<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<head>
<?php wp_head(); ?>
<title><?php if (function_exists('seo_title_tag')) { seo_title_tag(); } else { bloginfo('name'); wp_title();} ?></title>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
  <meta name="copyright" content="Copyright 2005" />
  <meta name="author" content="Aneko Studios - www.anekostudios.com" />
  <meta http-equiv="imagetoolbar" content="no" />
  <meta name="MSSmartTagsPreventParsing" content="true" />

  <!-- script to make external links that open in a new window validate, since "target=_blank" does not -->
  <script type="text/javascript" src="<?php bloginfo('template_directory'); ?>/scripts/external.js"></script>

  <!-- script to show/hide more text in entries -->
  <script type="text/javascript" src="<?php bloginfo('template_directory'); ?>/scripts/showhide.js"></script>

  <!-- script to remove dotted lines from around all links within the page -->
  <script type="text/javascript" src="<?php bloginfo('template_directory'); ?>/scripts/blur.js"></script>

  <?php 
   // if you wish for your comments top open in a popup window, then uncomment
   // this section.  You will also need to remname the "comments_popupBAK.php file
   // to comments_popup.php
   // comments_popup_script(400, 450); 
  ?>

  <link rel="stylesheet" href="<?php bloginfo('stylesheet_url'); ?>" type="text/css" media="screen" />

  <?php if(get_option('orange_crush_style')) { ?>
  <link rel="stylesheet" href="<?php echo get_bloginfo('template_directory'); ?>/styles/<?php echo get_option('orange_crush_style'); ?>" type="text/css" media="screen,projection" />
  <?php } ?>

  <!--[if IE]>
  <link rel="stylesheet" href="<?php bloginfo('template_directory'); ?>/ie.css" type="text/css" media="screen" />
  <![endif]-->

  <!--[if lte IE 6]>
  <link rel="stylesheet" href="<?php bloginfo('template_directory'); ?>/ie6.css" type="text/css" media="screen" />
  <![endif]-->

</head>
 
<body>

<div id="wrapper"> 

  <div id="header">
    <div class="outer">
      <div class="ie"> 
	<h1><a href="<?php echo get_settings('home'); ?>/"><?php bloginfo('name'); ?></a>
        <img src="<?php bloginfo('template_directory'); ?>/images/scroll.gif" width="60" height="18" alt="" /></h1>
	<h2><?php bloginfo('description'); ?></h2>
      </div>
    </div>
  </div> <!-- closing #header -->

  <div id="content_wrapper">