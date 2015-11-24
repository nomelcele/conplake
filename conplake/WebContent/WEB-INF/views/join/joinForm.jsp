<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="logoBox">
	
</div>
<form id="joinForm" action="joinMember" method="post">
	<input type="hidden" id="mem_mail" name="mem_mail">
	<input type="hidden" id="mem_addr" name="mem_addr">
	<div class="card">
		<div class="formBox" id="formBoxLeft">
	    	<div class="profileBox">
	    		<div id="profile_img">
            		<img src="resources/img/profile_img_default.png" id="target_img"/>
            	</div>
	    		<div id="inputProfileImgBox">
           			<input id="inputProfileImg" id="mem_img" name="mem_img" type="file"/>
        		</div>
	    		<div id="profile_txt">
	    			<textarea id="inputProfileTxt" placeholder="자기소개를 입력해주세요." 
	    			name="mem_intro"></textarea>
	    		</div>
	    	</div>
	    </div>
	    
	    
	    
	  <div class="formBox" id="formBoxRight">
	  		<p class="inputLabel" id="inputLabel_name"><label>이름</label></p>	  	
	        <p class="inputBox"><input class="inputStyle" id="name" type="text" autofocus spellcheck="false" value="" placeholder="이름" name="mem_name"></p>
	  
	  		<p class="inputLabel"><label>아이디</label></p>	  	
	         <p class="inputBox" id="inputBox_id">
	         	<input class="inputStyle" id="userId" type="text" maxlength="30" autofocus spellcheck="false" value="" placeholder="아이디" name="mem_id">
	         	<input class="button" id="idChkBtn" type="button" value="중복체크" name="btn_post" onclick="">
	         	<strong id="inputBox_idCheck"></strong>
	         </p>
	          
	        <p class="inputLabel"><label>비밀번호</label></p>
	        <p class="inputBox" id="inputBox_pw">
	        	<span id="inputBox_pwBox">
	        		<input class="inputStyle" id="userPwd" type="password" placeholder="비밀번호" name="mem_pwd">
	        		</span>
	        	<span id="inputBox_pwCheckBox">
	        		<input class="inputStyle" id="userPwd2" type="password" placeholder="비밀번호 재입력" name="">
	        		<strong id="inputBox_pwCheck"></strong>	
	        	</span>
	        
	        </p>
	        
	        <p class="inputLabel"><label>이메일</label></p>
	        <p class="inputBox" id="inputBox_email">
	        	<input class="inputStyle" id="email_id" type="text" maxlength="30">
	            <span>@</span>
	            <input class="inputStyle" id="email_address" type="text" maxlength="30">
	            <select class="inputStyle input_category" id="email_select" autocomplete="off" onchange="addDomain()">
	            	<option selected>-직접입력-</option>
	                <option >naver.com</option>
	                <option>hanmail.net</option>
	                <option>nate.com</option>
	                <option>gmail.com</option>
	                <option>hotmail.com</option>
	            </select>
	        </p>
	        
	        <p class="inputLabel"><label>생년월일</label></p>
	        <p class="inputBox"><input class="inputStyle" id="birth" type="date" max="2015-12-31" name="mem_birth"></p>
	        
	        <p class="inputLabel"><label>성별</label></p>
	        <p class="inputBox" id="inputBox_gender">
	        <input id="gender" type="radio" value="male" name="mem_gender" checked><span id="span_gender">남자</span>
	      	<input id="gender" type="radio" value="female" name="mem_gender"><span id="span_gender">여자</span>
	        </p>
	        
	    <p class="inputLabel"><label>우편번호</label></p>	  	
        <p class="inputBox">
        	<input class="inputStyle input_postCode" type="number" autofocus spellcheck="false" value="" placeholder="" id="postcode1">
            <span>-</span>
            <input class="inputStyle input_postCode" type="number" autofocus spellcheck="false" value="" placeholder="" id="postcode2">
        	<input class="button btnStyle" id="btnPost" type="button" value="우편번호 찾기" name="btn_post" onclick="searchPostcode()">
        </p>
        
        <p class="inputLabel"><label>주소</label></p>	  	
        <p class="inputBox">
        	<input class="inputStyle input_address" type="text" autofocus spellcheck="false" value="" placeholder="주소" id="addr">
            <input class="inputStyle input_address" type="text" autofocus spellcheck="false" value="" placeholder="상세주소" id="addrDetail">
         </p>  
	  </div>
	</div>
	
	<div id="memberButtonBox">
		<input id="joinBtn" class="button" type="submit" value="확인" name="mem_submit">
	</div>
</form>