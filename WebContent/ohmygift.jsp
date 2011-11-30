<!--  version1.1 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=euc-kr" pageEncoding="utf-8"%>
<!DOCTYPE html>
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
    
 	<!--  jQuery Library -->
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.3/jquery.min.js"></script>
	<script type="text/javascript" src="./scripts/jquery/jquery-ui-1.8.16.custom.min.js"></script>
	<link type="text/css" href="./scripts/css/custom-theme/jquery-ui-1.8.16.custom.css" rel="stylesheet" />
	<!--  jQuery Fancybox Library -->
	<script type="text/javascript" src="./scripts/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
    <link rel="stylesheet" type="text/css" href="./scripts/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
	
	<!--  jQuery jscrollpane Library -->
	<link type="text/css" href="./scripts/scroll/jquery.jscrollpane.css" rel="stylesheet"  />
	<!-- the styles for the lozenge theme -->
	<link type="text/css" href="./scripts/scroll/jquery.jscrollpane.lozenge.css" rel="stylesheet" />
	<!-- the mousewheel plugin -->
	<script type="text/javascript" src="./scripts/scroll/jquery.mousewheel.js"></script>
	<!-- the jScrollPane script -->
	<script type="text/javascript" src="./scripts/scroll/jquery.jscrollpane.js"></script>
	<!-- jQuery Rotate Library -->
	<!--  link type="text/css" href="./scripts/rotate/style.css" rel="stylesheet" /-->
	<script type="text/javascript" src="./scripts/rotate/jquery.rotate.js"></script>
	
	<style type="text/css">
	    body {
            padding 0;
            margin: 0 auto;
            margin-top: -20px;
            background-image: url(images/page1/bg.png); 
            background-repeat: repeat-x;
            background-color: #8DC4B7;
            float: left;
            width: 100%; 
          	/*
          	background-image: url(images/content_gift.png);
          	background-position: bottom right;
          	background-repeat: no-repeat;
         	height: 515px;
        	*/
         }
         /*클릭했을때 border 없애기*/
         a:active, a:focus, input {
            outline: 0;
            outline-style:none;
            outline-width:0;
         }
         .page1{
             margin-top: 0px;
         }
         .page2{
         }
         .page3{
         }
	</style>
    <div id="fb-root"></div>
	<script src="http://connect.facebook.net/ko_KR/all.js"></script>
    <script type="text/javascript">
    $(function(){
        
        var myName="";
    	var myUid="";
    	var myImg="";
    	var myBirthday="";
    	
        var selectedFriendName="";
		var selectedFriendUid="";
		var selectedFriendImg="";
		var selectedFriendBirthday="";
        
        $(document).ready(function(){
        	//나에게 선물 하기 버튼
        	$("#Forme_Btn").click(function(){
                $('#page1').hide();
                $('#page3').hide();
                $('#page2').show('slow');
                setPage2(myName,myUid,myImg,myBirthday,myUid);
            });
            //친구에게 선물 하기 버튼
            $("a#ForFriend_Btn").fancybox({
                    'titleShow'  : false,
                    'transitionIn'  : 'fade',
                    'transitionOut' : 'none',
                    'width' : '100%',
                    'height' : '100%',
                    'overlayShow'           : true,
                    'onClosed'		: function() {
                	    $("#fancybox-outer").css('background','white');
                	},
                    'onStart'		: function() {
                        $("#fancybox-outer").css('width','440px');
                        $('#fancybox-loading').css('top','35%');
                	}
            });
            //친구 선택 버튼
            $('#friend_add_img_btn').click(function(){
                setPage2(selectedFriendName,selectedFriendUid,selectedFriendImg,selectedFriendBirthday,myUid);
    			$.fancybox.close();
                $('#page1').hide();
                $('#page2').show('slow');
                $('#page3').hide();
    		});
    	});
	  
        
		/*
		 * HashMap 정의..
		 * 1.선언 - var map = new HashMap();
		 * 2.Setter - map.put('key','value')
		 * 3.Getter - map.get('key') , map.getPos('index')
		 * 4.remove - map.remove(index);
		 */
		var HashMap = function()
		{
		    var mapVal  = {};    // private
		    var pos     = new Array();
		    this.get = function( key )
		    {
		        return mapVal[ key ];
		    }
		    this.getPos = function( n )
		    {
		        return mapVal[ pos[n] ];
		    }
		    this.getKey = function( n)
		    {
		  		return pos[n];
		    }
		    this.remove = function( n )
		    {
		        var ary = new Array();
		        for( var i=0; i<pos.length; i++ )
		        {
		            if( i != n )
		            {
		                ary.push( pos[i] );
		            }
		        }
		        pos = ary;
		    }
		    this.put = function( key, val )
		    {
		        mapVal[key] = val;
		        var flg = true;
		        for( var i=0; i<pos.length; i++ )
		        {
		            if( key == pos[i] )
		                flg = false;
		        }
		        if( flg )
		            pos.push( key );
		    }
		    this.size = function()
		    {
		        return pos.length;
		    }
		}
	
		/*
		 * 앱 초기 세팅 initApp() 페이스북 앱 등록
		 *            initCanvas() 캔버스 사이즈 등록 - 안먹히는듯? 
		 */
		initApp();
		initCanvas();
		
		function initCanvas(){
			FB.Canvas.setSize({ width: 760, height: 1000 });
		}
		
		function initApp(){
			
			FB.init({
				appId  : '137664066326663',
			    status : true, // check login status
			    cookie : true, // enable cookies to allow the server to access the session
			    xfbml  : true, // parse XFBML
			    oauth  : true // enable OAuth 2.0
			});
		}
		
		/*
			accessToken 권한 
			publish_stream - 친구 담벼락에 글쓰기 권한.
			friends_photos
		*/
		/*
		 * accessToken 권한정리
		 * publish_stream - 친구 담벼락에 글쓰기 권한.
		 * friends_photos - 친구 프로필 사진 
		 * friends_likes - 친구 좋아하는 거
		 * user_likes - 유저가 좋아하는거
		 * manage_pages 
		 * offline_access - 유저가 log out 해도 정보를 가져 올 수 있다
		 * read_insights - insights 정보 가져올수 있게!
		 */
		var accessToken;  
	    FB.getLoginStatus(function(response) {
	      var birthday;
	      
		  if (response.status === 'connected') {
		    var uid = response.authResponse.userID;
		    accessToken = response.authResponse.accessToken;
		   	addFriendBirth();
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
            		setPage2(myName,myUid,myImg,myBirthday,myUid);
            		//회원정보 session 등록 
            		var data = "name="+ myName +"&"+"uid="+ myUid+"&"+"img="+myImg;
                    $.ajax({
        				type : 'get',
        				url :'ajax/member_session.jsp',
        				data :data ,
        				dataType:'html',
        				contentType: "application/x-www-form-urlencoded;charset=utf-8",
        				success:function(html,textStatus){
        					//history.go(0);
        				},
        				error:function(xhr,textStatus,errorThrown){
        					alret("error");
        				}
        			});
 				  }
			);
            
		  } else if (response.status === 'not_authorized') {
		    FB.login(function(response) {
		    	var query = "SELECT uid,name,birthday,pic_small FROM user WHERE uid=";
		    	query += response.authResponse.userID;
		    	console.log(query);
			  	if (response.authResponse) {
				  FB.api(
					  {
					    method: 'fql.query',
					    query: query
					  },
					  function(response) {
						console.log(response);
	            		var data = "name="+ response[0].name +"&"+"birthday="+ response[0].birthday+"&"+"uid="+response[0].uid+"&"+"image="+response[0].pic_small;
				    	$.ajax({
							type : 'POST',
							url :'./ajax/member_add.jsp',
							data :data ,
							dataType:'html',
							contentType: "application/x-www-form-urlencoded;charset=utf-8",
							success:function(html,textStatus){
								history.go(0);
							},
							error:function(xhr,textStatus,errorThrown){
								alret(errorThown ?  errorthrown : xhr.status);
							}
						});
	 				  }
					);
			  	}else {
                    console.log("거부");
				    alert('User cancelled login or did not fully authorize.');
				}
			},
			{ scope:'friends_birthday,user_birthday,friends_about_me,publish_stream,friends_photos,user_likes,friends_likes,manage_pages,offline_access,read_insights'});	
		  } else {
	          console.log(response);
	          FB.login(function(response) {
				  if (response) {
					  //history.go(0);
				  } else {
					  //history.go(0);
				  }
			},
			{ scope:''});
		    // the user isn't even logged in to Facebook.
		  }
		});

		/*
		 * Event일어났을때 
		 * auth.sessionChange -
		 * 
		 */
		FB.Event.subscribe('auth.sessionChange', function(response) {
	
		    if (response.session) {
                alert("auth.sessionChange" + reponse.authResponse.accessToken);
		      // A user has logged in, and a new cookie has been saved

		    } else {

		      // The user has logged out, and the cookie has been cleared

		    }

	   });
	   
	   /*
	    * accessToken 을 받자마자 자신의 친구목록( 생일 ) 을 가져오는 함수.
	    * friend_list 친구들 Array - { uid , name }
	    */
		var friend_list = new Array();
	    function addFriendBirth(){
			var friends_url = "https://graph.facebook.com/me/friends?access_token="+accessToken+"&callback=?";
			var params = { format :'json'};
			$.getJSON(friends_url,params, function(json){
				if(json.data){
					$.each(json.data,function(i,n){
						var item = json.data[i];
						var user = {};
						user['uid'] = item.id;
						user['name'] = item.name;
						friend_list.push(user);
						getUserProfile(item.id);
						return i < json.data.length;
					});
				}
			});
		}
		/*
		 * uid로 친구들 이름 생일 사진 가져오는 함수.
		 * friend_list_hash - HashMap 스타일 ex) friend_list_hash.getPos(0).name , friend_list_hash.get(uid).name
		 * friend_list_array - Array 스타일 ex) friend_list_array[0].name
		 */
		var friend_list_hash = new HashMap();
		var friend_list_hash_byname = new HashMap();
		var friend_list_array = new Array();
        var friend_name_array = new Array();
		function getUserProfile(uid){
			this.uid = uid;
			var frientBirth_query = "SELECT uid,name,birthday,pic_small FROM user WHERE uid=";
			frientBirth_query += this.uid;
			
			FB.api(
				  {
				    method: 'fql.query',
				    query: frientBirth_query
				  },
				  function(response) {
				    //alert('친구'+response[0].name +'의 생일은?' + response[0].birthday + "이미지 url : "+response[0].pic_small);
					$('<li></li>')
					.append('<img src="'+response[0].pic_small+'"'+'imgnum="'+ response[0].uid +'"'+' />')
					.appendTo('#img_ul');

					var user = {};
					user['uid'] = response[0].uid;
					user['name'] = response[0].name;
					user['birthday'] = response[0].birthday;
					user['pic_small'] = response[0].pic_small;
					friend_name_array.push(response[0].name);
					friend_list_array.push(user);
					friend_list_hash.put(response[0].uid,user);
					friend_list_hash_byname.put(response[0].name,user);
					
                    
                    setEachFriendList(response[0].name);
                    
					/*친구목록 받아오기 완료*/
					if(friend_list_hash.size() == friend_list.length){
                        
                        setAutoComplete();
                        getActiveUser();
					}
				  }
			);
		}
        
        function setEachFriendList(name){
            $('<li style="cursor:pointer; font-size:8px; width:150px;"></li>')
                .append('<h1 style="width:150px; margin:2px;">'+ name+'</h1>')
                .appendTo('#fancy_friend_list').click(function(){
					//보태기 버튼 보이게 하기
	               $('#friend_add_img_btn').css('display','block');
				   $('#friend_detail_view').text('');
	               
	               var click = $(this).index('#fancy_friend_list li');
				   selectedFriendName = friend_list_array[click].name;
				   selectedFriendUid = friend_list_array[click].uid;
				   selectedFriendImg = friend_list_array[click].pic_small;
				   selectedFriendBirthday = friend_list_array[click].birthday;
	               
				   
	               $('<img style="margin-left: 30px; width:35px; height:35px; float:left;"/>')
	               .attr('src',friend_list_array[click].pic_small)
	               .appendTo('#friend_detail_view');
	
	               $('<h1 style="float:left; font-size:12px; width:150px; margin-left: 20px;" id="selected_friendlist_name" >'+friend_list_array[click].name+'</h1>')
	               .append('<h1 style="float:left; font-size:12px; width:150px; margin-left: 20px;">'+friend_list_array[click].birthday+'<h1>')
	               .appendTo('#friend_detail_view');
            });
            setFriendListPageControl();
        };
        
        function setFriendListPageControl(tableWidth){
		    $('.friendlist_scroll-pane-arrows').jScrollPane({
					showArrows: true,
					horizontalGutter: 0,
					trackClickRepeatFreq: 190,
					arrowRepeatFreq: 190
				}
			);
		};
        
        function setAutoComplete(){
            $("input#fancy_friendlist_nameinput").autocomplete({
                source: friend_name_array,
                close: function(event, ui){ 
                  
                },
                change: function(event, ui) {
                   
                },
                focus: function(event, ui) { 
                    
                },
                select: function(event, ui) { 
                    var namedata = ui.item.value;
                    $('#fancy_friend_list').text('');
                    $('<li style="cursor:pointer; font-size:8px; width:150px;" id="specific_friend_btn" ></li>')
                    .append('<h1 style="width:150px; margin:2px;">'+ namedata +'</h1>')
                    .appendTo('#fancy_friend_list');  
                    
                    setSelectListner();
					//setFriendListPageControl();
                }
            });
        };
       
		
		
        /*app 사용중인 내친구 가져오기*/
        var activeFriendList;
		function getActiveUser(){
            var data = "";
            for(var i=0; i < friend_list.length; i++){
                var uid = friend_list[i].uid;
                if(i == friend_list.length-1){
                    data += uid;
                }
                else{
                    data += uid +",";   
                }
            }; 
         
		    $.ajax({
				type : 'POST',
				url :'./ajax/member_show.jsp',
				data :"friend_uid=" + data ,
				dataType:'json',
				contentType: "application/x-www-form-urlencoded;charset=utf-8",
				success:function(json,textStatus){
                    console.log(json);
					$li = $('<li></li>');
                    $.each(json,function(i){
                    	$li = $li
                        .append('<a herf="./getrolling.roll?paper_id='+json[i].roll_id+'" >'+'<img src="'+ json[i].friend_image +'" />'+'</a>')
                        .append('<h2 style="margin-left: 10px;">'+json[i].friend_name+"</h2>")
                       	.append('<div class="clear_fix"></div>');
                    	if(json.length <= 3){
                    		if(i == json.length-1){
                    			$li.appendTo('#roate-left');
                    		}
                    	}
                    	if(i % 3 == 2){
                    		$li.appendTo('#roate-left');
                    		$li = $('<li></li>');
                    	}
                    	if(json.length > 3){
                        	$('#area-roatation .remocon').css('display','block');
                    	}
                    });
                    
                    $("#area-roatation #roate-left").rotate({
                        'duration' : '1000',
                        'interval' : 9999999,
                        'stopButton' : '#leftstopButton',
                        'playButton' : '#leftplayButton',
                        'prevButton' : '#leftprevButton',
                        'nextButton' : '#leftnextButton',
                        'movement'  : 'left',
                        'autoStart' : false,
                        'opacity' : false
                    });
                    
                    
				},
				error:function(xhr,textStatus,errorThrown){
					alret(errorThown ?  errorthrown : xhr.status);
				}
			});
        }
		/*
		 * 친구 이미지 클릭 listener
		 */
		function AddPofileImgListner(){
			$("#img_ul img").click(function(){
				var uid = $(this).attr("imgnum");
				$('#profile_detail h2').text(friend_list_hash.get(uid).name);
				$('#profile_detail h1').text(friend_list_hash.get(uid).birthday);
			});
		}
 
        
		/*
		 * FaceBook Dialog 
		 * 친구 App으로 초대하기
		 */
		function requestFriend(){
			FB.ui({method: 'apprequests',
				message: 'You should learn more about this awesome game.', 
				data: 'tracking information for the user'});
		}

		function feedDialog(){
              FB.ui(
              {
                method: 'feed',
                name: 'Facebook Dialogs',
                link: 'http://developers.facebook.com/docs/reference/dialogs/',
                picture: 'http://fbrell.com/f8.jpg',
                caption: 'Reference Documentation',
                description: 'Dialogs provide a simple, consistent interface for applications to interface with users.'
              },
              function(response) {
                if (response && response.post_id) {
                  console.log(response);
                  alert('Post was published.');
                } else {
                  alert('Post was not published.');
                }
              }
            );
        }	
			
		function openDialog(){
			$('#dialog').dialog('open');
			return false;
		}
		
		function FBapiTest(){
			console.log(friend_list_array);
			var photos_url = "https://graph.facebook.com/me/photos?access_token="+accessToken+"&callback=?";
			var params = { format :'json'};
			$.getJSON(photos_url,params, function(json){
				if(json.data){
					$.each(json.data,function(i,n){
						var item = json.data[i]; 
						return i < json.data.length;
					});
				}
			});
		}
		
		var myEvent;
        function getRollingEvent(){
            var data = "";
            for(var i=0; i < friend_list.length; i++){
                var uid = friend_list[i].uid;
                if(i == friend_list.length-1){
                    data += uid;
                }
                else{
                    data += uid +",";   
                }
            }; 
		    $.ajax({
				type : 'POST',
				url :'http://almater.kr/gift/rollingpaper_show.jsp',
				data :"friend_uid=" + data ,
				dataType:'json',
				contentType: "application/x-www-form-urlencoded;charset=utf-8",
				success:function(json,textStatus){
					myEvent = json;
                    console.log("진행중인 이벤트");
					console.log(json);
				},
				error:function(xhr,textStatus,errorThrown){
					alret(errorThown ?  errorthrown : xhr.status);
				}
			});
		}
		
		
		/*
	 	 FB.api(
			  {
			    method: 'fql.query',
			    query: 'SELECT name FROM user WHERE uid=me()'
			  },
			  function(response) {
			    alert('Name is ' + response[0].name);
			  }
		);*/
        
	});
	</script>
</head>

<body>
    <div class="page1" id="page1" >
        <%@ include file="page1.jsp" %>
    </div>
    <div class="page2" id="page2" style="display :none;">
        <%@ include file="page2.jsp" %>
    </div>
 
    
</body>

</html>