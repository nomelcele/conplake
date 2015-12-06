 function mdOpen_searchPlace(){
	 $("#modalWindowWrap_searchPlace").css('display','block');
 }
 
 function mdOpen_searchArtist(){
	 $("#modalWindowWrap_searchArtist").css('display','block');
 }
 
 function searchConcerthall(){
	 $.ajax({
			type : "POST",
			url : "concerthallSearch",
			data : {
				chall_name: $("#challKeyword").val(),
				searchType: "addForm"
			},
			success : function(result) {
				$('#modalWindowWrap_searchPlace').html(result);
			}
		});
 }
 
 function selectConcerthall(chall_name,chall_num){
	$("#addConInfo_hall").attr("value",chall_name);
	$("#newConcertVenue").attr("value",chall_num);
	$("#modalWindowWrap_searchPlace").css("display","none"); 
 }

 function searchArtist(){
	 $.ajax({
			type : "POST",
			url : "artistSearch",
			data : {
				art_name: $("#artKeyword").val(),
				searchType: "addForm"
			},
			success : function(result) {
				$('#modalWindowWrap_searchArtist').html(result);
			}
		});
 }
 
 function selectArtist(art_name,art_num){
	$("#addConInfo_artist").attr("value",art_name);
	$("#newConcertArtist").attr("value",art_num);
	$("#modalWindowWrap_searchArtist").css("display","none"); 
 }
 
 function addNewConcert(){
	 alert("제발");
	 $("#addNewConcertForm").submit();
 }