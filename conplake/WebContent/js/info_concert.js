var page=0;

$( document ).ready(function() {
	$("#tab1").height("31");
	$("#tab1").css("background-color","#fff");
	
	$( "#tab1" ).click(function() {
		page = 1;
		$("#tab1").height("31");
		$("#tab1").css("background-color","#fff");
		$("#tab2").height("30");
		$("#tab2").css("background-color","#eee");
		$("#tab3").height("30");
		$("#tab3").css("background-color","#eee");
		
		$("#concertIntro").css("display","block");
		$("#concertSetList").css("display","none");
		
	});
	
	$( "#tab2" ).click(function() {
		page = 2;
		$("#tab2").height("31");
		$("#tab2").css("background-color","#fff");
		$("#tab1").height("30");
		$("#tab1").css("background-color","#eee");
		$("#tab3").height("30");
		$("#tab3").css("background-color","#eee");
		
		$("#concertIntro").css("display","none");
		$("#concertSetList").css("display","block");
	});
	
	$( "#tab3" ).click(function() {
		page = 3;
		$("#tab3").height("31");
		$("#tab3").css("background-color","#fff");
		$("#tab1").height("30");
		$("#tab1").css("background-color","#eee");
		$("#tab2").height("30");
		$("#tab2").css("background-color","#eee");
	});
	
	
	$( "#tab1" ).mouseenter(function() {
		if(page==0 || page==2 || page==3){
			$(this).height("31");
			$(this).css("background-color","#fff"); 
		}
		else{}
	});
	$( "#tab1" ).mouseleave(function() {
		if(page==0 || page==2 || page==3){
			$(this).height("30");
			$(this).css("background-color","#eee"); 
		}
	});
	//----------------------------tab1-----------------------------//
	$( "#tab2" ).mouseenter(function() {
		if(page==0 || page==1 || page==3){
			$(this).height("31");
			$(this).css("background-color","#fff"); 
		}
		else{}
	});
	$( "#tab2" ).mouseleave(function() {
		if(page==0 || page==1 || page==3){
			$(this).height("30");
			$(this).css("background-color","#eee"); 
		}
	});
	//----------------------------tab2-----------------------------//
	$( "#tab3" ).mouseenter(function() {
		if(page==0 || page==2 || page==1){
			$(this).height("31");
			$(this).css("background-color","#fff"); 
		}
		else{}
	});
	$( "#tab3" ).mouseleave(function() {
		if(page==0 || page==2 || page==1){
			$(this).height("30");
			$(this).css("background-color","#eee"); 
		}
	});
	//----------------------------tab3-----------------------------//
});
