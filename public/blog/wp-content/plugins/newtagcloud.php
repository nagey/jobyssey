<?php
/*  Copyright 2007  FunnyDingo  (email : funnydingo@funnydingo.de)

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/

/*
Plugin Name: New Tag Cloud
Plugin URI: http://www.funnydingo.de/projekte/new-tag-cloud/
Description: The plugin provides an widget wich shows a tag cloud with the tags used by the new WordPress own tagging feature
Author: Dennis Hueckelheim aka FunnyDingo
Version: 0.3
Author URI: http://www.funnydingo.de/
*/



$newtagcloud_defaults = array(
	'maxcount'			=> 10,
	'title'				=> 'New Tag Cloud',
	'bigsize'			=> 18,
	'smallsize'			=> 10,
	'step'				=> 2,
	'sizetype'			=> 'px',
	'html_before'		=> '<ul id="newtagcloud"><li>',
	'html_after'		=> '</li></ul>',
	'entry_layout'		=> '<a style="font-size:%FONTSIZE%%SIZETYPE%" href="%TAGURL%" target="_self">%TAGNAME%</a>',
	'glue'				=> ' ',
);



function newtagcloud()
{
	generate_newtagcloud(false);
}



function generate_newtagcloud($widget = true)
{
	global $newtagcloud_defaults, $wpdb;

	$options = get_newtagcloud_settings();
	$content = array();
	$size = $options['bigsize'];

	$query = "SELECT $wpdb->terms.term_id, $wpdb->terms.name, $wpdb->term_taxonomy.count FROM (($wpdb->term_relationships INNER JOIN $wpdb->posts ON $wpdb->term_relationships.object_id = $wpdb->posts.ID) INNER JOIN $wpdb->term_taxonomy ON $wpdb->term_relationships.term_taxonomy_id = $wpdb->term_taxonomy.term_taxonomy_id) INNER JOIN $wpdb->terms ON $wpdb->term_taxonomy.term_id = $wpdb->terms.term_id WHERE ((($wpdb->term_taxonomy.taxonomy)='post_tag') AND (($wpdb->posts.post_status)='publish')) GROUP BY $wpdb->terms.name ORDER BY count DESC, $wpdb->terms.name LIMIT 0, " . $options['maxcount'];
	$terms = $wpdb->get_results($query);

	$prevCount = $terms[0]->count;
	foreach ($terms as $term)
	{
		if ($prevCount > intval($term->count) && $size > $options['smallsize'])
		{
			$size = $size - $options['step'];
			$prevCount = intval($term->count);
		}
		$content[$term->name] = str_replace('%FONTSIZE%', $size, $options['entry_layout']);
		$content[$term->name] = str_replace('%SIZETYPE%', $options['sizetype'], $content[$term->name]);
		$content[$term->name] = str_replace('%TAGURL%', get_tag_link($term->term_id), $content[$term->name]);
		$content[$term->name] = str_replace('%TAGNAME%', $term->name, $content[$term->name]);
	}
	ksort($content);
	$content = implode($options['glue'], $content);
	if ($widget)
		echo '<h2>' . $options['title'] . '</h2>' . $options['html_before'] . $content . $options['html_after'];
	else
		echo $options['html_before'] . $content . $options['html_after'];
}



function newtagcloud_control()
{
	global $newtagcloud_defaults;

	$options = get_newtagcloud_settings();
	if (isset($_POST['newtagcloud-title']))
	{
		$options['title'] = strip_tags(stripslashes($_POST['newtagcloud-title']));
		update_option('widget_newtagcloud', $options);
	}
	echo '<p style="text-align:right;"><label for="newtagcloud-title">Title: <input style="width: 250px;" id="newtagcloud-title" name="newtagcloud-title" type="text" value="'.$options['title'].'" /></label></p>';
}



function newtagcloud_options()
{
	if (isset($_POST['newtagcloud-save']))
		save_newtagcloud_settings();

	$options = get_newtagcloud_settings();
	$options['glue'] = str_replace(" ", "%BLANK%", $options['glue']);
	?>
	<div class="wrap">
		<h2>New Tag Cloud Settings</h2>
		<form action="" method="post" name="newtagcloud-settings">
			<p>How many tags should be shown at most?<br/>
			<input type="text" name="newtagcloud-maxcount" value="<?php echo($options['maxcount']); ?>" size="<?php echo(strlen($options['maxcount'])+5); ?>" /></p>
			<p>How big should be the biggest tag?<br/>
			<input type="text" name="newtagcloud-bigsize" value="<?php echo($options['bigsize']); ?>" size="<?php echo(strlen($options['bigsize'])+5); ?>" /></p>
			<p>How small should be the smallest tag?<br/>
			<input type="text" name="newtagcloud-smallsize" value="<?php echo($options['smallsize']); ?>" size="<?php echo(strlen($options['smallsize'])+5); ?>" /></p>
			<p>Font size difference between to sizes?<br/>
			<input type="text" name="newtagcloud-step" value="<?php echo($options['step']); ?>" size="<?php echo(strlen($options['step'])+5); ?>" /></p>
			<p>Wich CSS size type you want use (e.g. px, pt, em, ...)?<br/>
			<input type="text" name="newtagcloud-sizetype" value="<?php echo($options['sizetype']); ?>" size="<?php echo(strlen($options['sizetype'])+5); ?>" /></p>
			<p>Provide HTML code used before entries:<br/>
			<input type="text" name="newtagcloud-htmlbefore" value="<?php echo(htmlentities($options['html_before'])); ?>" size="<?php echo(strlen($options['html_before'])+5); ?>" /></p>
			<p>Provide HTML coded used after entries:<br/>
			<input type="text" name="newtagcloud-htmlafter" value="<?php echo(htmlentities($options['html_after'])); ?>" size="<?php echo(strlen($options['html_after'])+5); ?>" /></p>
			<p>Entry template<br/>
			<input type="text" id="newtagcloudentrylayout" name="newtagcloud-entrylayout" value="<?php echo(htmlentities($options['entry_layout'])); ?>" size="<?php echo(strlen($options['entry_layout'])+5); ?>" onkeyup="update_example();" onkeydown="update_example();" /><br/>
			<div id="newtagcloud-entrylayout-example"></div></p>
			<p>Wich glue char you want use?<br/>
			<input type="text" name="newtagcloud-glue" value="<?php echo(htmlentities($options['glue'])); ?>" size="<?php echo(strlen($options['glue'])+5); ?>" /><br/><br/>
			<input type="submit" name="newtagcloud-save" value="Save settings"/></p>
        </form>
		<hr>
	</div>
	<script type="text/javascript">
		function update_example()
		{
			var div = document.getElementById("newtagcloud-entrylayout-example");
			var template = document.getElementById("newtagcloudentrylayout").value;
			template = template.replace(/</g, "&lt;");
			template = template.replace(/>/g, "&gt;");
			template = template.replace(/%FONTSIZE%/g, "10");
			template = template.replace(/%SIZETYPE%/g, "px");
			template = template.replace(/%TAGURL%/g, "http://www.yourblog.com/tags/test");
			template = template.replace(/%TAGNAME%/g, "test");
			div.innerHTML = template;
		}
		update_example();
	</script>
	<?php
}



function get_newtagcloud_settings()
{
	global $newtagcloud_defaults;
	$options = get_option('widget_newtagcloud');
	$options['title'] = $options['title'] !== NULL ? $options['title'] : $newtagcloud_defaults['title'];
	$options['maxcount'] = $options['maxcount'] !== NULL ? $options['maxcount'] : $newtagcloud_defaults['maxcount'];
	$options['bigsize'] = $options['bigsize'] !== NULL ? $options['bigsize'] : $newtagcloud_defaults['bigsize'];
	$options['smallsize'] = $options['smallsize'] !== NULL ? $options['smallsize'] : $newtagcloud_defaults['smallsize'];
	$options['step'] = $options['step'] !== NULL ? $options['step'] : $newtagcloud_defaults['step'];
	$options['sizetype'] = $options['sizetype'] !== NULL ? $options['sizetype'] : $newtagcloud_defaults['sizetype'];
	$options['html_before'] = $options['html_before'] !== NULL ? $options['html_before'] : $newtagcloud_defaults['html_before'];
	$options['html_after'] = $options['html_after'] !== NULL ? $options['html_after'] : $newtagcloud_defaults['html_after'];
	$options['entry_layout'] = $options['entry_layout'] !== NULL ? $options['entry_layout'] : $newtagcloud_defaults['entry_layout'];
	$options['glue'] = $options['glue'] !== NULL ? $options['glue'] : $newtagcloud_defaults['glue'];
	return $options;
}



function save_newtagcloud_settings()
{
	$options = get_newtagcloud_settings();

	$options['maxcount'] = intval($_POST['newtagcloud-maxcount']);
	$options['bigsize'] = intval($_POST['newtagcloud-bigsize']);
	$options['smallsize'] = intval($_POST['newtagcloud-smallsize']);
	$options['step'] = intval($_POST['newtagcloud-step']);
	$options['sizytype'] = strip_tags(stripslashes($_POST['newtagcloud-sizetype']));
	$options['html_before'] = stripslashes($_POST['newtagcloud-htmlbefore']);
	$options['html_after'] = stripslashes($_POST['newtagcloud-htmlafter']);
	$options['entry_layout'] = stripslashes($_POST['newtagcloud-entrylayout']);
	$options['glue'] = stripslashes(str_replace("%BLANK%", " ", $_POST['newtagcloud-glue']));
	update_option('widget_newtagcloud', $options);
	echo '<div id="message" class="updated fade"><p><strong>';
	_e('Options saved.');
	echo '</strong></p></div>';
}



function newtagcloud_menu()
{
	add_options_page('New Tag Cloud', 'New Tag Cloud', 8, 'newtagcloud.php','newtagcloud_options');
}



function newtagcloud_init()
{
	if ( !function_exists('register_sidebar_widget') || !function_exists('register_widget_control') )
		return;
	function print_newtagcloud($args) {
		extract($args);
		?>
		<?php echo $before_widget; ?>
		<?php echo generate_newtagcloud(); ?>
		<?php echo $after_widget; ?>
<?php
	}
	register_sidebar_widget(array('New Tag Cloud', 'widgets'), 'print_newtagcloud');
	register_widget_control(array('New Tag Cloud', 'widgets'), 'newtagcloud_control', 50, 10);
}



function newtagcloud_output($a = null)
{
	echo "Calling newtagcloud_output() is depricated. Please check the manual for more informations!";
}



add_action('widgets_init', 'newtagcloud_init');
add_action('admin_menu', 'newtagcloud_menu');

?>
