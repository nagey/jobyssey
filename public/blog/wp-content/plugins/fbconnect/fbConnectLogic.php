<?php
/**
 * @author: Javier Reyes Gomez (http://www.sociable.es)
 * @date: 05/10/2008
 * @license: GPLv2
 */
if (!class_exists('WPfbConnect_Logic')):

/**
 * Basic logic for wp-fbConnect plugin.
 */
class WPfbConnect_Logic {

	function get_connected_friends($fb_uid) {
	  $results = array();
	  $query = 'SELECT uid, email_hashes, has_added_app FROM user WHERE has_added_app = 1 AND uid IN '.
	    '(SELECT uid2 FROM friend WHERE uid1 = '.$fb_uid.')';
	  try {
	    $rows = facebook_client()->api_client->fql_query($query);
	    // Do filtering in PHP because the FQL doesn't allow it (yet)
	    if (!empty($rows)) {
	      foreach ($rows as $row) {
	        if ((is_array($row['email_hashes']) && count($row['email_hashes']) > 0) ||
	            ($row['has_added_app'] == 1)) {
	          unset($row['has_added_app']);
	          $results[] = $row;
	        }
	      }
	    }
	  }
	  catch (Exception $e) {
	    error_log("Failure in the api: ". $e->getMessage());
		
	  }
	
	  return $results;
	}

	/**
	 * Soft verification of plugin activation
	 *
	 * @return boolean if the plugin is okay
	 */
	function uptodate() {
		global $fbconnect;

		$fbconnect->log->debug('checking if database is up to date');
		if( get_option('fb_db_revision') != FBCONNECT_DB_REVISION ) {
			$fbconnect->enabled = false;
			$fbconnect->log->warning('Plugin database is out of date: ' . get_option('fb_db_revision') . ' != ' . FBCONNECT_DB_REVISION);
			update_option('fb_plugin_enabled', false);
			return false;
		}
		$fbconnect->enabled = (get_option('fb_plugin_enabled') == true );
		return $fbconnect->enabled;
	}


	/**
	 * Get the internal SQL Store.  If it is not already initialized, do so.
	 *
	 * @return WPfbConnect_Store internal SQL store
	 */
	function getStore() {
		global $fbconnect;

		if (!isset($fbconnect->store)) {
			set_include_path( dirname(__FILE__) . PATH_SEPARATOR . get_include_path() );
			require_once 'fbConnectStore.php';

			$fbconnect->store = new WPfbConnect_Store($fbconnect);
			if (null === $fbconnect->store) {
				$fbconnect->log->err('Social Webtop store could not be created properly.');
				$fbconnect->enabled = false;
			}
		}

		return $fbconnect->store;
	}




	/**
	 * Called on plugin activation.
	 *
	 * @see register_activation_hook
	 */
	function activate_plugin() {
		$start_mem = memory_get_usage();
		global $fbconnect;
		fbconnect_init();

		$store =& WPfbConnect_Logic::getStore();
		$store->create_tables();

		wp_schedule_event(time(), 'hourly', 'cleanup_fbconnect');
		//$fbconnect->log->warning("activation memory usage: " . (int)((memory_get_usage() - $start_mem) / 1000));
	}



	/**
	 * Called on plugin deactivation.  Cleanup tables.
	 *
	 * @see register_deactivation_hook
	 */
	function deactivate_plugin() {
		
	}


	/**
	 * Facebook connect Login 
	 */
	function wp_login_fbconnect() {
		global $wp_version;

		if (strpos($wp_version, '2.5') != 0) {
			return;
		}

		$self = basename( $GLOBALS['pagenow'] );

		$fb_user = facebook_client()->get_loggedin_user();
		$user = wp_get_current_user();

		if ( (!is_user_logged_in() || $user->fbconnect_userid == 0) &&  $fb_user) { //Intenta hacer login estando registrado en facebook
			include_once('wp-includes/registration.php');
			$usersinfo = facebook_client()->api_client->users_getInfo($fb_user, "about_me,profile_url,first_name,last_name,birthday,current_location,sex,pic,pic_small,pic_big,pic_square");
			
			$wpid = "";
			$fbwpuser = WPfbConnect_Logic::get_userbyFBID($fb_user);
			$wpid = "";
			if (!is_user_logged_in() && !$fbwpuser){
				//$wpid = wp_create_user("FB_".$fb_user, substr( md5( uniqid( microtime() ) ), 0, 7), '');
				if(!username_exists( "FB_".$fb_user )){
					$user_data = array();
					$user_data['user_login'] = "FB_".$fb_user;
					$user_data['user_pass'] = substr( md5( uniqid( microtime() ) ), 0, 7);
					$user_data['user_nicename'] = $usersinfo[0]["first_name"]." ".$usersinfo[0]["last_name"];
					$user_data['display_name'] = $usersinfo[0]["first_name"]." ".$usersinfo[0]["last_name"];
					$user_data['user_url'] = $usersinfo[0]["profile_url"];
					$wpid = wp_insert_user($user_data);
					update_usermeta( $wpid, "first_name", $usersinfo[0]["first_name"] );
					update_usermeta( $wpid, "last_name", $usersinfo[0]["last_name"] );
					update_usermeta( $wpid, "description", $usersinfo[0]["about_me"] );
					update_usermeta( $wpid, "birthday", $usersinfo[0]["birthday"] );
					update_usermeta( $wpid, "current_location", $usersinfo[0]["current_location"] );
					update_usermeta( $wpid, "sex", $usersinfo[0]["sex"] );
					WPfbConnect_Logic::set_userid_fbconnect($wpid,$fb_user);
				}else{
					$userdata = get_userdatabylogin( "FB_".$fb_user );	
					WPfbConnect_Logic::set_userid_fbconnect($userdata->ID,$fb_user);
					$wpid = $userdata->ID;
				}
			}elseif(is_user_logged_in() && $fbwpuser && $user->ID != $fbwpuser->ID){ // El usuario FB está asociado a un usaurio WP distinto al logeado
				WPfbConnect_Logic::set_userid_fbconnect($user->ID,$fb_user);
				WPfbConnect_Logic::set_userid_fbconnect($fbwpuser->ID,"0"); //Eliminamos la asociación anterior
				$wpid = $user->ID;
			}else{
				$wpid = $user->ID;
			}

			//$userdata = get_userdatabylogin( "FB_".$fb_user );
			$userdata = WPfbConnect_Logic::get_userbyFBID($fb_user);
			WPfbConnect_Logic::set_lastlogin_fbconnect($userdata->ID);
			//print_r($userdata);
			set_current_user($userdata->ID,"FB_".$fb_user);
			wp_set_auth_cookie($userdata->ID, false);

		}
	}


	function set_current_user($identity, $remember = true) {
		global $fbconnect;

		if (is_numeric($identity)) {
			$user_id = $identity;
		} else {
			$store =& WPfbConnect_Logic::getStore();
			$user_id = $store->get_user_by_identity( $identity );
		}

		if (!$user_id) return;

		$user = set_current_user($user_id);
			
		if (function_exists('wp_set_auth_cookie')) {
			wp_set_auth_cookie($user->ID, $remember);
		} else {
			wp_setcookie($user->user_login, md5($user->user_pass), true, '', '', $remember);
		}

		do_action('wp_login', $user->user_login);
	}


	//REYES
	function fb_logout(){
	    try {
	    	
		    if (facebook_client()->get_loggedin_user()!="") {
				facebook_client()->expire_session();
			}
			//setcookie("56d4df1c9b1e135e86c1e7c6407b8a62_user", "", time() - 3600);
			//die;
		}catch (Exception $e) {
        // nothing, probably an expired session
      }
	}
	

	function comment_fbconnect($comment_ID) {
		global $fbconnect;
		$fb_templates_id = get_option('fb_templates_id');
//REYES
		$comment = WPfbConnect_Logic::get_comment_byID($comment_ID);
		$blogname = get_option('blogname');
		$blogdesc = get_option('blogdescription');
		$siteurl = get_option('siteurl');

		$fb_user = facebook_client()->get_loggedin_user();

		if (is_user_logged_in() && $fb_user){
			WPfbConnect_Logic::set_comment_fbconnect($comment_ID,$fb_user);
			
			if ($_REQUEST["sendToFacebook"]){
				$feed_bundle_id = get_option('fb_templates_id');
				$url = get_permalink($comment->comment_post_ID);
		  		$template_data = array('post_title' => '<a href="'.$url.'">'.$comment->post_title.'</a>',
		                         'body' => $comment->comment_content,
		                         'post_permalink' => $url,
								 'blogname' => '<a href="'.$siteurl.'">'.$blogname.'</a>',
								 'blogdesc' => $blogdesc,
								 'siteurl' => $siteurl);

				facebook_client()->api_client->feed_publishUserAction( $feed_bundle_id, 
		                                               json_encode($template_data) , 
		                                               null, 
		                                              null,2);
			}
		}
	}


	/**
	 * Mark the provided comment as an Facebook Connect comment
	 *
	 */
	function set_comment_fbconnect($comment_ID,$fb_user = 0) {
		global $wpdb, $fbconnect;

		$comments_table = WPfbConnect::comments_table_name();
		$wpdb->query("UPDATE $comments_table SET fbconnect='".$fb_user."' WHERE comment_ID='$comment_ID' LIMIT 1");
	}

	/**
	 * Update last user login date
	 *
	 */
	function set_lastlogin_fbconnect($userID) {
		global $wpdb, $fbconnect;
		$users_table = WPfbConnect::users_table_name();
		$wpdb->query("UPDATE $users_table SET fbconnect_lastlogin=".date("U")." WHERE ID='$userID' LIMIT 1");
	}
	
	/**
	 * Get last users
	 *
	 */
	function get_lastusers_fbconnect($num = 10) {
		global $wpdb, $fbconnect;
		$users_table = WPfbConnect::users_table_name();
		$users = $wpdb->get_results("SELECT * FROM $users_table WHERE fbconnect_lastlogin>0 ORDER BY fbconnect_lastlogin LIMIT ".$num);
		return $users;
	}
	
	/**
	 * Get user by fbid
	 *
	 */
	function get_userbyFBID($fbid) {
		global $wpdb, $fbconnect;
		$users_table = WPfbConnect::users_table_name();
		$users = $wpdb->get_results("SELECT * FROM $users_table WHERE fbconnect_userid = ".$fbid);
		if (count($users)>0){
			return $users[0];
		}else{
			return null;
		}
	}
	
	/**
	 * Update Facebook userID
	 *
	 */
	function set_userid_fbconnect($userID,$fbuserid) {
		global $wpdb, $fbconnect;
		$users_table = WPfbConnect::users_table_name();
		$wpdb->query("UPDATE $users_table SET fbconnect_userid=".$fbuserid." WHERE ID='$userID' LIMIT 1");
	}
	
	/**
	 * Get user comments
	 *
	 */
	function get_user_comments($user_id) {
		global $wpdb;
		return $wpdb->get_results($wpdb->prepare("SELECT * FROM $wpdb->comments wpcomments, $wpdb->posts posts WHERE wpcomments.comment_post_ID=posts.ID AND wpcomments.fbconnect = %s AND wpcomments.comment_approved = '1' ORDER BY comment_date", $user_id));
	}
	
	/**
	 * Get user comments
	 *
	 */
	function get_user_comments_byID($user_id) {
		global $wpdb;
		return $wpdb->get_results($wpdb->prepare("SELECT * FROM $wpdb->comments wpcomments, $wpdb->posts posts WHERE wpcomments.comment_post_ID=posts.ID AND wpcomments.user_id = %s AND wpcomments.comment_approved = '1' ORDER BY comment_date", $user_id));
	}
	
	/**
	 * Get a comment by ID
	 *
	 */
	function get_comment_byID($comment_id) {
		global $wpdb;
		$comments = $wpdb->get_results($wpdb->prepare("SELECT * FROM $wpdb->comments wpcomments, $wpdb->posts posts WHERE wpcomments.comment_post_ID=posts.ID AND wpcomments.comment_ID = %s", $comment_id));
		if ($comments != ""){
			return $comments[0];			
		}
	}

	/**
	 * This filter callback simply approves all Facebook Connect comments
	 *
	 * @param string $approved comment approval status
	 * @return string new comment approval status
	 */
	function comment_approval($approved) {
		$fb_user = facebook_client()->get_loggedin_user();
		if ($fb_user) {
			return 1;
		}
			
		return $approved;
	}

	function html_namespace($html_lang){
		return "xmlns:fb=\"http://www.facebook.com/2008/fbml\" ".$html_lang;
	}

	function fb_get_avatar($avatar=null, $id_or_email = null, $size = null, $default=null){
		$fbuser = "";
		$username = "";
		if ( is_numeric($id_or_email) ) {
			$id = (int) $id_or_email;
			$user = get_userdata($id);
			$username = $user->display_name;
			if ( $user && isset($user->fbconnect_userid) && $user->fbconnect_userid!=""){
					$fbuser = $user->fbconnect_userid;
			}
		} elseif ( is_object($id_or_email) ) {
			if ( !empty($id_or_email->fbconnect) && $id_or_email->fbconnect!="0" ) {
				$fbuser = $id_or_email->fbconnect;
			}else if ( !empty($id_or_email->user_id) ) {
				$id = (int) $id_or_email->user_id;
				$user = get_userdata($id);	
				$username = $user->display_name;
				if ( $user && isset($user->fbconnect_userid) && $user->fbconnect_userid!=""){
					$fbuser = $user->fbconnect_userid;
				}
			}
		}
		if ($fbuser != "" && $fbuser != 0){
			return "<div class=\"avatar\"><a onclick=\"location.href='./?fbconnect_action=myhome&fbuserid=".$fbuser."';\" href=\"./?fbconnect_action=myhome&fbuserid=".$fbuser."\"><fb:profile-pic uid=\"".$fbuser."\" size=\"thumb\" linked=\"false\"></fb:profile-pic></a></div>";
		}elseif($id!=""){
			return "<a href=\"./?fbconnect_action=myhome&userid=".$id."\">".$avatar."</a>";
		}

		return $avatar;
	}



	function set_error($error) {
		$_SESSION['fb_error'] = $error;
		return;
	}
	
	function fbconnect_init_scripts(){
		echo "<script src='".get_static_root()."/js/api_lib/v0.4/FeatureLoader.js.php' type='text/javascript'></script>\n";
		echo "<script type='text/javascript'>\n";
		echo "FB_RequireFeatures([\"XFBML\"], function(){\n";
	    echo "FB.Facebook.init(\"".get_api_key()."\", \"".get_option('siteurl') . "/" . PLUGINDIR . "/fbconnect/xd_receiver.htm\");\n";
		$fb_user = facebook_client()->get_loggedin_user();
		if (!$fb_user){
			echo "	    FB.Facebook.get_sessionState().waitUntilReady(function(){\n";
			echo "  	window.location = \"index.php\";\n";
		  	echo "});\n";
		}
	    echo "});\n";
		echo "	function toggleLayer( whichLayer ){  
			var elem, vis;  
			if( document.getElementById ) // this is the way the standards work    
			   elem = document.getElementById( whichLayer );  
			else if( document.all ) // this is the way old msie versions work 
			   elem = document.all[whichLayer];  
			else if( document.layers ) // this is the way nn4 works    
				elem = document.layers[whichLayer];  
			vis = elem.style;  // if the style.display value is blank we try to figure it out here  
			if(vis.display==''&&elem.offsetWidth!=undefined&&elem.offsetHeight!=undefined)    
			vis.display = (elem.offsetWidth!=0&&elem.offsetHeight!=0)?'block':'none';  
			vis.display = (vis.display==''||vis.display=='block')?'none':'block';
		}\n";
	
	 	echo "</script>\n";
	}


} 
endif; // end if-class-exists test

?>
