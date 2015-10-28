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
	   <input id="findPasswd" class="button" type="submit" value="비밀번호 찾기" name="findPasswd">
	   <input id="joinFormBtn" class="button" type="button" value="회원가입" name="joinMember">
	</div>

