<!-- This is where you edit your sidebar.  You can easily "widgetize" your sidebar, but if you choose not
     to use widgets, there are options here to still have the same type of sidebar. -->

  <div id="sidebar">

<? if (function_exists('do_calendar')) { do_calendar(); } ?>

	<?php if ( function_exists('dynamic_sidebar') && dynamic_sidebar() ) : else : //This line basically says "If you have Widgets activated, use them...or else..." ?>
	<?php include (TEMPLATEPATH . '/searchform.php'); //"...below is what will show if Widgets are not enabled." ?>

        <div id="calendar" class="widget widget_calendar">
        <div id="calendar_wrap">
        <?php get_calendar(); ?>
        </div>
        </div>

        <div id="archives">
        <div class="title">Archives</div>
        <ul>
        <?php wp_get_archives(); ?>
        </ul>
        </div>

        <div id="categories">
        <div class="title">Categories</div>
        <ul>
        <?php wp_list_categories('title_li='); ?>
        </ul>
        </div>

        <div id="pages">
        <div class="title">Pages</div>
        <ul>
        <?php wp_list_pages('title_li=');?> 
        </ul>
        </div>

        <div id="posts">
        <div class="title">Recent Posts</div>
        <ul>
        <?php
        $posts = get_posts('numberposts=10&order=DESC&orderby=post_date');
        foreach ($posts as $post) : start_wp(); ?>
            <li><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></li>
        <?php endforeach; ?>
         </ul>
        </div>

        <div id="blogroll">
        <div class="title">Blogroll</div>
        <ul>
 	<?php get_links(''); ?>
        </ul>
        </div>

<?php /* If this is the frontpage */ if ( is_home() || is_page() ) { ?>
        <div id="meta">
        <div class="title">Meta</div>
        <ul>
        <?php wp_register(); ?>
        <li><?php wp_loginout(); ?></li>
        <li><a href="http://validator.w3.org/check/referer" title="This page validates as XHTML 1.0 Transitional">Valid <abbr title="eXtensible HyperText Markup Language">XHTML</abbr></a></li>
        <li><a href="http://gmpg.org/xfn/"><abbr title="XHTML Friends Network">XFN</abbr></a></li>
        <?php wp_meta(); ?>
        </ul>
        </div>
			<?php } ?>

	<?php endif; ?>

  </div> <!--closing #sidebar -->