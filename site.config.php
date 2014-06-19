<?php	
	
	/*	Login	*/
	$userinfo = array(		
		'lgP'=>'sha256:1000:2v5k6M2nhelUDtyJfmGs6e0/LeIi+Rui:d+8I7dngmllhJMGaZ37VFG36dvhgEDzo',
		'lgU'=>'sha256:1000:gbW4PE5xJtFm509ySH1ZqjbSG95tLEkF:jbdi2/1AYRRqbi3uOkgMfTSI8rLfoFTB'
		
	);
	
	
	/*	Gallery	*/
	$itemPerPage=36;
	
	
	/*	Smarty */
	//$smarty->force_compile = true;
	$smarty->debugging = false;
	$smarty->caching = true;
	$smarty->cache_lifetime = 120;
	
		
	$smarty->assign("DOMAIN","http://".$_SERVER['SERVER_NAME']."/");
	$smarty->assign("slider_animSpeed","2000");
	$smarty->assign("slider_pauseTime","6000");
	
	$smarty->assign("meta_title","Pharmatech Europe AG",true);
	$smarty->assign("meta_keywords","Pharmatech Europe AG",true);
	$smarty->assign("meta_description","Pharmatech Europe AG",true);
	$smarty->assign("meta_author","Pharmatech Europe AG - www.pharmatechag.ch",true);
	$smarty->assign("meta_copyright","Pharmatech Europe AG - www.pharmatechag.ch",true);
	$smarty->assign("meta_publisher","Pharmatech Europe AG - www.pharmatechag.ch",true);
	
	$smarty->assign("words_adminpanel_title"," Adminisztrációs oldal nincs bejelentkezve!",true);
	$smarty->assign("words_adminpanel","Admin Panel",true);
	$smarty->assign("words_adminpanel_link","Nyilvános oldal",true);
	$smarty->assign("words_adminpanel_btn","Belépés",true);
	$smarty->assign("words_adminpanel_user","Felhasználónév",true);
	$smarty->assign("words_adminpanel_pass","Jelszó",true);
	$smarty->assign("words_kijelentkezes","Kijelentkezés",true);
	
	$smarty->assign("words_gallery_title","Tekintse meg a galériánkat!",true);
	$smarty->assign("words_itemperpage",$itemPerPage);
	$smarty->assign("words_mapBuble","<div class='mapBuble'><p><strong>Pharmatech Europe AG.</strong></p><p>4032 Debrecen, Valamilyen utca 18.<br>Telefon:  +36 (52) 123-456</p><\/div>");	
	$smarty->assign("words_mapLat","47.50148");
	$smarty->assign("words_mapLong","21.61002");
	$smarty->assign("words_elerhetosegeink","Elérhetőségeink");
		
	$smarty->assign("msg_successlogin","Sikeresen bejelentkeztél az oldalra mint",true);
	
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/*	Bejelentkezés elemeinek megadása, működés deffiniálása. */
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////
	session_start();

	if(isset($_GET['logout'])) {
		$_SESSION['username'] = '';
		header('Location:  ' . "/");	
	}
	//echo create_hash("admin");
	
	if(isset($_POST['username'])) {
		if ((validate_password($_POST['password'],$userinfo["lgP"])==true)&&($_POST['username']==validate_password($_POST['username'],$userinfo["lgU"]))) {
		//if($userinfo[$_POST['username']] == $_POST['password']) {
			$_SESSION['username'] = $_POST['username'];
		}else {
			echo "<p class='error'>Hibás felhasználói adatok!</p>";
		}	
	}
	$loginPage = isset($_REQUEST['login']) ? $_REQUEST['login'] : "0";
	$loggedIn = $_SESSION['username'];

?>
