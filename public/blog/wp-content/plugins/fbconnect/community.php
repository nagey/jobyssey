<?php 
/**
 * @author: Javier Reyes Gomez (http://www.sociable.es)
 * @date: 05/10/2008
 * @license: GPLv2
 */

get_header();
?> 

	<div id="content" class="narrowcolumn">
		<div class="widget">

<?php
$fb_user = facebook_client()->get_loggedin_user();
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
		<h2 class="widgettitle">Community</h2>
<?php

		$users = WPfbConnect_Logic::get_lastusers_fbconnect(100);

			echo "<div class=\"fbconnect_userpics2\">";
			foreach($users as $user){
				echo get_avatar( $user->ID,50 );
			}
			echo "</div>";
?>
</div>
</div>
<?php get_sidebar(); ?>

<?php get_footer(); ?>