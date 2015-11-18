var rowNum=1;

$('document').ready(function(){
	$('#input_check0').click(function(event) {   
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
	
	
	$("#edit_setListBtn").click(function(){
		alert("셋리수정");
		$.ajax({
			type : "POST",
			url : "editSetlist",
			data : {
				con_num: $("#concertNumber").val(),
				con_artist: $("#concertArtist").val()
			},
			success : function(result) {
				$('#concertSetList').html(result);
			}
		});
	});
	
	// ajax 데이터로 배열을 보내기 위한 설정
	$.ajaxSettings.traditional = true;
	
	$("#setList_saveBtn").click(function(){
		alert("셋리저장");
		var titleArr = document.getElementsByName("input_setListTitle");
		var orderArr = document.getElementsByName("input_setListNum");
		
		var songs_title = [];
		var songs_order = [];

		for(var i=0; i<titleArr.length; i++){
			songs_title.push(titleArr[i].value);
			songs_order.push(orderArr[i].value);
		}
		
		$.ajax({
			type : "POST",
			url : "saveSetlist",
			data : {
				songs_title: songs_title,
				con_artist: $("#setList_con_artist").val(),
				con_num: $("#setList_con_num").val(),
				songs_order: songs_order 
			},
			success : function(result) {
				$('#concertSetList').html(result);
			}
		});
	});
	 
})


function createRow(){ 
	alert("행 추가");
    rowNum+=1;

	
	var objTable = document.getElementById('table_setList'); 
    var objRow = objTable.insertRow();
	
	var cell0 = objRow.insertCell(0);
	var cell1 = objRow.insertCell(1);
	var cell2 = objRow.insertCell(2);
	
	
	
	var input0= document.createElement("INPUT");
	var label0= document.createElement("label");
	input0.setAttribute("type", "checkbox");
	input0.setAttribute("name","s_check");
	
   	input0.className = "input_check";
	label0.className = "label_check";
	
	input0.id = ("input_check"+rowNum);
	
	label0.setAttribute("for",input0.id);

	
	cell0.appendChild(input0);
	cell0.appendChild(label0);
	
	var input1= document.createElement("INPUT");
	input1.setAttribute("type", "number");
   	input1.className = "input_setList";
	input1.id = "input_setListNum";
	input1.name = "input_setListNum"
	cell1.appendChild(input1);
	
	var input2= document.createElement("INPUT");
	input2.setAttribute("type", "text");
	input2.className = "input_setList";
	input2.id = "input_setListTitle";
	input2.name = "input_setListTitle";
	cell2.appendChild(input2);
	
	
	
	objRow.style.borderBottom = '1px solid #ccc';
	cell1.width = '100'; 
    cell1.height = '50';
	
	cell2.width = '750';
	cell2.height = '50';
	
	cell0.width = '50';
    cell0.align = 'center'; 
    cell0.style.color = '#333'; 
	
} 

function removeRow(){ 
	alert("행 삭제");
	$(".input_check:checked").not($("#input_check0")).parent().siblings().remove();
	$(".input_check:checked").not($("#input_check0")).parent().remove();
	
	$("#input_check0").prop("checked",false);  

}

