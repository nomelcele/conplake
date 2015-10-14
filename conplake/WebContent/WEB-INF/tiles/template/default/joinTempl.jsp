<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CONPLAKE</title>
<link href="resources/css/common.css" rel="stylesheet" type="text/css"/>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="js/join.js"></script>
<%--우편번호 다음 링크 --%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	$(function(){
		console.log("Join Page");
	});
</script>
<style>


body{ padding-bottom:100px; background:#eee;}

.card { background-color:#f7f7f7;
	border-radius:2px; 
	width:1000px; 
	height:700px; 
	box-shadow:0 2px 2px rgba(0, 0, 0, 0.3); 
	margin: 0 auto;
	position:relative;
	}

.logoBox {
	width : 250px;
	height: 200px;
	margin: 30px auto 0;
	background: url(resources/img/logo.png) no-repeat center center;
	background-size:contain;
	}


.formBox {
	width: 500px; height:620px;
	float:left;
	margin-top:30px;

}

#formBoxRight {width:430px; padding-left:45px; border-left:1px solid #ddd;}


.profileBox {width:300px; height:460px; margin:50px auto;}
#profile_img {width:150px; height:150px; margin:0 auto; -moz-border-radius: 50%; -webkit-border-radius: 50%; border-radius: 50%; background:url(resources/img/profile_img_default.png) }

#labelProfileImg {width:150px; height:150px; display:block; text-indent: -9999px; overflow:hidden;}
#inputProfileImg {width:150px; height:150px; display:none; }


#profile_txt {width:300px; height:220px; margin-top:30px; }
#inputProfileTxt {width:268px; height:190px; border:1px solid #ddd; border-radius:20px; padding:15px; resize:none;
overflow-x:hidden; overflow-y:auto;}

	
	
.inputLabel {color:#333; font-size:12px; font-family: '나눔고딕', 'Nanum Gothic', sans-serif;}

#inputLabel_name {padding-top:10px;}
	
.inputStyle { background: #fff none repeat scroll 0 0;
	border-color: #c0c0c0 #d9d9d9 #d9d9d9;
    border-image: none;
    border-radius: 1px;
    border-style: solid;
    border-width: 1px;
    box-sizing: border-box;
    color: #999;
    display: inline-block;
    font-size: 12px;
    width:200px;
	height: 36px;
    padding: 0 8px;
	margin-bottom:15px;
	}



.inputBox {margin:5px 0 5px;}

#inputBox_gender {margin-bottom:15px;}


#email_id {width:90px;}
.inputBox span {width:10px; height:36px; line-height:36px; display:line-block;}
.input_category { background: url(../img/arrow_down.png) no-repeat 120px center; /* 네이티브 화살표 대체 */  }
#email_address, #email_select {width:145px;}

#btnPost {width:100px; height:36px; float:none; margin-left:10px; background:#ddd; color:#666; border:none; font-size:12px;} 
.input_postCode {width:100px;}

.input_address {width:200px;}
#adressDetail{ margin-left:10px;}
	
	
#memberButtonBox {
	width:1000px;
	height:50px; 
	margin:0 auto;
	padding-top:35px;
	}
	
	
.button { background: #666 none repeat scroll 0 0;
	border:#666;
    border-radius: 5px;
    border-style: solid;
    border-width: 1px;
    box-sizing: border-box;
    color: #fff;
    display: inline-block;
    font-size: 14px;
    width:240px;
	height: 50px;
    padding: 0 8px;
	float:right;
	}

.button:hover {
	background-color:#464646;
}

</style>
</head>
<body>
	<tiles:insertAttribute flush="true" name="body" />
</body>
</html>