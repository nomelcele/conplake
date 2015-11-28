<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>ADD ARTIST INFORMATION</h1>
<form >     
	<div class="formBox" id="formBoxLeft2">
		<p class="rinputBox">
		    <label class="inputLabel">아티스트 명</label>
		    <input class="rInputStyle a_width" id="" type="text" maxlength="30" autofocus spellcheck="false" placeholder="">
		</p>
		
		<p class="rinputBox" id="p_artistImg">
		    <label class="inputLabel" id="">대표 사진</label>
		    
		    <label class="inputLabel rInputStyle a_width" id="input_artistImgBtn">Browse..
		        <input type="file" id="input_artistImg" class="rInputStyle input_fileImg"/>
		    </label>
		    
		    <input type="text" class="rInputStyle a_width input_fileImgName" id="input_artistImgName" readonly/> 
		</p>
		  
		
		<p class="rinputBox">
		    <label class="inputLabel">국가</label>
		    <input type="text" class="rInputStyle a_width" id="" placeholder="예) 대한민국"/>
		</p>
		
		
		<p class="rinputBox">
		    <label class="inputLabel">활동유형</label>
		    <select class="rInputStyle select_artist a_width">
		        <option value="artist_fs">여성/솔로</option>
		        <option value="artist_fd">여성/듀엣</option>
		        <option value="artist_fg">여성/그룹</option>
		        <option value="artist_ms">남성/솔로</option>
		        <option value="artist_md">남성/듀엣</option>
		        <option value="artist_mg">남성/그룹</option>
		        <option value="artist_fms">혼성/솔로</option>
		        <option value="artist_fmd">혼성/듀엣</option>
		        <option value="artist_fmg">혼성/그룹</option>
		    </select>
		</p>
		
		
		<p class="rinputBox">
		    <label class="inputLabel">장르</label>
		    <select class="rInputStyle select_artist a_width">
		      <option value="genre_b">발라드</option>
		        <option value="genre_d">댄스</option>
		        <option value="genre_h">랩/힙합</option>
		        <option value="genre_r">R&B/Soul</option>
		        <option value="genre_e">일렉트로니카</option>
		        <option value="genre_t">트로트</option>
		        <option value="genre_f">포크</option>
		        <option value="genre_i">인디음악</option>
		    </select>
		</p>
		
		<p class="rinputBox">
		        <label class="inputLabel">SNS</label>
		        <input type="text" class="rInputStyle a_width" id="" placeholder="예) http://twitter.com/"/>
		</p>
		    
		
		<p class="rinputBox">
		        <label class="inputLabel">공식사이트</label>
		        <input type="text" class="rInputStyle a_width" id="" placeholder="예) http://official.com/"/>
		</p>
	</div>
  
  
	<div class="formBox" id="formBoxRight2">
		<p class="p_write p_writeA">아티스트 소개</p>
		<div id="txt_artistProfile">
		    <textarea class="reviewContent" id="input_artistProfile"></textarea>
		</div>
	</div>
</form>

<p id="memberButtonBox">
	<input id="writeReviewBtn" onclick="writeReview()" class="rButton" type="button" value="확인" name="mem_submit">
</p>