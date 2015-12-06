var xhr = null;

function searchPostcode(){
	new daum.Postcode(
			{
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기한다.
					var fullAddr = ''; // 최종 주소 변수
					var extraAddr = ''; // 조합형 주소 변수

					// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						fullAddr = data.roadAddress;

					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						fullAddr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일 때 조합한다.
					if (data.userSelectedType === 'R') {
						// 법정동명이 있을 경우 추가한다.
						if (data.bname !== '') {
							extraAddr += data.bname;
						}
						// 건물명이 있을 경우 추가한다.
						if (data.buildingName !== '') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
						fullAddr += (extraAddr !== '' ? ' (' + extraAddr
								+ ')' : '');
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById("postcode1").value = data.postcode1;
					document.getElementById("postcode2").value = data.postcode2;
					document.getElementById("addr").value = fullAddr;

					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("addrDetail").focus();
				}
			}).open();
}

 
function addDomain(){
	// 메일 주소 select
	var selectedVal = $("#email_select").val();
	if(selectedVal == '-직접입력-'){
		$("#email_address").attr("value","");
	} else {
		$("#email_address").attr("value",selectedVal);
	}
	
}

$(function(){
	if(window.ActiveXObject){ // IE
		xhr = new ActivexObject("Microsoft.XMLHTTP");
	} else { // Cross
		xhr = new XMLHttpRequest();
	}
	
	$("#inputProfileImg").change(
		function(){
		// 파일이 업로드 되었을 때 함수 호출
		// 확장자 . 기준으로 다음 요소를 선택해서 소문자로 변경한 후에 ext에 저장
		var ext = $(this).val().split('.').pop()
			.toLowerCase();
		// pop(): 배열만 취급
		// 마지막 index의 value를 pop()이 리턴
		// ex) $(this).val() => img.jpg
		// pop()하면 jpg가 리턴
		// toLowerCase(): String을 모두 소문자로 만든다.

		// 추출한 확장자가 배열에 존재하는지 체크
		if ($.inArray(ext, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1) {
		// 첫번째에 있는 인자값이 두번째에 있는 배열에 있는지 확인 후
		// 있으면 1, 없으면 -1을 리턴
		
		resetFormElement($(this)); // 폼 초기화
			window.alert('이미지 파일이 아닙니다. gif, png, jpg, jpeg만 업로드 가능합니다.');
		} else {
		var file = $(this).prop("files")[0];
		// prop에서 files라는 속성을 가져온 것
		// 자바스크립트의 uploadfile이 제공하는 것이 files
		// file 경로는 file:////경로 
		// 이 경로는 이미지 태그가 표현하지 못한다.
		blobURL = window.URL.createObjectURL(file);
		console.log("blobURL::::", blobURL);
		// 윈도우 자체에서 파일을 불러오는 경로값을 표현하려면
		// createObjectURL()을 사용
							

		$('#target_img').attr('src', blobURL).css(
				'width', '150').css('height', '150');
		// attr() src 속성에  blobURL 넣기
		}
		
	});
	
	// 아이디 중복 검사
	$("#idChkBtn").click(function(){
		// '중복 체크' 버튼을 클릭했을 때 함수 동작
		$.ajax({ 
			// 비동기식으로 통신하기 때문에
			// 같은 페이지 내에서 다른 작업을 함께 할 수 있다.
			// 페이지를 새로 로드하지 않고, 서버로부터 응답을 받는다.
			type : "POST",
			url : "idCheck", // 요청명
			data : { // 요청 시 보내는 파라미터
				mem_id : $("#userId").val() // 사용자가 입력한 아이디
			},
			success : function(result) {
				console.log(result);
				var text=""; text=result;
				if(text=="사용 가능한 아이디입니다."){ // 중복된 아이디가 없을 경우 메시지 출력
					$('#inputBox_idCheck').css('color','blue');
					$('#inputBox_idCheck').html(result);
				}
				else { // 중복된 아이디가 있을 경우 메시지 출력
					$('#inputBox_idCheck').css('color','red');
					$('#inputBox_idCheck').html(result);
				}
			}
		});
	});
	
	// 비밀번호 일치 여부 체크
	$("#userPwd2").change(function(){
		if($('#userPwd').val() != $('#userPwd2').val()){
			$('#userPwd').val("");
			$('#userPwd2').val("");
			$('#userPwd').focus();
			$('#inputBox_pwCheck').html('비밀번호가 일치하지 않습니다.');
			$('#inputBox_pwCheck').css('color','red');
		} else {
			$('#inputBox_pwCheck').html('비밀번호가 일치합니다.');
			$('#inputBox_pwCheck').css('color','blue');
			setTimeout(function(){
				$('#inputBox_pwCheck').html('');
			}, 2000);
		}
	});


	// 회원 가입 버튼 클릭 시
//	 $("#joinBtn").click(function(){
//		// 메일
//		 var mailAddr = $("#email_id").val()+"@"+$("#email_address").val();
//			$("#mem_mail").attr("value",mailAddr);
//			
//			// 주소
//			var memAddr = $("#postcode1").val()+"-"+$("#postcode2").val()+"/"+$("#addr").val()+"/"+$("#addrDetail").val();
//			$("#mem_addr").attr("value",memAddr);
//			
//			// 이미지 파일 업로드
//			var img = imgUpload();
//			alert("????????????"+img);
//			console.log("이미지 파일 업로드 완료");
//			
//			// 회원 가입 폼 제출
//			$("#joinForm").submit();
//	 });
//	 
	 
	 
	 
	 
});

function resetFormElement($obj) { // 자바스크립트
	$obj.val("");
}

function imgUpload(){
	var imgFile = document.getElementById("inputProfileImg");
	// 업로드 시작 -> xhr.download..
	xhr.upload.onloadstart = function (e) {
		// onloadstart: 감지
		// display: none인 것을 보이게 한다.
	};
	xhr.onreadystatechange = function(){
		// callback
		if(xhr.readyState == 4 && xhr.status == 200){
// 			alert("사진경로"+xhr.responseText.trim());
			$('#mem_img').attr("value",xhr.responseText.trim());
//			alert("사원정보가 업데이트 되었습니다.");

		}
	};
	
	xhr.open("POST","imgUpload",true); // 크로스 도메인으로 데이터를 보내는 것이 가능해졌다.
	xhr.setRequestHeader("X-File-Name", // 헤더로 파일의 이름이 간다.
			encodeURIComponent(imgFile.files[0].name));
	xhr.send(imgFile.files[0]); // post 방식이니까 send로 파라미터 전송
}

function joinMember(type){
	// 메일
	alert("잠 좀 자자");
	 var mailAddr = $("#email_id").val()+"@"+$("#email_address").val();
		$("#mem_mail").attr("value",mailAddr);
		
		// 주소
		var memAddr = $("#postcode1").val()+"-"+$("#postcode2").val()+"/"+$("#addr").val()+"/"+$("#addrDetail").val();
		$("#mem_addr").attr("value",memAddr);
		
		// 이미지 파일 업로드
		var img = imgUpload();
		console.log("이미지 파일 업로드 완료");
		
		if(type=='modify'){
			// 개인 정보 수정 시
			$("#joinForm").attr("action","modifyMemInfo");
		} else {
			// 회원 가입 시
			$("#joinForm").attr("action","joinMember");
		}
		
		// 회원 가입 폼 제출
		$("#joinForm").submit();
}
