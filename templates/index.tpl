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
   
		
	<div style="position:relative; z-index:10;">
	<div class="fixBlock">			
		<div class="site_center" style="position:relative;">				
			<div class="hideMenu"></div>
			<a href="javascript:;"><img src="images/site/site_logo.png" alt="" class="site_logo" /></a>			
			<div class="site_menu tinyInlineEdit" rel="site.menu" >				
				{include file="data/site.menu.tpl"}
			</div>
		</div> 
	</div>
						
	<div class="scrollCont_">
		
		<div class="site_head_container">				
			<div class="site_head site_center">							
				<div class="slider-wrapper theme-default">
					<div id="slider" class="nivoSlider">								
						<a href="javascript:;"><img src="images/site/slider_4.jpg" alt="" /></a>
						<a href="javascript:;"><img src="images/site/slider_3.jpg" alt="" /></a>						
					</div>				
				</div>	
				<div class="clear"></div>   
			</div>
		</div>			
		<div class="siteTab slide_0 content_bg_0 menu_1">
			<div class="tabContent">
				<div class="slide_0_inner"></div>						
				<div class="inner_padding tinyInlineEdit" rel="menu_1">
					{include file="data/menu_1.tpl"}			
				</div>	
			</div>
		</div>		
		
		
		
		<div class="siteTab slide_1 content_bg_1 menu_2">
			<div class="tabContent slide_1_inner">					
				<div class="inner_padding tinyInlineEdit" rel="menu_2">					
					{include file="data/menu_2.tpl"}	
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
					<div class="footer_menu tinyInlineEdit" rel="site.menu">
						{include file="data/site.menu.tpl"}											
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

