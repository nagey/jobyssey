<?php get_header(); ?>
<?php get_sidebar();?>
<div id="content">

	<?php if (have_posts()) : while (have_posts()) : the_post(); ?>
	<h1><?php the_title(); ?></h1>
	<p><?php edit_post_link('[Edit]', '', ''); ?></p>
	<?php the_content(__('[More...]'));?>

        <div style="clear:both;"></div>
	
	<!--
	<?php trackback_rdf(); ?>
	-->

	<?php endwhile; else: ?>

	<p><?php _e('Sorry, no posts matched your criteria.'); ?></p><?php endif; ?><br />

<?php comments_template(); // Get wp-comments.php template ?>	

</div>

<?php get_footer(); ?>