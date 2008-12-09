<?php 
/* Don't remove these lines. */
add_filter('comment_text', 'popuplinks');
foreach ($posts as $post) { start_wp();
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
"http://www.w3.org/TR/xhtml11/DTD/xhtml11-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<head>
  <title>Aneko Studios - Comments on <?php the_title(); ?></title>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
  <meta name="copyright" content="Copyright 2005" />
  <meta name="author" content="Aneko Studios - www.anekostudios.com" />
  <meta http-equiv="imagetoolbar" content="no" />
  <meta name="MSSmartTagsPreventParsing" content="true" />

  <!-- script to make external links that open in a new window validate, since "target=_blank" does not -->
  <script type="text/javascript" src="<?php bloginfo('template_directory'); ?>/scripts/external.js"></script>

  <!-- script to remove dotted lines from around all links within the page -->
  <script type="text/javascript" src="<?php bloginfo('template_directory'); ?>/scripts/blur.js"></script>

  <link rel="stylesheet" href="<?php bloginfo('template_directory'); ?>/comments.css" type="text/css" media="screen" />

  <?php if(get_option('orange_crush_style')) { ?>
  <link rel="stylesheet" href="<?php echo get_bloginfo('template_directory'); ?>/styles/comments/comments_<?php echo get_option('orange_crush_style'); ?>" type="text/css" media="screen,projection" />
  <?php } ?>

</head>

<body>

<div id="comments_wrap">

<h2>Comments</h2>

<?php
// this line is WordPress' motor, do not delete it.
$comment_author = (isset($_COOKIE['comment_author_' . COOKIEHASH])) ? trim($_COOKIE['comment_author_'. COOKIEHASH]) : '';
$comment_author_email = (isset($_COOKIE['comment_author_email_'. COOKIEHASH])) ? trim($_COOKIE['comment_author_email_'. COOKIEHASH]) : '';
$comment_author_url = (isset($_COOKIE['comment_author_url_'. COOKIEHASH])) ? trim($_COOKIE['comment_author_url_'. COOKIEHASH]) : '';
$comments = get_approved_comments($id);
$post = get_post($id);
if (!empty($post->post_password) && $_COOKIE['wp-postpass_'. COOKIEHASH] != $post->post_password) {  // and it doesn't match the cookie
	echo(get_the_password_form());
} else { ?>

<?php if ($comments) { ?>

<ul id="commentlist">
<?php foreach ($comments as $comment) { ?>
	<li id="comment-<?php comment_ID() ?>">
	<?php comment_text() ?>
	<p class="right"><?php comment_type('Comment', 'Trackback', 'Pingback'); ?> by <?php comment_author_link() ?> <br />
        <?php comment_date() ?> @ <a href="#comment-<?php comment_ID() ?>"><?php comment_time() ?></a></p>
	</li>

<?php } // end for each comment ?>
</ul>

<?php } else { // this is displayed if there are no comments so far ?>
	<p>No comments yet.</p>
<?php } ?>

<?php if ('open' == $post->comment_status) { ?>
<h2>Leave a comment</h2>
<form action="<?php echo get_settings('siteurl'); ?>/wp-comments-post.php" method="post" id="commentform">
	<p>
	<label for="author">Name</label>
	<input type="hidden" name="comment_post_ID" value="<?php echo $id; ?>" />
	<input type="hidden" name="redirect_to" value="<?php echo wp_specialchars($_SERVER["REQUEST_URI"]); ?>" />
	<input class="form textarea" type="text" name="author" id="author" value="<?php echo $comment_author; ?>" tabindex="1" />
	</p>

	<p>
	<label for="email">E-mail</label>
	<input class="form" type="text" name="email" id="email" value="<?php echo $comment_author_email; ?>" tabindex="2" />
	</p>

	<p>
	<label for="url">URL</label>
	<input class="form" type="text" name="url" id="url" value="<?php echo $comment_author_url; ?>" tabindex="3" />
	</p>

	<p class="center">
	  <label class="center" for="comment">Your Comment</label>
	<br />
	  <textarea class="form" name="comment" id="comment" tabindex="4" rows="5" cols="10"></textarea>
	</p>
          <div>
	  <input class="formbutton" name="submit" type="submit" tabindex="5" value="Say It!" />
          </div>
	<?php do_action('comment_form', $post->ID); ?>
</form>
<?php } else { // comments are closed ?>
<p>Sorry, the comment form is closed at this time.</p>
<?php }
} // end password check
?>

<?php // if you delete this the sky will fall on your head
}
?>

<!-- // this is just the end of the motor - don't touch that line either :) -->
<?php //} ?> 

</div>
</body>
</html>
