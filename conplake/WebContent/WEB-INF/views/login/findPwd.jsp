<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="js/login.js"></script>
</head>
<body>
	<div id="findPwd">
	<div class="card">
	<form action="sendPwdMail" method="post">
		<h2>비밀번호 찾기</h2>
		ID: <input type="text" id="userId"><br/>
		MAIL: 	<input class="inputStyle" id="email_id" type="text" maxlength="30">
	            <span>@</span>
	            <input class="inputStyle" id="email_address" type="text" maxlength="30">
	            <select class="inputStyle input_category" id="email_select" autocomplete="off">
	            	<option selected>-직접입력-</option>
	                <option >naver.com</option>
	                <option>hanmail.net</option>
	                <option>nate.com</option>
	                <option>gmail.com</option>
	                <option>hotmail.com</option>
	            </select>
	    <input id="sendMailBtn" type="button" value="인증 메일 전송">
	</form>
	</div>
	</div>
	
</body>
</html>