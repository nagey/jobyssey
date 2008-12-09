<div id="sidebar">

<a href="<?php echo get_settings('home'); ?>/"><img src="<?php bloginfo('stylesheet_directory'); ?>/images/header.jpg" width="336" alt="<?php bloginfo('name'); ?>" /></a><br/>

<h1><a href="http://jobyssey.com"><?php bloginfo('name'); ?></a></h1>
<h2><a href="<?php echo get_option('home'); ?>/">Blog Main Page</a></h2>
<h3><?php bloginfo('description'); ?></h3>

<?php if ( !function_exists('dynamic_sidebar')
        || !dynamic_sidebar(1) ) : ?>
        
        
	<h3>about</h3>
		<?php bloginfo('name'); ?> was designed by <a href="http://www.upstartblogger.com/">Upstart Blogger</a>. Here's where you put a little blurb to let visitors know what your site is about. Just edit <b>sidebar.php</b>.

		
<h3>search</h3><br/>
	<?php include(TEMPLATEPATH . '/searchform.php'); ?>

<?php if (function_exists('akpc_most_popular')) { ?>
<h3>popular</h3>
<ul>
<?php akpc_most_popular($limit = 5); ?>
</ul>
<?php } ?>

<h3>clickage</h3>
You can put an ad here if you like. Just edit <b>sidebar.php</b>. For the latest information about this theme, please check this theme's page on Upstart Blogger, <a href="http://www.upstartblogger.com/wordpress-theme-upstart-blogger-minim" title="WordPress Theme: Upstart Blogger Minim">WordPress Theme: Upstart Blogger Minim</a>.		

<h3>recent</h3>
			<ul>
					<?php	query_posts('showposts=5');	?>
					<?php if (have_posts()) : while (have_posts()) : the_post(); ?>
					<li><strong><a href="<?php the_permalink() ?>"><?php the_title() ?> </a></strong></li>
					<?php endwhile; endif; ?>
			</ul>	

<?php if (function_exists('get_recent_comments')) { ?>
<h3>comments</h3>
<ul class="dates"><?php get_recent_comments(); ?></ul>
<?php } ?>

<h3>Copyright</h3>
	Copyright &copy; 2007 by <?php bloginfo('name'); ?>. All rights reserved.
	<!-- This theme is free and you can alter it as you see fit, but please keep the link to Upstart Blogger. Thanks! --><p>Designed by <a href="http://www.upstartblogger.com/">Upstart Blogger</a>.</p>
								

<?php endif; ?>

 


				
</div><!--end sidebar-->