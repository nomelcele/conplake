<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!-- 타임라인 댓글 -->  
            		<div class="modalWindow">	
            			<div class="mdHeader">
            				<p>REPLY<input class="mdClose" type="button" value="X" onclick="mdClose()"/></p>
            			</div>
            			<div class="mdBody">
            				<ul class="ul_commList">
	            			<c:forEach var="commList" items="${commList}">
		            			<li>
		            				<div class="mdImgWrap"><img src="resources/memberImg/${commList.authorimg}" width="50" height="50"/></div>
		            				<div class="mdTextWrap">
		            					<p id="mdUserName">${commList.authorname}<span>${commList.comm_date}</span></p>
		            					<p id="mdText">${commList.comm_cont}</p>
		            					<p>
		            						<c:if test="${sessionScope.mvo.mem_num eq commList.comm_author}">
		            							<input class="innerButton button" id="mdDelete" type="button" value="삭제" onclick="deleteTlComm(${commList.comm_num},${commList.comm_tl},'comm')"/>
		            						</c:if>
		            					</p>
		            				</div>
		            			</li>
	            			</c:forEach>
	            			</ul>
            			</div>
            			<div class="mdFooter">
            				<input class="inputStyle" id="mdInputText" type="text" placeholder="댓글 내용을 입력하세요."/>
            				<input class="innerButton button" id="mdInputBtn" type="button" value="입력" onclick="writeTimelineComm(${sessionScope.mvo.mem_num},${timelineNumber})"/>
            			</div>
            		</div>