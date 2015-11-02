<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
	<div class="util_menu">
    	<ul>
    		<c:if test="${!empty sessionScope.mvo.mem_name}">
    			<li><strong>${sessionScope.mvo.mem_name}</strong> 님 환영합니다.</li>
    		</c:if>
        	<li id="mypage"><a href="#">마이페이지</a></li>
            <li id="logout"><a href="logout">로그아웃</a></li>
        </ul>
    </div>
    <div class="gnb">
    	<a id="logo" href="#"><img id="imgLogo" src="resources/img/logo_main.png" alt="CONPLAKE" /></a>
    </div>
</header>