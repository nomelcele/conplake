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
<script src="js/login.js"></script>
<script>
	$(function(){
		console.log("Login Page");
	});
</script>
<style>
body{ height:100%; background:#eee; padding-bottom:100px;}

.card { background-color:#f7f7f7;
	border-radius:2px; 
	width:500px; 
	height:250px; 
	box-shadow:0 2px 2px rgba(0, 0, 0, 0.3); 
	margin: 0 auto;
	position:relative;
	}

.logoBox {
	width : 250px;
	height: 200px;
	margin: 50px auto 0;
	background: url(resources/img/logo.png) no-repeat center center;
	background-size:contain;
	}


.formBox {
	width: 292px; height:82px;
	margin: 0 auto;
	padding-top: 80px;

}

#loginBox {
	width:200px; height:82px; float:left;
	}
	
#id, #passwd { background: #fff none repeat scroll 0 0;
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
	}
#id {margin-bottom:10px;}

#loginButtonBox {
	width:92px; height:82px; float:left;
	}

input#signIn {
	width:82px; height:82px;
	margin-left:10px;
	background: #C30D22;
	border:1px solid ;
	border-radius: 1px;
	font-size:14px;
	color:#fff;
	}
	
input#signIn:hover {
	background: #B70B25;
	}
	
#memberButtonBox {
	width:500px;
	height:50px; 
	margin:0 auto;
	padding-top:30px;
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
	}

.button:hover {
	background-color:#464646;
}
	
.button#findPasswd {
	margin-right:10px;
	}	
	
	
.modalWindowWrap {width:100%; height:100%; position:fixed; background:rgba(0,0,0,.8); left:0; top:0; zindex:999; display:none; }


.modalWindow{position:absolute; width:400px; height:540px; top:50%; left:50%; margin-left:-200px; margin-top:-275px; border:1px solid #333; background:#fff; box-shadow : rgba(0,0,0,0.5) 0 0 8px 3px;}

.mdHeader{ width:100%; height:40px; background:#666;}
.mdHeader p {width:100%; line-height:40px; color:#eee; font-weight:bold; font-size:12px; padding-left:10px;}
.mdClose {width:30px; height:40px; color:#fff; font-size:14px; font-weight:bold; float:right; border:none; background:none; margin-right:10px;  }

.mdFooter{width:380px; height:29px; padding:10px 10px; border-top:1px solid #ccc; box-shadow:#eee 0 -3px 1px;}

.noScroll {overflow:hidden;}

#modalWindow_pwd{ width:500px; margin-left:-250px; height:300px; margin-top:-150px;}
#mdBody_pwd{ padding:20px;}

.input_search {
   /* 원하는 너비설정 */
  height: 20px;
  padding: 5px 0 5px 5px; /* 여백으로 높이 설정 */
}

</style>
</head>
<body>
	<tiles:insertAttribute flush="true" name="body" />
</body>
</html>