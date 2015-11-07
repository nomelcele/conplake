$(function(){
	$("#writeReviewCommBtn").click(function(){
		if($.trim($("#comm_cont").val()) == ""){
			// 댓글 내용을 적지 않은 경우
			alert("댓글 내용을 입력해 주세요.")
		} else {
			$("#writeReviewCommForm").submit();
		}
	});
});