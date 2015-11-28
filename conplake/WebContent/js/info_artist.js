$( document ).ready(function() {
	
	/* input[type="file"] 파일명, 버튼 css 고치기 */
	var fileTarget = $('.input_fileImg');
	
	fileTarget.on('change', function(){  // 값이 변경되면
		if(window.FileReader){  // modern browser
		  var filename = $(this)[0].files[0].name;
		} 
		
		else {  // old IE
		  var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
		}
		
		// 추출한 파일명 삽입
		$(this).parent().siblings('.input_fileImgName').val(filename);
			
	});
	
	
	
	
});

