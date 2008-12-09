<?php get_header(); ?>
<div id="container">
<div id="entries">
<?php previous_post_link('&laquo; %link','%title') ?><br/>
<?php next_post_link('&raquo; %link','%title') ?>	

	<h3>Look What I Found</h3>
<h1 style="display:inline; font-size:3.3em;">Search Results</h1><br/> <br>
      <br>
	<?php if (have_posts()) : ?>
		<ul>			
		<?php while (have_posts()) : the_post(); ?>
							
			<li><div class="results_date">
				<?php the_time('m.d.y'); ?> 
			</div> <div class="results_content">
				<a href="<?php the_permalink(); ?>" style="color:#444444;"><?php the_title(); ?></a><small>&nbsp;&nbsp;	<?php the_category(', ') ?>  <?php comments_popup_link('(0)', '(1)', '(%)' ) ?></small><div style="margin-top: -1em;">
					<?php the_excerpt(); ?>
				</div>
			</div></li>
				<?php endwhile; ?>
		</ul>	
	<?php else : ?>
		<h3>Look What I Didn't Find</h3>
<h1 style="display:inline; font-size:3.3em;">Nothing Found</h1><br/><br/>
Sorry. I looked everywhere, but I didn't find anything. Try again?
	<?php endif; ?>
<?php previous_post_link('&laquo; %link','%title') ?><br/>
<?php next_post_link('&raquo; %link','%title') ?><br/>	
</div><!--end entries-->
<?php get_sidebar(); ?>
</div><!-- end container -->
<?php get_footer(); ?>