<!-- <h1>Login oldal bejelentkezve!</h1> -->
<style type="text/css">
.tinyInlineEdit:hover, .tinyInlineEdit,  .editableImageBlock:hover, .editableImageBlock { border:2px dashed #ccc !important;}
.tinyInlineEdit:hover, .editableImageBlock:hover { border-color:#000 !important; } 

.editableImageBlock { display:inline-block !important; position:relative; }
.editableImageBlock.selectedItem {  -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=30)";
filter: alpha(opacity=30);
-moz-opacity: 0.3;
-khtml-opacity: 0.3;
opacity: 0.3; }
.deleteItem { position:absolute; top:0px; right:0px; z-index:99; padding:2px 6px; font-family:Tahoma, Geneva, sans-serif; font-size:12px; font-weight:bold; background:#0C0; color:#fff; }
.editableImageBlock.selectedItem .deleteItem { background:#F00;}
.editControls-delete, .editControls-new { position:relative; display:block; clear:both; color:#fff; font-weight:bold; text-transform:uppercase; text-align:center; padding:10px 15px; margin:5px 0px; cursor:pointer;  }
.editControls-delete { background:#C00;}
.editControls-new { background:#0C0;  }

#kcfinder_div { display: none;position: relative; width: 670px; height: 400px;background: #e0dfde; padding: 1px; border: 2px solid #3687e2;
border-radius: 6px; -moz-border-radius: 6px; -webkit-border-radius: 6px; }   
#kcfinder-input { position:absolute; left:0px; top:0px; z-index:11; width:100%; height:30px; line-height:100%; z-index:10;  
 -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=30)";
filter: alpha(opacity=30);
-moz-opacity: 0.3;
-khtml-opacity: 0.3;
opacity: 0.3; }
.modal-dialog { width:710px !important;}


/*Custom site definition depending to the public area.*/
.refItem { width:308px;}
.pBox { width:478px;}
.site_menu.mce-content-body A, .site_menu.mce-content-body { background:#000;}
</style>
<link href="{$DOMAIN}css/bootstrap.min.css" rel="stylesheet" media="screen" type="text/css"/>
<script type="text/javascript" src="{$DOMAIN}js/tinymce/tinymce.min.js"></script>
<script type="text/javascript" src="{$DOMAIN}js/bootstrap.min.js"></script>
<script type="text/javascript">	
$(function(){					
	$("a[rel^='prettyPhoto']").unbind('click').attr('rel', '').attr("href","javascript:;");
	$(".editableImageBlock").each(function(){
		var THISGALITEM=$(this);
		THISGALITEM.append("<span class='deleteItem'>X</span>");
		THISGALITEM.click(function(){
			if($(this).hasClass("selectedItem")==true){
				$(this).removeClass("selectedItem");
				//console.log(1);
			}else{
				$(this).addClass("selectedItem");
				//console.log(0);
			}
		});
	});

	$(".editControls-delete").click(function(){
		var txt;
		var r = confirm("Biztos, hogy törölni szeretné a kijelölt képeket?");
		if (r == true) {
			txt = "A törlés feldolgozás allatt!";
			var strResult=" { ";
			$(".editableImageBlock.selectedItem").each(function(e){ 
				var str = $(this).find("IMG.refItem").attr("src");
				var strItem= str.substring(str.lastIndexOf("/"),str.lastIndexOf("&w")); 
				//strResult+="\"img_"+e+"\":\""+strItem.substring(1)+"\",";	
				strResult+="\"img_"+e+"\":\""+strItem.substring(1)+"\",\"galPage\":\"{$galPage}\",";	
			});	
			strResult=strResult.substring(0, strResult.length - 1);
			strResult+=" } ";
			strResult=JSON.parse(strResult);
			$.post("modules/module.del.galItem.php",  { 
				json: JSON.stringify(strResult)  
				}, function(msg){ 
					$(msg).appendTo("BODY").fadeIn(750).delay(3000).fadeOut(750); 					
					if (window.location.href.indexOf("#") != -1) { 						
						document.location.href=window.location.href.substring(0,location.href.indexOf("#"));
					}else{
						document.location.href=window.location.href;
					}
				} 
			);		
		} else {
			txt = "Nincs törlés!";
		}		
	});
	
	
	
	function openKCFinder(field) {
		var div = document.getElementById('kcfinder_div');
		if (div.style.display == "block") {
			div.style.display = 'none';
			div.innerHTML = '';
			return;
		}
		window.KCFinder = {
			callBack: function(url) {
				window.KCFinder = null;
				//field.value = url;
				div.style.display = 'none';
				div.innerHTML = '';
			}
		};
		div.innerHTML = '<iframe name="kcfinder_iframe" src="{$DOMAIN}js/kcfinder/browse.php?type=files&dir=files/public" ' +
			'frameborder="0" width="100%" height="100%" marginwidth="0" marginheight="0" scrolling="no" />';
		div.style.display = 'block';
		return false;
	}
	$(".editControls-new").click(function(){
		$("#kcfinder-modal .modal-body").append("<div id='kcfinder_div'></div>");
		$('#kcfinder-modal').appendTo("BODY").modal('show');
		openKCFinder($("#kcfinder-input"));		
	 });	
	$('#kcfinder-modal').on('hidden.bs.modal', function () {
		if (window.location.href.indexOf("#") != -1) { 						
			document.location.href=window.location.href.substring(0,location.href.indexOf("#"));
		}else{
			document.location.href=window.location.href;
		}
	})
 
    tinymce.init({
		language :"hu_HU",
        selector: ".tinyInlineEdit", 
        width:"350",
        inline: true,
        force_br_newlines : false,
        force_p_newlines : false,
        forced_root_block : '',
        plugins: "save code link image",		
        toolbar1: "save | insertfile undo redo | styleselect | bold italic | duplicatecontent",
        toolbar2: "alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image ",
        save_enablewhendirty: true,
        save_onsavecallback: function() {
            //console.log(encodeURIComponent( tinyMCE.activeEditor.getContent()));					
            //console.log($(tinyMCE.activeEditor.bodyElement).attr("rel"));							
            var dataToSend= { "thisItem" : $(tinyMCE.activeEditor.bodyElement).attr('rel'), "thisItemText" :(tinyMCE.activeEditor.getContent()) }
            $.post("modules/module.ajax.setContent.php",  { json: JSON.stringify(dataToSend)}, function(msg){ 
            $(msg).appendTo("BODY").fadeIn(750).delay(3000).fadeOut(750); 
            } );                                                
		},
		file_browser_callback : function(field, url, type, win) {
			tinyMCE.activeEditor.windowManager.open({
				file: '{$DOMAIN}/js/kcfinder/browse.php?opener=tinymce4&field=' + field + '&type=' + type,					
				title: 'KCFinder',
				width: 700,
				height: 500,
				inline: false,					
				close_previous: false
			}, {
				window: win,
				input: field
			});
			return false;
		}
		/*
		setup: function(editor) {
			editor.addButton('duplicatecontent', {
				text: 'Tartalom duplikálása!',
				icon: false,
				onclick: function() {
					alert(1);
				}
			});    	
			editor.addMenuItem('example', {
				text: 'My menu item',
				context: 'tools',
				onclick: function() {
					//editor.insertContent('Hello world!!');
					$(tinyMCE.activeEditor.bodyElement).after( $(tinyMCE.activeEditor.bodyElement).clone().removeAttr("id") );
					//tinymce.init({ selector: ".tinyInlineEdit" } );
					//$(tinyMCE.activeEditor.bodyElement)
					tinymce.EditorManager.execCommand('mceAddEditor', false, ".tinyInlineEdit");
				}
			});
		}  */  
    });
	
		
});		
</script>		


<div style="display:none;" class="modal fade" id="kcfinder-modal" tabindex="-1" role="dialog" aria-labelledby="kcfindertool" aria-hidden="true">
	<div class="modal-dialog login-modal-dialog">
	  <div class="modal-content">
		<div class="modal-header">		  
		  <h4 class="modal-title"><i class="icomoon icomoon-user"></i>Galéria képek feltöltése</h4>
		</div>
		<div class="modal-body">&nbsp;</div>
	  </div>
	</div>
</div>
