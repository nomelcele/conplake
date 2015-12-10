<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>ADD ARTIST INFORMATION</h1>
<form action="addArtist" method="post" enctype="multipart/form-data">     
	<div class="formBox" id="formBoxLeft2">
		<p class="rinputBox">
		    <label class="inputLabel">아티스트 명</label>
		    <input class="rInputStyle a_width" name="art_name" type="text" maxlength="30" autofocus spellcheck="false" >
		</p>
		
		<p class="rinputBox" id="p_artistImg">
		    <label class="inputLabel">대표 사진</label>
		    
		    <label class="inputLabel rInputStyle input_fileImgBtn">Browse..
		        <input type="file" name="art_file" class="rInputStyle input_fileImg">
		    </label>
		    
		    <input type="text" class="rInputStyle a_width input_fileImgName" id="input_artistImgName" readonly> 
		</p>
		  
		
		<p class="rinputBox">
		    <label class="inputLabel">국가</label>
		    <input type="text" class="rInputStyle a_width" name="art_country" placeholder="예) 대한민국">
		</p>
		
		
		<p class="rinputBox">
		    <label class="inputLabel">활동유형</label>
		    <select class="rInputStyle select_artist a_width" name="art_type">
		        <option value="여성/솔로">여성/솔로</option>
		        <option value="여성/그룹">여성/그룹</option>
		        <option value="남성/솔로">남성/솔로</option>
		        <option value="남성/그룹">남성/그룹</option>
		        <option value="혼성/그룹">혼성/그룹</option>
		    </select>
		</p>
		
		
		<p class="rinputBox">
		    <label class="inputLabel">장르</label>
		    <select class="rInputStyle select_artist a_width" name="art_genre">
		     	<option value="발라드">발라드</option>
		        <option value="댄스">댄스</option>
		        <option value="R&amp;B/소울">R&amp;B/소울</option>
		        <option value="락">락</option>
		        <option value="랩/힙합">랩/힙합</option>
		        <option value="일렉트로니카">일렉트로니카</option>
		        <option value="인디">인디</option>
		        <option value="블루스/포크/컨트리">블루스/포크/컨트리</option>
		        <option value="트로트">트로트</option>
		        <option value="팝">팝</option>
		        <option value="재즈">재즈</option>
		        <option value="라틴">라틴</option>
		        <option value="클래식">클래식</option>
		        <option value="뉴에이지">뉴에이지</option>
		        <option value="크로스오버">크로스오버</option>
		    </select>
		</p>
		
		<p class="rinputBox">
		        <label class="inputLabel">SNS</label>
		        <input type="text" class="rInputStyle a_width" name="art_sns" placeholder="예) http://twitter.com">
		</p>
		    
		
		<p class="rinputBox">
		        <label class="inputLabel">공식사이트</label>
		        <input type="text" class="rInputStyle a_width" name="art_official" placeholder="예) http://official.com">
		</p>
	</div>
  
  
	<div class="formBox" id="formBoxRight2">
		<p class="p_write p_writeA">아티스트 소개</p>
		<div id="txt_artistProfile">
		    <textarea class="reviewContent" id="input_artistProfile" name="art_intro"></textarea>
		</div>
	</div>
	<p id="memberButtonBox">
		<input id="writeReviewBtn" class="rButton" type="submit" value="확인" name="mem_submit">
	</p>
</form>

