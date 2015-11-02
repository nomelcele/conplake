function concertInfo(con_num){
	$("#con_num").attr("value",con_num);
	$("#mainForm").attr("action","concertInfo").submit();
}