<?php if ( function_exists('dynamic_sidebar') && dynamic_sidebar('Right_Sidebar') ) : else : ?>

<h2>Advertisements</h2>
<div class="Ads">
	<p>
		<!-- Place your manual Ads here. I recommend using the Widget feature of WordPress
		<a href="http://www.namynot.com" target="_blank"><img src="images/ad_nmi.gif" alt="NAMYnot Multimedia Inc. Custom Web Design" width="125" height="125" border="0" /></a>-->
	</p>
</div>

<h2>Blog Roll</h2>
<ul>
	<?php wp_list_bookmarks('categorize=0&title_li='); ?>
</ul>

<?php endif; ?>