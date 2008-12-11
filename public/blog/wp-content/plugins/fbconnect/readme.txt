=== Facebook Connect Wordpress plugin ===
Author: Javier Reyes (www.sociable.es) (www.sixjumps.com)


== Description ==
Allow the use of Facebook Connect API for Wordpress authentication/registration of users and send comments to Facebook feed.

1. Access the blog (login) with your Facebook credentials where facebook validates the username without asking for the password necessary to access the blog/website.

2. The user does not need to register in the blog because thanks to the plugin the user can utilize his complete profile information he already edited in Facebook. 
This is tremendously useful as the user does not have to register and create profiles over and over again! 
The blog can now utilize the shared user profile information for customization and statistics in our Wordpress Blog. 
The plugin creates a Wordpress Blog user with the exact same facebook profile information which then could be edited by the user if he likes so.

3. It is possible to obtain your friends/contacts from facebook and to generate invitations to join our Blog/Site. 
One way of promoting the site using the so powerful and marvellous word-of-mouth.

4. You additionally can access to a list of existing members of the blog/site.

5. The users activity in the blog/site such as posts can be sent to Facebooks mini-feed of the users profile and is then visible in facebook in his lifestream.

6. You can show your last visits to the blog including the users photo that have accessed the page.



== Installation ==

This plugin follows the [standard WordPress installation method][]:

1. Log in to the Facebook Developer application: http://www.facebook.com/developers/
2. Create a new application, more info: http://developers.facebook.com/get_started.php
3. Upload the `fbconnect` folder to the `/wp-content/plugins/` directory
4. Activate the plugin through the 'Plugins' menu in WordPress
5. Configure the plugin through the 'Facebook Connector' section of the 'Settings' menu
6. Use the Facebook App info (step 2) to configure the plugin
7. Create a new template for comments.
8. Activate the Facebook Connector widget from the 'Design / Widtgets' menu.
9. If you dont see the Facebook Connect login button, and the user images, you need to modify
your header.php theme file:
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml">

 
[standard WordPress installation method]: http://codex.wordpress.org/Managing_Plugins#Installing_Plugins

== Help and Updates ==
http://www.sociable.es/facebook-connect

== Changelog ==
= version 0.9 =
*SSL Support
*Include pages from user theme (MyHome and Community)

= version 0.8 =
*Removed site_url usage
*Changed order on comments list and community users
*Community users pagination

= version 0.7 =
*Facebook Connect comment dialog
*Solved problems with Community page (sidebar.php  not found)

= version 0.0.4 =
*PHP4 support
*New page for friends invite
*CSS Styles
*Some bugs

= version 0.0.1 =
-