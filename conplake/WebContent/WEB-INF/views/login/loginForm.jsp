<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div class="logoBox">	
	</div>
	<div class="card">
	  <div class="formBox">
	  <form action="login" method="post">
		  <div id="loginBox">
	          <input id="id" name="mem_id" type="text" autofocus spellcheck="false" value="" placeholder="아이디" name="Email">
	          <input id="passwd" name="mem_pwd" type="password" placeholder="비밀번호" name="Passwd">
	      </div>
	      <div id="loginButtonBox">
	      		<input id="signIn" type="submit" value="로그인" name="signIn">
	      </div>
	  </form>
	  </div>
	</div>
	<div id="memberButtonBox">
	   <input id="findPasswd" class="button" type="submit" value="비밀번호 찾기" name="findPasswd" onclick="mdOpen()"/>
	   <input id="joinFormBtn" class="button" type="button" value="회원가입" name="joinMember"/>
	</div>
	
	<div class="modalWindowWrap">
		<div class="modalWindow" id="modalWindow_pwd">	
			<div class="mdHeader">
				<p>FIND PASSWORD<input class="mdClose" type="button" value="X" onclick="mdClose()"/></p>
			</div>
			<div class="mdBody" id="mdBody_pwd">
				<form action="sendPwdMail" method="post">
					<p>ID <input type="text" class="inputStyle input_search" id="userId"></p>
					<p>MAIL 	
				            <select class="inputStyle input_category" id="email_select" autocomplete="off">
				            	<option selected>-직접입력-</option>
				                <option >naver.com</option>
				                <option>hanmail.net</option>
				                <option>nate.com</option>
				                <option>gmail.com</option>
				                <option>hotmail.com</option>
				            </select>
				            <input class="inputStyle input_search" id="email_address" type="text" maxlength="30"/>
				    		<span>@</span>
				    		<input class="inputStyle input_search" id="email_id" type="text" maxlength="30">
				    </p>
				    
				    <input class="" id="sendMailBtn" type="button" value="인증 메일 전송">
				    
				</form>		
			</div>
		</div>
	</div>

