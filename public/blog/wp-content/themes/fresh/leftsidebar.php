<?php if ( function_exists('dynamic_sidebar') && dynamic_sidebar('Left_Sidebar') ) : else : ?>

<h2>Join The Movement</h2>
<ul>
	<li><?php wp_loginout(); ?></li>
	<?php wp_register(); ?>
</ul>
		
<h2 id="cat">Categories</h2>
<ul>
	<?php wp_list_categories('title_li='); ?>
</ul>
		
<h2 id="arh">Monthly Archive</h2>
<ul>
	<?php wp_get_archives('type=monthly'); ?>
</ul>

<?php endif; ?>