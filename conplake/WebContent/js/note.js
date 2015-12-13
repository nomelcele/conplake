
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
	// 쪽지창 띄우기(보낸 쪽지함)
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

function checkAll(obj){
	// 체크박스 전체 선택(해제)을 해주는 메서드
	var chkArr = document.getElementsByName("s_check");
	var len = chkArr.length;
	
	for(var i=0; i<len; i++){
		if(obj.checked){
			chkArr[i].checked = true;
		} else {
			chkArr[i].checked = false;
		}
	}
}

function removeNote(){ 
	// 쪽지 삭제
	if(!confirm("쪽지를 삭제하시겠습니까?")){
		return;
	} else {
		$.ajax({
			type: "POST",
			url: "deleteNote",
			data: {
				type: $("#inboxSent").val()
			},
			success: function(result){
				$("#mdBody_right").html(result);
			}
		});
	}
//	$(".input_check:checked").not($("#input_n_check0")).parent().siblings().remove();
//	$(".input_check:checked").not($("#input_n_check0")).parent().parent().parent().remove();
//	
//	$("#input_n_check0").prop("checked",false);  
}

function writeNoteForm(){
		// 쪽지 쓰기 페이지 이동
		$.ajax({
			type: "POST",
			url: "writeNoteForm",
			data: {
				type: "normal",
				note_from: 0
			},
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
			toNameId: $("#toWriteNote").val(),
			note_cont: $("#contentWriteNote").val()
		},
		success: function(result){
			$("#mdBody_right").html(result);
		}
	});
}

function readNote(note_num){
	// 쪽지 읽기
	$.ajax({
		type: "POST",
		url: "readNote",
		data: {
			note_num: note_num
		},
		success: function(result){
			$("#mdBody_right").html(result);
		}
	});

}

function replyNote(note_from){
	// 쪽지 답장 & 친구목록/마이페이지에서 쪽지 보내기
	$.ajax({
		type: "POST",
		url: "writeNoteForm",
		data: {
			type: "reply",
			note_from: note_from
		},
		success: function(result){
			$("#mdBody_right").html(result);
			$("#modalWindowWrap_fri_header").css('display','none');
			$("#modalWindowWrap_note_header").css('display','block');
		}
	});
}

var address = null;

function addressBook(){
	$.ajax({
		type: "POST",
		url: "addressBook",
		dataType: "json",
		success: function(jdata){
			console.log("Ddddddd");
			address = jdata;
			var txt = "<table>";
			for(var i=0; i<address.length; i++){
				console.log(address[i]);
				txt += "<tr style='background:white;'><td style='cursor:pointer;' onmouseover='this.style.background=\"#eee\"' onmouseout='this.style.background=\"white\"' onclick='selectMember("+i+")'>"+address[i]+"</td></tr>";
			}
			txt += "</table>";
			$("#addressView").html(txt);
			$("#addressView").css("display","block");
		}
	});
}

function selectMember(idx){
	$("#toWriteNote").attr("value",address[idx]);
	$("#addressView").css("display","none");
}

function removeView(){
	$("#addressView").css("display","none");
	console.log("!!!");
}