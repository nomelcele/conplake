<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
    <h1>USER MY PAGE
    	<c:if test="${isFriend eq 'n'}">
    		<input id="addFriend" class="innerButton button" type="button" value="친구 추가" onclick="addFriend(${sessionScope.mvo.mem_num},${myProfile.mem_num})"/>
    	</c:if>
    	<c:if test="${isFriend eq 'y'}">
    		<input id="addFriend" class="innerButton button" type="button" value="친구 해제" onclick="deleteFriend(${sessionScope.mvo.mem_num},${myProfile.mem_num},'myPage')"/>
    	</c:if>
    </h1>
    
	<div id="userProfile">
		<div id="profile_img">
	    	<img src="resources/memberImg/${myProfile.mem_img}" width="150" height="150" />
	    </div>
		<div id="profileCard">
	        <p id="p_userId">${myProfile.mem_name}</p>
	        <p id="p_introduce">${myProfile.mem_intro}</p>
	    </div>
	</div>
	
	<div class="myPageContents" id="myPageContent1">
		<p class="p_myPageContents">관심 공연</p>
	
		<div class="scrollContents" id="scrollContent1">
		    <ul class="ul_scroll" id="ul_likeToGo">
		    	<c:forEach var="likedConcerts" items="${likedConcerts}">
			        <li class="li_scroll" id="li_likeToGo">
			            <a href="concertInfo?con_num=${likedConcerts.con_num}"><img width="158" height="208" alt="콘서트이미지1" src="${likedConcerts.con_poster}"></a>
			            <p class="p_scroll">${likedConcerts.con_name}</p>
			        </li>
		        </c:forEach>

		    </ul>
		</div>
	
		<div class="scrollBars" id="scrollBar1">
			<div class="bars" id="bar1"></div>
		</div>
	</div>
	
	
	<div class="myPageContents" id="myPageContent2">
	<p class="p_myPageContents">관심 아티스트</p>
	
	<div class="scrollContents" id="scrollContent2">
	    <ul class="ul_scroll" id="ul_likeArtist">
	    	<c:forEach var="likedArtists" items="${likedArtists}">
		        <li class="li_scroll" id="li_likeArtist">
		            <a href="artistInfo?art_num=${likedArtists.art_num}"><img width="158" height="158" alt="콘서트이미지1" src="${likedArtists.art_img}"></a>
		            <p class="p_scroll">${likedArtists.art_name}</p>
		        </li>
		    </c:forEach>

	    </ul>
	</div>
	
	<div class="scrollBars" id="scrollBar2">
		<div class="bars" id="bar2"></div>
	 </div>
	</div>
	
	<div class="myPageContents" id="myPageContent3">
		<p class="p_myPageContents" id="p_myPageContent3">마이 리뷰</p>
		<table class="table_list">
	    	<tr class="tr_list">
	        	<th class="reviewNum" id="myReviewNum"><p>번호</p></th>
	        	<th id="myReviewConTitle"><p>공연 제목</p></th>
	            <th class="reviewTitle" id="myReviewTitle"><p>제목</p></th>
	            <th class="reviewDate" id="myReviewDate"><p>날짜</p></th>
	        </tr>
	        <c:forEach var="myReviews" items="${myReviews}">
		        <tr class="tr_list">
		        	<td class="reviewNum" id="myReviewNum"><p>${myReviews.post_num}</p></td>
		        	<td id="myReviewConTitle"><p><a href="concertInfo?con_num=${myReviews.post_concert}">${myReviews.concertname}</a></p></td>
		            <td class="reviewTitle" id="myReviewTitle"><p><a href="readReview?post_num=${myReviews.post_num}">${myReviews.post_title}</a></p></td>
		            <td class="reviewDate" id="myReviewDate"><p>${myReviews.post_date}</p></td>
		        </tr>
		    </c:forEach>
	        
	        
		</table>
	    
	    <p id="p_myReview">
	    	<span>
	        	<a href="#" class="mPage" id="mPage_prev"><</a>
	        	<a href="#">1</a>
	            <a href="#">2</a> 
	             <a href="#">3</a> 
	             <a href="#">4</a> 
	             <a href="#">5</a> 
	             <a href="#">6</a> 
	             <a href="#">7</a> 
	             <a href="#">8</a> 
	             <a href="#">9</a> 
	            <a href="#" class="mPage" id="mPage_next">></a>
	        </span>
	    
	    </p>
	</div>
	
	
	<footer></footer>