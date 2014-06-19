// Returns the version of Internet Explorer or a -1
// (indicating the use of another browser).
function getInternetExplorerVersion(){
  var rv = -1; // Return value assumes failure.
  if (navigator.appName == 'Microsoft Internet Explorer')
  {
	var ua = navigator.userAgent;
	var re  = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
	if (re.exec(ua) != null)
	  rv = parseFloat( RegExp.$1 );
  }
  return rv;
}


function checkVersion(){
  var msg = "notie";
  var ver = getInternetExplorerVersion();

  if ( ver > -1 )
  {
	if ( ver >= 8.0 ) { 
	  if (ver == 8.0 ) { msg="ie8.0";}
	  if (ver > 8.0 ) { msg=">ie8.0";}	 
	}
	else
	  msg = "<ie8.0";
  }
return msg   
}


function anchorTo(currentTop,endTop){
	var defaults = {																
		animateDuration:Math.abs(currentTop-endTop)/2
	};  
	$('HTML, BODY').animate({
		scrollTop:Math.abs(endTop)+'px'
		},  
		defaults.animateDuration, 
		function() { 
			//console.log(1);			
		} 
	 );	 
	return false;		
};	

$(".site_logo").click(function(){
	anchorTo($(window).scrollTop(),0);						
});	

$(function(){
	$("A[rel^='prettyPhoto']").prettyPhoto({animation_speed:'normal',theme:'facebook',slideshow:6000, default_width: 700, 
		autoplay_slideshow: false, social_tools:false,deeplinking: false, show_title:false, allow_resize: false,
		overlay_gallery: false, opacity: 0.9,
		markup:
		'<div class="pp_pic_holder"> \
			<div class="ppt">&nbsp;</div> \
			<div class="pp_content_container"> \
				<div class="pp_content"> \
						<div class="pp_loaderIcon"></div> \
						<div class="pp_fade"> \
							<a href="#" class="pp_expand" title="Expand the image">Expand</a> \
							<div class="pp_hoverContainer"> \
								<a class="pp_next" href="#">next</a> \
								<a class="pp_previous" href="#">previous</a> \
							</div> \
							<div id="pp_full_res"></div> \
						   </div> \
					</div> \
				 </div> \
			</div> \
			<div class="pp_overlay"></div>',
		changepicturecallback: function(){ anchorTo($(window).scrollTop(),0); },
		});	
	
	
	$.fn.mainScroll({
		navTrigger : $(".site_menu a[href^='#'], .footer_menu a[href^='#']"),
		fixBlock : $(".fixBlock"),
		fixBlockUse : false,
		//fixBlockTop : 495,
		scrollMsgUse : false
	});				
	
});