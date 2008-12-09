<div id="sidebar">
	
	<form method="get" id="searchform" action="<?php bloginfo('home'); ?>/">
	<div><input type="text" name="s" id="s" />
	<input type="submit" id="submit" value="Search" /></div></form><br/>

	<h2>Recent Posts</h2>
		<ul>
		<?php get_archives('postbypost', 20); ?>
		</ul>

	<h2>Categories</h2>
		<ul>
		<?php wp_list_cats('sort_column=name'); ?>
		</ul>
			
	<h2>Archives</h2>
		<ul>
		<?php wp_get_archives('type=monthly'); ?>
		</ul>
	
	<h2>Meta</h2>
		<ul>
		<?php wp_register(); ?>
		<li><?php wp_loginout(); ?></li>
		<li><a href="http://www.wordpress.org/">Wordpress</a></li>
		<?php wp_meta(); ?>
		<li><a href="http://validator.w3.org/check?uri=referer">XHTML</a></li>
              <li><a href="<?php bloginfo('rss2_url'); ?>" title="<?php _e('RSS Feed for Blog Entries'); ?>">Entries RSS</a></li>
		<li><a href="<?php bloginfo('comments_rss2_url'); ?>" title="<?php _e('RSS Feed for all Comments');?>">Comments RSS</a></li>
		</ul>

	<h2>Links</h2>
		<ul>
		<?php get_links(-1, '<li>', '</li>', ' - '); ?>
		</ul>
				
</div>