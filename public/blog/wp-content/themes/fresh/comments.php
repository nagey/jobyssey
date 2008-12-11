<?php // Do not delete these lines
	if ('comments.php' == basename($_SERVER['SCRIPT_FILENAME']))
		die ('Please do not load this page directly. Thanks!');

	if (!empty($post->post_password)) { // if there's a password
		if ($_COOKIE['wp-postpass_' . COOKIEHASH] != $post->post_password) {  // and it doesn't match the cookie
			?>

			<p class="NoComments">This post is password protected. Enter the password to view comments.</p>

			<?php
			return;
		}
	}
	
		$oddcomment = ' Alt';
?>

<!-- Start Comments Form -->
<div class="Comments">
	<h2><?php comments_number('0 Comments', '1 Comment', '% Comments' );?> until now</h2>

	<?php if ($comments) : ?>
		<?php foreach ($comments as $comment) : ?>
			<div class="Comment<?php echo $oddcomment; ?>" id="comment-<?php comment_ID() ?>"  >
				<div class="CommentMeta">
					<span class="Gravatar"><a href="#comment-<?php comment_ID() ?>" title=""><?php echo get_avatar( $comment, 32 ); ?></a></span>
					<span class="CommentDate">
						On <?php comment_date('F jS, Y') ?>  
						<?php comment_author_link() ?> Said:
					</span>
				<div style="clear: both;"></div>
				</div>
				<?php if ($comment->comment_approved == '0') : ?>
				<p><strong>Your comment is awaiting moderation! If approved, we'll put it on the site!</strong></p>
				<?php endif; ?>
				<?php comment_text() ?>
			</div>
			<?php
			/* Changes every other comment to a different class */
			$oddcomment = ( empty( $oddcomment ) ) ? ' Alt' : '';
			?>
		<?php endforeach; /* end for each comment */ ?>

	<?php else : // this is displayed if there are no comments so far ?>
		<p class="NoComments">Be heard... Be the first commenter!</p>
		<?php if ('open' == $post->comment_status) : ?>
			<!-- If comments are open, but there are no comments. -->
		<?php else : // comments are closed ?>
			<!-- If comments are closed. -->
			<p class="NoComments">Comments are closed.</p>
		<?php endif; ?>
	<?php endif; ?>

		<div class="CommentForm">

	<?php if ('open' == $post->comment_status) : ?>
		<h2>Be Heard... Add your Comment!</h2>
		<?php if ( get_option('comment_registration') && !$user_ID ) : ?>
		<p>You must be <a href="<?php echo get_option('siteurl'); ?>/wp-login.php?redirect_to=<?php echo urlencode(get_permalink()); ?>">logged in</a> to post a comment.</p>
		<?php else : ?>

		<form action="<?php echo get_option('siteurl'); ?>/wp-comments-post.php" method="post" id="Commentform">

			<?php if ( $user_ID ) : ?>
			<?php else : ?><?php endif; ?>
				<span>Name*:</span>
				<input class="input" type="text" name="author" id="author" value="<?php echo $comment_author; ?>" size="22" tabindex="2" />
				
				<span>Email*: <em>(Will not be made Public)</em></span>
				<input class="input" type="text" name="email" id="email" value="<?php echo $comment_author_email; ?>" size="22" tabindex="3" />
				
				<span>Website:</span>
				<input class="input" type="text" name="url" id="url" value="<?php echo $comment_author_url; ?>" size="22" tabindex="4" />

				<span>Comment*:</span>
				<textarea name="comment" id="comment" cols="100%" rows="10" tabindex="1"></textarea>

				<input name="submit" type="submit" id="submit" tabindex="5" value="Submit" class="SubscribeButton" />
				<input type="hidden" name="comment_post_ID" value="<?php echo $id; ?>" />
			
			<?php do_action('comment_form', $post->ID); ?>
		</form>
		</div>
		<?php endif; // If registration required and not logged in ?>
	<?php endif; // if you delete this the sky will fall on your head ?>
	
</div>

