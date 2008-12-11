<?php get_header(); ?>
<div style="margin-left:20px;width:95%;">

	<h2 class="widgettitle">Invite your friends</h2>
	  <fb:serverfbml style="width: 100%;">
	    <script type="text/fbml">
	      <fb:fbml>
	          <fb:request-form
	                    action="<?php echo get_option('siteurl'); ?>"
	                    method="GET"
	                    invite="true"
	                    type="XFBML"
	                    content="<?php echo get_option('blogname')." : ".get_option('blogdescription'); ?>
	                 <fb:req-choice url='<?php echo get_option('siteurl'); ?>'
	                       label='Become a Member!' />
	              "
	              >
	 
	                    <fb:multi-friend-selector
	                    showborder="false"
	                    actiontext="Select the friends you want to invite.">
	        </fb:request-form>
	      </fb:fbml>
	 
	    </script>
	  </fb:serverfbml>

 </div>



<?php get_footer(); ?>