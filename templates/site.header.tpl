<title>{$meta_title}</title>       
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="content-language" content="hu" />
<meta http-equiv="Expires" content="0" />
<meta name="robots" content="index,follow" />
<meta name="language" content="hu" />
<meta name="page-topic" content="all, alle" />
<meta name="distribution" content="global" />
<meta name="revisit-after" content="5 days" />    
<meta name="description" content="{$meta_title}" />
<meta name="keywords" content="{$meta_keywords}" />
<meta name="author" content="{$meta_author}" />
<meta name="copyright" content="{$meta_copyright}" /> 
<meta name="publisher" content="{$meta_publisher}" />   

<link href="{$DOMAIN}images/site/favicon.ico" rel="icon" type="image/ico" />
<link href="{$DOMAIN}images/site/favicon.ico" rel="shortcut icon" type="image/ico" />
<link href="{$DOMAIN}images/site/favicon.ico" rel="bookmark icon" type="image/ico" />
<link href="{$DOMAIN}images/site/favicon.ico" rel="shortcut" type="image/ico" />

{if ($loginPage eq '1') AND !$loggedIn}
    <link href="{$DOMAIN}css/bootstrap.min.css" rel="stylesheet" media="screen" type="text/css"/>
    <link href="{$DOMAIN}css/AdminLTE.css" rel="stylesheet" type="text/css" charset="utf-8" />
    <link href="{$DOMAIN}css/site_main.css" rel="stylesheet" type="text/css" charset="utf-8" />
    <style type="text/css">
     HTML, BODY.body { height:100%; }
     .form-box .header, .bg-olive { background:#8ea12e !important;}
     .public-site { display:block; color:#fff; background:#574026;  padding:5px; margin:5px 0px;}
     </style>		        
{/if}

{if $loginPage ne '1' OR ($loginPage eq '1' AND $loggedIn)}
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700&amp;subset=latin,latin-ext' rel='stylesheet' type='text/css' />	
    <link href="{$DOMAIN}css/jquery.nivo.slider.css" rel="stylesheet" type="text/css" charset="utf-8" />
    <link href="{$DOMAIN}css/nivoThemes/default/default.css" rel="stylesheet" type="text/css" charset="utf-8" />		
    <link href="{$DOMAIN}css/simplePagination.css" type="text/css" rel="stylesheet" />		
    <link href="{$DOMAIN}css/prettyPhoto.css" type="text/css" rel="stylesheet" />				
    <link href="{$DOMAIN}css/site_main.css" rel="stylesheet" type="text/css" charset="utf-8" />	
    <!--[if lte IE 6]><link href="{$DOMAIN}css/site_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->
    <!--[if IE 7]><link href="{$DOMAIN}css/site_ie7.css" rel="stylesheet" type="text/css" /><![endif]-->
    <!--[if gte IE 8]><link href="{$DOMAIN}css/site_ie8.css" rel="stylesheet" type="text/css" /><![endif]-->		
    <script type="text/javascript" src="{$DOMAIN}js/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="{$DOMAIN}js/jquery-LJ-mainScroll.js"></script>		
    <script type="text/javascript" src="{$DOMAIN}js/jquery.nivo.slider.pack.js"></script>		
    <script type="text/javascript" src="{$DOMAIN}js/jquery.simplePagination.js"></script>	
    <script type="text/javascript" src="{$DOMAIN}js/jquery.prettyPhoto.js"></script>				
    <script type="text/javascript" src="{$DOMAIN}js/site.js"></script>
    
    <script type="text/javascript">
	$(function(){		
					
			$(".nivoSlider").nivoSlider( {
				effect: 'fade',
				slices: 15,
				boxCols: 8,
				boxRows: 4,
				animSpeed: '{$slider_animSpeed}',
				pauseTime: '{$slider_pauseTime}',
				startSlide: 0,
				directionNav: true,
				controlNav: true,
				controlNavThumbs: false,
				pauseOnHover: true,
				manualAdvance: false       
			});
			
	});
	
    </script>
{/if}

