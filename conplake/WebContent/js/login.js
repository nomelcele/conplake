$(function(){
	$("#joinFormBtn").click(function(){
		location="joinForm";		
	});
	
	
//	$("#findPasswd").click(function(){
//		var option = "width=800, height=600, scrollbars=yes";
//		window.open("findPwd","비밀번호 찾기",option);	
//	});
	
	$("#email_select").change(function(){
		// 메일 주소 select
		var selectedVal = $("#email_select").val();
		if(selectedVal == '-직접입력-'){
			$("#email_address").attr("value","");
		} else {
			$("#email_address").attr("value",selectedVal);
		}
		
	});
	
	$("#sendMailBtn").click(function(){
		// 메일
		 var mailAddr = $("#email_id").val()+"@"+$("#email_address").val();
			$("#mem_mail").attr("value",mailAddr);
		
		// 인증 메일 전송
		$.ajax({
			url: "sendPwdMail",
			type: "POST",
			data: {
				mem_mail: mailAddr,
				mem_id: $("#userId").val()
			},
			success: function(result){
				alert("인증 번호를 메일로 전송하였습니다.");
				$(".mdBody").html(result);
				//findPwd
			},
			error: function(thrownError){
				alert("Error");
			}
		});
	});
	
	$("#checkCodeBtn").click(function(){
		// 인증 번호 일치 여부 확인
		$.ajax({
			type: "POST",
			url: "checkCode",
			data: {
				userCode: $('#userCode').val()
			},
			success: function(result){
				alert("인증번호가 일치합니다. 비밀번호를 변경해 주세요.");
				$('.changePwForm').show('slow');
			},
			error:function(thrownError){
				alert("인증번호가 일치하지 않습니다. 다시 시도해 주세요.");
			}
		});
	});
	
	$("#newPwd2").change(function(){
		// 변경할 비밀번호 일치 여부 확인
		if($('#newPwd').val() != $('#newPwd2').val()){
			$('#newPwd').val("");
			$('#newPwd2').val("");
			$('#newPwd').focus();
			alert("비밀번호가 일치하지 않습니다.");
			$('#changePwdBtn').attr("disabled",true);
//			$('#inputBox_pwCheck').html('비밀번호가 일치하지 않습니다.');
		} else {
//			$('#inputBox_pwCheck').html('비밀번호가 일치합니다.');
//			setTimeout(function(){
//				$('#inputBox_pwCheck').html('');
//			}, 2000);
			$('#changePwdBtn').attr("disabled",false);
		}
	});
	
	$("#changePwdBtn").click(function(){
		// 비밀번호 변경
		alert("비밀번호 변경"+$("#changePwdUser").val());
		$.ajax({
			type: "POST",
			url: "changePwd",
			data: {
				mem_num: $("#changePwdUser").val(),
				mem_pwd: $('#newPwd2').val()
			},
			success: function(result){
				alert("비밀번호가 변경되었습니다.");
				// 모달 종료
//				$('#findPW').modal('toggle');
				$(".modalWindowWrap").css('display','none');
			}
		});
	});
});


function mdOpen(){
	$(".modalWindowWrap").css('display','block');
	
}

function mdClose(){
	$(".modalWindowWrap").css('display','none');
	
}