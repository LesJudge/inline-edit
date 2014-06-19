<?php
require 'library/smarty/Smarty.class.php';
require 'modules/module.pbkdf2.php';

//echo phpinfo();

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*	Smarty template változók megadása. */
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
$smarty = new Smarty;
require 'site.config.php';


$referenzen = (isset($_REQUEST['referenzen'])&&($_REQUEST['referenzen']==1)) ? $_REQUEST['referenzen'] : "0";
$page = isset($_REQUEST['page']) ? $_REQUEST['page'] : "0";
$editControls=(($loginPage == '1')&&($loggedIn))?"<div class='editControls-new'>Új képek feltöltése!</div><div class='editControls-delete'>Kijelölt képek törlése!</div>":"";
	
if($_REQUEST['page']>4){}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*	Galléria inline gager rész deffiniálása. */
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
$page = (int)$page;
if (($_REQUEST['page']<=4)&&($_REQUEST['page']>0)&&(is_int($page))){  
	if (($loginPage == '1') && ($loggedIn)){
		$_SESSION['KCFINDER'] = array();
    	$_SESSION['KCFINDER']['disabled'] = false;  
	}
	 // Activate the uploader, Users to this page MUST be authenticated
	$dirs=Array("upload/gallery1","upload/gallery2","upload/gallery3","upload/gallery4");	
}else { 
	$page=0; 	
}



//echo $page;
switch($page){
	case 1 : { 	
        if (($loginPage == '1') && ($loggedIn)){	
			$_SESSION['KCFINDER']['uploadURL'] = "/".$dirs[0];        
			$_SESSION['fold_type'] = "media"; 
		}
		//echo $dirs[0].";";
		$smarty->assign("gallery",gal_list($dirs[0]."/files",$itemPerPage,$loginPage,$loggedIn),true);
		break; 
	}
	case 2 : {
		if (($loginPage == '1') && ($loggedIn)){
			$_SESSION['KCFINDER']['uploadURL'] = "/".$dirs[1]; 
			$_SESSION['fold_type'] = "media"; 
		}
		//echo $dirs[1].";";
		$smarty->assign("gallery",gal_list($dirs[1]."/files",$itemPerPage,$loginPage,$loggedIn),true);
		break; 
	}
	case 3 : {
		if (($loginPage == '1') && ($loggedIn)){
			$_SESSION['KCFINDER']['uploadURL'] = "/".$dirs[2]; 
			$_SESSION['fold_type'] = "media"; 
		}
		//echo $dirs[3].";";
		$smarty->assign("gallery",gal_list($dirs[2]."/files",$itemPerPage,$loginPage,$loggedIn),true);
		break;  
	}
	case 4 : {
		if (($loginPage == '1') && ($loggedIn)){
			$_SESSION['KCFINDER']['uploadURL'] = "/".$dirs[3]; 
			$_SESSION['fold_type'] = "media"; 	
		}
		//echo $dirs[3].";";
		$smarty->assign("gallery",gal_list($dirs[3]."/files",$itemPerPage,$loginPage,$loggedIn),true);
		break; 
	}
	default : {
		$smarty->assign("gallery","",true);
		$editControls ="<h1>Nincs ilyen galéria!</h1>";		
		break;
	}
}
$galPage=$page;   


//echo "loggedIn".$loggedIn."; ";
//echo "kcsession:".print_r($_SESSION['KCFINDER']['uploadURL']).";";

function gal_list($dir,$itemPerPage,$loginPage,$loggedIn){		
	$filenevek = scandir($dir);
	
	$editableImage=(($loginPage == '1')&&($loggedIn))?"class='refItem-link editableImageBlock'":"class='refItem-link'";
	foreach($filenevek as $filenev)
		{
			if ($filenev != "." && $filenev != "..")
			{
				$file=$dir.'/'.$filenev;
				if (is_file($file))
				{
					$gallery.=  "<a href='timthumb.php?src=".$file."&w=800&zc=1' rel='prettyPhoto[gal]' {$editableImage}><img src='timthumb.php?src=".$file."&amp;w=233&amp;zc=1' alt='' class='refItem' /></a>";
				 	$i++; 
					if ($i%$itemPerPage==0) 
					{
					 $gallery.=  '</div><div class="pageElement" id="page-'.(($i/$itemPerPage)+1).'" >';
					}
				}
			}
		}
	return $gallery;	
}       
          



$smarty->assign("galPage",$galPage,true);
$smarty->assign("editControls",$editControls,true);
$smarty->assign("loginPage",$loginPage,true);
$smarty->assign("loggedIn",$loggedIn,true);

$smarty->assign("referenzen",$referenzen,true);

$smarty->display('site.gallery.tpl');

?>