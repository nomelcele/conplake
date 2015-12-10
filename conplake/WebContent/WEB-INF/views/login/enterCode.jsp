<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="js/login.js"></script>


	<div class="tabbable" id="enterCode">
		<input type="hidden" id="changePwdUser" value="${memInfo.mem_num}">
		<div class="tab-content">
			<div class="form-group">
				<p>
					<label class="control-label">인증번호</label> 
					<button id="checkCodeBtn" type="button" class="">확인</button>
					<input type="text" id="userCode" class="inputStyle input_search" placeholder="인증 번호" >
				</p>
				<div id="succodeTarget"></div>
			</div>
			
			<div class="changePwForm" style="display:none">
			<hr>
				<p class="p_changePwd">
					<label class="control-label" >변경할 비밀번호</label> 
					<input type="password" id="newPwd" class="inputStyle input_changePwd">
				</p>
				
				<p class="p_changePwd">
					<label class="control-label">비밀번호 확인</label> 
					<input type="password" id="newPwd2" class="inputStyle input_changePwd">
				</p>
			</div>
			<div id="checkPwTarget"></div>
		</div>

		<div>
<!-- 						<button type="button" data-dismiss="modal">닫기</button> -->
			<p>
				<button type="button" class="rButton" id="changePwdBtn" disabled="disabled">변경</button>
			</p>
		</div>
	</div>
