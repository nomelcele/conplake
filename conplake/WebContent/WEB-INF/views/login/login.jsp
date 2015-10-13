<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div class="logoBox">	
	</div>
	<div class="card">
	  <div class="formBox">
		  <div id="loginBox">
	          <input id="id" type="email" autofocus spellcheck="false" value="" placeholder="아이디" name="Email">
	          <input id="passwd" type="password" placeholder="비밀번호" name="Passwd">
	      </div>
	      <div id="loginButtonBox">
	      		<input id="signIn" type="submit" value="로그인" name="signIn" onclick="window.location='index.html'">
	      </div>
	  </div>
	</div>
	<div id="memberButtonBox">
	   <input id="findPasswd" class="button" type="submit" value="비밀번호 찾기" name="findPasswd">
	   <input id="joinMember" class="button" type="submit" value="회원가입" name="joinMember">
	</div>

