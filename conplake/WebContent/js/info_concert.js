var page=1;

$( document ).ready(function() {
	$("#tab1").height("31");
	$("#tab1").css("background-color","#fff");
	
	$( "#tab1" ).click(function() {
		page = 1;
		$("#concertIntro").css("display","block");
		$("#concertSetList").css("display","none");
		$("#concertReview").css("display","none");
		
		$("#tab1").height("31");
		$("#tab1").css("background-color","#fff");
		$("#tab2").height("30");
		$("#tab2").css("background-color","#eee"); 
		$("#tab3").height("30");
		$("#tab3").css("background-color","#eee"); 
		
	});
	
	$( "#tab2" ).click(function() {
		page = 2;
		$("#concertIntro").css("display","none");
		$("#concertSetList").css("display","block");
		$("#concertReview").css("display","none");
		
		$("#tab2").height("31");
		$("#tab2").css("background-color","#fff");
		$("#tab1").height("30");
		$("#tab1").css("background-color","#eee"); 
		$("#tab3").height("30");
		$("#tab3").css("background-color","#eee"); 
		
	});
	
	$( "#tab3" ).click(function() {
		page = 3;
		$("#concertIntro").css("display","none");
		$("#concertSetList").css("display","none");
		$("#concertReview").css("display","block");
		
		$("#tab3").height("31");
		$("#tab3").css("background-color","#fff");
		$("#tab1").height("30");
		$("#tab1").css("background-color","#eee"); 
		$("#tab2").height("30");
		$("#tab2").css("background-color","#eee"); 
		
	});
	

	$( "#tab1" ).mouseenter(function() {
		if(page==2 || page==3){
			$("#tab1").height("31");
			$("#tab1").css("background-color","#fff"); 
		}
	});
	$( "#tab1" ).mouseleave(function() {
		if(page==2 || page==3){
			$("#tab1").height("30");
			$("#tab1").css("background-color","#eee"); 
		}
	});		
			
	$( "#tab2" ).mouseenter(function() {
		if(page==0 || page==1 || page==3){
			$("#tab2").height("31");
			$("#tab2").css("background-color","#fff"); 
		}
	});
	$( "#tab2" ).mouseleave(function() {
		if(page==0 || page==1 || page==3){
			$("#tab2").height("30");
			$("#tab2").css("background-color","#eee"); 
		}
	});
	
	$( "#tab3" ).mouseenter(function() {
		if(page==0 || page==1 || page==2){
			$("#tab3").height("31");
			$("#tab3").css("background-color","#fff");
		}
	});
	$( "#tab3" ).mouseleave(function() {
		if(page==0 || page==1 || page==2){
			$("#tab3").height("30");
			$("#tab3").css("background-color","#eee"); 
		}
	});
		
		
	
	
	
	
	
	//----------------------------tab3-----------------------------//
});
