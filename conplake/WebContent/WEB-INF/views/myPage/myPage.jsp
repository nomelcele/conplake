<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
    <h1>MY PAGE</h1>
	<div id="userProfile">
		<div id="profile_img">
<!-- 	    	<img src="../img/apple.png" width="150" height="150" /> -->
	    	<img src="resources/memberImg/${myProfile.mem_img}" width="150" height="150" />
	    </div>
		<div id="profileCard">
<!-- 	        <p id="p_userId">user id</p> -->
<!-- 	        <p id="p_introduce">안녕하세요. 테스트입니다.</p> -->
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
<!-- 		        <li class="li_scroll" id="li_likeToGo"> -->
<!-- 		            <a href="#"><img width="158" height="208" alt="콘서트이미지1" src="../img/sg.png"></a> -->
<!-- 		            <p class="p_scroll">콘서트이름</p> -->
<!-- 		        </li> -->
<!-- 		        <li class="li_scroll" id="li_likeToGo"> -->
<!-- 		            <a href="#"><img width="158" height="208" alt="콘서트이미지1" src="../img/sg.png"></a> -->
<!-- 		            <p class="p_scroll">콘서트이름</p> -->
<!-- 		        </li> -->
<!-- 		        <li class="li_scroll" id="li_likeToGo"> -->
<!-- 		            <a href="#"><img width="158" height="208" alt="콘서트이미지1" src="../img/sg.png"></a> -->
<!-- 		            <p class="p_scroll">콘서트이름</p> -->
<!-- 		        </li> -->
<!-- 		        <li class="li_scroll" id="li_likeToGo"> -->
<!-- 		            <a href="#"><img width="158" height="208" alt="콘서트이미지1" src="../img/sg.png"></a> -->
<!-- 		            <p class="p_scroll">콘서트이름</p> -->
<!-- 		        </li> -->
<!-- 		        <li class="li_scroll" id="li_likeToGo"> -->
<!-- 		            <a href="#"><img width="158" height="208" alt="콘서트이미지1" src="../img/sg.png"></a> -->
<!-- 		            <p class="p_scroll">콘서트이름</p> -->
<!-- 		        </li> -->
<!-- 		        <li class="li_scroll" id="li_likeToGo"> -->
<!-- 		            <a href="#"><img width="158" height="208" alt="콘서트이미지1" src="../img/sg.png"></a> -->
<!-- 		            <p class="p_scroll">콘서트이름</p> -->
<!-- 		        </li> -->
<!-- 		         <li class="li_scroll" id="li_likeToGo"> -->
<!-- 		            <a href="#"><img width="158" height="208" alt="콘서트이미지1" src="../img/sg.png"></a> -->
<!-- 		            <p class="p_scroll">콘서트이름</p> -->
<!-- 		        </li> -->
<!-- 		        <li class="li_scroll" id="li_likeToGo"> -->
<!-- 		            <a href="#"><img width="158" height="208" alt="콘서트이미지1" src="../img/sg.png"></a> -->
<!-- 		            <p class="p_scroll">콘서트이름</p> -->
<!-- 		        </li> -->
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
<!-- 	        <li class="li_scroll" id="li_likeArtist"> -->
<!-- 	            <a href="#"><img width="158" height="158" alt="콘서트이미지1" src="../img/nell.jpg"></a> -->
<!-- 	            <p class="p_scroll">콘서트이름</p> -->
<!-- 	        </li> -->
<!-- 	        <li class="li_scroll" id="li_likeArtist"> -->
<!-- 	            <a href="#"><img width="158" height="158" alt="콘서트이미지1" src="../img/nell.jpg"></a> -->
<!-- 	            <p class="p_scroll">콘서트이름</p> -->
<!-- 	        </li> -->
<!-- 	        <li class="li_scroll" id="li_likeArtist"> -->
<!-- 	            <a href="#"><img width="158" height="158" alt="콘서트이미지1" src="../img/nell.jpg"></a> -->
<!-- 	            <p class="p_scroll">콘서트이름</p> -->
<!-- 	        </li> -->
<!-- 	        <li class="li_scroll" id="li_likeArtist"> -->
<!-- 	            <a href="#"><img width="158" height="158" alt="콘서트이미지1" src="../img/nell.jpg"></a> -->
<!-- 	            <p class="p_scroll">콘서트이름</p> -->
<!-- 	        </li> -->
<!-- 	        <li class="li_scroll" id="li_likeArtist"> -->
<!-- 	            <a href="#"><img width="158" height="158" alt="콘서트이미지1" src="../img/nell.jpg"></a> -->
<!-- 	            <p class="p_scroll">콘서트이름</p> -->
<!-- 	        </li> -->
<!-- 	        <li class="li_scroll" id="li_likeArtist"> -->
<!-- 	            <a href="#"><img width="158" height="158" alt="콘서트이미지1" src="../img/nell.jpg"></a> -->
<!-- 	            <p class="p_scroll">콘서트이름</p> -->
<!-- 	        </li> -->
<!-- 	         <li class="li_scroll" id="li_likeArtist"> -->
<!-- 	            <a href="#"><img width="158" height="158" alt="콘서트이미지1" src="../img/nell.jpg"></a> -->
<!-- 	            <p class="p_scroll">콘서트이름</p> -->
<!-- 	        </li> -->
<!-- 	        <li class="li_scroll" id="li_likeArtist"> -->
<!-- 	            <a href="#"><img width="158" height="158" alt="콘서트이미지1" src="../img/nell.jpg"></a> -->
<!-- 	            <p class="p_scroll">콘서트이름</p> -->
<!-- 	        </li> -->
	    </ul>
	</div>
	
	<div class="scrollBars" id="scrollBar2">
		<div class="bars" id="bar2"></div>
	 </div>
	</div>
	
	<div class="myPageContents" id="myPageContent3">
		<p class="p_myPageContents" id="p_myPageContent3">마이 리뷰</p>
		<table id="table_review">
	    	<tr class="tr_review">
	        	<th class="reviewNum"><p>번호</p></th>
	        	<th id="myReviewConTitle"><p>공연 제목</p></th>
	            <th class="reviewTitle" id="myReviewTitle"><p>제목</p></th>
	            <th class="reviewDate" id="myReviewDate"><p>날짜</p></th>
	        </tr>
	        <c:forEach var="myReviews" items="${myReviews}">
		        <tr class="tr_review">
		        	<td class="reviewNum"><p>${myReviews.post_num}</p></td>
		        	<td id="myReviewConTitle"><p><a href="concertInfo?con_num=${myReviews.post_concert}">${myReviews.concertname}</a></p></td>
		            <td class="reviewTitle" id="myReviewTitle"><p><a href="readReview?post_num=${myReviews.post_num}">${myReviews.post_title}</a></p></td>
		            <td class="reviewDate" id="myReviewDate"><p>${myReviews.post_date}</p></td>
		        </tr>
		    </c:forEach>
<!-- 	        <tr class="tr_review"> -->
<!-- 	         <td class="reviewNum"><p>12</p></td> -->
<!-- 	        	<td id="myReviewConTitle"><p><a href="">2015 넬 크리스마스 콘서트</a></p></td> -->
<!-- 	            <td class="reviewTitle" id="myReviewTitle"><p><a href="">후기 제목</a></p></td> -->
<!-- 	            <td class="reviewDate" id="myReviewDate"><p>2015.05.05</p></td> -->
<!-- 	        </tr> -->
<!-- 	        <tr class="tr_review"> -->
<!-- 	        	<td class="reviewNum"><p>12</p></td> -->
<!-- 	        	<td id="myReviewConTitle"><p><a href="">2015 버즈 전국투어 콘서트 'The Original' - 서울</a></p></td> -->
<!-- 	            <td class="reviewTitle" id="myReviewTitle"><p><a href="">후기 제목</a></p></td> -->
<!-- 	            <td class="reviewDate" id="myReviewDate"><p>2015.05.05</p></td> -->
<!-- 	        </tr> -->
<!-- 	        <tr class="tr_review"> -->
<!-- 	        	<td class="reviewNum"><p>12</p></td> -->
<!-- 	        	<td id="myReviewConTitle"><p><a href="">공연이름이름이름</a></p></td> -->
<!-- 	            <td class="reviewTitle" id="myReviewTitle"><p><a href="">후기 제목</a></p></td> -->
<!-- 	            <td class="reviewDate" id="myReviewDate"><p>2015.05.05</p></td> -->
<!-- 	        </tr> -->
<!-- 	        <tr class="tr_review"> -->
<!-- 	        	<td class="reviewNum"><p>12</p></td> -->
<!-- 	        	<td id="myReviewConTitle"><p><a href="">공연이름이름이름</a></p></td> -->
<!-- 	            <td class="reviewTitle" id="myReviewTitle"><p><a href="">후기 제목</a></p></td> -->
<!-- 	            <td class="reviewDate" id="myReviewDate"><p>2015.05.05</p></td> -->
<!-- 	        </tr> -->
<!-- 	        <tr class="tr_review"> -->
<!-- 	         <td class="reviewNum"><p>12</p></td> -->
<!-- 	        	<td id="myReviewConTitle"><p><a href="">공연이름이름이름</a></p></td> -->
<!-- 	            <td class="reviewTitle" id="myReviewTitle"><p><a href="">후기 제목</a></p></td> -->
<!-- 	            <td class="reviewDate" id="myReviewDate"><p>2015.05.05</p></td> -->
<!-- 	        </tr> -->
<!-- 	        <tr class="tr_review"> -->
<!-- 	        	<td class="reviewNum"><p>12</p></td> -->
<!-- 	        	<td id="myReviewConTitle"><p><a href="">공연이름이름이름</a></p></td> -->
<!-- 	            <td class="reviewTitle" id="myReviewTitle"><p><a href="">후기 제목</a></p></td> -->
<!-- 	            <td class="reviewDate" id="myReviewDate"><p>2015.05.05</p></td> -->
<!-- 	        </tr> -->
	        
	        
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