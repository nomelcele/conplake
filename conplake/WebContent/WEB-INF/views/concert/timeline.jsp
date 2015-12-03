<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
	<!-- 타임라인 -->
	    <input type="hidden" id="concertNumber" value="${concertNumber}">
	    <input type="hidden" id="currentUserNum" value="${sessionScope.mvo.mem_num}">
            	<div id="timeLineWrap" class="timeLine">
            		<div id="timeLineHeader" class="timeLine">
            			<p>TIMELINE</p>
            		</div>
            		
            		<div id="timeLineBody" class="timeLine">
            			<ul>
            			<c:forEach var="timeline" items="${timeline}">
	            			<li>
	            				<div class="tLImgWrap"><img src="resources/memberImg/${timeline.authorimg}" width="50" height="50"/></div>
	            				<div class="tLTextWrap">
	            					<p id="tLUserName">${timeline.authorname}<span>${timeline.tl_date}</span></p>
	            					<p id="tLText">${timeline.tl_cont}</p>
	            					<p>
	            						<a href="" onclick="readTimelineComm(${timeline.tl_num}); return false;">댓글(${timeline.tlcount})</a>
	            						<c:if test="${sessionScope.mvo.mem_num eq timeline.tl_author}">
		            						<input class="innerButton button" id="mdDelete" type="button" value="삭제" onclick="deleteTlComm(${timeline.tl_num},${timeline.tl_concert})"/>
		            					</c:if>
	            					</p>
	            				</div>
	            			</li>
	            		</c:forEach>
            			</ul>
            		</div>
            		
            		<div id="timeLineFooter" class="timeLine">
            			<input class="inputStyle" id="tLInputText" type="text" placeholder="메시지를 입력하세요."/>
            			<input class="innerButton button" id="tLInputBtn" type="button" value="입력" onclick="writeTimeline(${sessionScope.mvo.mem_num},${concertNumber})"/>
            		</div>
            	</div>
            	
            	
            	<div class="modalWindowWrap">
            		<div class="modalWindow">	
            			<div class="mdHeader">
            				<p>REPLY<input class="mdClose" type="button" value="X" onclick="mdClose()"/></p>
            			</div>
            			<div class="mdBody">
            				<ul>
	            			
	            			</ul>
            			</div>
            			<div class="mdFooter">
            				<input class="inputStyle" id="mdInputText" type="text" placeholder="댓글 내용을 입력하세요."/>
            				<input class="innerButton button" id="mdInputBtn" type="button" value="입력"/>
            			</div>
            		</div>
            	</div>