<?php
/*
Template Name: Links
*/
?>

<?php get_header(); ?>

<div id="bloque">
	<div id="notice">
		<div class="entrance">
			<h2>Links:</h2>
			<ul>
			<?php get_links(-1, '<li>', '</li>', ''); ?>
			</ul>
		</div>
	</div>	

<?php get_footer(); ?>
