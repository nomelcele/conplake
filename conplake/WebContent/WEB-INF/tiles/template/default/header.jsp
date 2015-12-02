<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
	<form id="myPageForm" action="myPage" method="post">
		<input type="hidden" name="mem_num" value="${sessionScope.mvo.mem_num}">
	</form>
	<div class="util_menuWrap">
    	<ul class="util_menu">
    		<li>
    			<a id="a_addMenu" href="#" onclick="toggle_addMenu(); return false;">정보 등록</a></li>
    		</li>
    		
    		<li>
	    		<c:if test="${!empty sessionScope.mvo.mem_name}">
	    			<a id="a_myMenu" href="#" onclick="toggle_myMenu(); return false;"><strong>${sessionScope.mvo.mem_name}</strong> 님 환영합니다.</a></li>
	    		</c:if>
    		</li>
        </ul>
        <ul class="pop" id="pop_myMenu">
        	<li><a href="#">개인정보수정</a></li>
        	<li id="mypage"><a href="#">마이페이지</a></li>
        	<li><a href="#">친구목록</a></li>
        	<li><a href="#">쪽지</a></li>
        	<li id="logout"><a href="logout">로그아웃</a></li>
        </ul>
        
        <ul class="pop" id="pop_addMenu">
        	<li><a href="addConcertForm">공연정보</a></li>
        	<li><a href="addArtistForm">아티스트정보</a></li>
        	
        </ul>
    </div>
    <div class="gnb">
    	<a id="logo" href="main"><img id="imgLogo" src="resources/img/logo_main.png" alt="CONPLAKE" /></a>
    </div>
</header>