<?php
/*
 Plugin Name: Facebook Connector
 Plugin URI: http://www.sociable.es/facebook-connect
 Description: Allows the use of Facebook Connect for account registration, authentication, and commenting. 
 Author: Javier Reyes
 Author URI: http://www.sociable.es/
 Version: 0.9.1
 License: GPL (http://www.fsf.org/licensing/licenses/info/GPLv2.html) 
 */

define ( 'FBCONNECT_PLUGIN_REVISION', preg_replace( '/\$Rev: (.+) \$/', 'svn-\\1',
	'$Rev: 50 $') ); 

define ( 'FBCONNECT_DB_REVISION', 5);


define ( 'FBCONNECT_LOG_LEVEL', 'warning');     

set_include_path( dirname(__FILE__) . PATH_SEPARATOR . get_include_path() );   

require_once('fbConnectLogic.php');
require_once('fbConnectInterface.php');


restore_include_path();

@session_start();



if  (!class_exists('WPfbConnect')):
class WPfbConnect {
	var $store;
	var $consumer;

	var $log;
	var $status = array();

	var $message;	  // Message to be displayed to the user.
	var $action;	  // Internal action tag. 'success', 'warning', 'error', 'redirect'.

	var $response;

	var $enabled = true;

	var $bind_done = false;

	
	function WPfbConnect() {
		$this->log = &Log::singleton('error_log', PEAR_LOG_TYPE_SYSTEM, 'FBCONNECT');

		// Set the log level
		$fbconnect_log_level = constant('PEAR_LOG_' . strtoupper(FBCONNECT_LOG_LEVEL));
		$this->log->setMask(Log::UPTO($fbconnect_log_level));
	}


	/**
	 * Set Status.
	 **/
	function setStatus($slug, $state, $message) {
		$this->status[$slug] = array('state'=>$state,'message'=>$message);
	}


	function textdomain() {
		$lang_folder = PLUGINDIR . '/fbconnect/lang';
		load_plugin_textdomain('fbconnect', $lang_folder);
	}

	function table_prefix() {
		global $wpdb;
		return isset($wpdb->base_prefix) ? $wpdb->base_prefix : $wpdb->prefix;
	}

	function comments_table_name() { return WPfbConnect::table_prefix() . 'comments'; }
	function usermeta_table_name() { return WPfbConnect::table_prefix() . 'usermeta'; }
	function users_table_name() { return WPfbConnect::table_prefix() . 'users'; }
}
endif;

if (!function_exists('fbconnect_init')):
function fbconnect_init() {
	if ($GLOBALS['fbconnect'] && is_a($GLOBALS['fbconnect'], 'WPfbConnect')) {
		return;
	}
	
	$GLOBALS['fbconnect'] = new WPfbConnect();
}
endif;

//wp_enqueue_script( 'prototype' );
// -- Register actions and filters -- //

register_activation_hook('fbconnect/fbConnectCore.php', array('WPfbConnect_Logic', 'activate_plugin'));
register_deactivation_hook('fbconnect/fbConnectCore.php', array('WPfbConnect_Logic', 'deactivate_plugin'));

add_action( 'admin_menu', array( 'WPfbConnect_Interface', 'add_admin_panels' ) );

add_filter('language_attributes', array('WPfbConnect_Logic', 'html_namespace'));
add_filter('get_avatar', array('WPfbConnect_Logic', 'fb_get_avatar'),10,4);
// Add hooks to handle actions in WordPress

//add_action( 'wp_authenticate', array( 'WPfbConnect_Logic', 'wp_authenticate' ) ); // fbconnect loop start
add_action( 'wp_logout', array( 'WPfbConnect_Logic', 'fb_logout'),1);

add_action( 'init', array( 'WPfbConnect_Logic', 'wp_login_fbconnect' ),100 ); // fbconnect loop done

add_action( 'init', array( 'WPfbConnect', 'textdomain' ) ); // load textdomain

// Comment filtering
add_action( 'comment_post', array( 'WPfbConnect_Logic', 'comment_fbconnect' ), 5 );

//add_filter( 'comment_post_redirect', array( 'WPfbConnect_Logic', 'comment_post_redirect'), 0, 2);
if( get_option('fb_enable_approval') ) {
	add_filter( 'pre_comment_approved', array('WPfbConnect_Logic', 'comment_approval'));
}


// include internal stylesheet
add_action( 'wp_head', array( 'WPfbConnect_Interface', 'style'));
add_action( 'login_head', array( 'WPfbConnect_Interface', 'style'));

if( get_option('fb_enable_commentform') ) {
	add_action( 'comment_form', array( 'WPfbConnect_Interface', 'comment_form'), 10);
}

add_action( 'wp_footer', array( 'WPfbConnect_Logic', 'fbconnect_init_scripts'), 10);

if(!function_exists('carga_template')):
function carga_template() {
	if (isset($_REQUEST['fbconnect_action'])){
		if($_REQUEST['fbconnect_action']=="community"){
			if(file_exists (TEMPLATEPATH.'/community.php')){
				include( TEMPLATEPATH.'/community.php');
			}else{
				include( WP_PLUGIN_DIR.'/fbconnect/community.php');
			}
		}else if($_REQUEST['fbconnect_action']=="myhome"){
			if(file_exists (TEMPLATEPATH.'/myhome.php')){
				include( TEMPLATEPATH.'/myhome.php');
			}else{
				include( WP_PLUGIN_DIR.'/fbconnect/myhome.php');
			}
		}else if($_REQUEST['fbconnect_action']=="invite"){
			include( WP_PLUGIN_DIR.'/fbconnect/invitefriends.php');
		}
		
	//include(TEMPLATEPATH . '/all.php');
		exit;
	}
}
endif;
add_action('template_redirect', 'carga_template');


/**
 * If the current comment was submitted with FacebookConnect, return true
 * useful for  <?php echo ( is_comment_fbconnect() ? 'Submitted with FacebookConnect' : '' ); ?>
 */
if(!function_exists('is_comment_fbconnect')):
function is_comment_fbconnect() {
	global $comment;
	return ( $comment->fbconnect == 1 );
}
endif;

/**
 * If the current user registered with FacebookConnect, return true
 */
if(!function_exists('is_user_fbconnect')):
function is_user_fbconnect($id = null) {
	global $current_user;
    $user = $current_user;
	if ($id != null) {
		$user = get_userdata($id);
	}
	if($user!=null && $user->fbconnect_userid){
		return true;
	}else{
		return false;
	}
}
endif;

if(!function_exists('render_friends_invite')):
function render_friends_invite($invitetext){
   echo "<input type=\"button\" value=\"".$invitetext."\" style=\"width:100%;\" onclick=\"location.href='".get_option('siteurl')."/?fbconnect_action=invite'\"/>";
} 
endif;

//MAIN WIDGET
if(!function_exists('widget_FacebookConnector_init')):
function widget_FacebookConnector_init() {
if (!function_exists('register_sidebar_widget')) return;
function widget_FacebookConnector($args) {
		
		extract($args);

		$options = get_option('widget_FacebookConnector');

		if (!isset($options) || $options==""){
			$before_title ="<h2>";
			$after_title ="</h2>";
			$options = widget_FacebookConnector_init_options($options);
		}
		$title = $options['title'];
		$welcometext = $options['welcometext'];
		$footertext = $options['footertext'];
		$invitetext = $options['invitetext'];
		$lastvisittext = $options['lastvisittext'];
		$logintext = $options['logintext'];
		$alreadytext = $options['alreadytext'];
		$maxlastusers = $options['maxlastusers'];

		echo $before_widget . $before_title . $title . $after_title;
		//get_flickrRSS();
		$fb_user = fb_get_loggedin_user();

		$user = wp_get_current_user();

		if ( $user->ID ) {
			echo "<div class=\"fbconnect_miniprofile\">";
			echo "<div class=\"fbconnect_userpicmain\"><a onclick=\"location.href='".get_option('siteurl')."/?fbconnect_action=myhome&userid=".$user->ID."';\" href=\"".get_option('siteurl')."/?fbconnect_action=myhome&userid=".$user->ID."\"><fb:profile-pic uid=\"".$user->fbconnect_userid."\" size=\"thumb\" linked=\"false\"></fb:profile-pic></a></div>";
			echo "<div class=\"fbconnect_miniprofiletext;\">".$welcometext."<br/><a href=\"".get_option('siteurl')."/?fbconnect_action=myhome&userid=".$user->ID."\">".$user->display_name."</a>";
			echo "<br/><a href=\"".get_option('siteurl')."/wp-admin/profile.php"."\">Edit profile</a>";
			echo '<br/><a href="#" onclick="FB.Connect.logout(function() { window.location = \''.get_option('siteurl').'/wp-login.php?action=logout'.'\'; })">Logout</a></div>';
			echo "</div>";
		}else{
			echo $alreadytext."<br/>";
			echo '<a href="'.get_option('siteurl').'/wp-login.php'.'"><b>Login</b></a><br/>';
		}
		echo "<div class=\"invitebutton\">";
		if ($fb_user){
			render_friends_invite($invitetext);
		}else{
			echo $logintext."<br/>";	
			echo "<fb:login-button></fb:login-button>\n";
		}
		echo "</div>";		
		

		//echo '<div class="rbroundbox"><div class="rbtop"><div></div></div><div class="rbcontent">';
		echo "<div class=\"fbconnect_LastUsers\">";
		echo "<div class=\"fbconnect_title\">".$lastvisittext."</div>";
		echo "<div class=\"fbconnect_userpics\">";
		$users = WPfbConnect_Logic::get_lastusers_fbconnect($maxlastusers);

		foreach($users as $user){
				echo get_avatar( $user->ID,50 );
		}

		echo "</div>";
		echo '<div style="text-align:right;"><a href="'.get_option('siteurl').'/?fbconnect_action=community'.'">view more...</a></div>';
		echo "</div>";

		echo $footertext . $after_widget;
	}

	function widget_FacebookConnector_init_options($options){
		if (!isset($options['title'])){
			$options['title'] = "Community";
		}
		if (!isset($options['welcometext'])){
			$options['welcometext'] = "Welcome to ".get_option('blogname')."!";
		}
		if (!isset($options['lastvisittext'])){
			$options['lastvisittext'] = "Last visitors";
		}
		if (!isset($options['invitetext'])){
			$options['invitetext'] = "Invite your friends!";
		}
		if (!isset($options['logintext'])){
			$options['logintext'] = "Login using Facebook:";
		}
		if (!isset($options['alreadytext'])){
			$options['alreadytext'] = "Already a member?";
		}
		if (!isset($options['footertext'])){
			$options['footertext'] = 'Powered by <a href="http://www.sociable.es">Sociable!</a>';
		}
		if (!isset($options['maxlastusers'])){
			$options['maxlastusers'] = "9";
		}
		return $options;
	}
	
	function widget_FacebookConnector_control() {
		$options = get_option('widget_FacebookConnector');

		if ( $_POST['FacebookConnector-submit'] ) {
			$options['title'] = strip_tags(stripslashes($_POST['FacebookConnector-title']));
			$options['welcometext'] = stripslashes($_POST['FacebookConnector-welcometext']);
			$options['footertext'] = stripslashes($_POST['FacebookConnector-footertext']);
			$options['invitetext'] = stripslashes($_POST['FacebookConnector-invitetext']);
			$options['lastvisittext'] = stripslashes($_POST['FacebookConnector-lastvisittext']);
			$options['logintext'] = stripslashes($_POST['FacebookConnector-logintext']);
			$options['alreadytext'] = stripslashes($_POST['FacebookConnector-alreadytext']);
			$options['maxlastusers'] = (int)$_POST['FacebookConnector-maxlastusers'];
			update_option('widget_FacebookConnector', $options);
		}

		$options = widget_FacebookConnector_init_options($options);
		
		$title = htmlspecialchars($options['title'], ENT_QUOTES);
		$welcometext = htmlspecialchars($options['welcometext'], ENT_QUOTES);
		$footertext = htmlspecialchars($options['footertext'], ENT_QUOTES);
		$invitetext = htmlspecialchars($options['invitetext'], ENT_QUOTES);
		$lastvisittext = htmlspecialchars($options['lastvisittext'], ENT_QUOTES);
		$logintext = htmlspecialchars($options['logintext'], ENT_QUOTES);
		$alreadytext = htmlspecialchars($options['alreadytext'], ENT_QUOTES);
		$maxlastusers = htmlspecialchars($options['maxlastusers'], ENT_QUOTES);
		//get_option('blogname')
		
		echo '<p style="text-align:right;"><label for="FacebookConnector-title">Title: <input style="width: 180px;" id="FacebookConnector-title" name="FacebookConnector-title" type="text" value="'.$title.'" /></label></p>';
		echo '<p style="text-align:right;"><label for="FacebookConnector-welcometext">Welcome msg: <input style="width: 180px;" id="FacebookConnector-welcometext" name="FacebookConnector-welcometext" type="text" value="'.$welcometext.'" /></label></p>';
		echo '<p style="text-align:right;"><label for="FacebookConnector-footertext">Footer msg: <input style="width: 180px;" id="FacebookConnector-footertext" name="FacebookConnector-footertext" type="text" value="'.$footertext.'" /></label></p>';
		echo '<p style="text-align:right;"><label for="FacebookConnector-invitetext">Invite msg: <input style="width: 180px;" id="FacebookConnector-invitetext" name="FacebookConnector-invitetext" type="text" value="'.$invitetext.'" /></label></p>';
		echo '<p style="text-align:right;"><label for="FacebookConnector-lastvisittext">Visitors title: <input style="width: 180px;" id="FacebookConnector-lastvisittext" name="FacebookConnector-lastvisittext" type="text" value="'.$lastvisittext.'" /></label></p>';
		echo '<p style="text-align:right;"><label for="FacebookConnector-logintext">Login msg: <input style="width: 180px;" id="FacebookConnector-logintext" name="FacebookConnector-logintext" type="text" value="'.$logintext.'" /></label></p>';
		echo '<p style="text-align:right;"><label for="FacebookConnector-alreadytext">Member msg: <input style="width: 180px;" id="FacebookConnector-alreadytext" name="FacebookConnector-alreadytext" type="text" value="'.$alreadytext.'" /></label></p>';
		echo '<p style="text-align:right;"><label for="FacebookConnector-maxlastusers">Max users: <input style="width: 180px;" id="FacebookConnector-maxlastusers" name="FacebookConnector-maxlastusers" type="text" value="'.$maxlastusers.'" /></label></p>';
		echo '<input type="hidden" id="FacebookConnector-submit" name="FacebookConnector-submit" value="1" />';
	}		

	register_sidebar_widget('FacebookConnector', 'widget_FacebookConnector');
	register_widget_control('FacebookConnector', 'widget_FacebookConnector_control', 300, 100);
}
endif;

add_action('plugins_loaded', 'widget_FacebookConnector_init');

//WIDGET
if(!function_exists('widget_fbconnect_usercomments_init')):
function widget_fbconnect_usercomments_init() {
if (!function_exists('register_sidebar_widget')) return;
function widget_fbconnect_usercomments($args) {
		
		extract($args);

		$options = get_option('widget_fbconnect_usercomments');
		$title = $options['title'];
		$before_images = $options['before_images'];
		$after_images = $options['after_images'];
		
		echo $before_widget . $before_title . $title . $after_title . $before_images;
		//get_flickrRSS();
		$fb_user ="";
		if (isset($_REQUEST['userid']) && $_REQUEST['userid']!=""){
			$fb_user = $_REQUEST['userid'];
		}else{
			$fb_user = fb_get_loggedin_user();
		}
		if ($fb_user){
			$comments = WPfbConnect_Logic::get_user_comments($fb_user);
			include('usercomments.php');
		}
		
		echo $after_images . $after_widget;
	}

	function widget_fbconnect_usercomments_control() {
		$options = get_option('widget_fbconnect_usercomments');

		if ( $_POST['fbconnect_usercomments-submit'] ) {
			$options['title'] = strip_tags(stripslashes($_POST['fbconnect_usercomments-title']));
			$options['before_images'] = $_POST['fbconnect_usercomments-beforeimages'];
			$options['after_images'] = $_POST['fbconnect_usercomments-afterimages'];
			update_option('widget_fbconnect_usercomments', $options);
		}

		$title = htmlspecialchars($options['title'], ENT_QUOTES);
		$before_images = htmlspecialchars($options['before_images'], ENT_QUOTES);
		$after_images = htmlspecialchars($options['after_images'], ENT_QUOTES);
		
		echo '<p style="text-align:right;"><label for="fbconnect_usercomments-title">Title: <input style="width: 180px;" id="gsearch-title" name="fbconnect_usercomments-title" type="text" value="'.$title.'" /></label></p>';
		echo '<p style="text-align:right;"><label for="fbconnect_usercomments-beforeimages">Before all images: <input style="width: 180px;" id="fbconnect_usercomments-beforeimages" name="fbconnec_usercommentst-beforeimages" type="text" value="'.$before_images.'" /></label></p>';
		echo '<p style="text-align:right;"><label for="fbconnect_usercomments-afterimages">After all images: <input style="width: 180px;" id="fbconnect_usercomments-afterimages" name="fbconnect_usercomments-afterimages" type="text" value="'.$after_images.'" /></label></p>';
		echo '<input type="hidden" id="fbconnect_usercomments-submit" name="fbconnect_usercomments-submit" value="1" />';
	}		

	//register_sidebar_widget('fbconnect_usercomments', 'widget_fbconnect_usercomments');
	//register_widget_control('fbconnect_usercomments', 'widget_fbconnect_usercomments_control', 300, 100);
}
endif;

//add_action('plugins_loaded', 'widget_fbconnect_usercomments_init');

//WIDGET
if(!function_exists('widget_fbconnect_userprofile_init')):
function widget_fbconnect_userprofile_init() {
if (!function_exists('register_sidebar_widget')) return;
function widget_fbconnect_userprofile($args) {
		
		extract($args);

		$options = get_option('widget_fbconnect_userprofile');
		$title = $options['title'];
		$before_images = $options['before_images'];
		$after_images = $options['after_images'];
		
		echo $before_widget . $before_title . $title . $after_title . $before_images;
		//get_flickrRSS();
		$fb_user ="";
		$wpuser ="";
		if (isset($_REQUEST['userid']) && $_REQUEST['userid']!=""){
			$wpuser = $_REQUEST['userid'];
		}if (isset($_REQUEST['fbuserid']) && $_REQUEST['fbuserid']!=""){
			$fb_user = $_REQUEST['fbuserid'];
		}else{
			$fb_user = fb_get_loggedin_user();
		}
		if ($fb_user){
			//$userprofile= get_userdatabylogin("FB_".$fb_user);
			$userprofile = WPfbConnect_Logic::get_userbyFBID($fb_user);
		}elseif($wpuser){
			$userprofile= get_userdata($wpuser);
		}
		//print_r($userprofile);
		include('userprofile.php');
		
		
		echo $after_images . $after_widget;
	}

	function widget_fbconnect_userprofile_control() {
		$options = get_option('widget_fbconnect_userprofile');

		if ( $_POST['fbconnect_userprofile-submit'] ) {
			$options['title'] = strip_tags(stripslashes($_POST['fbconnect_userprofile-title']));
			$options['before_images'] = $_POST['fbconnect_userprofile-beforeimages'];
			$options['after_images'] = $_POST['fbconnect_userprofile-afterimages'];
			update_option('widget_fbconnect_userprofile', $options);
		}

		$title = htmlspecialchars($options['title'], ENT_QUOTES);
		$before_images = htmlspecialchars($options['before_images'], ENT_QUOTES);
		$after_images = htmlspecialchars($options['after_images'], ENT_QUOTES);
		
		echo '<p style="text-align:right;"><label for="fbconnect_userprofile-title">Title: <input style="width: 180px;" id="gsearch-title" name="fbconnect_userprofile-title" type="text" value="'.$title.'" /></label></p>';
		echo '<p style="text-align:right;"><label for="fbconnect_userprofile-beforeimages">Before all images: <input style="width: 180px;" id="fbconnect_userprofile-beforeimages" name="fbconnec_userprofilet-beforeimages" type="text" value="'.$before_images.'" /></label></p>';
		echo '<p style="text-align:right;"><label for="fbconnect_userprofile-afterimages">After all images: <input style="width: 180px;" id="fbconnect_userprofile-afterimages" name="fbconnect_userprofile-afterimages" type="text" value="'.$after_images.'" /></label></p>';
		echo '<input type="hidden" id="fbconnect_userprofile-submit" name="fbconnect_userprofile-submit" value="1" />';
	}		

	//register_sidebar_widget('fbconnect_userprofile', 'widget_fbconnect_userprofile');
	//register_widget_control('fbconnect_userprofile', 'widget_fbconnect_userprofile_control', 300, 100);
}
endif;

//add_action('plugins_loaded', 'widget_fbconnect_userprofile_init');
?>
