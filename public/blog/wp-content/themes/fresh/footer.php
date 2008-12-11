<div id="Footer">
	<div class="LeftContent">
		<div class="CommonPanel">
			<span>Powered by <a href="http://wordpress.org/" target="_blank">WordPress</a> | <a
				href="<?php bloginfo('rss2_url'); ?>">Subscribe (RSS)</a> and <a href="<?php bloginfo('comments_rss2_url'); ?>">Comments (RSS)</a> </span>
		  <p>
				Copyright &copy; 2008. All right reserved.<br />
			  <a href="http://www.antoniowells.com/2008/10/05/fresh-wordpress-themefresh-wordpress-theme/" target="_blank">Fresh</a> Theme by <a href="http://www.antoniowells.com"
					target="_blank">Antonio Wells.com</a>.
		  </p>
		</div>
	</div>
	<div class="Sidebar">
		<div class="LeftSideBar">
			<div class="CommonPanel">
				<h2>Blog Roll</h2>
				<ul>
					<?php wp_list_bookmarks('categorize=0&title_li='); ?>
				</ul>
			</div>
		</div>
		<div class="RightSideBar">
			<div class="CommonPanel">
				<h2>Meta</h2>
				<ul>
					<?php wp_register(); ?>
					<li><?php wp_loginout(); ?></li>
					<li><a href="http://validator.w3.org/check/referer" title="This page validates as XHTML 1.0 Transitional">Valid <abbr title="eXtensible HyperText Markup Language">XHTML</abbr></a></li>
					<li><a href="http://gmpg.org/xfn/"><abbr title="XHTML Friends Network">XFN</abbr></a></li>
					<li><a href="http://wordpress.org/" title="Powered by WordPress, state-of-the-art semantic personal publishing platform.">WordPress</a></li>
					<?php wp_meta(); ?>
				</ul>
			</div>
		</div>
	</div>
	<div class="Clear">
	</div>
</div>

<?php wp_footer(); ?>

</div>
</body>
</html>