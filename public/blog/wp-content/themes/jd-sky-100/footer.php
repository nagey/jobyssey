<!-- begin footer -->

<?php get_sidebar(); ?>

<p id="credits">


<a href="<?php bloginfo('rss2_url'); ?>">Entries</a> and <a href="<?php bloginfo('comments_rss2_url'); ?>">comments</a> feeds. 
Valid <a href="http://validator.w3.org/check/referer">XHTML</a> and <a href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a>. ^<a href="#">Top</a>^<br />

 <?php echo $wpdb->num_queries; ?> queries. <?php timer_stop(1); ?> seconds.<br />
Powered by <a href="http://wordpress.org">WordPress</a> with <a href="http://www.jdblog.net/wordpress">jd-sky theme</a> design by <a href="http://www.jdblog.net">John Doe</a>.</p>

</div>

<?php do_action('wp_footer'); ?>
</body>
</html>

