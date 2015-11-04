$(document).ready( function () {
	$(".sideBoxWrap").animate({left:"0"},500);
	
	$("#searchBtn").click(function(){
		var searchOption = $("#searchCategory").val();
		switch(searchOption){
			case 'artist':
			case 'concert':
				$("#searchForm").attr("action","concertSearch").submit();
			case 'concerthall':
		}
	});
});