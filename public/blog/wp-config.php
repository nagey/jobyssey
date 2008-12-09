<?php
// ** MySQL settings ** //
define('DB_NAME', 'db464_jobyssey');    // The name of the database
define('DB_USER', 'db464_jobyssey');     // Your MySQL username
define('DB_PASSWORD', 'sw9p2wRu'); // ...and password
define('DB_HOST', 'internal-db.s464.gridserver.com');    // 99% chance you won't need to change this value
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

// Change each KEY to a different unique phrase.  You won't have to remember the phrases later,
// so make them long and complicated.  You can visit http://api.wordpress.org/secret-key/1.1/
// to get keys generated for you, or just make something up.  Each key should have a different phrase.
define('AUTH_KEY', 'Busted flat in Baton Rouge and waiting for a train'); // Change this to a unique phrase.
define('SECURE_AUTH_KEY', 'I was feeling near as faded as my jeans when Booby thumbed a diesel down'); // Change this to a unique phrase.
define('LOGGED_IN_KEY', 'just before it rained that rode us all the way to New Orleans'); // Change this to a unique phrase.

// You can have multiple installations in one database if you give each a unique prefix
$table_prefix  = 'wp_';   // Only numbers, letters, and underscores please!

// Change this to localize WordPress.  A corresponding MO file for the
// chosen language must be installed to wp-content/languages.
// For example, install de.mo to wp-content/languages and set WPLANG to 'de'
// to enable German language support.
define ('WPLANG', '');

/* That's all, stop editing! Happy blogging. */

if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');
require_once(ABSPATH . 'wp-settings.php');
?>
