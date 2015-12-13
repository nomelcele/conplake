<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    <Table class="table_list" id="table_letsGo">
			                    <tr class="tr_list">
			                        <th id="letsGoNum"><p>번호</p></th>
			                        <th id="letsGoTitle"><p>제목</p></th>
			                        <th id="letsGoId"><p>작성자</p></th>
			                        <th id="letsGoDate"><p>날짜</p></th>
			                        <th id="letsGoHits"><p>조회수</p></th>
			                    </tr>
								<c:forEach var="postList" items="${postList}">			                    
				                    <tr class="tr_list">
				                        <td id="letsGoNum"><p>${postList.post_num}</p></td>
				                        <td id="letsGoTitle"><p><a href="" onclick="readLetsgo(${postList.post_num}); return false;"><span>[${postList.post_subtype}] </span>${postList.post_title}</a></p></td>
				                        <td id="letsGoId"><p>${postList.authorname}</p></td>
				                        <td id="letsGoDate"><p>${postList.post_date}</p></td>
				                        <td id="letsGoHits"><p>${postList.post_hit}</p></td>
				                    </tr>
			                    </c:forEach>
			                                      
			                </Table>
			                <p class="p_review">
			                	<span>
			                    	<a href="#" class="page" id="page_prev"><</a>
			                    	<a href="#">1</a>
			<!--                         <a href="#">2</a> -->
			<!--                         <a href="#">3</a> -->
			                        <a href="#" class="page" id="page_next">></a>
			                    </span>

<%-- 			                <input id="write_review" class="innerButton" type="button" value="후기 작성" onclick="location='writeReviewForm?con_num=${conInfo.con_num}'"/> --%>

			                <input id="write_review" class="innerButton" type="button" value="게시물 작성" onclick="writeLetsgoForm()"/>

			                </p>