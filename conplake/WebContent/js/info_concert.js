
$( document ).ready(function() {
	
		
	
	//----------------------------tab3-----------------------------//
	
	$(".btn_searchReview").click(function(){
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
	$("#modalWindowWrap_comm").css('display', 'none');
	$(".modalWindowWrap").css('display', 'none');
	
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
			$('#modalWindowWrap_comm').html(result);
		}
	});
	
	$("#modalWindowWrap_comm").css('display', 'block');
	
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
			$('#modalWindowWrap_comm').html(result);
		}
	});
}


function commHeight(){
	if($(".ul_commList li").length == 0){
		$(".ul_commList").height('0');
		$(".modalWindow").height('90px');
		$(".modalWindow").css('margin-top', '-45px');
	}

	else if(($(".ul_commList li").length > 0) && ($(".mdBody ul li").length <= 6)){
		var li = $(".mdBody ul li").length;
		var margFor = -45-(li*35);
		
		$(".ul_commList").height(li*70);
		$(".modalWindow").height(90 + li*70);
		document.getElementById("modalWindow").style.marginTop = margFor.toString() + 'px';
		
	}

	else if($(".ul_commList li").length > 6){
		$(".ul_commList").height('450px');
		$(".modalWindow").height('540px');
	}
}

function deleteTlComm(num, origin, type){
	if(type=='comm'){ // 타임라인 댓글 삭제
		$.ajax({
			type : "POST",
			url : "deleteComm",
			data : {
				comm_num: num,
				comm_tl: origin,
				type: 'timeline'
			},
			success : function(result) {
				$('#modalWindowWrap_comm').html(result);
			}
		});
	} else { // 타임라인 삭제
		$.ajax({
			type : "POST",
			url : "deleteTimeline",
			data : {
				tl_num: num,
				tl_concert: origin
			},
			success : function(result) {
				$('#concertTimeLine').html(result);
			}
		});
	}
	
}

function mdOpen_letsGo(){
	$.ajax({
		type : "POST",
		url : "letsgoList",
		data : {
			post_concert: $("#concertNumber").val()
		},
		success : function(result) {
			$('.mdBody').html(result);
			$("#modalWindowWrap_letsGo").css('display', 'block');	
		}
	});
}

function goMyPage(mem_num){
	// 마이 페이지 이동
	var formId = "#myPageForm"+mem_num;
	$(formId).submit();
}

function writeLetsgoForm(){
	$.ajax({
		type : "POST",
		url : "writeLetsgoForm",
		success : function(result) {
			$('.mdBody').html(result);
		}
	});
}

function writeLetsgo(){
	$.ajax({
		type : "POST",
		url : "writeLetsgo",
		data : {
			post_subtype: $("#subjectLetsGo").val(),
			post_title: $("#titleLetsGo").val(),
			post_cont: $("#contentLetsGo").val(),
			post_author: $("#currentUserNum").val(),
			post_concert: $("#concertNumber").val()
		},
		success : function(result) {
			$('.mdBody').html(result);
		}
	});
	
}

function readLetsgo(post_num){
	$.ajax({
		type : "POST",
		url : "readLetsgo",
		data : {
			post_num: post_num
		},
		success : function(result) {
			$('.mdBody').html(result);
		}
	});
	
}