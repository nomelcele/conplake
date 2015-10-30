function createRow(){ 
    var objTable = document.getElementById('table_setList'); 
    var objRow = objTable.insertRow();
	var cell1 = objRow.insertCell(0);
	var cell2 = objRow.insertCell(1);

	var input1= document.createElement("INPUT");
	input1.setAttribute("type", "number");
   	input1.className = "input_setList";
	input1.id = "input_setListNum";
	cell1.appendChild(input1);
	
	var input2= document.createElement("INPUT");
	input2.setAttribute("type", "text");
	input2.className = "input_setList";
	input2.id = "input_setListTitle";
	cell2.appendChild(input2);
	
	
	
	objRow.style.borderBottom = '1px solid #ccc';
	cell1.width = '100'; 
    cell1.height = '50';
	
	cell2.width = '600';
	cell2.height = '50';
	 
    cell.align = 'center'; 
    cell.style.color = '#333'; 
} 