<?php
/*
Plugin Name: Snap Shots&trade; Plugin for Wordpress.org
Version: 2.0
Plugin URI: http://www.snap.com/about/shots_central.php
Description: Add <a href="http://shots.snap.com">Snap Shots</a> to your website or blog. Snap Shots enhance links with visual previews of the destination site, including summaries of Wikipedia and IMDb, YouTube videos, stock charts, RSS feeds and more with just a single line of javascript. Go to <a href="options-general.php?page=spa_options">Options &gt;&gt; Snap Shots</a> to configure.
Publisher: Snap Technologies, Inc.
Author: Snap Technologies, Inc.
Author URI: http://shots.snap.com
*/

if (!defined('ABSPATH')) die("Aren't you supposed to come here via WP-Admin?");

define('ALD_Snap_Shots_DIR', dirname(__FILE__));

/*********************************************************************
*                  Main Function (Do not edit)                       *
********************************************************************/
function ald_spa()
{
	$spa_settings = spa_read_options();

	if($spa_settings[key]=='')
	{
		$str = 'Please visit WP-Admin &gt; Options &gt; Snap Shots and enter the Snap Shots key. <a href="http://www.snap.com/about/shots_faq.php#26">How to find your key</a>';
	}
	else
	{
		$str = '<script type="text/javascript" src="http://shots.snap.com/snap_shots.js?ap=';
		if ($spa_settings[alllinks]) {
			$str .= '1';
		} else {
			$str .= '0';
		}
		$str .= '&amp;key=' . $spa_settings[key];
		$str .= '&amp;sb=';
		if ($spa_settings[searchbox]) {
			$str .= '1';
		} else {
			$str .= '0';
		}

		if ($spa_settings[theme]) $str .= '&amp;th='. $spa_settings[theme];

		$str .= '&amp;cl=';
		if ($spa_settings[customlogo]) {
			$str .= '1';
		} else {
			$str .= '0';
		}

		$str .= '&amp;si=';
		if ($spa_settings[locallinks]) {
			$str .= '1';
		} else {
			$str .= '0';
		}

		$str .= '&amp;po=';
		if ($spa_settings[previewshots]) {
			$str .= '1';
		} else {
			$str .= '0';
		}

		$str .= '&amp;oi=0';

		$str .= '&amp;df=';
		if ($spa_settings[df]) {
			$str .= '1';
		} else {
			$str .= '0';
		}

		$str .= '&amp;link_icon=';
		if ($spa_settings[link_icon]) {
			$str .= 'on';
		} else {
			$str .= 'off';
		}
		if ($spa_settings[shots_trigger]) $str .= '&amp;shots_trigger='. $spa_settings[shots_trigger];

		if ($spa_settings[size]) $str .= '&amp;size='. $spa_settings[size];

		if ($spa_settings[lang]) $str .= '&amp;lang='. $spa_settings[lang];

		$str .= '&amp;domain='. $spa_settings[url] . '"></script>';
	}

	return $str;
}

function spa_read_options()
{
	if(!is_array(get_option('ald_spa_settings')))
	{
		$spa_settings = spa_default_options();
		update_option('ald_spa_settings', $spa_settings);
	}
	else
	{
		$spa_settings = get_option('ald_spa_settings');
	}
	return $spa_settings;
}

// Functions to echo the necessary code
add_action('wp_footer', 'ald_spa_display');
function ald_spa_display($force = false) {
	$spa_settings = spa_read_options();

	if ($force || $spa_settings['footer'])
	{
		echo ald_spa();
	}
}

// Add an action called echo_snapshots so that it can be called using do_action('echo_snapshots');
add_action('echo_snapshots', 'echo_snapshots_function');
function echo_snapshots_function() {
	$spa_settings = spa_read_options();
	if (!$spa_settings['footer'])
	{
		ald_spa_display(true);
	}
}


// Add an action called echo_snapshots so that it can be called using do_action('echo_snapshots_visitor');
add_action('echo_snapshots_visitor', 'echo_snapshots_visitor_function');
function echo_snapshots_visitor_function() {
	$spa_settings = spa_read_options();
	if ($spa_settings[userpreview]) {
?>

<iframe frameborder="no" scrolling="no" width="175" height="105"  src="http://spa.snap.com/badge/<?php echo $spa_settings[key]; ?>/"></iframe>

<?php
	}
}

// This function adds an Options page in WP Admin
if (is_admin() || strstr($_SERVER['PHP_SELF'], 'wp-admin/')) {
	require_once(ALD_Snap_Shots_DIR . "/admin.inc.php");
}


?>
