
function mdOpen_note_header(){
	$("#modalWindowWrap_note_header").css('display','block');
}

function mdClose_note_header(){
	$("#modalWindowWrap_note_header").css('display','none');
}

function mdOpen_fri_header(){
	$("#modalWindowWrap_fri_header").css('display','block');
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