<?php get_header(); ?>
<div id="container">
<div id="entries">

<?php previous_post_link('&laquo; %link','%title') ?><br/>
<?php next_post_link('&raquo; %link','%title') ?>

<h3><?php the_category(', ') ?></h3>

<?php if (have_posts()) : while (have_posts()) : the_post(); ?>

 <h1 style="display:inline; font-size:1.3em;"><a href="<?php the_permalink(); ?>" style="color:#444444;"><?php the_title(); ?></a></h1><div style="margin-top:-2px;"><small><?php the_time('m.d.y'); ?> <b>|</b> <?php comments_number('Comment?', '1 Comment', '% Comments' ) ?> </small></div><br/>

<div class="post">
	<?php the_content(); ?>
</div><!--end posts-->

 <?php endwhile; ?>
 <?php else : ?>
 <!-- no posts -->

 <h2>Sorry, no posts were found</h2>
 <?php endif; ?>

	<?php if (function_exists('related_posts')) { ?>
<h3>related</h3>
<ul>
<?php related_posts(); ?>
</ul>
<?php } ?>		

<?php if (function_exists('akpc_most_popular')) { ?>
<h3>popular</h3>
<ul>
<?php akpc_most_popular($limit = 5); ?>
</ul>
<?php } ?>

<?php comments_template(); ?><br/>
			
<?php previous_post_link('&laquo; %link','%title') ?><br/>
<?php next_post_link('&raquo; %link','%title') ?><br/>
</div><!--end entries-->	
<?php get_sidebar(); ?>
<!-- end container -->
<?php get_footer(); ?>