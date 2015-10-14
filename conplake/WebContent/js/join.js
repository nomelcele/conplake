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
						//법정동명이 있을 경우 추가한다.
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

function joinMember(){
	// 메일
	var mailAddr = $("#email_id").val()+"@"+$("#email_address").val();
	$("#mem_mail").attr("value",mailAddr);
	
	// 주소
	var memAddr = $("#postcode1").val()+"-"+$("#postcode2").val()+"/"+$("#addr").val()+"/"+$("#addrDetail").val();
	$("#mem_addr").attr("value",memAddr);
	
	// 회원 가입 폼 제출
	$("#joinForm").submit();
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

function uploadImg(){
	// 변화가 있을 때 function을 호출한다.
	// 확장자 . 기준으로 다음 요소를 선택해서 소문자로 변경한 후에 ext에 저장한다.
	var ext = $("#inputProfileImg").val().split('.').pop()
		.toLowerCase();
	// pop(): 배열만 취급. 
	// 마지막 index의 value를 pop()이 리턴
	// ex) $(this).val() => img.jpg
	// pop()하면 jpg가 리턴됨!
	// toLowerCase(): String을 모두 소문자로 만들어준다.

	// 추출한 확장자가 배열에 존재하는지 체크
	if ($.inArray(ext, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1) {
	// 첫번째에 있는 인자값이 두번째에 있는 배열에 있는지 확인 후, 
	// 있으면 1, 없으면 -1을 리턴
	// inArray는 jQuery에서 제공하는 메서드
	resetFormElement($("#inputProfileImg")); // 폼 초기화
		window.alert('이미지 파일이 아닙니다. gif, png, jpg, jpeg만 업로드 가능합니다.');
	} else {
	var file = $("#inputProfileImg").prop("files")[0];
	// prop에서 files라는 속성을 가져온 것
	// 자바스크립트의 uploadfile이 제공하는 것이 files
	// file 경로는 file:////경로 
	// 이 경로는 이미지 태그가 표현하지 못한다.
	blobURL = window.URL.createObjectURL(file);
	console.log("blobURL::::", blobURL);
	// 윈도우 자체에서 파일을 불러오는 경로값을 표현하려면
	// createObjectURL()을 사용해야 한다.
						

	$('#profile_img').attr('background', blobURL);
	// attr() src 속성에  blobURL을 넣는다.
	
	}
}