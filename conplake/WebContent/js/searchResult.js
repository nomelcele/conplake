$(document).ready( function () {
	$(".sideBoxWrap").animate({left:"0"},500);
	
	$("#searchBtn").click(function(){
		var searchOption = $("#searchCategory").val();
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
	});
});