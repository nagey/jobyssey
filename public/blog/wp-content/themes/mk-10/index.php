<?php get_header(); ?>
<?php get_sidebar();?>
<div id="content">

	<?php if (have_posts()) : while (have_posts()) : the_post(); ?>

	<h1><a href="<?php the_permalink() ?>" rel="bookmark"><?php the_title(); ?></a></h1>
	<p><?php the_time('F jS, Y') ?> &nbsp; Filed Under <?php the_category(', ') ?> &nbsp; <?php edit_post_link('[Edit]', '', ''); ?></p>

        <?php the_content(__('[More...]'));?>

        <div style="clear:both;"></div>
       
	<?php
	include("postinfo.php");
	?>
	
	<!--
	<?php trackback_rdf(); ?>
	-->
	
	<?php endwhile; else: ?>

	<p><?php _e('Sorry, no posts matched your criteria.'); ?></p><?php endif; ?>

        <div class="alignleft"><?php next_posts_link('&laquo; Previous Entries') ?></div>
        <div class="alignright"><?php previous_posts_link('Next Entries &raquo;') ?></div>
        <br>

	<?php comments_template(); // Get wp-comments.php template ?>

</div>
<?php get_footer(); ?>