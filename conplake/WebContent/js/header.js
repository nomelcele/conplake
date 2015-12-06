
function mdOpen_fri_header(mem_num){
	// 친구 목록 띄우기
	$.ajax({
		type: "POST",
		url: "myFriends",
		data: {
			mem_num: mem_num
		},
		success: function(result){
			$("#modalWindowWrap_fri_header").html(result);
			$("#modalWindowWrap_fri_header").css('display','block');
		}
	});
}

function mdClose_fri_header(){
	$("#modalWindowWrap_fri_header").css('display','none');
}

function toggle_myMenu() {
	$("#pop_addMenu").css('display','none');
	$("#pop_myMenu").slideToggle("100");
};

function toggle_addMenu() {
	$("#pop_myMenu").css('display','none');
	$("#pop_addMenu").slideToggle("100");
	
};

function modifyInfoForm(){
	$.ajax({
		type: "POST",
		url: "modifyInfoForm",
		success: function(result){
			$(".mainBox").html(result);
		}
	});
}