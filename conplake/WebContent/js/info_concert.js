
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
	
	
	
});

function mdClose(){
	$("#modalWindowWrap").css('display', 'none');
	
}
