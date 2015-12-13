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
    			<a id="a_addMenu" href="#" onclick="toggle_addMenu(); return false;"> 정보 등록</a></li>
    		</li>
    		
    		<li>
	    		<c:if test="${!empty sessionScope.mvo.mem_name}">
	    			<a id="a_myMenu" href="#" onclick="toggle_myMenu(); return false;">&#128100; <strong>${sessionScope.mvo.mem_name}</strong> 님 환영합니다.</a></li>
	    		</c:if>
    		</li>
        </ul>
        <ul class="pop" id="pop_myMenu">
        	<li><a href="#" onclick="modifyInfoForm(); return false;">개인정보수정</a></li>
        	<li id="mypage"><a href="#">마이페이지</a></li>
        	<li><a href="#" onclick="mdOpen_fri_header(${sessionScope.mvo.mem_num}); return false;">친구목록</a></li>
        	<li><a href="#" onclick="mdOpen_note_header(${sessionScope.mvo.mem_num}); return false;">쪽지</a></li>
        	<li id="logout"><a href="logout">로그아웃</a></li>
        </ul>
        
        <ul class="pop" id="pop_addMenu">
        	<li><a href="addConcertForm">공연정보</a></li>
        	<li><a href="addArtistForm">아티스트정보</a></li>
        	
        </ul>
    	</div>    
       <div id="modalWindowWrap_note_header">
       		<div id="modalWindow3">	
       			<div class="mdHeader">
       				<p>NOTE<input class="mdClose" type="button" value="X" onclick="mdClose_note_header()"/></p>
       			</div>
       			<div id="mdBody_left">
       				<ul>
       					<li><input class="innerButton" id="write_note" type="button" value="쪽지 쓰기" onclick="writeNoteForm()"/></li>
       					<li><a href="#" onclick="mdOpen_note_header(${sessionScope.mvo.mem_num}); return false;">받은 쪽지함 <span></span></a></li>
       					<li><a href="#" onclick="sentNotesList(${sessionScope.mvo.mem_num}); return false;">보낸 쪽지함 <span></span></a></li>
       				</ul>
       			</div>
       			<div id="mdBody_right">
       				
       				
       				
       			</div>
            			
            			
            		
       </div>
        
    </div>
    <!-- 친구 목록 (S) -->
    <div id="modalWindowWrap_fri_header">
    </div>
    
    	
    <div class="gnb">
    	<a id="logo" href="main"><img id="imgLogo" src="resources/img/logo_main.png" alt="CONPLAKE" /></a>
    </div>
</header>