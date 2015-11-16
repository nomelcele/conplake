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
	
	
	 
	 
})


function createRow(){ 
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
	input1.id = "input_setListNum"
	cell1.appendChild(input1);
	
	var input2= document.createElement("INPUT");
	input2.setAttribute("type", "text");
	input2.className = "input_setList";
	input2.id = "input_setListTitle";
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
	
	$(".input_check:checked").not($("#input_check0")).parent().siblings().remove();
	$(".input_check:checked").not($("#input_check0")).parent().remove();
	
	$("#input_check0").prop("checked",false);  

}