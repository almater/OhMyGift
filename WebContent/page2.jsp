<%@ page contentType="text/html; charset=euc-kr" pageEncoding="utf-8"%>
<link type="text/css" href="page2.css" rel="stylesheet" />

<script type="text/javascript">
	$(function() {
		var friend_uid ="";
		var my_uid = "";
		
        $(document).ready(function(){
                   
	        var date = new Date();
            var currentMonth = date.getMonth();
            var currentDate = date.getDate();
            var currentYear = date.getFullYear();

        	
       		$("#datepicker").datepicker({ 
               dateFormat: 'yy년 mm월 dd일',
               minDate: new Date(currentYear, currentMonth, currentDate),
               maxDate: new Date(currentYear, currentMonth+2, currentDate)
            });
        	
            
            $('#calendar_img').click(function(){
                $("#datepicker").datepicker( "show" );
            });
            
            $('#Submit_Btn').click(function(){
            	
            	var form = document.rollingpaper;
            	form.submit();
            });
           
            
        });
	});
	function setPage2(FriendName,FriendUid,FriendImg,FriendBirthday,myUid){
	    //친구 이미지 설정
	    friend_uid = FriendUid;
	    my_uid = myUid;
	    $('#myUid').attr('value',my_uid);
    	$('#friendUid').attr('value',friend_uid);
    	
	    $('#Friend_Img').attr('src',FriendImg);
	};
	function submit(){
		var form = document.rollingpaper;
		form.submit();
	}
</script>
<div class="ohMyGiftButton">
 	<a href="./ohmygift.jsp" title="Click here go home">
 	   <img src="images/page1/1_logo.png" alt="Go Home" />
 	</a>
</div>
<div class="center_container">
    <div class="header">
        <div class="title">
            <img src="images/page2/title.png" alt="Title" class="title_img" />
            <img src="images/page2/default_gift.png"  class="friend_img" id="Friend_Img" style="width:40px; height:40px; float:left; margin-top:15px; margin-left:30px;"/>
        </div>
    </div><!--header-->
    <form name="rollingpaper" method="get" action="makerolling.roll">
	    <input type="hidden" id="myUid" name=my_uid />
	    <input type="hidden" id="friendUid" name=friend_uid />
	    <div class="body_container">
	    	<div class="board_container" id="container" >
	            <div class="left_container">
	                <img src="images/page2/default_gift.png" />
	                <input type="text" name=gift_image>
	                <img src="images/page2/gift_img_btn.png" />
	            </div>
	            <div class="right_container">
	                <div class="right_top_container">
	                    <h1>선물 상품명</h1>
	                    <div class="clear_fix"></div>
	                    
	                    <input type="text" class="name_input" name=gift_name />
	                    <div class="clear_fix"></div>
	                    
	                    <h1>선물링크</h1>
	                    <div>
	                       <input type="text" class="website_input" name=gift_link />
	                       <img src="images/page2/remove.png" class="clear_btn">
	                    </div>
	                </div>
	                <div class="right_bottom_container">
	                    <div class="bottom_left_container">
	                        <h1>선물가격</h1>
	                        <div class="clear_fix"></div>
	                        <input type="text" class="price_input" name=gift_price />
	                        <img src="images/page2/botton_btn.png" />
	                    </div>
	                    <div class="bottom_right_container">
	                        <h1>기념일 정보</h1>
	                        <div class="clear_fix"></div>
	                        <input type="text" class="occasion_input" name=gift_type />
	                        <img src="images/page2/botton_btn.png" />
	                    </div>
	                </div>
	                
	            </div>
	        </div>
	    </div><!--body_container-->
	    <div class="footer">
			<div class="choose_gift">
	        	<div class="gift_pic"></div>
	   			<div class="gift_text"><img src="images/page2/pickup_text.png" /></div>
	            <div class="period_text"><h2>생일정보(</h2><h2 class="deadline_text">2011/12/31 까지</h2><h2>)</h2></div>
	            <div class="gift_price"><h2 class="present_text">아이패드2</h2><h2>(\\</h2><h2 class="price_text" id="price_text"></h2><h2>)</h2></div>
	            <div class="service_text"><h2>Service fee +10%</h2></div>
	            <div class="total_price"><h2>Total Cost : </h2><h2 class="totalprice_text"></h2></div>
	     	</div>
	        <div class="button">
	        	<div class="button">
	        		<img src="images/page2/btn.png" id="Submit_Btn" />
	        	</div>
	        </div>
	        <div class="choose_date">
	        	<div class="date_text"><img src="images/page2/date_text.png" alt="date_text" class="text_img2" /></div>
	            <div class="date_form"><input type="text" id="datepicker" class="datapicker"></div>
	            <div class="date_btn"><img src="images/page2/calendars.png" alt="date_btn" class="calendar_img" id="calendar_img"/></div>	
	        </div>  	
	    </div><!--footer-->
    </form>
</div> 
