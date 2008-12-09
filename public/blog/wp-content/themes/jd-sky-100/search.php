<?php get_header(); ?>
			
	<div id="bloque">
		
		<div id="notice">
		
		<?php if (have_posts()) : while (have_posts()) : the_post(); ?>
		
			<div class="entrance">
				<h2 id="post-<?php the_ID(); ?>"><a href="<?php the_permalink() ?>" rel="bookmark" title="Permanent Link to <?php the_title(); ?>"><?php the_title(); ?></a></h2>
				<small><?php the_time('F j, Y \o\n\ g:i a'); ?> | In <?php the_category(', ') ?> | <?php comments_popup_link('No Comments', '1 Comment', '% Comments'); ?></small>
						
		<?php the_excerpt(); ?>
							
				<div class="feedback"><?php link_pages('<p><strong>Pages:</strong> ', '</p>', 'number'); ?><?php edit_post_link('Edit', ' &#8212; ', ''); ?></div>

			<!--
			<?php trackback_rdf(); ?>
			-->

			</div>
				

			
		<?php endwhile; else: ?>
		<h2 class="center">Not Found</h2>
		<p><?php _e('Sorry, no posts matched your criteria.'); ?></p>
		<?php endif; ?>

		<?php posts_nav_link(' &#8212; ', __('&laquo; Previous Page'), __('Next Page &raquo;')); ?>
		</div>

<?php get_footer(); ?>