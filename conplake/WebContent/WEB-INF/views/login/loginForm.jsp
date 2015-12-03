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
	   <input id="findPasswd" class="button" type="submit" value="비밀번호 찾기" name="findPasswd" onclick="mdOpen()>"/>
	   <input id="joinFormBtn" class="button" type="button" value="회원가입" name="joinMember">
	</div>
	
	<div class="modalWindowWrap"/>
		<div class="modalWindow">	
			<div class="mdHeader">
				<p>REPLY<input class="mdClose" type="button" value="X" onclick="mdClose()"/></p>
			</div>
			<div class="mdBody">
				
			</div>
			<div class="mdFooter">
				<input class="inputStyle" id="mdInputText" type="text" placeholder="댓글 내용을 입력하세요."/>
				<input class="innerButton button" id="mdInputBtn" type="button" value="입력" onclick="writeTimelineComm(${sessionScope.mvo.mem_num},${timelineNumber})"/>
			</div>
		</div>
	</div>

