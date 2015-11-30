var page=1;

$( document ).ready(function() {
	$("#tab1").height("31");
	$("#tab1").css("background-color","#fff");
	
	$( "#tab1" ).click(function() {
		page = 1;
		
		$("#concertIntro").css("display","block");
		$("#concertSetList").css("display","none");
		$("#concertReview").css("display","none");
		$("#concertTimeLine").css("display","none");
		
		$("#hallIntro").css("display","block");
		$("#hallMap").css("display","none");
		$("#hallOngoing").css("display","none");
		$("#hallSeat").css("display","none");
		$("#seatReview").css("display","none");
		$("#hallReview").css("display","none");
		
		$("#artistIntro").css("display","block");
		$("#artistConcert").css("display","none");
		$("#artistSong").css("display","none");
		
		$("#tab1").height("31");
		$("#tab1").css("background-color","#fff");
		$("#tab2").height("30");
		$("#tab2").css("background-color","#eee"); 
		$("#tab3").height("30");
		$("#tab3").css("background-color","#eee");
		$("#tab4").height("30");
		$("#tab4").css("background-color","#eee");
		$("#tab5").height("30");
		$("#tab5").css("background-color","#eee");
		$("#tab6").height("30");
		$("#tab6").css("background-color","#eee"); 
		
	});
	
	$( "#tab2" ).click(function() {
		page = 2;
		
		$("#concertIntro").css("display","none");
		$("#concertSetList").css("display","block");
		$("#concertReview").css("display","none");
		$("#concertTimeLine").css("display","none");
		
		$("#hallIntro").css("display","none");
		$("#hallMap").css("display","block");
		$("#hallOngoing").css("display","none");
		$("#hallSeat").css("display","none");
		$("#seatReview").css("display","none");
		$("#hallReview").css("display","none");

		$("#artistIntro").css("display","none");
		$("#artistConcert").css("display","block");
		$("#artistSong").css("display","none");
		
		$("#tab2").height("31");
		$("#tab2").css("background-color","#fff");
		$("#tab1").height("30");
		$("#tab1").css("background-color","#eee"); 
		$("#tab3").height("30");
		$("#tab3").css("background-color","#eee"); 
		$("#tab4").height("30");
		$("#tab4").css("background-color","#eee");
		$("#tab5").height("30");
		$("#tab5").css("background-color","#eee");
		$("#tab6").height("30");
		$("#tab6").css("background-color","#eee");
		
		console.log($("#gpsx").val(),$("#gpsy").val());
		loadMap($("#gpsx").val(),$("#gpsy").val());
		
	});
	
	$( "#tab3" ).click(function() {
		page = 3;
		
		$("#concertIntro").css("display","none");
		$("#concertSetList").css("display","none");
		$("#concertReview").css("display","block");
		$("#concertTimeLine").css("display","none");
		
		$("#hallIntro").css("display","none");
		$("#hallMap").css("display","none");
		$("#hallOngoing").css("display","block");
		$("#hallSeat").css("display","none");
		$("#seatReview").css("display","none");
		$("#hallReview").css("display","none");
		
		$("#artistIntro").css("display","none");
		$("#artistConcert").css("display","none");
		$("#artistSong").css("display","block");
		
		
		$("#tab3").height("31");
		$("#tab3").css("background-color","#fff");
		$("#tab1").height("30");
		$("#tab1").css("background-color","#eee"); 
		$("#tab2").height("30");
		$("#tab2").css("background-color","#eee"); 
		$("#tab4").height("30");
		$("#tab4").css("background-color","#eee");
		$("#tab5").height("30");
		$("#tab5").css("background-color","#eee");
		$("#tab6").height("30");
		$("#tab6").css("background-color","#eee");
		
	});
	
	$( "#tab4" ).click(function() {
		page = 4;
		
		$("#concertIntro").css("display","none");
		$("#concertSetList").css("display","none");
		$("#concertReview").css("display","none");
		$("#concertTimeLine").css("display","block");
		
		$("#hallIntro").css("display","none");
		$("#hallMap").css("display","none");
		$("#hallOngoing").css("display","none");
		$("#hallSeat").css("display","block");
		$("#seatReview").css("display","none");
		$("#hallReview").css("display","none");
		
		
		$("#tab4").height("31");
		$("#tab4").css("background-color","#fff");
		$("#tab1").height("30");
		$("#tab1").css("background-color","#eee"); 
		$("#tab2").height("30");
		$("#tab2").css("background-color","#eee"); 
		$("#tab3").height("30");
		$("#tab3").css("background-color","#eee"); 
		$("#tab5").height("30");
		$("#tab5").css("background-color","#eee");
		$("#tab6").height("30");
		$("#tab6").css("background-color","#eee");
		
	});
	
	$( "#tab5" ).click(function() {
		page = 5;
		$("#hallIntro").css("display","none");
		$("#hallMap").css("display","none");
		$("#hallOngoing").css("display","none");
		$("#hallSeat").css("display","none");
		$("#seatReview").css("display","block");
		$("#hallReview").css("display","none");
		
		
		$("#tab5").height("31");
		$("#tab5").css("background-color","#fff");
		$("#tab1").height("30");
		$("#tab1").css("background-color","#eee"); 
		$("#tab2").height("30");
		$("#tab2").css("background-color","#eee"); 
		$("#tab3").height("30");
		$("#tab3").css("background-color","#eee"); 
		$("#tab4").height("30");
		$("#tab4").css("background-color","#eee");
		$("#tab6").height("30");
		$("#tab6").css("background-color","#eee");
		
	});
	
	$( "#tab6" ).click(function() {
		page = 6;
		$("#hallIntro").css("display","none");
		$("#hallMap").css("display","none");
		$("#hallOngoing").css("display","none");
		$("#hallSeat").css("display","none");
		$("#seatReview").css("display","none");
		$("#hallReview").css("display","block");
		
		
		
		$("#tab5").height("31");
		$("#tab5").css("background-color","#eee");
		$("#tab1").height("30");
		$("#tab1").css("background-color","#eee"); 
		$("#tab2").height("30");
		$("#tab2").css("background-color","#eee"); 
		$("#tab3").height("30");
		$("#tab3").css("background-color","#eee"); 
		$("#tab4").height("30");
		$("#tab4").css("background-color","#eee");
		$("#tab6").height("30");
		$("#tab6").css("background-color","#fff");
		
	});
	

	$( "#tab1" ).mouseenter(function() {
		if(page != 1){
			$("#tab1").height("31");
			$("#tab1").css("background-color","#fff"); 
		}
	});
	$( "#tab1" ).mouseleave(function() {
		if(page != 1){
			$("#tab1").height("30");
			$("#tab1").css("background-color","#eee"); 
		}
	});		
			
	$( "#tab2" ).mouseenter(function() {
		if(page != 2){
			$("#tab2").height("31");
			$("#tab2").css("background-color","#fff"); 
		}
	});
	$( "#tab2" ).mouseleave(function() {
		if(page != 2){
			$("#tab2").height("30");
			$("#tab2").css("background-color","#eee"); 
		}
	});
	
	$( "#tab3" ).mouseenter(function() {
		if(page != 3){
			$("#tab3").height("31");
			$("#tab3").css("background-color","#fff");
		}
	});
	$( "#tab3" ).mouseleave(function() {
		if(page != 3){
			$("#tab3").height("30");
			$("#tab3").css("background-color","#eee"); 
		}
	});
	
	$( "#tab4" ).mouseenter(function() {
		if(page != 4){
			$("#tab4").height("31");
			$("#tab4").css("background-color","#fff");
		}
	});
	$( "#tab4" ).mouseleave(function() {
		if(page != 4){
			$("#tab4").height("30");
			$("#tab4").css("background-color","#eee"); 
		}
	});	
	
	$( "#tab5" ).mouseenter(function() {
		if(page != 5){
			$("#tab5").height("31");
			$("#tab5").css("background-color","#fff");
		}
	});
	$( "#tab5" ).mouseleave(function() {
		if(page != 5){
			$("#tab5").height("30");
			$("#tab5").css("background-color","#eee"); 
		}
	});
	
	$( "#tab6" ).mouseenter(function() {
		if(page != 5){
			$("#tab6").height("31");
			$("#tab6").css("background-color","#fff");
		}
	});
	$( "#tab6" ).mouseleave(function() {
		if(page != 6){
			$("#tab6").height("30");
			$("#tab6").css("background-color","#eee"); 
		}
	});
		
		
	
	
	
	
	
	//----------------------------tab3-----------------------------//
});
