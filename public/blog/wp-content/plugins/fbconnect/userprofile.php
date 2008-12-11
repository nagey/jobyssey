<?php
		$fb_user ="";
		$wpuser ="";
		if (isset($_REQUEST['userid']) && $_REQUEST['userid']!=""){
			$wpuser = $_REQUEST['userid'];
		}if (isset($_REQUEST['fbuserid']) && $_REQUEST['fbuserid']!=""){
			$fb_user = $_REQUEST['fbuserid'];
		}else{
			$fb_user = facebook_client()->get_loggedin_user();
		}
		if ($fb_user!=""){
			//$userprofile= get_userdatabylogin("FB_".$fb_user);
			$userprofile = WPfbConnect_Logic::get_userbyFBID($fb_user);
		}elseif($wpuser){
			$userprofile= get_userdata($wpuser);
		}
?>	
	
<div>
	<div style="float:left;">
		<div class="fbconnect_userpicmain">
			<fb:profile-pic uid="<?php echo $userprofile->fbconnect_userid;?>" size="small" linked="true"></fb:profile-pic>
		</div>
	</div>

	<div class="fbconnet_userprofile">
	    <div class="fbconnet_profiletext"><b>Estado:</b> <fb:user-status uid="<?php echo $userprofile->fbconnect_userid;?>" linked="true"></fb:user-status><br/></div>
		<div class="fbconnet_profiletext"><b>Nombre: </b><?php echo $userprofile->display_name; ?><br/></div>
		<div class="fbconnet_profiletext"><b>Nickname: </b><?php echo $userprofile->nickname; ?><br/></div>
		<div class="fbconnet_profiletext"><b>Miembro desde: </b><?php echo $userprofile->user_registered; ?><br/></div>
		<div class="fbconnet_profiletext"><b>URL: </b><a href="<?php echo $userprofile->user_url; ?>"><?php echo $userprofile->user_url; ?></a></div>
		<div class="fbconnet_profiletext"><b>Sobre mi: </b><?php echo $userprofile->description; ?><br/></div>
	</div>
</div>
