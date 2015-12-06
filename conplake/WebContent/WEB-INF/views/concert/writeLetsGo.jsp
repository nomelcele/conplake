<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<div id="mdBody_writeLetsGo">
	<p id="p_writeLetsGo">
		<input id="titleLetsGo" name="input_searchReview" class="inputStyle input_searchReview" type="text" placeholder="글 제목을 입력하세요." autocomplete="off" >
	   	<select class="inputStyle input_categoryReview" id="subjectLetsGo">
	           <option selected="selected" value="함께가요">함께가요</option>
	           <option value="캠핑해요">캠핑해요</option>
	           <option value="카풀해요">카풀해요</option>
	       </select>
	      </p>
	      
	      <textarea class="inputStyle" id="contentLetsGo" placeholder="글 내용을 입력하세요."></textarea>	
	<input id="write_review" class="innerButton button" type="button" value="등록" onclick="writeLetsgo()"/>
	<input id="write_review2" class="innerButton button" type="button" value="취소" onclick="mdOpen_letsGo()"/>
</div>