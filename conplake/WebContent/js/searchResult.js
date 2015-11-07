$(document).ready( function () {
	$(".sideBoxWrap").animate({left:"0"},500);
	
	$("#searchFrom").change(function(){
		$("#searchTo").attr("min",$(this).val());
	});
	
	
	$("#searchBtn").click(function(){
		var searchOption = $("#searchCategory").val();
//		alert($("#searchFrom").val());
//		alert($("#searchTo").val());
		if(searchOption=="default"){
			alert("카테고리를 선택해 주세요.");
		} else {
			switch(searchOption){
				case 'artist':
				case 'concert':
					$("#searchKeyword").attr("name","con_name");
					$("#searchForm").attr("action","concertSearch").submit();
					break;
				case 'concerthall':
					$("#searchKeyword").attr("name","chall_name");
					$("#searchForm").attr("action","concerthallSearch").submit();
					break;
			}
		}
	});
});