$( document ).ready(function() {
	$('#ul_likeToGo').css('width', $('#ul_likeToGo li').length * 180); //li 개수만큼 width 조정하기
	$('#ul_likeArtist').css('width', $('#ul_likeArtist li').length * 180); //li 개수만큼 width 조정하기
	
	$('#bar1').draggable({ axis:'x', containment:'parent'});
	$('#bar1').bind("drag", function(event, ui) {
		getPos();
	});
	
	$('#bar2').draggable({ axis:'x', containment:'parent'});
	$('#bar2').bind("drag", function(event, ui) {
		getPos2();
	});
	
	if($('#ul_likeToGo li').length < 6) {
		if($('#ul_likeToGo li').length == 0) 
			$('#scrollContent1').height(0);
		$('#scrollBar1').css('display', 'none');
	}
	
	if($('#ul_likeArtist li').length < 6) {
		if($('#ul_likeArtist li').length == 0)
			$('#scrollContent2').height(0);
		$('#scrollBar2').css('display', 'none');
	}
	
	var min = 0;
	var max = 860-( $('#ul_likeToGo li').length * 180 );		//액자 길이 - ul 길이  , pos에서 870은 액자-움직일수있는 거리 최대
	var max2 = 860-( $('#ul_likeArtist li').length * 180 );		//액자 길이 - ul 길이  , pos에서 870은 액자-움직일수있는 거리 최대
	
	function getPos(){
		var barLeft= $('#bar1').css("left");
		barLeft = parseInt(barLeft);
		var pos = (barLeft * (max - min)) /800	+ min;
		$('#ul_likeToGo li').css('left',pos);	
	}
	
	function getPos2(){
		var barLeft= $('#bar2').css("left");
		barLeft = parseInt(barLeft);
		var pos = (barLeft * (max2 - min)) /800	+ min;
		$('#ul_likeArtist li').css('left',pos);	
	}
	
	$("#mypage").click(function(){
		$("#myPageForm").submit();
	});


});

function deleteFriend(ui_member,ui_friend,type){
	// 친구 삭제
	$.ajax({
		type: "POST",
		url: "deleteFriend",
		data: {
			ui_member: ui_member,
			ui_friend: ui_friend,
			type: type
		},
		success: function(result){
			if(type == 'myFriends')
				$("#modalWindowWrap_fri_header").html(result);
			if(type == 'myPage')
				$(".mainBox").html(result);
		}
	});
}

function addFriend(ui_member,ui_friend){
	// 친구 추가
	$.ajax({
		type: "POST",
		url: "addFriend",
		data: {
			ui_member: ui_member,
			ui_friend: ui_friend
		},
		success: function(result){
			$(".mainBox").html(result);
		}
	});

}