<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

				<p id="p_searchReview">
                	<select class="inputStyle input_categoryReview" id="reviewSearchCategory" onchange="hallReviewList()">
                        <option selected="selected">선택</option>
                        <option value="sightsound">시야 및 음향</option>
                        <option value="facility">시설</option>
                    </select>
                </p>
            	
				<c:forEach var="reviews" items="${reviews}">
	            	<div class="box_hallReview">
	            		<div class="boxT_hallReview">
	            			<span class="span_hallReviewTitle"><a href="concertInfo?con_num=${reviews.post_concert}">${reviews.concertname}</a></span>
		            		<ul class="ul_hallReview">
		            			<a href="readReview?post_num=${reviews.post_num}"><li class="li_hallReviewSeat">${reviews.post_seat}</li>
		            			<li class="li_hallReviewDate">${reviews.post_date}</li></a>
		            			<li class="li_hallReviewId"><a href="myPage?mem_num=${reviews.post_author}">${reviews.authorname}</a></li>
		            		</ul>
	            		</div>
	            		
	            		<div class="boxB_hallReview">
	            			<c:if test="${type eq 'sightsound'}">
	            				<p id="content_hallReview">${reviews.post_sightsound}</p>
	            			</c:if>
	            			<c:if test="${type eq 'facility'}">
	            				<p id="content_hallReview">${reviews.post_facility}</p>
	            			</c:if>
	            		</div>
	            	</div>
            	</c:forEach>
            	
                <p class="p_review" id="page_hallReview">
                	<span id="span_hallReview">
                    	<a href="#" class="page" id="page_prev"><</a>
                    	<a href="#">1</a>
<!--                         <a href="#">2</a> -->
<!--                         <a href="#">3</a> -->
                        <a href="#" class="page" id="page_next">></a>
                    </span>
                </p>