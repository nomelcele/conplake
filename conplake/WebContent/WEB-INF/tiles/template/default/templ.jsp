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
<link href="resources/css/writeReview.css" rel="stylesheet" type="text/css"/>
<link href="resources/css/common.css" rel="stylesheet" type="text/css"/>
<link href="resources/css/header.css" rel="stylesheet" type="text/css"/>
<link href="resources/css/sideBox.css" rel="stylesheet" type="text/css"/>
<link href="resources/css/index.css" rel="stylesheet" type="text/css"/>
<link href="resources/css/searchResult.css" rel="stylesheet" type="text/css"/>
<link href="resources/css/info_concert.css" rel="stylesheet" type="text/css"/>
<link href="resources/css/info_hall.css" rel="stylesheet" type="text/css"/>
<link href="resources/css/readReview.css" rel="stylesheet" type="text/css"/>
<link href="resources/css/edit_setList.css" rel="stylesheet" type="text/css"/>


<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="js/info_concert.js"></script>
<script src="js/info_hall.js"></script>
<script src="js/edit_setList.js"></script>
<script src="js/searchResult.js"></script>
<script src="js/concert.js"></script>
<script src="js/writeReview.js"></script>
<script src="js/readReview.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=7f9c33732c713549cc705cd0d7c3b278"></script>
<style>
html, body{ width:100%; height:100%; position:relative; }
.contentWrap{ width:1200px; height:100%; background:#fff;}
.mainBoxWrap{ width:919px; float:left; border-left:1px solid #ccc; padding-bottom:50px; }
.mainBox {width:100%; height:100%; padding-left:40px; margin-top:150px;}

h1 {font:20px Arial, Helvetica, sans-serif; font-weight:600; color:#999; padding-bottom:35px; }

.ul_concert { height:100%;}
.ul_concert li {
    -moz-border-bottom-colors: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    border-color: #d6d6d6 #d6d6d6 #b8b8b8;
    border-image: none;
    border-style: solid;
    border-width: 1px;
    float: left;
	margin-right:20px;
   	margin-bottom:30px;
    position: relative;
    width: 198px;
}
.ul_concert li strong{display:block; float:left;}

.concert_title{
    color: #333;
    font-size: 12px;
    font-weight: normal;
	height:14px;
    line-height: 14px;
    overflow: hidden;
    padding: 6px 12px 0;
    text-overflow: ellipsis;
	font-weight:600;
}

.concert_place, .concert_date{
	color:#666;
	line-height:14px;
    min-height: 14px;
    overflow: hidden;
    padding: 6px 12px 0;
}

.concert_place {padding-bottom:10px;}
</style>
</head>
<body>
	<c:if test="${!empty sessionScope.mvo.mem_name}">
	<tiles:insertAttribute flush="true" name="header" />
	<div class="contentWrap">
		<div class="sideBoxWrap">
			<div class="sideBox">
				<tiles:insertAttribute flush="true" name="search" />
			</div>
		</div>	
		<div class="mainBoxWrap">
			<div class="mainBox">
				<tiles:insertAttribute flush="true" name="body" />
			</div>
		</div>	
	</div>
	</c:if>
	<c:if test="${empty sessionScope.mvo.mem_name}">
		<h1>Unauthorized Access</h1>
		<a href="loginForm">go to login page</a>
	</c:if>
</body>
</html>