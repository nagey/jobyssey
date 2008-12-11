<?php
		$fb_user ="";
		$wpuser ="";
		if (isset($_REQUEST['userid']) && $_REQUEST['userid']!=""){
			$wpuser = $_REQUEST['userid'];
		}if (isset($_REQUEST['fbuserid']) && $_REQUEST['fbuserid']!=""){
			$fb_user = $_REQUEST['fbuserid'];
		}else{
			$fb_user = fb_get_loggedin_user();
		}
		if ($fb_user!=""){
			//$userprofile= get_userdatabylogin("FB_".$fb_user);
			$userprofile = WPfbConnect_Logic::get_userbyFBID($fb_user);
		}elseif($wpuser){
			$userprofile= get_userdata($wpuser);
		}
?>	
	
<div class="fbconnect_userprofile">
	<div class="fbconnect_userpicmain">
		<fb:profile-pic uid="<?php echo $userprofile->fbconnect_userid;?>" size="small" linked="true"></fb:profile-pic>
	</div>

	<div class="fbconnect_profiletexts">
	    <b>Estado:</b> <fb:user-status uid="<?php echo $userprofile->fbconnect_userid;?>" linked="true"></fb:user-status>
		<br/><b>Nombre: </b><?php echo $userprofile->display_name; ?>
		<br/><b>Nickname: </b><?php echo $userprofile->nickname; ?>
		<br/><b>Miembro desde: </b><?php echo $userprofile->user_registered; ?>
		<br/><b>URL: </b><a href="<?php echo $userprofile->user_url; ?>"><?php echo $userprofile->user_url; ?></a>
		<br/><b>Sobre mi: </b><?php echo $userprofile->description; ?><br/>
	</div>
</div>
