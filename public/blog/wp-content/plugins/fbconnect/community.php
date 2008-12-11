<?php 
/**
 * @author: Javier Reyes Gomez (http://www.sociable.es)
 * @date: 05/10/2008
 * @license: GPLv2
 */

get_header();
?> 

	<div class="narrowcolumn">
		<div class="widget">

<?php

	$fb_user = fb_get_loggedin_user();
	if(isset($fb_user) && $fb_user!=""){
		$users = WPfbConnect_Logic::get_connected_friends($fb_user);
		
		echo "<h2 class=\"widgettitle\">Community friends</h2>";
		echo "<div class=\"fbconnect_userpics2\">";
		foreach($users as $user){
			echo "<div><a style=\"border: 2px solid #d5d6d7;\" onclick=\"location.href='./?fbconnect_action=myhome&fbuserid=".$user["uid"]."';\" href=\"./?fbconnect_action=myhome&userid=".$user["uid"]."\"><fb:profile-pic uid=\"".$user["uid"]."\" size=\"thumb\" linked=\"false\"></fb:profile-pic></a></div>";
		}
		echo "</div>";
	}else{
		
	}
?> 
</div>
		<div style="clear:both;" class="widget">
<?php
		$users_count = WPfbConnect_Logic::get_count_users();
		echo "<h2 class=\"widgettitle\">Community (".$users_count." members)</h2>";
		$pos = 0;
		if (isset ($_REQUEST["pos"])){
			$pos= (int)$_REQUEST["pos"];
		}
		$viewusers = 50;
		$users = WPfbConnect_Logic::get_lastusers_fbconnect($viewusers,$pos);

			echo "<div class=\"fbconnect_userpics2\">";
			foreach($users as $user){
				echo get_avatar( $user->ID,50 );
			}
			echo "</div>";
		if ($pos>=$viewusers){
			echo '<a href="'.get_option('siteurl').'/?fbconnect_action=community&pos='.($pos-$viewusers).'">&laquo; Previous page&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>';
		}
		if (($pos+$viewusers)<$users_count){
			echo '<a href="'.get_option('siteurl').'/?fbconnect_action=community&pos='.($pos+$viewusers).'"> Next page &raquo;</a>';
		}

?>
</div>
</div>
<?php 
if ( file_exists( TEMPLATEPATH . '/sidebar.php') ){
	get_sidebar();
}
?>

<?php get_footer(); ?>