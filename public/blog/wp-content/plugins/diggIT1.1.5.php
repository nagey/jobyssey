<?php

/*
Plugin Name: diggIT
Plugin URI: http://tuggo.org/projects/diggit/
Description: This plugin allows quick integration for WordPress users that want to automatically have the "digg" button show up for each of their posts.  <a href="http://tuggo.org/projects/diggit/">Need help?</a>
Author: Paul Cheek
Version: 1.1.5
Author URI: http://tuggo.org/
*/

#################################################################
// Edit these four lines to customize your digg button.

$bg = "#FFFFFF"; // The HEX value for the background
$compact = "0"; // Set as for compact version, otherwise 0
$style = ""; // Custom styling for the <div> around the button
$topic = ""; // Topic relating to all of your posts

#################################################################

/*  Copyright 2007-2008  Paul Cheek  (email : pcheek@tuggo.org)

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
    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
*/

add_filter('the_content', 'diggIT');

function diggIT($content) {
	error_reporting(0);
	
	global $bg;
	global $compact;
	global $style;
	global $topic;
	
		if(isset($compact) && $compact == 1) {
			$digg_skin = "compact"; // Set the skin to be compact
		}
		
		if(isset($topic) && $topic != "") {
			if($topic == "2008_us_elections" || $topic == "apple" || $topic == "baseball" || $topic == "basketball" || $topic == "business_finance" || $topic == "celebrity" || $topic == "design" || $topic == "environment" || $topic == "extreme_sports" || $topic == "football" || $topic == "gadgets" || $topic == "gaming_news" || $topic == "general_sciences" || $topic == "golf" || $topic == "hardware" || $topic == "health" || $topic == "hockey" || $topic == "linux_unix" || $topic == "microsoft" || $topic == "mods" || $topic == "motorsport" || $topic == "movies" || $topic == "music" || $topic == "offbeat_news" || $topic == "other_sports" || $topic == "playable_web_games" || $topic == "political_opinions" || $topic == "politics" || $topic == "programming" || $topic == "security" || $topic == "soccer" || $topic == "software" || $topic == "space" || $topic == "tect_deals" || $topic == "tech_news" || $topic == "television" || $topic == "tennis" || $topic == "videos_animation" || $topic == "videos_comedy" || $topic == "videos_educational" || $topic == "videos_gaming" || $topic == "videos_music" || $topic == "videos_people" || $topic == "videos_sports" || $topic == "world_news") {
				$digg_topic = $topic; // Define the topic
			}
		}
		
		if(isset($style) && $style != "") {
			echo '<div class="diggthisplugin" style="' . $style .'">'; // Change the style to the defined styles
		} else {
			if($digg_skin == "compact") {
				echo '<div class="diggthisplugin" style="float: right; width: 140px; padding-top: 10px; margin-left: 20px;">'; // Change the style to suit the compact digg button
			} else {
				echo '<div class="diggthisplugin" style="float: right; width: 42px; padding-right: 10px; margin-left: 10px; margin-bottom: 0px;">'; // Change the style to suit the default digg button
			}
		}
		
		if($digg_skin == "compact") {
		?>
<iframe src="http://digg.com/tools/diggthis.php?u=<?php the_permalink(); ?>&s=compact&t=<?php the_title(); ?><?php if(isset($digg_topic)) { echo '&c=' . $digg_topic; } ?><?php if(isset($bg) && $bg != '') { echo '&k=' . $bg; } ?>" scrolling="no" style="border: none; height: 18px; width: 120px;"></iframe>
		<?php } else { ?>
<iframe src="http://digg.com/tools/diggthis.php?u=<?php the_permalink(); ?>&t=<?php the_title(); ?><?php if(isset($digg_topic)) { echo '&c=' . $digg_topic; } ?><?php if(isset($bg) && $bg != '') { echo '&k=' . $bg; } ?>" scrolling="no" style="border: none; height: 80px; width: 52px;"></iframe>
		<?php
		}
		echo '</div>' . $content;
}

?>