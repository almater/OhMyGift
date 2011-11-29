<%@ page contentType="text/html; charset=euc-kr" pageEncoding="utf-8"%>
<link type="text/css" href="page1.css" rel="stylesheet" />

		
<script type="text/javascript">
    $(document).ready(function(){
        /*
         * 2011.10.19일 
         * help버튼 잠시 삭제..
        $("a#Help_fancyBoxLink").fancybox({
                'titleShow'  : false,
                'transitionIn'  : 'fade',
                'speedIn' : 300,
                'transitionOut' : 'none',
                'width' : '420px;',
                'height' : '310px',
                'padding': 0,
                'onClosed'		: function() {
            	    $("#fancybox-outer").css('background','white');
            	},
                'onStart'		: function() {
            	    $("#fancybox-outer").css('background','transparent');
                    $.fancybox.showActivity();
            	}
                
        });*/
        
        
        var firstClick = true;
        $("a#ForFriend_Btn").click(function(){
            if(firstClick){
                //$.fancybox.showActivity();
                $('#fancybox-loading').css('top','35%'); 
                firstClick = false;    
            }
               
        });
     
    });
    
</script>
     
        


<div class="header_container">
    <!-- Top GoHome Button -->
    <div class="ohMyGiftButton">
     	<a href="./ohmygift.jsp" title="Click here go home">
     	   <img src="images/page1/1_logo.png" alt="Go Home" />
     	</a>
    </div>   
    <div class="myFriendList" id="friendList">
    	<div id="area-roatation">
	    	<ul id="roate-left">
	    	
	    	</ul>
	    	<p class="remocon" style="display:none">
	            <span id="leftprevButton"><img src="http://coding.kr/service/rotate/images/btn_back.png"/></span>
	            <span id="leftnextButton"><img src="http://coding.kr/service/rotate/images/btn_next.png"/></span>
        	</p>
	    </div>	
    </div>
    <div class="myPageButton">
    	<a href="mypage.mem">
    		<img src="images/page1/mypage_icon.png" alt="My Page"/>
    	</a>
    </div>
    
</div>



<!--------------------------------------------------------------------->
<!--Other middle Content -->
<div class="middle_container">
    <div class="middleContent">
        <p class="middleText">
            <img src="images/page1/1_title.png" alt="Logo" />
            <br />
            <br />
             	사랑하는 사람에게 선물로 마음을 전하세요
            <br />
                 	여러 마음이 모여 하나가 되는 선물
        	<br />
        	<br />
            
        </p>   
    	<div class="btn_container">
   	        <a class="me_gift_btn" id="Forme_Btn">
  			    <img src="images/page1/1_btn1.png" alt="Show Friends" class="button1"  />   
       		</a>
       	    
       		<a href="#friendList_fancybox" id="ForFriend_Btn" class="friend_list_btn">
      			<img src="images/page1/1_btn2.png" alt="Show Friends" class="button2" />   
       		</a> 
        </div>
        <div style="display:none">
            <div id="friendList_fancybox" class="friend_fancybox" style="width:442px; height:320px; background: url('images/page1/board_all.png');"> 
               <input type=text style="margin-top:46px; margin-left: 25px; width:230px; height:14px; border:0px;" id="fancy_friendlist_nameinput">
               <div class="container" style="width:250px;">
	               <div class="friendlist_scroll-pane-arrows" style="margin-top: 22px; margin-left: 30px;width:228px; height:130px;">
	               		<ul id="fancy_friend_list" style="margin-left: 0px; list-style: none;width: inherit;">
	                  		
	               		</ul>
					
	               </div>
               </div>
               <div id="friend_detail_view" style="margin-top:25px; width 240px; height: 50px; float: left;">
                   <h1 style="width:240px; text-indent:9999; margin-left:20px;"></h1>
               </div>
			   <div id="friend_add_btn" style="margin-top:38px; margin-left:50px; width 100px; height: 40px; float: left;">
                   <img src="images/page1/addfriend.png" id="friend_add_img_btn" style="display:none;"/>
               </div>
            </div>
        </div>
        
        <br>
        <!-- 2011.10.19 help버튼 제거 -->
        <!--
        <a href="#help_fancybox" id="Help_fancyBoxLink">Help</a>
        <div style="display:none">
            <div id="help_fancybox" class="help_fancybox" style="">
                <img src="images/page1/help.png" />    
            </div>
        </div>
        -->
        
        
    <!--
        <div class="middleButton" id="middleButton"> 
            <button>나에게</button>
            <button>친구에게</button>
        </div>
     -->  
    </div>
</div>
<div class="footer_container">
     <div class="giftBox">
		<img src="images/page1/howtouse.png" />
	</div>
</div>

