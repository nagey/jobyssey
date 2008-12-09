<?php
function add_some_meta_flavor()
{ ?>

  <title>Jobyssey Blog</title>
  <meta name="description" content="description here" />
  <meta name="keywords" content="keywords here" />
<?php }
add_action('wp_head','add_some_meta_flavor');
?>

<?php get_header(); ?>

    <div id="content">

	<?php if (have_posts()) : ?>
   	<?php while (have_posts()) : the_post(); ?>
<div id="post-<?php the_ID(); ?>">
		<h2><a href="<?php the_permalink() ?>" rel="bookmark" title="Permanent Link to <?php the_title(); ?>" onfocus="blur();">
		<?php the_title(); ?></a></h2>
                <p class="date"><?php the_time('F d, Y') ?></p>

      	<?php the_content('<p class="right more">there\'s more to this &raquo;</p>', strip_teaser); ?>
		<p class="right"> 
			Posted by <?php the_author() ?> at <?php the_time('g:ia') ?><br /> 
		<?php comments_popup_link('No Comments &#187;', '1 Comment &#187;', '% Comments &#187;'); ?>

		</p></div>


	<?php endwhile; ?>
	<?php endif; ?>

    </div> <!--closing #content -->

  <div id="footer">
	<?php oc_linky_love(); ?>
  </div> <!-- closing #footer -->

  </div> <!-- closing #content_wrapper -->

<?php get_sidebar(); ?>

<?php get_footer(); ?>