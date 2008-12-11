<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title><?php wp_title(' '); ?> <?php if(wp_title(' ', false)) { echo ' : '; } ?><?php bloginfo('name'); ?></title>
		<meta name="generator" content="WordPress <?php bloginfo('version'); ?>" /> <!-- leave this for stats -->
		<link rel="stylesheet" href="<?php bloginfo('stylesheet_url'); ?>" type="text/css" media="screen" />
		<link rel="alternate" type="application/rss+xml" title="<?php bloginfo('name'); ?> RSS Feed" href="<?php bloginfo('rss2_url'); ?>" />
		<link rel="pingback" href="<?php bloginfo('pingback_url'); ?>" />
		<?php wp_head(); ?>
		<!--[if IE 6]>
		<link rel="stylesheet" href="<?php bloginfo('template_directory'); ?>/ie.css" type="text/css" media="screen" />
		<![endif]-->
</head>
<body>
<div id="Wrapper">
	<div id="Header">
		<div id="BlogTitle">
			<h1>
				<a href="<?php bloginfo('url'); ?>" title="<?php bloginfo('name'); ?>"><?php bloginfo('name'); ?></a></h1>
			<span class="Description"><?php bloginfo('description'); ?></span></div>
		<div id="SearchBox">
			<form method="get" id="searchform" action="<?php bloginfo('url'); ?>/">
			<input type="text" class="SearchField" value="Search Posts" name="s" id="s" onfocus="javascript:if(this.value=='Search Posts') this.value='';"
				onblur="javascript:if(this.value=='') this.value='Search Posts';" /><input name="Submit" type="submit" class="SearchButton" value="" />
			</form>
		</div>
		<div class="Clear">
		</div>
		<div id="NavPanel">
			<div class="Menu">
				<ul>
					<li class="page_item<?php if (is_home()) {echo ' current_page_item';} ?>">					
						<a href="<?php bloginfo('url'); ?>" title="Home">Home</a></li>
						<?php wp_list_pages('sort_column=menu_order&title_li=&depth=1'); ?>
				</ul>
			</div>
			<div class="RSS"><a href="<?php bloginfo('rss2_url'); ?>">Subscribe to RSS</a></div>
			<div class="Clear">
			</div>
		</div>
		<div class="Clear">
		</div>
	</div>
	<p>
	</p>
	