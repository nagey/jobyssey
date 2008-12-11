<?php
/*
Template Name: Error 404 Template
*/
?>
<?php get_header(); ?>

<div id="Body">

	<div class="LeftContent">
		<div class="CommonPanel">
		
	<h2>Sorry, the page request cannot be found. </h2>
	<br />
	<p>You 
<?php
#some variables for the script to use
#if you have some reason to change these, do.  but wordpress can handle it
$adminemail = get_bloginfo('admin_email'); #the administrator email address, according to wordpress
$website = get_bloginfo('url'); #gets your blog's url from wordpress
$websitename = get_bloginfo('name'); #sets the blog's name, according to wordpress
  if (!isset($_SERVER['HTTP_REFERER'])) {
    #politely blames the user for all the problems they caused
        echo "tried going to: <strong>"; #starts assembling an output paragraph
	$casemessage = "No worries...";
  } elseif (isset($_SERVER['HTTP_REFERER'])) {
    #this will help the user find what they want, and email me of a bad link
	echo "clicked a link to"; #now the message says You clicked a link to...
        #setup a message to be sent to me
	$failuremess = "A user tried to go to $website"
        .$_SERVER['REQUEST_URI']." and received a 404 (page not found) error. ";
	$failuremess .= "It wasn't their fault, so try fixing it.  
        They came from ".$_SERVER['HTTP_REFERER'];
	mail($adminemail, "Bad Link To ".$_SERVER['REQUEST_URI'],
        $failuremess, "From: $websitename <noreply@$website>"); #email you about problem
	$casemessage = "An administrator has been emailed 
        about this problem, too.";#set a friendly message
  }
  echo " ".$website.$_SERVER['REQUEST_URI']; ?> 
</strong><br />
...and it doesn't exist. <?php echo $casemessage; ?>  You can click back 
and try again, search for what you were looking for,
  <?php include(TEMPLATEPATH . "/searchform.php"); ?> 
go to the 
	<a href="<?php echo get_settings('siteurl'); ?>" title="Go to the Homepage">Homepage</a>, or read the </p>
    <h3>Last <?php print(isset($getOptions["num_posts"])?$getOptions["num_posts"]:"8"); ?> blog posts</h3>
	<ol>
			<?php get_archives('postbypost', isset($getOptions["num_posts"])?$getOptions["num_posts"]:8, '', '<li>', '</li>'); ?>
	</ol>
	<ol>
			<?php wp_list_cats('sort_column=name&optioncount=1&hierarchical=0&feed=RSS'); ?>
	</ol>

	</div>
</div>


<?php get_sidebar(); ?>

<div class="Clear"></div>
</div>

<?php get_footer(); ?>