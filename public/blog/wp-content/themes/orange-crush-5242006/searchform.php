<?php
/*
Template Name: Search Form
*/
?>

     	<div id="search">

		<form method="get" id="searchform" action="<?php bloginfo('home'); ?>">
                <div> <!-- for validation purposes -->
		<input type="text" name="s" id="s" value="search me!" />
		<input class="button" id="searchsubmit" type="image" value="&nbsp; &nbsp; &nbsp;" />
                </div> <!-- closing div tag for validation purposes -->
	  	</form>
    	</div> <!-- closing #search -->