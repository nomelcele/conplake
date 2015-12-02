var imgNum = 0;
var imgArr = new Array(1); // 업로드할 파일 이름을 저장하는 배열




//$( document ).ready(function() {
//	 $("#formBoxRight").height($("#formBoxLeft").height()) ;
//});


        $(function(){
        	
        	
        	
        	
        	$("#formBoxLeft").height($("#formBoxRight").height()) ;
//        	$("#imgFile").change(
//        			function(){
//	        		// 변화가 있을 때 function을 호출한다.
//	        		// 확장자 . 기준으로 다음 요소를 선택해서 소문자로 변경한 후에 ext에 저장한다.
//	        		var ext = $(this).val().split('.').pop()
//	        			.toLowerCase();
//	        		// pop(): 배열만 취급. 
//	        		// 마지막 index의 value를 pop()이 리턴
//	        		// ex) $(this).val() => img.jpg
//	        		// pop()하면 jpg가 리턴됨!
//	        		// toLowerCase(): String을 모두 소문자로 만들어준다.
//	
//	        		// 추출한 확장자가 배열에 존재하는지 체크
//	        		if ($.inArray(ext, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1) {
//	        		// 첫번째에 있는 인자값이 두번째에 있는 배열에 있는지 확인 후, 
//	        		// 있으면 1, 없으면 -1을 리턴
//	        		// inArray는 jQuery에서 제공하는 메서드
//	        		resetFormElement($(this)); // 폼 초기화
//	        			window.alert('이미지 파일이 아닙니다. gif, png, jpg, jpeg만 업로드 가능합니다.');
//	        		} else {
//	        		var file = $(this).prop("files")[0];
//	        		// prop에서 files라는 속성을 가져온 것
//	        		// 자바스크립트의 uploadfile이 제공하는 것이 files
//	        		// file 경로는 file:////경로 
//	        		// 이 경로는 이미지 태그가 표현하지 못한다.
//	        		blobURL = window.URL.createObjectURL(file);
//	        		console.log("blobURL::::", blobURL);
//	        		// 윈도우 자체에서 파일을 불러오는 경로값을 표현하려면
//	        		// createObjectURL()을 사용해야 한다.
//	        			
//	        		
//	        		//위에저거랑 비슷한거같은데 이러케써도되나 - 유라
//	        		var place = document.getElementById('reviewContent');
//	        		var newImage= document.createElement("img");
//	        		
//	        		
//	        		place.appendChild(newImage);
//	        		
//	        		$(newImage).attr('src', blobURL).css(
//	        				'height', '100');
//	        		// attr() src 속성에  blobURL을 넣는다.
//        			}
//        	});
        	
        	
        	
        	$("#reviewFile0").change(
        			function(){
//        			window.alert("사진~~~~~~");
        			console.log($(this));
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
	        			
	        		
	        		//위에저거랑 비슷한거같은데 이러케써도되나 - 유라
//	        		var place = document.getElementById('reviewContent');	
//	        		var newImage= document.createElement("img");
	        		
	        		var reviewArea = $(this).parent().parent().children().first();
	        		reviewArea.append("<br/>").append("<img id='imgView"+imgNum+"'>");
	        		
	        		$("#imgView"+imgNum).attr('src', blobURL).css(
	        				'width', '350');
	        		// attr() src 속성에  blobURL을 넣는다.
	        		
	        		imgArr[imgNum] = $(this).val().split("\\")[2];
	        		console.log(imgArr[imgNum]); // 파일 이름
	        		
	        		
	        		
//	        		$(this).parent().parent().append("<div id='filebox'><input type='file' onchange='showImg($(this))' id='files["+(imgNum+2)+"]' name='files["+(imgNum+2)+"]' class='reviewFile' multiple='multiple'/></div>");
	        		
	        		
	        		$("#fileNameBox0").append("<p class='p_fileName'>"+imgArr[imgNum]+"<input id='btn_deleteFile' type='button' value='' name=''/></p>");
	        		imgNum++;
	        		
	        		$("#fileBox0").height($("#fileNameBox0").height()) ;
	        		
        		}
        	});
        	
        	
        	$("#reviewFile1").change(
        			function(){
//        			window.alert("사진~~~~~~");
        			console.log($(this));
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
	        			
	        		
	        		//위에저거랑 비슷한거같은데 이러케써도되나 - 유라
//	        		var place = document.getElementById('reviewContent');	
//	        		var newImage= document.createElement("img");
	        		
	        		var reviewArea = $(this).parent().parent().children().first();
	        		reviewArea.append("<br/>").append("<img id='imgView"+imgNum+"'>");
	        		
	        		$("#imgView"+imgNum).attr('src', blobURL).css(
	        				'width', '350');
	        		// attr() src 속성에  blobURL을 넣는다.
	        		
	        		imgArr[imgNum] = $(this).val().split("\\")[2];
	        		console.log(imgArr[imgNum]); // 파일 이름
	        		
	        		
	        		
//	        		$(this).parent().parent().append("<div id='filebox'><input type='file' onchange='showImg($(this))' id='files["+(imgNum+2)+"]' name='files["+(imgNum+2)+"]' class='reviewFile' multiple='multiple'/></div>");
	        		
	        		
	        		$("#fileNameBox1").append("<p class='p_fileName'>"+imgArr[imgNum]+"<input id='btn_deleteFile' type='button' value='' name=''/></p>");
	        		imgNum++;
	        		
	        		$("#fileBox1").height($("#fileNameBox1").height()) ;
	        		
        		}
        	});
        	
        	
        	
        	$("#reviewFile2").change(
        			function(){
//        			window.alert("사진~~~~~~");
        			console.log($(this));
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
	        			
	        		
	        		//위에저거랑 비슷한거같은데 이러케써도되나 - 유라
//	        		var place = document.getElementById('reviewContent');	
//	        		var newImage= document.createElement("img");
	        		
	        		var reviewArea = $(this).parent().parent().children().first();
	        		reviewArea.append("<br/>").append("<img id='imgView"+imgNum+"'>");
	        		
	        		$("#imgView"+imgNum).attr('src', blobURL).css(
	        				'width', '350');
	        		// attr() src 속성에  blobURL을 넣는다.
	        		
	        		imgArr[imgNum] = $(this).val().split("\\")[2];
	        		console.log(imgArr[imgNum]); // 파일 이름
	        		
	        		
	        		
//	        		$(this).parent().parent().append("<div id='filebox'><input type='file' onchange='showImg($(this))' id='files["+(imgNum+2)+"]' name='files["+(imgNum+2)+"]' class='reviewFile' multiple='multiple'/></div>");
	        		
	        		
	        		$("#fileNameBox2").append("<p class='p_fileName'>"+imgArr[imgNum]+"<input id='btn_deleteFile' type='button' value='' name=''/></p>");
	        		imgNum++;
	        		
	        		$("#fileBox2").height($("#fileNameBox2").height()) ;
	        		
        		}
        	});
        	
//        	$("#writeReviewBtn").click(function(){
//        		console.log("-----imgArr-----");
//        		for(var i=0; i<imgArr.length; i++){
//        			console.log(imgArr[i]);
//        			$("#imgView"+i).attr("src","C:\\conplake\\ws\\conplake\\WebContent\\upload\\"+imgArr[i]);
//        			// 이미지 속성에 파일 경로 넣어줌
//        		}
//        		
//        		$("#post_sightsound").attr("value",$("#reviewSightsound").html());
//        		$("#post_facility").attr("value",$("#reviewFacility").html());
//        		$("#post_perform").attr("value",$("#reviewPerform").html());
//        		$("#writeReviewForm").submit();
//        	});
        	
        	
        });
        
        function showImg(obj){
        	// 확장자 . 기준으로 다음 요소를 선택해서 소문자로 변경한 후에 ext에 저장한다.
        	console.log(obj.id);
    		var ext = obj.val().split('.').pop().toLowerCase();
    		console.log(ext);
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
    			resetFormElement($("#"+obj.id)); // 폼 초기화
    			window.alert('이미지 파일이 아닙니다. gif, png, jpg, jpeg만 업로드 가능합니다.');
    		} else {
    		var file = obj.prop("files")[0];
    		
    		// prop에서 files라는 속성을 가져온 것
    		// 자바스크립트의 uploadfile이 제공하는 것이 files
    		// file 경로는 file:////경로 
    		// 이 경로는 이미지 태그가 표현하지 못한다.
    		blobURL = window.URL.createObjectURL(file);
    		console.log("blobURL::::", blobURL);
    		// 윈도우 자체에서 파일을 불러오는 경로값을 표현하려면
    		// createObjectURL()을 사용해야 한다.
    			
    		
    		//위에저거랑 비슷한거같은데 이러케써도되나 - 유라
//    		var place = document.getElementById('reviewContent');	
//    		var newImage= document.createElement("img");
    		
    		var reviewArea = obj.parent().parent().children().first();
    		reviewArea.append("<br/>").append("<img id='imgView"+imgNum+"'>");
    		
    		$("#imgView"+imgNum).attr('src', blobURL).css(
    				'width', '350');
    		// attr() src 속성에  blobURL을 넣는다.
    		
    		imgArr[imgNum] = obj.val().split("\\")[2];
    		console.log(imgArr[imgNum]); // 파일 이름
    		imgNum++;
    		
    		
    		obj.parent().parent().append("<div id='filebox'><input type='file' id='files["+(imgNum+2)+"]' name='files["+(imgNum+2)+"]' onchange='showImg($(this))' class='reviewFile' multiple='multiple'/></div>");
    		
    		} 
        }
        
        function resetFormElement($obj) {
        	$obj.val("");
        }
        
        function writeReview(){
        	console.log("-----imgArr-----");
    		for(var i=0; i<imgArr.length; i++){
    			console.log(imgArr[i]);
    			$("#imgView"+i).attr("src","upload/"+imgArr[i]);
    			// 이미지 속성에 파일 경로 넣어줌
    		}
    		
    		$("#post_sightsound").attr("value",$("#reviewSightsound").html());
    		$("#post_facility").attr("value",$("#reviewFacility").html());
    		$("#post_perform").attr("value",$("#reviewPerform").html());
    		
    		
    		$("#writeReviewForm").submit();
        	
        }
        