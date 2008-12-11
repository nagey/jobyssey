<?php get_header(); ?>
<div class="narrowcolumn">

		<h2 class="widgettitle">User profile</h2>
		<?php //dynamic_sidebar('admin1');
		?>
		
		<?php
			if(file_exists (TEMPLATEPATH.'/userprofile.php')){
				include( TEMPLATEPATH.'/userprofile.php');
			}else{
				include( WP_PLUGIN_DIR.'/fbconnect/userprofile.php');
			}

		 ?>

		<div style="width:100%;clear:both;">&nbsp;</div>
		<h2 class="widgettitle">User comments</h2>
		<?php
			if(file_exists (TEMPLATEPATH.'/usercomments.php')){
				include( TEMPLATEPATH.'/usercomments.php');
			}else{
				include( WP_PLUGIN_DIR.'/fbconnect/usercomments.php');
			}
		?>

</div>

<?php 
if ( file_exists( TEMPLATEPATH . '/sidebar.php') ){
	get_sidebar();
}
?>

<?php get_footer(); ?>