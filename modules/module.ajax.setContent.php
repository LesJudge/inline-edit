<? header("Content-type: text/html; charset=utf-8"); 

$value = get_magic_quotes_gpc() ? json_decode(stripslashes($_POST['json'])) : json_decode($_POST['json']);
$thisItem=$value->thisItem;
$thisItemText=$value->thisItemText;

$saveMessage=" <div class='formMessage'><span></span>A HTML elem értéke sikeresen módosítva: [".$thisItem."]!</div>";
$saveError="<div class='formError'><span></span>Nincs megjeleníthető eredmény [".$thisItem."]!</div>";

function sikerult($thisItem,$thisItemText,$saveMessage,$saveError){		
	
	$my_file = "../templates/data/".$thisItem.".tpl";
	$handle = fopen($my_file, 'w') or die('Cannot open file:  '.$my_file);
	fwrite($handle, " ".$thisItemText." ");
	fclose($handle);

	echo $saveMessage;	
}

function nem_sikerult($saveError){		
	echo $saveError;				
}

if( isset($thisItem)&& isset($thisItemText)  ){			
	sikerult($thisItem,$thisItemText,$saveMessage,$saveError);	
}
else {
	nem_sikerult($saveError);	
}


?>
