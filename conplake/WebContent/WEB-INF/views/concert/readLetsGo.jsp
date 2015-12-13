<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<table class="table_list" id="table_readLetsGo">
	<tr class="tr_list" id="tr_titleReadLetsGo">
	    <th id="th_titleReadReview" ><span>[${post.post_subtype}] </span>${post.post_title}</th>
	</tr>
	
	<tr class="tr_list" id="tr_infoReadLetsGo">
	    <th id="th_infoReadLetsGo">
	    	<ul>
	        	<li><span id=""><a href="myPage?mem_num=${post.post_author}">${post.authorname}</a></span></li>
	            <li><span id="">${post.post_date}</span></li>
	        	<li><span>조회: </span><span id="">${post.post_hit}</span></li>
	        </ul>
	    </th>
	</tr>
	
	<tr class="tr_list" id="tr_readLetsGo">
	    <td class="td_readLetsGo">${post.post_cont}</td>
	    
	</tr>
	
	<tr class="tr_readLetsGo" id="tr_button">
	    <td>

<!-- 	    	<input id="listViewletsGo" class="innerButton" type="button" value="목록" onclick=""/> -->
<!-- 	    	<input id="deleteReview" class="innerButton" type="button" value="글 삭제" onclick=""/> -->
<!-- 	    	<input id="editReview" class="innerButton" type="button" value="수정" onclick=""/> -->

	    	<input id="listViewletsGo" class="innerButton" type="button" value="목록" onclick="mdOpen_letsGo()"/>
			<c:if test="${sessionScope.mvo.mem_num eq post.post_author}">	    	
	    		<input id="deleteReview" class="innerButton" type="button" value="글 삭제" onclick=""/>
	    		<input id="editReview" class="innerButton" type="button" value="수정" onclick=""/>
	    	</c:if>

	    </td>
	</tr>

</table>
	

<p class="p_reply p_replyLetsGo">REPLY</p>
	
<table class="table_reply table_replyLetsGo"> <!-- 유저 댓글 보이는 목록 -->                        
	<!-- 유저 댓글내용 
	<tr class="tr_readReply tr_reply" > 
	    <td class="td_readReply" id="td_replyId" >
	    	<img src="resources/memberImg/${commList.authorimg}" width="60" height="60"/>
	    </td>
	    
	    <td class="td2_readReply" id="td_replyContent">
	    	<p id="p_replyId">아이디</p>
	    	<p id="p_replyContent">sdffsda</p>
	    </td>
	    <td class="td_readReply" id="td_replyDate">
	    	<p id="p_replyDate">2015.05.05</p>
	    	<p><input id="deleteReply" class="innerButton" type="button" value="삭제" onclick=""/></p>
	    	
	    </td>
	</tr>
	 -->
	    
</table>
	
	
<form id="writeReviewCommForm" action="writePostComm" method="post">
	<input type="hidden" id="comm_author" name="comm_author" value="${sessionScope.mvo.mem_num}">
	<input type="hidden" id="comm_post" name="comm_post" value="${reviewDetail.post_num}">
	<div class="div_inputReply div_inputReplyLetsGo"> <!-- 고정부분 댓글 입력 -->
       	<textarea name="comm_cont" id="comm_cont" class="inputStyle input_search" placeholder="댓글 내용을 입력하세요." ></textarea>
       	<input id="writeReviewCommBtn" class="innerButton" type="button" value="입력"/>
	</div>
</form>
