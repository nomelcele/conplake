<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<div id="mdBody_writeLetsGo">
	<p id="p_writeLetsGo">
		<input id="titleLetsGo" name="input_searchReview" class="inputStyle input_searchReview" type="text" placeholder="글 제목을 입력하세요." autocomplete="off" >
	   	<select class="inputStyle input_categoryReview" id="subjectLetsGo">
	           <option selected="selected" value="title">같이가요</option>
	           <option value="author">캠핑해요</option>
	           <option value="cont">카풀해요</option>
	       </select>
	      </p>
	      
	      <textarea class="inputStyle" id="contentLetsGo" placeholder="글 내용을 입력하세요."></textarea>	
	<input id="write_review" class="innerButton button" type="button" value="등록" onclick=""/>
	<input id="write_review2" class="innerButton button" type="button" value="취소" onclick=""/>
</div>