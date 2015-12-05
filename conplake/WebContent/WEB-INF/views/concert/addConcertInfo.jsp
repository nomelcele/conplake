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
	    <label class="inputLabel">관람료</label>
	    <input class="rInputStyle c_width" id="" name="con_price" type="text" maxlength="30" autofocus spellcheck="false" placeholder="">
	</p>
	
	
	
	
</div>
  
  
<div class="formBox" id="formBoxRight3">
	
	<p class="rinputBox">
	    <label class="inputLabel">공연 장소</label>
	    <span class="btn_searchReview" id="span_addSearch" ><a class="addSearch" id="addSearchButton_place" href="" onclick="mdOpen_searchPlace(); return false;"></a></span>
	    <input class="rInputStyle c_width inner" id="addConInfo" name="con_venue" type="text" maxlength="30" autofocus spellcheck="false" placeholder="">
	    
	</p>
	
	<p class="rinputBox">
	    <label class="inputLabel">출연</label>
	    <span class="btn_searchReview" id="span_addSearch" ><a class="addSearch" id="addSearchButton_artist" href="" onclick="mdOpen_searchArtist(); return false;"></a></span>
	    <input class="rInputStyle c_width" id="addConInfo" name="con_artist" type="text" maxlength="30" autofocus spellcheck="false" placeholder="">
	</p>
	
	<p class="rinputBox">
	    <label class="inputLabel">예매사이트</label>
	    <input class="rInputStyle c_width" id="" name="con_link" type="text" maxlength="30" autofocus spellcheck="false" placeholder="">
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


<div class="modalWindowWrap" id="modalWindowWrap_searchPlace">
	<div class="modalWindow" id="modalWindow_searchPlace">	
		<div class="mdHeader">
			<p>SEARCH CONCERTHALL<input class="mdClose" type="button" value="X" onclick="mdClose()"/></p>
		</div>
		
		<div class="mdBody">
			<div class="mdBody_searchWrap">
				<p>공연장소 
					<span class="btn_searchReview" id="span_addSearch" ><a class="addSearch" id="btn_searchPlace" href="" onclick=" return false;"></a></span>
					<input class="rInputStyle s_width" id="" type="text" maxlength="30" autofocus spellcheck="false" placeholder="검색어를 입력하세요.">
				</p>
			</div>
			<div class="mdBody_searchResult">
				<ul id="ul_searchResult">
					<li>
						<p>
							<span>올림픽공원 체조경기장</span>
							<input class="innerButton button" id="mdSearchSelect" type="button" value="선택" onclick=""/>
						</p>
					</li>
					
					<li>
						<p>
							<span>올림픽공원 체조경기장</span>
							<input class="innerButton button" id="mdSearchSelect" type="button" value="선택" onclick=""/>
						</p>
					</li>
					
					<li>
						<p>
							<span>올림픽공원 체조경기장</span>
							<input class="innerButton button" id="mdSearchSelect" type="button" value="선택" onclick=""/>
						</p>
					</li>
				</ul>
			</div>
			
		</div>

	</div>
</div>

<div class="modalWindowWrap" id="modalWindowWrap_searchArtist">
	<div class="modalWindow" id="modalWindow_searchArtist">	
		<div class="mdHeader">
			<p>SEARCH ARTIST<input class="mdClose" type="button" value="X" onclick="mdClose()"/></p>
		</div>
		
		<div class="mdBody">
			<div class="mdBody_searchWrap">
				<p>아티스트 
					<span class="btn_searchReview" id="span_addSearch" ><a class="addSearch" id="btn_searchArtist" href="" onclick=" return false;"></a></span>
					<input class="rInputStyle s_width" id="" type="text" maxlength="30" autofocus spellcheck="false" placeholder="검색어를 입력하세요.">
				</p>
			</div>
			<div class="mdBody_searchResult">
				<ul id="ul_searchResult">
					<li>
						<p>
							<span>올림픽공원 체조경기장</span>
							<input class="innerButton button" id="mdSearchSelect" type="button" value="선택" onclick=""/>
						</p>
					</li>
					
					<li>
						<p>
							<span>올림픽공원 체조경기장</span>
							<input class="innerButton button" id="mdSearchSelect" type="button" value="선택" onclick=""/>
						</p>
					</li>
					
					<li>
						<p>
							<span>올림픽공원 체조경기장</span>
							<input class="innerButton button" id="mdSearchSelect" type="button" value="선택" onclick=""/>
						</p>
					</li>
				</ul>
			</div>
				
		</div>

	</div>
</div>