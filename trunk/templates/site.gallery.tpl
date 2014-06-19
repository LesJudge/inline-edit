<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
{include file="site.header.tpl"}
</head>

<body class="body">
{if $loginPage eq '1' AND $loggedIn}
   {include file="site.logout.tpl"}
{/if}
	
{if $loginPage eq '1'}
     {if ! $loggedIn}        
        {include file="site.login.tpl"}
     {else}  				
     	{include file="site.inlineEdit.tpl"}        		
   {/if}  	
{/if}  	


{if $loginPage ne '1' OR ($loginPage eq '1' AND $loggedIn)}
   
<script type="text/javascript" charset="utf-8">
	  $(document).ready(function(){			                 
			$("A[rel^='prettyPhoto']").prettyPhoto({ animation_speed:'normal',theme:'facebook',slideshow:6000, default_width: 700, 
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
			
			$(".site_logo").click(function(){
				anchorTo($(window).scrollTop(),0);						
			});	
			/*
			if($(".pageElement#page-2").length!=0){ $(".refItem-pager").css("display","block"); }
			$(".refItem-pager").pagination({
				items: $(".refItem-cont DIV A").size(),
				itemsOnPage: '{$words_itemperpage}',				
				prevText: 'Früher',
				nextText: 'Nächste',
				hrefTextPrefix: '#seite-',					
				cssStyle: 'light-theme',
				onPageClick:function(pageNumber, event){ 
					//console.log( $(".refItem-pager").pagination('getCurrentPage') ); 
					$(".editableImageBlock").removeClass("selectedItem");
					$(".pageElement").css("display","none"); 
					$("#page-"+$(".refItem-pager").pagination('getCurrentPage')).css("display","block");
				}
			});				
			if((window.location.hash)&&(window.location.hash.search("galeria-")!=-1)) {					
				//console.log(window.location.hash.search("galeria-")); 
				$(".refItem-pager").pagination('selectPage', window.location.hash.substring(7));	 
			} else {
				$(".refItem-pager").pagination('selectPage',1);
			}	
			
			*/
			if($(".pageElement#page-2").length!=0){ $(".refItem-pager").css("display","block"); }
			if($(".refItem-pager").length!=0){
				$(".refItem-pager").pagination({
					items: $(".refItem-cont DIV A").size(),
					itemsOnPage: '{$words_itemperpage}',	
					prevText: 'Früher',
					nextText: 'Nächste',
					hrefTextPrefix: '#seite-',
					cssStyle: 'light-theme',
					onPageClick:function(pageNumber, event){ 
						//console.log( $(".refItem-pager").pagination('getCurrentPage') ); 
						$(".editableImageBlock").removeClass("selectedItem");
						$(".pageElement").css("display","none"); 
						$("#page-"+$(".refItem-pager").pagination('getCurrentPage')).css("display","block");
					}
				});				
				if(window.location.hash) {					
					//console.log("hash:"+window.location.hash);
					//console.log("hash:"+window.location.hash.substring(7));		
					$(".refItem-pager").pagination('selectPage', window.location.hash.substring(7));	 
				} else {
					$(".refItem-pager").pagination('selectPage',1);
				}	
			}
					
	  });
	</script>        	
	<div style="position:relative; z-index:10;">
	<div class="fixBlock">			
		<div class="site_center" style="position:relative;">				
			<div class="hideMenu"></div>
			<a href="javascript:;"><img src="images/site/site_logo.png" alt="" class="site_logo" /></a>			
			<div class="site_menu tinyInlineEdit" rel="site.gallery_menu">			
				{include file="data/site.gallery_menu.tpl"}
			</div>
		</div> 
	</div>
						
	<div class="scrollCont_">
		
		<div class="site_head_container min_size">				
			<div class="site_head site_center min_size">							
				<div class="pageTitle">Unsere Referenzen</div>
				<div class="clear"></div>   
			</div>
		</div>			
		<div class="siteTab slide_4 content_bg_4">
			<div class="tabContent">
				<div class="slide_4_inner"></div>						
				<div class="inner_padding">
					<!-- <h1>Willkommen bei <span class="binding">Pharmatech Europe AG</span></h1> -->							
					{if $referenzen eq 0}       
					<div class="refItem-cont">
						 {include file="site.gallery_start.tpl"}
					</div>
					{else} 
						{$editControls}  
						{if $gallery}
						<div class="refItem-cont">
							<div class="pageElement" id="page-1">
								<!-- $dir="images/referencia/hastelloy";	 -->
								{$gallery}        
							 </div>
							<div class="clear"></div>		
						</div>
						<div class="refItem-pager"></div>	
						{/if}			
					{/if}  											
				</div>	
			</div>
		</div>
			
		
		<div class="siteTab slide_3 content_bg_3 menu_3">
			<div class="tabContent slide_3_inner">                	
				<div class="inner_padding">	
					<div class="footer-cell-1 tinyInlineEdit" rel="menu_3">
						 {include file="data/menu_3.tpl"}
					</div>	
					<div class="footer-cell-2">
						<a href="https://maps.google.hu/maps?oe=utf-8&q=Einsiedlerstrasse+23+CH-8834+Schindellegi&ie=UTF-8&hq=&hnear=0x479ab24c3b7b2fa5:0x823f854dca3a466c,Einsiedlerstrasse+23,+CH-8834,+Sv%C3%A1jc&gl=hu&ei=hSkwU7SCIef8ywOE0YHwCg&ved=0CC8Q8gEwAA" target="_blank">
						<img class="mapImg" src="images/site/map.png" alt="" />
						</a>
					</div>
					<div class="clear"></div>	
					<div class="copiright tinyInlineEdit" rel="menu_4">
						{include file="data/menu_4.tpl"}
					</div>					
					<div class="footer_menu tinyInlineEdit" rel="site.gallery_menu">
						{include file="data/site.gallery_menu.tpl"}											
					</div>
					<div class="clear"></div>
				</div>			
            </div>
		</div>			              

	</div>
</div>	
   
{/if}
 
 </body>
</html>

