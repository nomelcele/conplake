

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
	
	
	$("#input_seatReviewPic").change(
			function(){
				var file = $(this).prop("files")[0];
				blobURL = window.URL.createObjectURL(file);
				
				var seatReviewPicWrap = document.getElementById('seatReviewPicWrap'); 
				var seatReviewPic= document.createElement("img");
				seatReviewPic.id = "seatReviewPic";
				
				seatReviewPicWrap.appendChild(seatReviewPic);
				
				$('#seatReviewPic').attr('src', blobURL).css(
						'maxWidth', '448px').css('maxHeight', '248px');
			}
		);
	
	
	
	
});

function uploadSeatPic(){
	$("#modalWindowWrap_seatReview").css('display','block');
	
}

function uploadSeatReviewPic(){
	$("#modalWindowWrap_seat").css('display','block');
	
}

function searchSightimg(chall_num){
	$.ajax({
		type: "post",
		url: "searchSightimg",
		data: {
			si_concerthall: chall_num,
			si_floor: $("#select_floor").val(),
			si_standseat: $("#select_standseat").val()
		},
		success: function(result){
			$("#seatReview").html(result);
		}
	});
}

function hallReviewList(){
	// 공연장 후기 불러오기
	$.ajax({
		type: "post",
		url: "hallReviewList",
		data: {
			type: $("#reviewSearchCategory").val(),
			chall_num: $("#concerthallNum").val()
		},
		success: function(result){
			$("#hallReview").html(result);
		}
	});
}
