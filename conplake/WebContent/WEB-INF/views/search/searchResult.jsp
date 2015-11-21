<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    <h1>RESULTS</h1>
        
            <ul class="ul_search">
            <c:choose>
            	<c:when test="${resultType eq 'concert'}">
	            	<c:forEach var="conResult" items="#{conResult}">
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
            		<c:forEach var="challResult" items="#{challResult}">
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
            	    <c:forEach var="artResult" items="#{artResult}">
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
            
<!--                 <li id="list_search"> -->
<!--                     <a href="#"><img width="100" height="100" alt="콘서트이미지1" src="resources/img/nell.jpg"	style="float:left"> -->
<!--                        	<div id="search_info"> -->
<!--                             <p class="concert_title">넬 콘서트 : NELL'S SEASON 2015 - Beautiful Day</p> -->
<!--                             <p class="concert_date">2015.05.22 ~ 2015.06.07</p> -->
<!--                             <p class="concert_place">이화여자대학교 삼성홀 </p> -->
<!--                         </div></a> -->
<!--                 </li> -->
                
                                
<!--                 <li id="list_search"> -->
<!--                     <a href="#"><img width="100" height="100" alt="콘서트이미지1" src="resources/img/nell2.png"	style="float:left"> -->
<!--                        	<div id="search_info"> -->
<!--                             <p class="concert_title">2014 넬 크리스마스 콘서트 CHRISTMAS IN NELL＇S ROOM 2014</p> -->
<!--                             <p class="concert_date">2014.12.24 ~ 2014.12.25</p> -->
<!--                             <p class="concert_place">서울 잠실학생체육관</p> -->
<!--                         </div></a> -->
<!--                 </li> -->
                
<!--                 <li id="list_search"> -->
<!--                     <a href="#"><img width="100" height="100" alt="콘서트이미지1" src="resources/img/nell3.png"	style="float:left"> -->
<!--                        	<div id="search_info"> -->
<!--                             <p class="concert_title">NELL＇S SEASON 2014 - NEWTON’S APPLE</p> -->
<!--                             <p class="concert_date">2014.04.03 ~ 2014.04.06</p> -->
<!--                             <p class="concert_place">블루스퀘어 삼성카드홀</p> -->
<!--                         </div></a> -->
<!--                 </li> -->
                
<!--                 <li id="list_search"> -->
<!--                     <a href="#"><img width="100" height="100" alt="콘서트이미지1" src="resources/img/nell4.png"	style="float:left"> -->
<!--                        	<div id="search_info"> -->
<!--                             <p class="concert_title">2013 넬 크리스마스 콘서트 CHRISTMAS IN NELL＇s ROOM 2013</p> -->
<!--                             <p class="concert_date">2013.12.24 ~ 2013.12.25</p> -->
<!--                             <p class="concert_place">서울 잠실학생체육관</p> -->
<!--                         </div></a> -->
<!--                 </li> -->
                
<!--                  <li id="list_search"> -->
<!--                     <a href="#"><img width="100" height="100" alt="콘서트이미지1" src="resources/img/nell5.png"	style="float:left"> -->
<!--                        	<div id="search_info"> -->
<!--                             <p class="concert_title"> 2012 넬 콘서트 NELL＇s ROOM</p> -->
<!--                             <p class="concert_date">2012.12.31</p> -->
<!--                             <p class="concert_place">서울 잠실학생체육관</p> -->
<!--                         </div></a> -->
<!--                 </li>           -->
            </ul>
