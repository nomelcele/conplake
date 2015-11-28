<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!-- 타임라인 댓글 -->  
            		<div id="modalWindow">	
            			<div id="mdHeader">
            				<p>REPLY<input id="mdClose" type="button" value="X" onclick="mdClose()"/></p>
            			</div>
            			<div id="mdBody">
            				<ul>
<!-- 	            			<li> -->
<!-- 	            				<div class="mdImgWrap"><img src="resources/img/nell.jpg" width="50" height="50"/></div> -->
<!-- 	            				<div class="mdTextWrap"> -->
<!-- 	            					<p id="mdUserName">user_name<span>2015.05.05</span></p> -->
<!-- 	            					<p id="mdText">text최대 두줄</p> -->
<!-- 	            					<input class="innerButton button" id="mdDelete" type="button" value="삭제"/> -->
<!-- 	            				</div> -->
<!-- 	            			</li> -->
	            			
	            			<c:forEach var="commList" items="${commList}">
		            			<li>
		            				<div class="mdImgWrap"><img src="resources/memberImg/${commList.authorimg}" width="50" height="50"/></div>
		            				<div class="mdTextWrap">
		            					<p id="mdUserName">${commList.authorname}<span>${commList.comm_date}</span></p>
		            					<p id="mdText">${commList.comm_cont}</p>
		            					<p>
		            						<c:if test="${sessionScope.mvo.mem_num eq commList.comm_author}">
		            							<input class="innerButton button" id="mdDelete" type="button" value="삭제"/>
		            						</c:if>
		            					</p>
		            				</div>
		            			</li>
	            			</c:forEach>
	            			</ul>
            			</div>
            			<div id="mdFooter">
            				<input class="inputStyle" id="mdInputText" type="text" placeholder="댓글 내용을 입력하세요."/>
            				<input class="innerButton button" id="mdInputBtn" type="button" value="입력" onclick="writeTimelineComm(${sessionScope.mvo.mem_num},${timelineNumber})"/>
            			</div>
            		</div>