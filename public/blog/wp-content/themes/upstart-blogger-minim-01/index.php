<?php get_header(); ?>
<div id="container">
<div id="entries">

<?php if (have_posts()) :  while (have_posts()) : the_post(); ?>
<h3><?php the_category(', ') ?></h3><h1 style="display:inline;"><a href="<?php the_permalink(); ?>" style="color:#444444;"><?php the_title(); ?></a></h1><div style="margin-top:-2px;"><small><?php the_time('m.d.y'); ?> <b>|</b> <a href="<?php the_permalink(); ?>">Permalink</a> <b>|</b> <?php comments_popup_link('Comment?', '1 Comment', '% Comments' ) ?> </small></div>
 
<div class="post">
<?php the_excerpt(); ?>
<a href="<?php the_permalink(); ?>">Read More</a>
</div><!--end posts-->


 <?php endwhile; ?>
 <?php else : ?>
 <!-- no posts -->

 <h2>Sorry, no posts were found</h2>
 <?php endif; ?>


<?php next_posts_link('&laquo; Previous Entries') ?><br/>
<?php previous_posts_link('&raquo; Next Entries') ?>

<br/><br/>

</div><!--end entries-->

<?php get_sidebar(); ?>
<?php get_footer(); ?>