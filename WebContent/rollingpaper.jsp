<%@ page contentType="text/html; charset=euc-kr" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="ohmygift.rollingpaper.db.*" %>    
<%
	ArrayList<MessageBean> messagelist = (ArrayList<MessageBean>)request.getAttribute("messagelist");
	String paper_id = (String)request.getAttribute("paper_id");
	pageContext.setAttribute("paper_id", paper_id);
	GiftInfoBean gift_info = (GiftInfoBean)request.getAttribute("gift_info");
	pageContext.setAttribute("gift_info",gift_info);
	System.out.println(gift_info.getGift_name());
	
%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:og="http://opengraphprotocol.org/schema/" xmlns:fb="http://www.facebook.com/2008/fbml" xml:lang="en" lang="en">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta property="fb:app_id" content="137664066326663" />
	<meta property="fb:admins" content="100001601537277" />
	<meta property="fb:page_id" content="256589707692679" />
    <meta property="og:title" content="JaeYoung's FackBook App"/>
	<!-- 
	
	-->
    <meta property="og:type" content="article"/>
    <meta property="og:url" content="http://almater.kr/ohmygift/page1.jsp"/>
    <meta property="og:image" content="https://fbcdn-photos-a.akamaihd.net/photos-ak-snc1/v43/60/253782174639480/app_1_253782174639480_5302.gif"/>
    <meta property="og:site_name" content="JaeYoung"/>
    
    <meta property="og:description"
          content="facebook app test  "/>
          
	<title>Oh My Gift!!!</title>
	
	<link type="text/css" href="rollingpaper.css" rel="stylesheet" />
	<!--  Booklet Library -->
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
	<script src="./scripts/booklet/jquery.easing.1.3.js" type="text/javascript"></script>
	<script src="./scripts/booklet/jquery.booklet.1.1.0.min.js" type="text/javascript"></script>
	<link href="./scripts/booklet/jquery.booklet.1.1.0.css" type="text/css" rel="stylesheet" media="screen" />
	<link rel="stylesheet" href="./scripts/booklet/css/style.css" type="text/css" media="screen" />
	
	<!--  Epiclock Library -->
	<script type="text/javascript" src="./scripts/epiclock/javascript/jquery.dateformat.js"></script>
	<script type="text/javascript" src="./scripts/epiclock/jquery.epiclock.js"></script>
	<script type="text/javascript" src="./scripts/epiclock/renderers/retro/epiclock.retro.js"></script>
	<script type="text/javascript" src="./scripts/epiclock/renderers/retro-countdown/epiclock.retro-countdown.js"></script>
	
	<script src="./scripts/booklet/cufon/cufon-yui.js" type="text/javascript"></script>
	<script src="./scripts/booklet/cufon/ChunkFive_400.font.js" type="text/javascript"></script>
	<script src="./scripts/booklet/cufon/Note_this_400.font.js" type="text/javascript"></script>
	<script type="text/javascript">
		Cufon.replace('h1,p,.b-counter');
		Cufon.replace('.book_wrapper a', {hover:true});
		Cufon.replace('.title', {textShadow: '1px 1px #C59471', fontFamily:'ChunkFive'});
		Cufon.replace('.reference a', {textShadow: '1px 1px #C59471', fontFamily:'ChunkFive'});
		Cufon.replace('.loading', {textShadow: '1px 1px #000', fontFamily:'ChunkFive'});
	</script>
		
		
	<div id="fb-root"></div>
	<script src="http://connect.facebook.net/ko_KR/all.js"></script>        
	<script type="text/javascript">
	$(function(){
		initApp();

		
		function initApp(){
			
			FB.init({
				appId  : '137664066326663',
			    status : true, // check login status
			    cookie : true, // enable cookies to allow the server to access the session
			    xfbml  : true, // parse XFBML
			    oauth  : true // enable OAuth 2.0
			});
		}
		
	    var myName;
	    var myUid;
	    var myImg;
	    var myBirthday;
	    
	    var accessToken;  
	    FB.getLoginStatus(function(response) {
		  if (response.status === 'connected') {
		    var uid = response.authResponse.userID;
		    accessToken = response.authResponse.accessToken;
	        var frientBirth_query = "SELECT uid,name,birthday,pic_small FROM user WHERE uid=";
			frientBirth_query += uid;
	        FB.api(
				  {
				    method: 'fql.query',
				    query: frientBirth_query
				  },
				  function(response) {
	                myName = response[0].name;
	                myUid = response[0].uid;
	                myImg = response[0].pic_small;
	        		myBirthday= response[0].birthday;
				  }
			);
	        
		  } else if (response.status === 'not_authorized') {
		    FB.login(function(response) {
				  if (response.authResponse) {
				    FB.api('/me', function(response) {
				    	var data = "name="+ response.name +"&"+"birthday="+ response.birthday+"&"+"uid="+response.id;
				    	
				    	$.ajax({
							type : 'POST',
							url :'./ajax/member_add.jsp',
							data :data ,
							dataType:'html',
							contentType: "application/x-www-form-urlencoded;charset=utf-8",
							success:function(html,textStatus){
	                            alert(paper_id);
	                            if( paper_id != null){
	                            }
								else{
	                            }
							},
							error:function(xhr,textStatus,errorThrown){
								alret(errorThown ?  errorthrown : xhr.status);
							}
						});
	                });
				  } else {
	                console.log("거부");
				    alert('User cancelled login or did not fully authorize.');
				  }
			},
			{ scope:'friends_birthday,user_birthday,friends_about_me,publish_stream,friends_photos,user_likes,friends_likes,manage_pages,offline_access,read_insights'});	
		  } else {
	          console.log(response);
	          FB.login(function(response) {
				  if (response) {
				    window.parent.location = "./ohmygift.jsp"
				  } else {
				    alert('User cancelled login or did not fully authorize.');
				  }
			},
			{ scope:''});
		    // the user isn't even logged in to Facebook.
		  }
		});
	    
	    $(document).ready(function() {
	    	
	    	setBooklet();
	       //------------------------------
	        //  Countdown
	        //------------------------------
	        
	        $('#countdown').epiclock({mode: $.epiclock.modes.countdown, offset: {minutes: 3600}});
	        $('#addMoneyBtn').click(function(){
	        	setBooklet();	
	        });
	        $('#writingBtn').click(function(){
	           FB.ui(
	              {
	                method: 'feed',
	                name: '축하메세지!!!',
	                link: 'http://localhost:8080/OhMyGift/getrolling.roll?paper_id='+${paper_id},
	                picture: 'http://fbrell.com/f8.jpg',
	                caption: '생일축하드립니다.',
	                description: '생일축하메세지...'
	              },
	              function(response) {
	                if (response && response.post_id) {
	                    var friends_url = "https://graph.facebook.com/" + response.post_id+"&callback=?";
	                    var params = { format :'json'};
	                    $.getJSON(friends_url,params, function(json){
	                        var data = 'uid='+myUid+"&paper_id="+ ${paper_id}+"&message="+json.message+"&photo_url="+myImg;
	                        console.log(data);
	                        $.ajax({
								type : 'POST',
								url :'./ajax/message_add.jsp',
								data :data ,
								dataType:'html',
								contentType: "application/x-www-form-urlencoded;charset=utf-8",
								success:function(json,textStatus){
	                                history.go(0);
								},
								error:function(xhr,textStatus,errorThrown){
								}
							});
	                    });
	                } else {
	                  alert('Post was not published.');
	                }
	              }
	            ); 
	        });
		});
	    
	    
	    
	    function getRollingPaper(){
	        $.ajax({
	    		type : 'POST',
	    		url :'http://almater.kr/gift/message_show.jsp',
	    		data :"paper_id=" + '1' ,
	    		dataType:'json',
	    		contentType: "application/x-www-form-urlencoded;charset=utf-8",
	    		success:function(json,textStatus){
	                console.log(json);
	                
	                $('#b-load').text('');
	                $page = $('<div></div>');
	                $.each(json,function(i){
	                   $page = $page.append('<img style="margin-left: 0px; float:left; clear:left;" src="'+ json[i].photo_url +'" />')
	                   .append('<h2 style="width:200px">'+json[i].message+'</h2');
	                   if(i % 2 == 1){
	                       $page.appendTo('#b-load');
	                       $page = $('<div></div>');
	                   }
	                });
	                setBooklet();
	    		},
	    		error:function(xhr,textStatus,errorThrown){
	    			alret(errorThown ?  errorthrown : xhr.status);
	    		}
	    	});    
	    };
	    /*
		 * 롤링페이퍼를 다불러온 후에 Booklet 세팅..
		 * 롤링페이퍼 여러개 생성시에 어떻케 처리할지 고민..
		 */
	    function setBooklet(){
         	var $mybook 		= $('#mybook');
			var $bttn_next		= $('#next_page_button');
			var $bttn_prev		= $('#prev_page_button');
			var $loading		= $('#loading');
			var $mybook_images	= $mybook.find('img');
			var cnt_images		= $mybook_images.length;
			var loaded			= 0;
            
            $loading.hide();
			$bttn_next.show();
			$bttn_prev.show();
			$mybook_images.each(function(){
				var $img 	= $(this);
				var source	= $img.attr('src');
				console.log("setBooklet");
				$('<img/>').load(function(){
					++loaded;
					if(loaded == cnt_images){
						$loading.hide();
						$bttn_next.show();
						$bttn_prev.show();
						
						$mybook.show().booklet({
							name:               null,                            // name of the booklet to display in the document title bar
							width:              600,                             // container width
							height:             348,                             // container height
							speed:              600,                             // speed of the transition between pages
							direction:          'LTR',                           // direction of the overall content organization, default LTR, left to right, can be RTL for languages which read right to left
							startingPage:       0,                               // index of the first page to be displayed
							easing:             'easeInOutQuad',                 // easing method for complete transition
							easeIn:             'easeInQuad',                    // easing method for first half of transition
							easeOut:            'easeOutQuad',                   // easing method for second half of transition

							closed:             true,                           // start with the book "closed", will add empty pages to beginning and end of book
							closedFrontTitle:   null,                            // used with "closed", "menu" and "pageSelector", determines title of blank starting page
							closedFrontChapter: null,                            // used with "closed", "menu" and "chapterSelector", determines chapter name of blank starting page
							closedBackTitle:    null,                            // used with "closed", "menu" and "pageSelector", determines chapter name of blank ending page
							closedBackChapter:  null,                            // used with "closed", "menu" and "chapterSelector", determines chapter name of blank ending page
							covers:             false,                           // used with  "closed", makes first and last pages into covers, without page numbers (if enabled)

							pagePadding:        10,                              // padding for each page wrapper
							pageNumbers:        false,                            // display page numbers on each page

							hovers:             false,                            // enables preview pageturn hover animation, shows a small preview of previous or next page on hover
							overlays:           false,                            // enables navigation using a page sized overlay, when enabled links inside the content will not be clickable
							tabs:               false,                           // adds tabs along the top of the pages
							tabWidth:           60,                              // set the width of the tabs
							tabHeight:          20,                              // set the height of the tabs
							arrows:             false,                           // adds arrows overlayed over the book edges
							cursor:             'pointer',                       // cursor css setting for side bar areas

							hash:               false,                           // enables navigation using a hash string, ex: #/page/1 for page 1, will affect all booklets with 'hash' enabled
							keyboard:           true,                            // enables navigation with arrow keys (left: previous, right: next)
							next:               $bttn_next,          			// selector for element to use as click trigger for next page
							prev:               $bttn_prev,          			// selector for element to use as click trigger for previous page

							menu:               null,                            // selector for element to use as the menu area, required for 'pageSelector'
							pageSelector:       false,                           // enables navigation with a dropdown menu of pages, requires 'menu'
							chapterSelector:    false,                           // enables navigation with a dropdown menu of chapters, determined by the "rel" attribute, requires 'menu'

							shadows:            true,                            // display shadows on page animations
							shadowTopFwdWidth:  166,                             // shadow width for top forward anim
							shadowTopBackWidth: 166,                             // shadow width for top back anim
							shadowBtmWidth:     50,                              // shadow width for bottom shadow

							before:             function(){},                    // callback invoked before each page turn animation
							after:              function(){}                     // callback invoked after each page turn animation
						});
						Cufon.refresh();
					}
				}).attr('src',source);
			});
	    }
	});   
	</script>
	
</head>	
<body>
	<div class="header_container">
	    <!--------------------------------------------------------------------->
	    <!-- Ribbon Image -->
	    <div class="ohMyGiftButton">
	     	<a href="ohmygift.jsp" title="Click here go home">
	     	   <img src="images/page1/1_logo.png" alt="Go Home" />
	     	</a>
	    </div>
	    <div class="title">
	        <img src="images/page3/title.png" class="titleTextImg" />
	        <img src="${sessionScope.myImg }" class="myProfileImg" />
	    </div> 
	    <div class="time">
	        <h3 id="countdown" ></h3>
	    </div>  
	    <!--------------------------------------------------------------------->
	    <!--Other Friends Button -->
	</div>
	
	<!--------------------------------------------------------------------->
	<!--Other middle Content -->
	<div class="middle_container">
	    <div class="book_wrapper">
			<a id="next_page_button"></a>
			<a id="prev_page_button"></a>
			<div id="loading" class="loading">Loading pages...</div>
			<div id="mybook" style="display:none;">
				<div class="b-load">
					<%
					for(int i =0; i < messagelist.size(); i++){
						if(i % 3 == 0){
							out.println("<div>");
							out.println("<div style='width:300px; height:100px; padding-top:10px; '>");
							out.println("<img src="+  messagelist.get(i).getPhoto_url() +" style='width:50px; height:50px; float:left; margin-left:10px;'/>");
							out.println("<p style=' float:left; font-size:13px; margin-left:10px; width: 200px; max-height: 80px; overflow:hidden;'>"+messagelist.get(i).getMessage() +"</p>");
							out.println("</div>");
							out.println("<div style='clear:both;'></div>");
						}else if(i % 3 ==1){
							out.println("<div style='width:300px; height:100px; padding-top:10px; '>");
							out.println("<img src="+  messagelist.get(i).getPhoto_url() +" style='width:50px; height:50px; float:left; margin-left:10px;'/>");
							out.println("<p style='  float:left; font-size:13px; margin-left:10px; width: 200px; max-height: 80px;'>" + messagelist.get(i).getMessage() +"</p>");
							out.println("</div>");
							out.println("<div style='clear:both;'></div>");
						}
						else{
							out.println("<div style='width:300px; height:100px; padding-top:10px; '>");
							out.println("<img src="+  messagelist.get(i).getPhoto_url() +" style='width:50px; height:50px; float:left; margin-left:10px;'/>");
							out.println("<p style=' float:left; font-size:13px; margin-left:10px; width: 200px; overflow:hidden; max-height: 80px;'>" + messagelist.get(i).getMessage() +"</p>");
							out.println("</div>");
							out.println("<div style='clear:both;'></div>");
							out.println("</div>");
						}
					}
					%>
				</div>
			</div>
		</div>
	</div>
	<div class="footer_container">
        <div class="inner_footer">
    		<div class="progress">
            	<div class="progress_pic"><img src="images/page3/progress_pic.png" class="picture" /></div>
       			<div class="progress_bar"><img src="images/page3/progress.png" class="bar" /></div>
            </div>
            <div class="button">
            	<div class="help"><img src="images/page3/btn1.png" id="addMoneyBtn"/></div>
                <div class="writing"><img src="images/page3/btn2.png" id="writingBtn"/></div>
            </div>
       </div>    
	</div>
		
</body>

</html>
