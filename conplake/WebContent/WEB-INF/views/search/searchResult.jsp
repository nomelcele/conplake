<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    <h1>RESULTS</h1>
        
            <ul class="ul_search">
            <c:choose>
            	<c:when test="${resultType eq 'concert'}">
	            	<c:forEach var="conResult" items="${conResult}">
		            	<li id="list_search">
		                    <a href="concertInfo?con_num=${conResult.con_num}"><img width="100" height="100" alt="콘서트이미지1" src="${conResult.con_poster}"	style="float:left">
		                       	<div id="search_info">
		                            <p class="concert_title">${conResult.con_name}</p>
		                            <p class="concert_date">${conResult.con_startdate} ~ ${conResult.con_enddate}</p>
		                            <p class="concert_place">${conResult.venuename}</p>
		                        </div></a>
		                </li>
	            	</c:forEach>
            	</c:when>
            	<c:when test="${resultType eq 'concerthall'}">
            		<c:forEach var="challResult" items="${challResult}">
		            	<li id="list_search">
		                    <a href="concerthallInfo?chall_num=${challResult.chall_num}"><img width="100" height="100" alt="콘서트이미지1" src="${challResult.chall_img}"	style="float:left">
		                       	<div id="search_info">
		                            <p class="concert_title">${challResult.chall_name}</p>
		                            <p class="concert_date">${challResult.chall_addr}</p>
		                        </div></a>
		                </li>
	            	</c:forEach>
            	</c:when>
            	<c:otherwise>
            	    <c:forEach var="artResult" items="${artResult}">
		            	<li id="list_search">
		                    <a href="artistInfo?art_num=${artResult.art_num}"><img width="100" height="100" alt="콘서트이미지1" src="${artResult.art_img}"	style="float:left">
		                       	<div id="search_info">
		                            <p class="concert_title">${artResult.art_name}</p>
		                        </div></a>
		                </li>
	            	</c:forEach>
            	</c:otherwise>
            </c:choose>	
                
                
                
<!--             	<li id="list_search"> -->
<!--                     <a href="#"><img width="100" height="100" alt="콘서트이미지1" src="resources/img/nell0.png"	style="float:left"> -->
<!--                        	<div id="search_info"> -->
<!--                             <p class="concert_title">2015 넬 단독콘서트 NELL’S SEASON ‘201509’</p> -->
<!--                             <p class="concert_date">2014.09.18 ~ 2015.09.20</p> -->
<!--                             <p class="concert_place">올림픽공원 우리금융아트홀</p> -->
<!--                         </div></a> -->
<!--                 </li> -->
            
            </ul>
