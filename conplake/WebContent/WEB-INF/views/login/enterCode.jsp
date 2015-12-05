<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="js/login.js"></script>
	<div class="tabbable" id="enterCode">
		<input type="hidden" id="changePwdUser" value="${memInfo.mem_num}">
					<div class="tab-content">

						<div class="form-group">
							<label class="control-label">인증번호</label> 
							<input type="text" id="userCode" class="form-control" style="width: 170px; display:inline" placeholder="인증 번호" >
							<button id="checkCodeBtn" type="button" class="btn btn-default">확인</button>
							<div id="succodeTarget"></div>
						</div>
						<div class="changePwForm" style="display:none">
						<hr>
							<label class="control-label" >변경할 비밀번호</label> 
								<input type="password" id="newPwd" class="form-control" style="width: 170px">
								<br/>
							<label class="control-label">비밀번호 확인</label> 
								<input type="password" id="newPwd2" class="form-control" style="width: 170px">
						</div>
						<div id="checkPwTarget"></div>
					</div>

					<div>
<!-- 						<button type="button" data-dismiss="modal">닫기</button> -->
						<button type="button" id="changePwdBtn" disabled="disabled">변경</button>
					</div>
				</div>
