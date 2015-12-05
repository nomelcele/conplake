
function mdOpen_note_header(mem_num){
	// 쪽지창 띄우기(초기 화면-받은 쪽지함)
	$.ajax({
		type: "POST",
		url: "inbox",
		data: {
			mem_num: mem_num
		},
		success: function(result){
			$("#mdBody_right").html(result);
			$("#modalWindowWrap_note_header").css('display','block');
		}
	});
}

function mdClose_note_header(){
	$("#modalWindowWrap_note_header").css('display','none');
}

function sentNotesList(mem_num){
	// 쪽지창 띄우기(초기 화면-받은 쪽지함)
	$.ajax({
		type: "POST",
		url: "sent",
		data: {
			mem_num: mem_num
		},
		success: function(result){
			$("#mdBody_right").html(result);
//			$("#modalWindowWrap_note_header").css('display','block');
		}
	});
	
}


$('document').ready(function(){
	$('#input_n_check0').click(function(event) {   
		if(this.checked == true) {
			// Iterate each checkbox
			$(':checkbox').each(function() {
				this.checked = true;                        
			});
		}
		
		else if(this.checked == false) {
			// Iterate each checkbox
			$(':checkbox').each(function() {
				this.checked = false;                        
			});
		}
	});
	
});


function removeNote(){ 
	$(".input_check:checked").not($("#input_n_check0")).parent().siblings().remove();
	$(".input_check:checked").not($("#input_n_check0")).parent().parent().parent().remove();
	
	$("#input_n_check0").prop("checked",false);  

}

function writeNoteForm(){
		// 쪽지 쓰기 페이지 이동
		$.ajax({
			type: "POST",
			url: "writeNoteForm",
			success: function(result){
				$("#mdBody_right").html(result);
			}
		});
}

function writeNote(mem_num){
	// 쪽지 쓰기
	$.ajax({
		type: "POST",
		url: "writeNote",
		data: {
			note_from: mem_num,
			note_to: $("#toWriteNote").val(),
			note_cont: $("#contentWriteNote").val()
		},
		success: function(result){
			$("#mdBody_right").html(result);
		}
	});
}
