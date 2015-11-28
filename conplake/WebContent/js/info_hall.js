

function loadMap(gpsy,gpsx){
	var container = document.getElementById('concerthallMap'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new daum.maps.LatLng(gpsx, gpsy), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};

	var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
}

$(document).ready(function(){
	$("a[rel^='prettyPhoto']").prettyPhoto();
	
	
	$("#input_seatPic").change(
		function(){
			var file = $(this).prop("files")[0];
			blobURL = window.URL.createObjectURL(file);
			
			var seatPicWrap = document.getElementById('seatPicWrap'); 
			var seatPic= document.createElement("img");
			seatPic.id = "seatPic";
			
			seatPicWrap.appendChild(seatPic);
			
			$('#seatPic').attr('src', blobURL).css(
					'maxWidth', '448px').css('maxHeight', '248px');
		}
	);
	
	
	
	
});

function uploadSeatPic(){
	$("#modalWindowWrap").css('display','block');
	
}

