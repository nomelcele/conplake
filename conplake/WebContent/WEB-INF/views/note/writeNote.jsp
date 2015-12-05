<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <div id="mdBody_writeNote">
		<p>받는 사람 : 
			<c:if test="${replyId ne ''}">
				<input type="text" class="inputStyle input_search" id="toWriteNote" value="${replyId.mem_id}"/>
			</c:if>
		</p>
		
		<textarea class="inputStyle" id="contentWriteNote" placeholder="쪽지 내용을 입력하세요."></textarea>
		<p>
			<input id="writeNote" class="rButton" type="button" onclick="writeNote(${sessionScope.mvo.mem_num})" value="전송"/>
			<input id="noWriteNote" class="rButton" type="button" onclick="mdOpen_note_header(${sessionScope.mvo.mem_num})" value="취소"/>
		</p>
	</div>
