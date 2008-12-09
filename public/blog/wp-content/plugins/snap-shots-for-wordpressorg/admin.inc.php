<?php
/**********************************************************************
*					Admin Page							*
*********************************************************************/
function spa_default_options() {
	$spa_settings = 	Array (
						url => str_replace("http://", "", get_bloginfo('url')),	// Blog URL
						key => '',				// Snap Shots Key
						searchbox => true,		// Search Box
						alllinks => true,		// Snap Shots on every link
						locallinks => false,	// Snap Shots on local links
						link_icon => true,		// Show Link Icon for link
						shots_trigger => 'both',// Trigger bubble
						previewshots => false,	// Automatically display Preview Shots
						theme => 'silver',		// Snap Shots Theme
						size => 'small',		// Snap Shots Size
						lang => 'en-us',		// Snap Shots Language
						customlogo => false,	// Use Custom Logo?
                                                df => false,
						footer => true			// Add to blog theme footer?
						);

	return $spa_settings;
}

function spa_options() {

	$spa_settings = spa_read_options();

	if($_POST['spa_save']){
		$spa_settings[key] = $_POST['key'];
		if ($_POST['Theme']!='') {
			$spa_settings[theme] = $_POST['Theme'];
		} else {
			$spa_settings[theme] = 'silver';
		}

		if ($_POST['shots_trigger']) {
			$spa_settings[shots_trigger] = $_POST['shots_trigger'];
		} else {
			$spa_settings[shots_trigger] = 'both';
		}
		if ($_POST['size']!='') {
			$spa_settings[size] = $_POST['size'];
		}
		if ($_POST['searchbox']) {
			$spa_settings[searchbox] = true;
		} else {
			$spa_settings[searchbox] = false;
		}
		if ($_POST['alllinks']) {
			$spa_settings[alllinks] = true;
		} else {
			$spa_settings[alllinks] = false;
		}
		if ($_POST['locallinks']) {
			$spa_settings[locallinks] = true;
		} else {
			$spa_settings[locallinks] = false;
		}
		if ($_POST['previewshots']) {
			$spa_settings[previewshots] = true;
		} else {
			$spa_settings[previewshots] = false;
		}
		if ($_POST['link_icon']) {
			$spa_settings[link_icon] = true;
		} else {
			$spa_settings[link_icon] = false;
		}
		if ($_POST['lang']!='') {
			$spa_settings[lang] = $_POST['lang'];
		} else {
			$spa_settings[lang] = 'en-us';
		}
		if ($_POST['customlogo']) {
			$spa_settings[customlogo] = true;
		} else {
			$spa_settings[customlogo] = false;
		}
		if ($_POST['Footer']) {
			$spa_settings[footer] = true;
		} else {
			$spa_settings[footer] = false;
		}
		if ($_POST['df']) {
			$spa_settings[df] = true;
		} else {
			$spa_settings[df] = false;
		}

		update_option('ald_spa_settings', $spa_settings);

		echo '<div id="message" class="updated fade"><p>Options saved successfully.</p></div>';
	}

	if ($_POST['spa_default']){

		delete_option('ald_spa_settings');
		$spa_settings = spa_default_options();
		update_option('ald_spa_settings', $spa_settings);

		echo '<div id="message" class="updated fade"><p>Options set to Default.</p></div>';
	}
?>


<div class="wrap">
  <h2>
    <?php _e("Snap Shots&trade; Options"); ?>
  </h2>
	<label>
		<?php _e('This plugin makes it easy to control the look and behaviour of Snap Shots on your Wordpress blog.<br>In order to use this plugin you need to have a Snap Shots key that you can get for free on the <a href="http://www.snap.com/about/shots1.php">Snap Shots website</a><br>'); ?>
	</label>


  <form method="post" id="spa_options" name="spa_options">
    <fieldset class="options">
	<p>
		<h5><?php _e('Enter Your Snap Shots Key:'); ?></h5>
		<input type="text" name="key" id="key" value="<?php echo $spa_settings[key]; ?>" size="40" maxlength="32" />
		<?php _e('<a href="http://www.snap.com/about/shots_faq.php#26">How to find your key</a>'); ?>
	</p>
	<div id="swatches">
		<h5><?php _e('Choose a Color Theme:'); ?></h5>
		<div class="swatch-div">
			<a id="th_silver" class="swatch color1 <?php if (($spa_settings[theme]=='')||($spa_settings[theme]=='silver')) { ?> selected <?php } ?>" onclick="return toggle_theme('silver');"><br /></a>
		</div>
		<div class="swatch-sep"></div>
		<div class="swatch-div">
			<a id="th_ice" class="swatch color2 <?php if ($spa_settings[theme]=='ice') { ?> selected <?php } ?>" onclick="return toggle_theme('ice');"><br /></a>
		</div>
		<div class="swatch-div">
			<a id="th_green" class="swatch color3 <?php if ($spa_settings[theme]=='green') { ?> selected <?php } ?>" onclick="return toggle_theme('green');"><br /></a>
		</div>
		<div class="swatch-div">
			<a id="th_linen" class="swatch color4 <?php if ($spa_settings[theme]=='linen') { ?> selected <?php } ?>" onclick="return toggle_theme('linen');"><br /></a>
		</div>
		<div class="swatch-div">
			<a id="th_orange" class="swatch color5 <?php if ($spa_settings[theme]=='orange') { ?> selected <?php } ?>" onclick="return toggle_theme('orange');"><br /></a>
		</div>
		<div class="swatch-div">
			<a id="th_pink" class="swatch color6 <?php if ($spa_settings[theme]=='pink') { ?> selected <?php } ?>" onclick="return toggle_theme('pink');"><br /></a>
		</div>
		<div class="swatch-div">
			<a id="th_purple" class="swatch color7 <?php if ($spa_settings[theme]=='purple') { ?> selected <?php } ?>" onclick="return toggle_theme('purple');"><br /></a>
		</div>
		<div class="swatch-div">
			<a id="th_asphalt" class="swatch color8 <?php if ($spa_settings[theme]=='asphalt') { ?> selected <?php } ?>" onclick="return toggle_theme('asphalt');"><br /></a>
		</div>
		<p style="clear:both">
			<label><input type="hidden" name="Theme" id="Theme" value="<?php echo $spa_settings[theme]; ?>" size="6" readonly="readonly" />
			<?php _e(''); ?></label>
		</p>
	</div>
	<div id="spa_linkicon">
	<h5><?php _e('Choose a Snap Shots Icon and Trigger:'); ?></h5>
	<p>
		<label>
		<input name="shots_trigger" type="radio" value="both" <?php if ($spa_settings[shots_trigger]=='both') { ?> checked="checked" <?php } ?> onclick="document.spa_options.link_icon.value='1'" />
		<?php _e('Snap Shots icon; Snap Shots triggered by the link and icon'); ?></label>
		<br />
		<label>
		<input name="shots_trigger" type="radio" value="icon" <?php if ($spa_settings[shots_trigger]=='icon') { ?> checked="checked" <?php } ?>  onclick="document.spa_options.link_icon.value='1'" />
		<?php _e('Snap Shots icon; Snap Shots triggered by the icon only'); ?></label>
		<label>
		<br />
		<input name="shots_trigger" type="radio" value="link" <?php if ($spa_settings[shots_trigger]=='link') { ?> checked="checked" <?php } ?> onclick="document.spa_options.link_icon.value='0'" />
		<?php _e('No Snap Shot icon; Snap Shots triggered by the link'); ?></label>
<input type="hidden" name="link_icon" id="link_icon" <?php if ($spa_settings[shots_trigger]!='link') { ?> value="1" <?php } ?> />
	</p>
	</div>
	<p>
		<h5><?php _e('Snap Shots Language'); ?></h5>
        <select name="lang" id="lang">
               	    <option value="en-us" <?=($spa_settings[lang]=='en-us')?'selected="selected"':''?> >English</option>
               	    <option value="af-za" <?=($spa_settings[lang]=='af-za')?'selected="selected"':''?> >Afrikaans</option>
               	    <option value="ar-sa" <?=($spa_settings[lang]=='ar-sa')?'selected="selected"':''?> >Arabic</option>

               	    <option value="bg-bg" <?=($spa_settings[lang]=='bg-bg')?'selected="selected"':''?> >Bulgarian</option>
               	    <option value="ca-es" <?=($spa_settings[lang]=='ca-es')?'selected="selected"':''?> >Catalan</option>
               	    <option value="zh-cn" <?=($spa_settings[lang]=='zh-cn')?'selected="selected"':''?> >Chinese-Simplified</option>
               	    <option value="zh-tw" <?=($spa_settings[lang]=='zh-tw')?'selected="selected"':''?> >Chinese-Traditional</option>
               	    <option value="hr-hr" <?=($spa_settings[lang]=='hr-hr')?'selected="selected"':''?> >Croatian</option>
               	    <option value="cs-cz" <?=($spa_settings[lang]=='cs-cz')?'selected="selected"':''?> >Czech</option>

               	    <option value="da-dk" <?=($spa_settings[lang]=='da-dk')?'selected="selected"':''?> >Danish</option>
               	    <option value="nl-nl" <?=($spa_settings[lang]=='nl-nl')?'selected="selected"':''?> >Dutch</option>
               	    <option value="eo-eo" <?=($spa_settings[lang]=='eo-eo')?'selected="selected"':''?> >Esperanto</option>
               	    <option value="ph-ph" <?=($spa_settings[lang]=='ph-ph')?'selected="selected"':''?> >Filipino</option>
               	    <option value="fi-fi" <?=($spa_settings[lang]=='fi-fi')?'selected="selected"':''?> >Finnish</option>
               	    <option value="fr-fr" <?=($spa_settings[lang]=='fr-fr')?'selected="selected"':''?> >French</option>

               	    <option value="de-de" <?=($spa_settings[lang]=='de-de')?'selected="selected"':''?> >German</option>
               	    <option value="el-gr" <?=($spa_settings[lang]=='el-gr')?'selected="selected"':''?> >Greek</option>
               	    <option value="he-il" <?=($spa_settings[lang]=='he-il')?'selected="selected"':''?> >Hebrew</option>
               	    <option value="hi-in" <?=($spa_settings[lang]=='hi-in')?'selected="selected"':''?> >Hindi</option>
               	    <option value="hu-hu" <?=($spa_settings[lang]=='hu-hu"')?'selected="selected"':''?> >Hungarian</option>
               	    <option value="id-id" <?=($spa_settings[lang]=='id-id')?'selected="selected"':''?> >Indonesian</option>

               	    <option value="is-is" <?=($spa_settings[lang]=='is-is')?'selected="selected"':''?> >Icelandic</option>
               	    <option value="it-it" <?=($spa_settings[lang]=='it-it')?'selected="selected"':''?> >Italian</option>
               	    <option value="ja-jp" <?=($spa_settings[lang]=='ja-jp')?'selected="selected"':''?> >Japanese</option>
               	    <option value="ko-kr" <?=($spa_settings[lang]=='ko-kr')?'selected="selected"':''?> >Korean</option>
               	    <option value="ms-my" <?=($spa_settings[lang]=='ms-my')?'selected="selected"':''?> >Malay</option>
               	    <option value="ml-in" <?=($spa_settings[lang]=='ml-in')?'selected="selected"':''?> >Malayalam</option>

               	    <option value="nb-no" <?=($spa_settings[lang]=='nb-no')?'selected="selected"':''?> >Norwegian</option>
               	    <option value="fa-ir" <?=($spa_settings[lang]=='fa-ir')?'selected="selected"':''?> >Persian</option>
               	    <option value="pl-pl" <?=($spa_settings[lang]=='pl-pl')?'selected="selected"':''?> >Polish</option>
               	    <option value="pt-br" <?=($spa_settings[lang]=='pt-br')?'selected="selected"':''?> >Portuguese-Brazil</option>
               	    <option value="pt-pt" <?=($spa_settings[lang]=='pt-pt')?'selected="selected"':''?> >Portuguese-Portugal</option>
               	    <option value="ro-ro" <?=($spa_settings[lang]=='ro-ro')?'selected="selected"':''?> >Romanian</option>

               	    <option value="ru-ru" <?=($spa_settings[lang]=='ru-ru')?'selected="selected"':''?> >Russian</option>
               	    <option value="sr-rs" <?=($spa_settings[lang]=='sr-rs')?'selected="selected"':''?> >Serbian-Cyrillic</option>
               	    <option value="sp-rs" <?=($spa_settings[lang]=='sp-rs')?'selected="selected"':''?> >Serbian-Latin</option>
               	    <option value="sk-sk" <?=($spa_settings[lang]=='sk-sk')?'selected="selected"':''?> >Slovak</option>
               	    <option value="sl-si" <?=($spa_settings[lang]=='sl-si')?'selected="selected"':''?> >Slovenian</option>
               	    <option value="es-mx" <?=($spa_settings[lang]=='es-mx')?'selected="selected"':''?> >Spanish-Mexico</option>

               	    <option value="es-es" <?=($spa_settings[lang]=='es-es')?'selected="selected"':''?> >Spanish-Spain</option>
               	    <option value="sv-se" <?=($spa_settings[lang]=='sv-se')?'selected="selected"':''?> >Swedish</option>
               	    <option value="tl-ph" <?=($spa_settings[lang]=='tl-ph')?'selected="selected"':''?> >Tagalog</option>
               	    <option value="tr-tr" <?=($spa_settings[lang]=='tr-tr')?'selected="selected"':''?> >Turkish</option>
               	    <option value="uk-ua" <?=($spa_settings[lang]=='uk-ua')?'selected="selected"':''?> >Ukrainian</option>
                  </select>
		<!--input type="text" name="Language" id="lang" value="<?php echo $spa_settings[lang]; ?>" size="5" maxlength="5" /-->
	</p>
	<div id="shots_size">
	<h5><?php _e('Choose Snap Shots Size'); ?></h5>
	<p>
		<label>
		<input name="size" type="radio" value="small" <?php if ($spa_settings[size]=='small') { ?> checked="checked" <?php } ?> />
		<?php _e('Small'); ?></label>
		<br />
		<label>
		<input name="size" type="radio" value="large" <?php if ($spa_settings[size]=='large') { ?> checked="checked" <?php } ?> />
		<?php _e('Large'); ?></label>
	</p>
	</div>
	<h5><?php _e('Custom Logo:'); ?></h5>
	<p>
		<label><input type="checkbox" name="customlogo" id="customlogo" value="true" <?php if ($spa_settings[customlogo]) { ?> checked="checked" <?php } ?> />
		<?php _e('Check this box only if you have uploaded a custom logo on the Snap Shots site'); ?></label>
	</p>

	<h3><?php _e('Advanced Settings'); ?></h3>
	<p>
		<label><input type="checkbox" name="alllinks" id="alllinks" value="true" <?php if ($spa_settings[alllinks]) { ?> checked="checked" <?php } ?> />
		<?php _e('Display Preview for all links? (If disabled, you will need to add <code>class="snap_shots"</code> for links you want the Snap Shots to display on.'); ?></label>
	</p>
	<p>
		<label><input type="checkbox" name="locallinks" id="locallinks" value="true" <?php if ($spa_settings[locallinks]) { ?> checked="checked" <?php } ?> />
		<?php _e('Display Preview for internal links? (Only works if preview is enabled for all links)'); ?></label>
	</p>
	<p>
		<label><input type="checkbox" name="previewshots" id="previewshots" value="true" <?php if ($spa_settings[previewshots]) { ?> checked="checked" <?php } ?> />
		<?php _e('Only display PreviewShots'); ?></label>
	</p>
	<p>
		<label><input type="checkbox" name="searchbox" id="searchbox" value="true" <?php if ($spa_settings[searchbox]) { ?> checked="checked" <?php } ?> />
		<?php _e('Display Snap searchbox below the thumbnail?'); ?></label>
	</p>
	<!--p>
		<label><input type="checkbox" name="link_icon" id="link_icon" value="true" <?php if ($spa_settings[link_icon]) { ?> checked="checked" <?php } ?> />
		<?php _e('Add an Icon to indicate link has Snap Shots'); ?></label>
	</p-->
        <p>
                <label><input type="checkbox" name="df" id="df" <?php if ($spa_settings[df]) { ?> checked="checked" <?php } ?> />
                <?php _e('Delay loading of Snap Shots until after the page loads.'); ?></label>
        </p>
	<p>
		<label><input type="checkbox" name="Footer" id="Footer" value="true" <?php if ($spa_settings[footer]) { ?> checked="checked" <?php } ?> />
		<?php _e('Automatically add the code to your footer? (Your theme needs to have <code>wp_footer()</code> for this to work.)'); ?></label>
	</p>
	<p>
	    <input type="submit" name="spa_save" id="spa_save" value="Save Options" style="border:#00CC00 1px solid" />
        <input name="spa_default" type="submit" id="spa_default" value="Restore Defaults" style="border:#FF0000 1px solid" onclick="if (!confirm('Do you want to set options to Default? If you don\'t have a copy of the Key, please hit Cancel and copy it first.')) return false;" />
	</p>
    </fieldset>
  </form>
</div>
<?php

}


function spa_adminmenu() {
	if (function_exists('current_user_can')) {
		// In WordPress 2.x
		if (current_user_can('manage_options')) {
			$spa_is_admin = true;
		}
	} else {
		// In WordPress 1.x
		global $user_ID;
		if (user_can_edit_user($user_ID, 0)) {
			$spa_is_admin = true;
		}
	}

	if ((function_exists('add_options_page'))&&($spa_is_admin)) {
		add_options_page(__("Snap Shots"), __("Snap Shots"), 9, 'spa_options', 'spa_options');
		}
}

function spa_adminhead()
{
?>

<style type="text/css">
a.swatch:hover { border-bottom: #f60 1px solid; border-left: #f60 1px solid; border-right: #f60 1px solid; border-top: #f60 1px solid; }
.color1 { background: #eee; border-bottom: #888 1px solid; border-left: #888 1px solid; border-right: #888 1px solid; border-top: #888 1px solid; }
.color2 { background: #def; border-bottom: #578 1px solid; border-left: #578 1px solid; border-right: #578 1px solid; border-top: #578 1px solid; }
.color3 { background: #deb; border-bottom: #684 1px solid; border-left: #684 1px solid; border-right: #684 1px solid; border-top: #684 1px solid; }
.color4 { background: #e4dbd0; border-bottom: #876 1px solid; border-left: #876 1px solid; border-right: #876 1px solid; border-top: #876 1px solid; }
.color5 { background: #fea; border-bottom: #b50 1px solid; border-left: #b50 1px solid; border-right: #b50 1px solid; border-top: #b50 1px solid; }
.color6 { background: #fde; border-bottom: #967 1px solid; border-left: #967 1px solid; border-right: #967 1px solid; border-top: #967 1px solid; }
.color7 { background: #dde; border-bottom: #668 1px solid; border-left: #668 1px solid; border-right: #668 1px solid; border-top: #668 1px solid; }
.color8 { background: #444; border-bottom: #222 1px solid; border-left: #222 1px solid; border-right: #222 1px solid; border-top: #222 1px solid; }
.swatch { float: left; height: 30px; width: 30px; cursor: pointer; }
.swatch-div { float: left; padding-bottom: 8px; padding-left: 8px; padding-right: 8px; padding-top: 8px; }
.swatch-sep { border-left: #bba 1px dotted; float: left; height: 32px; margin: 7px 7px 15px; width: 1px; }
.selected { border-bottom: #bba 1px solid; border-left: #bba 1px solid; border-right: #bba 1px solid; border-top: #bba 1px solid; padding-bottom: 7px; padding-left: 7px; padding-right: 7px; padding-top: 7px; }
</style>

<?php
}
function spa_adminfoot()
{
?>
<script type="text/javascript"><!--
function toggle_theme(new_th) {
	var spa_options_form = document.spa_options;
	var ThemeValue = spa_options_form.Theme.value;
	if (ThemeValue == '') ThemeValue = 'silver';
	var el = document.getElementById("th_"+ThemeValue);
	el.className = el.className.replace(/ selected/g,"");
	el = document.getElementById("th_"+new_th);
	el.className += " selected";
	spa_options_form.Theme.value = new_th;
	return false;
}
-->
</script>

<?php
}

add_action('admin_menu', 'spa_adminmenu');
add_action('admin_head', 'spa_adminhead');
add_action('admin_footer', 'spa_adminfoot');

?>
