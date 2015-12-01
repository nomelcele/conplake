
$( document ).ready(function() {
	
		
	
	//----------------------------tab3-----------------------------//
	
	$("#btn_searchReview").click(function(){
		// 리뷰 검색
		var searchOption = $("#reviewSearchCategory").val();
		switch(searchOption){
			case 'title':
				$.ajax({
					type : "POST",
					url : "reviewSearch",
					data : {
						post_title: $("#reviewSearchKeyword").val(),
						con_num: $("#concertNumber").val()
					},
					success : function(result) {
						$('#concertReview').html(result);
					}
				});
				break;
			case 'author':
				$.ajax({
					type : "POST",
					url : "reviewSearch",
					data : {
						authorname: $("#reviewSearchKeyword").val(),
						con_num: $("#concertNumber").val() 
					},
					success : function(result) {
						$('#concertReview').html(result);
					}
				});
				break;
			case 'cont':
				$.ajax({
					type : "POST",
					url : "reviewSearch",
					data : {
						reviewcont: $("#reviewSearchKeyword").val(),
						con_num: $("#concertNumber").val()
					},
					success : function(result) {
						$('#concertReview').html(result);
					}
				});
				break;
		}
		
		
	});
	
	
	
	
	$("#tLInputBtn").click(function(){
		// 타임라인에 글 작성
		$.ajax({
			type : "POST",
			url : "writeTimeline",
			data : {
				tl_cont: $("#tLInputText").val(),
				tl_author: $("#currentUserNum").val(),
				tl_concert: $("#concertNumber").val()
			},
			success : function(result) {
				$('#concertTimeLine').html(result);
			}
		});

	});
	
});

function mdClose(){
	$("#modalWindowWrap").css('display', 'none');
	
}

function readTimelineComm(comm_tl){
	// 댓글 불러오기
	$.ajax({
		type : "POST",
		url : "readTimelineComm",
		data : {
			comm_tl: comm_tl
		},
		success : function(result) {
			$('#modalWindowWrap').html(result);
		}
	});
	alert("댓글창 열기");
	$("#modalWindowWrap").css('display', 'block');
	
	commHeight();
	
}


function writeTimeline(){
	$.ajax({
		type : "POST",
		url : "writeTimeline",
		data : {
			tl_cont: $("#tLInputText").val(),
			tl_author: $("#currentUserNum").val(),
			tl_concert: $("#concertNumber").val()
		},
		success : function(result) {
			$('#concertTimeLine').html(result);
		}
	});
}

function writeTimelineComm(currentUserNumber,timelineNumber){
	$.ajax({
		type : "POST",
		url : "writeTimelineComm",
		data : {
			comm_cont: $("#mdInputText").val(),
			comm_author: currentUserNumber,
			comm_tl: timelineNumber
		},
		success : function(result) {
			$('#modalWindowWrap').html(result);
		}
	});
}


function commHeight(){
	if($("#mdBody ul li").length == 0){
		$("#mdBody ul").height('0');
		$("#modalWindow").height('90px');
		$("#modalWindow").css('margin-top', '-45px');
	}

	else if(($("#mdBody ul li").length > 0) && ($("#mdBody ul li").length <= 6)){
		var li = $("#mdBody ul li").length;
		var margFor = -45-(li*35);
		
		$("#mdBody ul").height(li*70);
		$("#modalWindow").height(90 + li*70);
		document.getElementById("modalWindow").style.marginTop = margFor.toString() + 'px';
		
	}

	else if($("#mdBody ul li").length > 6){
		$("#mdBody ul").height('450px');
		$("#modalWindow").height('540px');
	}
}

function deleteComm(){
	$.ajax({
		type : "POST",
		url : "writeTimelineComm",
		data : {
			comm_cont: $("#mdInputText").val(),
			comm_author: currentUserNumber,
			comm_tl: timelineNumber
		},
		success : function(result) {
			$('#modalWindowWrap').html(result);
		}
	});
}

