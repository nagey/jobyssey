<?php get_header(); ?>

<div id="container">

<div id="entries">
 
<h3><?php bloginfo('name'); ?></h3>
<h1 style="display:inline; font-size:3.3em;"><a href="<?php the_permalink(); ?>" style="color:#444444;"><?php the_title(); ?></a></h1>

		<h2 class="center">Error 404 - Not Found</h2>

</div><!--end entries-->


<?php get_sidebar(); ?>

</div><!--end container-->
</body>
</html>