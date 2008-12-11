<?php
/**
 * @author: Javier Reyes Gomez (http://www.sociable.es)
 * @date: 05/10/2008
 * @license: GPLv2
 */

function fb_get_loggedin_user() {
	try{
		$fbclient = & facebook_client();
		if ($fbclient)
			return $fbclient->get_loggedin_user();
	}catch (FacebookRestClientException $e) {
		//echo "Facebook connect error:".$e->getCode();
	}
	return null;
}

function fb_user_getInfo($fb_user) {
	try{
		$fbclient = & facebook_client();
		if ($fbclient){
			$fbapi_client = & $fbclient->api_client;
			$userinfo = $fbapi_client->users_getInfo($fb_user, "about_me,profile_url,first_name,last_name,birthday,current_location,sex,pic,pic_small,pic_big,pic_square");
			if (isset($userinfo[0])){
				return $userinfo[0];
			}else{
				return $userinfo;
			}
		}
	}catch (FacebookRestClientException $e) {
		//echo "Facebook connect error:".$e->getCode();
	}
	return null;
}

function fb_feed_getRegisteredTemplateBundles() {
	try{
		$fbclient = & facebook_client();
		if ($fbclient){
			$fbapi_client = & $fbclient->api_client;
			return $fbapi_client->feed_getRegisteredTemplateBundles();
		}
	}catch (FacebookRestClientException $e) {
		//echo "Facebook connect error:".$e->getCode();
	}
	return null;
}

function fb_feed_registerTemplateBundle($one_line_stories,$short_stories,$full_stories){
	try{
		$fbclient = & facebook_client();
		if ($fbclient){
			$fbapi_client = & $fbclient->api_client;
			return $fbapi_client->feed_registerTemplateBundle($one_line_stories,$short_stories,$full_stories);
		}
	}catch (FacebookRestClientException $e) {
		//echo "Facebook connect error:".$e->getCode();
	}
	return null;
}

function fb_feed_deactivateTemplateBundleByID($templateID){
	 try{
		$fbclient = & facebook_client();
		if ($fbclient){		
			$fbapi_client = & $fbclient->api_client;
			$fbapi_client->feed_deactivateTemplateBundleByID($templateID);
		}
	}catch (FacebookRestClientException $e) {
		//echo "Facebook connect error:".$e->getCode();
	}
	return null;	
}

function fb_feed_getRegisteredTemplateBundleByID($templateID){
	 try{
		$fbclient = & facebook_client();
		if ($fbclient){		
			$fbapi_client = & $fbclient->api_client;
			return $fbapi_client->feed_getRegisteredTemplateBundleByID($templateID);
		}
	}catch (FacebookRestClientException $e) {
		//echo "Facebook connect error:".$e->getCode();
	}
	return null;
}

function fb_fql_query($query){
  	try{
		$fbclient = & facebook_client();
		if ($fbclient){		
			$fbapi_client = & $fbclient->api_client;
			return $fbapi_client->fql_query($query);
		}
	}catch (FacebookRestClientException $e) {
		//echo "Facebook connect error:".$e->getCode();
	}
	return null;
}
function fb_expire_session(){
	try {
	
		$fbclient = & facebook_client();
	    if ($fbclient && $fbclient->get_loggedin_user()!="") {
			$fbclient->expire_session();
		}
	}catch (Exception $e) {
	// nothing, probably an expired session
	}
}

function fb_feed_publishUserAction($template_data){
	try {
		$fbclient = & facebook_client();
		if ($fbclient){		
			$fbapi_client = & $fbclient->api_client;
			$feed_bundle_id = get_option('fb_templates_id');
			$fbapi_client->feed_publishUserAction( $feed_bundle_id, 
	                                           json_encode($template_data) , 
	                                           null, 
	                                          null,2);
		}
	}catch (Exception $e) {
	// nothing, probably an expired session
	}
}	
function fb_showFeedDialog(){
		$template_data = $_SESSION["template_data"];
		if (isset($template_data) && $template_data!=""){
				echo "<script type='text/javascript'>\n";
				echo "	  FB.Connect.showFeedDialog(".get_option('fb_templates_id').", ".json_encode($template_data).", null, null, FB.FeedStorySize.full , FB.RequireConnect.promptConnect);";
				echo "	</script>";
				$_SESSION["template_data"] = "";
		}

}													  