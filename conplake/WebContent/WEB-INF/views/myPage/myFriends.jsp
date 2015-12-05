<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<div id="modalWindow_fri">	
       			<div class="mdHeader">
       				<p>친구 목록<input class="mdClose" type="button" value="X" onclick="mdClose_fri_header()"/></p>
       			</div>
       			<div class="mdBody" id="mdBody_fri">
       				<ul class="ul_commList" id="ul_fri">
       					<c:forEach var="friends" items="${friends}">
	            			<li>
	            				<div class="mdImgWrap"><img src="resources/memberImg/${friends.mem_img}" width="50" height="50"/></div>
	            				<div class="mdTextWrap">
	            					<p id="p_friend">
	            						<a href="myPage?mem_num=${friends.mem_num}"><strong>${friends.mem_name}<span> (${friends.mem_id})</span></strong></a>
	         							<input class="innerButton button" id="mdDelete" type="button" value="삭제" onclick="deleteFriend(${sessionScope.mvo.mem_num},${friends.mem_num})"/>
	         							<input class="innerButton button" id="friendNoteBtn" type="button" value="&#9993;" onclick=""/>
	            					</p>
	            				</div>
	            			</li>
            			</c:forEach>
           			</ul>
       			</div>
       </div>    
    