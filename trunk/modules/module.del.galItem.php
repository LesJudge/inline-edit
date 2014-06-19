<? header("Content-type: text/html; charset=utf-8"); 

$value = get_magic_quotes_gpc() ? json_decode(stripslashes($_POST['json'])) : json_decode($_POST['json']);

foreach ($value as $k => $v) {
   if($k=="galPage"){$galPage = $v-1; } 
}
//echo $galPage;
$dirs=Array("upload/gallery1","upload/gallery2","upload/gallery3","upload/gallery4");
foreach ($value as $k => $v) {
    $fileArray[]=$_SERVER['DOCUMENT_ROOT']."/".$dirs[$galPage]."/files/".$v;
	$fileArray_str.=$_SERVER['DOCUMENT_ROOT']."/".$dirs[$galPage]."/files/".$v.";<br />";	
}


$saveMessage=" <div class='formMessage'><span></span>A HTML elem értéke sikeresen módosítva: <br />[".$fileArray_str."]!</div>";
$saveError="<div class='formError'><span></span>Nincs megjeleníthető eredmény <br />[".$fileArray_str."]!</div>";

function sikerult($fileArray,$saveMessage,$saveError){	
	foreach ($fileArray as $value) {
		if (file_exists($value)) {
			unlink($value);
		}
	}
	echo $saveMessage;	
}

function nem_sikerult($saveError){		
	echo $saveError;				
}

if( isset($fileArray) ){			
	sikerult($fileArray,$saveMessage,$saveError);	
}
else {
	nem_sikerult($saveError);	
}


?>
