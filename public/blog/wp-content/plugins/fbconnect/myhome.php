<?php get_header(); ?>

	<div id="content" class="narrowcolumn">
		<div class="widget">
			<h2 class="widgettitle">User profile</h2>
			<?php //dynamic_sidebar('admin1');
			?>
			<?php
				include('userprofile.php');
			 ?>
		</div>
		<div style="width:100%;">&nbsp;</div>
		<div class="widget">
			<h2 class="widgettitle">User comments</h2>
			<?php
				include('usercomments.php');
			?>
		</div>			
	</div>

<?php get_sidebar(); ?>

<?php get_footer(); ?>