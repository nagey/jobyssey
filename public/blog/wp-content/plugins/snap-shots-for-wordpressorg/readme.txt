=== Snap Shots for Wordpress.org ===
Contributors: snapshots
Tags: snap, snap.com, snapshots, snap technologies, video, movie, film, wiki, wikipedia, imdb, actor, stock, google, yahoo, msn, lycos, blogger, blogspot, amazon, rss, photo, album, mp3, audio, preview
Requires at least: 1.5
Tested up to: 2.3
Stable tag: 2.0

Add Snap Shots(TM) to your blog. Snap Shots is an open, extensible platform for creating, sharing, and distributing contextually relevant content.


== Description ==

PLUGIN FEATURES:
* Generates perfectly valid XHTML code.
* All Snap Shots options can be set via WP-Admin.
* Options can be changed at anytime to customize the preview.
* The plugin can automatically add the code to the footer.

Learn more about Snap Shots at http://www.snap.com/about/shots.php

REQUIREMENTS:
WordPress 1.5 or above


== Installation ==
  1. Signup for Snap Shots (http://www.snap.com/about/shots.php) and generate the code. In the code you will find a 32-digit parameter that follows key=. This will be needed for configuring the display.
  2. Download the Snap Shots Plugin (.zip file that contains this readme.txt file)
  3. Extract the contents of the .zip file.  Add the extracted folder and its contents under wp-content/plugins/ folder on your server.
  4. Activate the Plugin in WP-Admin.
  5. Goto Options > Snap Shots to configure. If you are upgrading from an earlier version, it is recommended that you click Default Options so as to clean up any old options. Remember to backup/write down your key first, as it will be cleared from the page.
  6. Configure the plugin to automatically add the code to wp_footer() (wp_footer needs to be present in your theme). Alternatively, add <?php do_action('echo_snapshots'); ?> just before the </body>.


== Frequently Asked Questions ==  

= How do I change the Snap Shots Options? =

On WP-Admin, go to Options > Snap Shots.

= What are the Snap Shots options? =

* Snap Shots Key: This is a required parameter. You need to get your key for Snap Shots by signing up and generating the code. In the code you will find a 32-digit parameter that follows key=. This has to be entered into the Snap Shots Key field. The plugin will give you a message in case this is empty.
* Color Theme: Select between eight different themes for the Snap Shots Bubble.  
* Snap Shots Icon and Trigger: Choose to show or hide the small Snap Shots icon next to enabled links, and choose how to trigger Snap Shots.
* Link Icon Behavior: Both (default) causes the bubble to appear when cursor is over both link and icon. Icon only causes the bubble to appear when the cursor is over the icon only.
* Language: Choose from dozens of languages to display the Shots surrounding text and options menu text.
* Snap Shots Size: Choose to show the large or small size by default.
* Custom Logo: Only turn this option if you have already uploaded your logo first via the Snap Shots web site.
Advanced Settings:
* Display Preview for all links: Select if you want a thumbnail to display when hovering over all links. (Default selected) If you disable this feature, then to enable Snap Shots on any links you will need to add class="snap_shots" to the link HTML.
* Display Preview for internal links: Select if you want a thumbnail to display when hovering over internal links. Above option needs to be selected for this to work. (Default unselected)  
* Only Display PreviewShots: Selecting this will display PreviewShots (formerly Snap Preview Anywhere) for automatically triggered Snap Shots.  
* Display Snap Searchbox below the thumbnail: Select if you want to display the small box at the bottom of the thumbnail. (Default selected)
* Delay loading of Snap Shots until after the page loads. Useful if you have a lot of other widgets on your pages that slow it down.
* Automatically add the code to your footer: Select if you want the code to be added to the footer automatically. (Default selected)

If you want to manually insert the code you can add <?php do_action('echo_snapshots'); ?> just before the </body>.

Note: Using do_action in the above code ensures that your blog won't break even if you deactivate the plugin.

The function ald_spa() is also available which has a return value instead of an echo. You can use it as follows:
    $str = ald_spa();
    echo $str;

Lastly, you can reset to default options by clicking on Default Options (Remember to save the key before you do so). We recommend you do this once during upgrade if you are upgrading from any older version as it will clean up old variables which the plugin used.


= I have more questions. Who can help me? =

Limited technical support is available by writing Snap Customer Service via the online form located at http://www.snap.com/about/feedbk.php .


CHANGE LOG:
    * 2.0
       o Plugin now officially maintained by the Snap.com team.
       o Added language selector, choose from 45 languages
       o Various other updates to code and filenames to match "Snap Shots" product name instead of SPA.
    * 1.3
       o Plugin name changed from Snap Preview Anywhere Plugin to Snap Shots Plugin in accordance with the name change of the service.
       o Code added to footer is now XHTML 1.1 compliant as well.
       o Blocks of Links behavior has been deprecated.
       o You can now set if you want only PreviewShots to be displayed
    * 1.2
       o Updated plugin for latest Snap Shots Update
       o You can now set options for a Link Icon, Theme, Blocks of Links behavior.
       o Let you visitors choose if they want to enable Snap Shots on your site or not.
       o Display a custom logo on the bubble (needs to be configured at the Snap Shots site)
    * 1.1
       o Fixes for internal links as per latest Snap Shots update
       o Added the option to disable Snap Shots on all links. You can add class="snap_shots" only on those links you wish to have the Snap Shots display on.
    * 1.0 - Release
