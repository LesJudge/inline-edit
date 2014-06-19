
/********************************************************/
/*	LABEL IN FIELD => $-LJ-mainScroll.js	
	
	Készítette: Bíró László 
	e-mail: birolacko82@gmail.com 
	
	Működési leírás: 
		Horgonyok mentén navigál, majd animációval a konténerhez scrollozódik,
		és a hash-t átírja a trigger A-tag 'href' attributumában megadott '#'-kal megadott kifejezésére kattintás után.
		Lehetőség van fix pozíciójú blokk helyzetének megadására is (top-tól adott px-re lévő nav konténer adott px után fixtop-ra igazítása). 
		
	Használata: 	
		HTML: - container:		<div id='top'> ... </div>
			  - nav trigger : 	<a href="#top"> ... </a>
		JS: $.fn.mainScroll();			
			
			amely az alábbi paraméterekkel deffiniálható:
			
			var defaults = {	
				animDuration : 300,
				checkPosTime : 50,
				latency : 300,
				fixBlockUse : false,
				fixBlockTop : 400,
				fixBlock : $(".fixBlock"),
				scrollMsgUse : false,
				scrollMsgId : "scrollMsgInfo",
				crollMsgContant : "SCROLLING",
				scrollMsgStyle : {
					position: 'fixed', 
					top: 100,
					left: 20,
					height: 30,
					lineHeight: '30px',
					padding: '0 10px',
					background: 'black',
					border: '1px solid yellow',
					color: 'yellow',
					opacity: 0,
					zIndex:9999					
				},
				navTrigger : $(".site_menu a[href^='#']")	 			
			};	
*/
/********************************************************/

$.fn.extend({       
	mainScroll : function(options) {  
		var THIS = this;
		
		var defaults = {	
			animDuration : 300,
			checkPosTime : 100,
			latency : 200,
			fixBlockUse : false,
			fixBlockTop : 400,
			fixBlock : $(".fixBlock"),
			scrollMsgUse : false,
			scrollMsgId : "scrollMsgInfo",
			scrollMsgContant : "<img src='images/site/loader.gif' alt='' />",
			scrollMsgStyle : {
				position: 'fixed', 
				top: 10,
				left: 10,
				height: 30,
				lineHeight: '30px',
				padding: '0 10px',
				opacity: 0,
				zIndex:9999					
			},
			navTrigger : $(".site_menu a[href^='#']")	 			
		};	
			
		var opt = $.extend(defaults, options);   
		
		THIS.getViewport = function(){						
			var $w = $(window);
			return {
				l: $w.scrollLeft(),
				t: $w.scrollTop(),
				w: $w.width(),
				h: $w.height() 
			}					
		}
		
		THIS.setNavPos = function(){			
			if((THIS.getViewport().t) >= opt.fixBlockTop){
				opt.fixBlock.css({'position':'fixed','top':'0px'});						
			}else{
				opt.fixBlock.css({'position':'relative','top':'0px'});						
			}
			return false;	
		}
		
		THIS.message = $("<div id='#"+opt.scrollMsgId+"' />").css(opt.scrollMsgStyle);				
						
		THIS.special = $.event.special, uid1 = 'D' + (+new Date()), uid2 = 'D' + (+new Date() + 1);
				
		THIS.special.scrollstart = {
			setup: function() {			 
				var timer,
					handler =  function(evt) {			 
						var _self = this,
							_args = arguments;			 
						if (timer) {
							clearTimeout(timer);
						} else {
							evt.type = 'scrollstart';
							$.event.handle.apply(_self, _args);
						}			 
						timer = setTimeout( function(){
							timer = null;
						}, THIS.special.scrollstop.latency);			 
					};							
	 
				$(this).bind('scroll', handler).data(uid1, handler);			 
			},
			teardown: function(){
				$(this).unbind( 'scroll', $(this).data(uid1) );
			}
		};	
		
		THIS.special.scrollstop = {
			latency: opt.latency,
			setup: function() {			 
				var timer,
					handler = function(evt) {			 
						var _self = this,
							_args = arguments;			 
						if (timer) {
							clearTimeout(timer);
						}			 
						timer = setTimeout( function(){			 
							timer = null;
							evt.type = 'scrollstop';
							$.event.handle.apply(_self, _args);			 
						}, THIS.special.scrollstop.latency);			 
					};			 
				$(this).bind('scroll', handler).data(uid2, handler);			 
			},
			teardown: function() {
				$(this).unbind( 'scroll', $(this).data(uid2) );
			}
		};	
		
		$(function(){				
			if (opt.scrollMsgUse != false){
				THIS.message.hide().appendTo('body');
			}
			
			if (opt.fixBlockUse != false){
				THIS.setNavPos();
			}
			
			$(window).bind('scrollstart', function(){
				if (opt.fixBlockUse != false){
					clearInterval(THIS.scrollTimer);
					THIS.scrollTimer=setInterval(function(){
						THIS.setNavPos();
					}, opt.checkPosTime);
				}
				if (opt.scrollMsgUse != false){
					THIS.message.html(opt.scrollMsgContant).stop().show().animate({						
						opacity: 1
					});
				}
			});
			
			$(window).bind('scrollstop', function(e){
				if (opt.fixBlockUse != false){
					clearInterval(THIS.scrollTimer);
					THIS.scrollTimer=setInterval(function(){
						THIS.setNavPos();
					}, opt.checkPosTime);
				}
				if (opt.scrollMsgUse != false){
					THIS.message.stop().show().animate({
						opacity: 0
					});
				}
			});		
				
			opt.navTrigger.on('click', function(e) {
				e.preventDefault();
				THIS.ht=this.hash.substring(1);
				//console.log(THIS.ht);
				
				$("HTML, BODY").animate(
					{ 
					  scrollTop: parseInt(parseInt($("."+THIS.ht).offset().top)-80)+"px" 					 
					},
					{ duration: opt.animDuration, 
						complete:function() {		
							window.location.hash = THIS.ht;											
						}
					}
				);	
																		
			});	// opt.navTrigger click -> end
			
		});
	} // opt.mainScroll -> end	
	
}); //$.fn.extend -> end
