<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>ADD CONCERT INFORMATION</h1>
<form action="addConcert" method="post">     
<div class="formBox" id="formBoxLeft3">
	<p class="rinputBox">
	    <label class="inputLabel">공연 명</label>
	    <input class="rInputStyle c_width" name="con_name" type="text" maxlength="30" autofocus spellcheck="false" placeholder="">
	</p>
	
	<p class="rinputBox" id="p_artistImg">
	    <label class="inputLabel" id="">공연 포스터</label>
	    
	    <label class="inputLabel rInputStyle input_fileImgBtn" id="">Browse..
	        <input type="file" class="input_fileImg" id="" name="con_poster" class="rInputStyle"/>
	    </label>
	    
	    <input type="text" class="rInputStyle input_fileImgName" id="input_concertImgName" readonly/> 
	</p>
	  
	<p class="rinputBox" id="p_artistImg">
	    <label class="inputLabel" id="">소개 이미지</label>
	    
	    <label class="inputLabel rInputStyle input_fileImgBtn" id="">Browse..
	        <input type="file" class="input_fileImg" id="" name="con_detailimg" class="rInputStyle"/>
	    </label>
	    
	    <input type="text" class="rInputStyle input_fileImgName" id="input_concertImgName" readonly/> 
	</p>  
	
	<p class="rinputBox">
	    <label class="inputLabel">공연일</label>
	    <input type="date" class="rInputStyle cDate_width" id="cDateE" name="con_startdate" min="2000-01-01"/>
	    <span id="dateBtw">~</span>
	    <input type="date" class="rInputStyle cDate_width" id="cDateS" name="con_enddate" max="2015-12-31"/>
	    
	</p>
	
	
	<p class="rinputBox">
	    <label class="inputLabel">공연 장소</label>
	    <input class="rInputStyle c_width inner" id="" name="con_venue" type="text" maxlength="30" autofocus spellcheck="false" placeholder="">
	</p>
	
	
	
	
</div>
  
  
<div class="formBox" id="formBoxRight3">
	
	
	<p class="rinputBox">
	    <label class="inputLabel">출연</label>
	    <input class="rInputStyle c_width" id="" name="con_artist" type="text" maxlength="30" autofocus spellcheck="false" placeholder="">
	</p>
	
	<p class="rinputBox">
	    <label class="inputLabel">예매사이트</label>
	    <input class="rInputStyle c_width" id="" name="con_link" type="text" maxlength="30" autofocus spellcheck="false" placeholder="">
	</p>
	
	<p class="rinputBox">
	    <label class="inputLabel">관람료</label>
	    <input class="rInputStyle c_width" id="" name="con_price" type="text" maxlength="30" autofocus spellcheck="false" placeholder="">
	</p>
	
	<p class="rinputBox">
	    <label class="inputLabel">문의처</label>
	    <input class="rInputStyle c_width" id="" name="con_tel" type="text" maxlength="30" autofocus spellcheck="false" placeholder="">
	</p>
        
</div>
</form>

<p id="memberButtonBox">
    <input id="writeReviewBtn" onclick="writeReview()" class="rButton" type="button" value="확인" name="mem_submit">
</p>