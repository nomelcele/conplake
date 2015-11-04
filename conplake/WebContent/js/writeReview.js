$( document ).ready(function() {
	 $("#formBoxRight").height($("#formBoxLeft").height()) ;
});

function ImageButton1_OnClientClick(objImageButton)
        {
            var TextArea1 = document.getElementById('TextArea1');
            

            var Image1 = new Image();
            Image1.src = objImageButton.src;
            

            TextArea1.appendChild(Image1);
            return false;
        }
        
        $(function(){
        	console.log("gngngngngng");
        	$("#imgFile").change(
        			function(){
	        		// 변화가 있을 때 function을 호출한다.
	        		// 확장자 . 기준으로 다음 요소를 선택해서 소문자로 변경한 후에 ext에 저장한다.
	        		var ext = $(this).val().split('.').pop()
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
	        		// createObjectURL()을 사용해야 한다.
	        			
	        		
	        		var place = document.getElementById('inputReviewContent');
	        		var newImage= document.createElement("img");
	        		
	        		
	        		
	        		
	        		place.appendChild(newImage);
	        		
	        		$(newImage).attr('src', blobURL).css(
	        				'height', '100');
	        		// attr() src 속성에  blobURL을 넣는다.
        			}
        	});
        });