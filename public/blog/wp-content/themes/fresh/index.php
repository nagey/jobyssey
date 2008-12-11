<?php get_header(); ?>

<div id="Body">

	<div class="LeftContent">
		<div class="CommonPanel">
			<!-- Start Article Posts -->
			<?php if (have_posts()) : while (have_posts()) : the_post(); ?>
			<div class="Article">
				<div class="CalendarGroup">
					<div class="Calendar">
						<span class="Month"><?php the_time('M'); ?></span><br />
						<span class="Day"><?php the_time('d'); ?></span><br />
						<span class="Year"><?php the_time('Y'); ?></span></div>
				</div>
				<div class="TitleGroup">
					<h2>
						<a href="<?php the_permalink(); ?>" title="<?php the_title(); ?>"><?php the_title(); ?></a></h2>
					<div class="meta">
						Posted by: <span class="Author"><?php the_author(); ?></span> in Categories:
						<?php the_category(', '); ?>.<br /><?php the_tags('Using Tags: ', ', ', ''); ?></div>
				</div>
				<div class="Clear">
				</div>
				<div class="PostContent">
					<?php the_content('Read the entire post...'); ?>
					<div class="CommentsGroup">
						<span class="CommentsCloud"><?php comments_popup_link(__('0'), __('1'), __('%'), '', __('--')); ?></span> <span class="CommentsText">Comments</span> 
						<?php edit_post_link(__('Edit this Post')); ?></div>
				</div>
			</div>
			<!-- End Article Posts -->
			<?php endwhile; else: ?>
			<p><?php _e('Sorry, no posts matched your criteria.'); ?></p>
			<?php endif; ?>
			<?php posts_nav_link(' &#8212; ', __('&laquo; Newer Posts'), __('Older Posts &raquo;')); ?>
		</div>
	</div>

<?php get_sidebar(); ?>

<div class="Clear"></div>
</div>

<?php get_footer(); ?>