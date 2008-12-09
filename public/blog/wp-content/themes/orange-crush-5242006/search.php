<?php get_header(); ?>

	<div id="content">

	<?php if (have_posts()) : ?>

		<h2>Search Results</h2>
		
		<?php while (have_posts()) : the_post(); ?>
				
			<div class="post">
				<h3 class="archives" id="post-<?php the_ID(); ?>"><a href="<?php the_permalink() ?>" rel="bookmark" title="Permanent Link to <?php the_title(); ?>"><?php the_title(); ?></a></h3>
				<p class="date"><?php the_time('l, F jS, Y') ?></p>
		
				<p class="right">Posted in <?php the_category(', ') ?> | <?php edit_post_link('Edit', '', ' | '); ?>  <?php comments_popup_link('No Comments &#187;', '1 Comment &#187;', '% Comments &#187;'); ?></p>
			</div>
	
		<?php endwhile; ?>

	<?php else : ?>

		<h3 style="border:none;">No posts found. Try a different search?</h3>

	<?php endif; ?>
		
	</div> <!-- closing #content -->

	</div> <!-- closing #content_wrapper -->

<?php get_sidebar(); ?>

<?php get_footer(); ?>