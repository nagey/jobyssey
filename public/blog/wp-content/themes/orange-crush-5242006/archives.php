<?php
/*
Template Name: Monthly Archive List
*/
?>

<?php get_header(); ?>

<div id="content">

<?php include (TEMPLATEPATH . '/searchform.php'); ?>

<h2>Archives by Month:</h2>
  <ul>
    <?php wp_get_archives('type=monthly'); ?>
  </ul>

<h2>Archives by Subject:</h2>
  <ul>
     <?php wp_list_cats(); ?>
  </ul>

</div>	<!--closing #content -->

</div> <!-- closing #content_wrapper -->

<?php get_sidebar(); ?>

<?php get_footer(); ?>
