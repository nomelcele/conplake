


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
})


function removeNote(){ 
	$(".input_check:checked").not($("#input_n_check0")).parent().siblings().remove();
	$(".input_check:checked").not($("#input_n_check0")).parent().parent().parent().remove();
	
	$("#input_n_check0").prop("checked",false);  

}
