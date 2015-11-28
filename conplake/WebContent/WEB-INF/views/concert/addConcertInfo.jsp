<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>ADD CONCERT INFORMATION</h1>
<form >     
<div class="formBox" id="formBoxLeft3">
	<p class="rinputBox">
	    <label class="inputLabel">공연 명</label>
	    <input class="rInputStyle c_width" id="" type="text" maxlength="30" autofocus spellcheck="false" placeholder="">
	</p>
	
	<p class="rinputBox" id="p_artistImg">
	    <label class="inputLabel" id="">공연 포스터</label>
	    
	    <label class="inputLabel rInputStyle c_width" id="input_artistImgBtn">Browse..
	        <input type="file" class="input_fileImg" id="input_artistImg" class="rInputStyle"/>
	    </label>
	    
	    <input type="text" class="rInputStyle c_width input_fileImgName" id="input_concertImgName" readonly/> 
	</p>
	  
	
	<p class="rinputBox">
	    <label class="inputLabel">공연일</label>
	    <input type="date" class="rInputStyle cDate_width" id="cDateE" min="2000-01-01"/>
	    <span id="dateBtw">~</span>
	    <input type="date" class="rInputStyle cDate_width" id="cDateS" max="2015-12-31"/>
	    
	</p>
	
	
	<p class="rinputBox">
	    <label class="inputLabel">공연 장소</label>
	    <input class="rInputStyle c_width" id="" type="text" maxlength="30" autofocus spellcheck="false" placeholder="">
	</p>
	
	<p class="rinputBox">
	    <label class="inputLabel">출연</label>
	    <input class="rInputStyle c_width" id="" type="text" maxlength="30" autofocus spellcheck="false" placeholder="">
	</p>
	
	<p class="rinputBox">
	    <label class="inputLabel">예매사이트</label>
	    <input class="rInputStyle c_width" id="" type="text" maxlength="30" autofocus spellcheck="false" placeholder="">
	</p>
	
	<p class="rinputBox">
	    <label class="inputLabel">관람료</label>
	    <input class="rInputStyle c_width" id="" type="text" maxlength="30" autofocus spellcheck="false" placeholder="">
	</p>
	
	<p class="rinputBox">
	    <label class="inputLabel">문의처</label>
	    <input class="rInputStyle c_width" id="" type="text" maxlength="30" autofocus spellcheck="false" placeholder="">
	</p>
</div>
  
  
<div class="formBox" id="formBoxRight3">
	<p class="rinputBox" id="p_artistImg">
	    <label class="inputLabel" id="">소개 이미지</label>
	    
	    <label class="inputLabel rInputStyle c_width" id="input_artistImgBtn">Browse..
	        <input type="file" class="input_fileImg" id="input_artistImg" class="rInputStyle"/>
	    </label>
	    
	    <input type="text" class="rInputStyle c_width input_fileImgName" id="input_concertImgName" readonly/> 
	</p>
	
	<p class="p_write p_writeA">소개 글</p>
	<div id="txt_artistProfile">
	    <textarea class="reviewContent" id="input_concertProfile"></textarea>
	</div>
        
</div>
</form>

<p id="memberButtonBox">
    <input id="writeReviewBtn" onclick="writeReview()" class="rButton" type="button" value="확인" name="mem_submit">
</p>