<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
    <h1>ARTIST INFORMATION</h1>
        	<h2 id="concertTitle">${artistInfo.art_name}</h2>
        	<div id="innerButtonBox">
            	    <c:if test="${liked eq 'n'}">
                    	<input id="likeToGo" class="innerButton" type="button" value="좋아요" onclick="location='likeArtist?ui_member='+${sessionScope.mvo.mem_num}+'&ui_artist='+${artistInfo.art_num}"/>
                    </c:if>
                    <c:if test="${liked eq 'y'}">
                    	<input class="innerButton" type="button" value="관심 해제" onclick="location='unlikeArtist?ui_member='+${sessionScope.mvo.mem_num}+'&ui_artist='+${artistInfo.art_num}"/>
                    </c:if>
            </div>
            	
            
            <div class="concertProfileBox profileSize">
            	<div class="concertPoster profileSize" >
                	<img src="${artistInfo.art_img}" width="225" height="225" alt=""/>
                </div>
                <div class="concertProfile profileSize">
     		        <p>국가 : <span>${artistInfo.art_country}</span></p>
              		<p>활동 유형 : <span>${artistInfo.art_type}</span></p>
              		<p>장르 : <span>${artistInfo.art_genre}</span></p>
                    <p>SNS : <span><a href="${artistInfo.art_sns}">${artistInfo.art_sns}</a></span></p>
                    <p>공식 사이트 : <span><a href="${artistInfo.art_official}">${artistInfo.art_official}</a></span></p>
                </div>
            </div>
            
            <div id="tabBox">
            	<ul class="tabs">
                  <li><a class="tab" id="tab1" href="#">프로필</a></li>
                  <li><a class="tab" id="tab2" href="#">공연 목록</a></li>
                  <li><a class="tab" id="tab3" href="#">대표곡</a></li>
                </ul>
            </div>
            
            <div class="contentView" id="artistIntro">
           		<p>${artistInfo.art_intro}</p>
            </div>
            
           
           <div class="contentView" id="artistConcert">
            	<Table id="table_list">
                    <tr class="tr_list">
                        <th id="ongoingTitle"><p>공연 제목</p></th>
                        <th id="ongoingDate"><p>공연 기간</p></th>
                    </tr>
                    <c:forEach var="artistConcerts" items="${artistConcerts}">
	                    <tr class="tr_list">
	                        <td id="ongoingTitle"><p><a href="concertInfo?con_num=${artistConcerts.con_num}">${artistConcerts.con_name}</a></p></td>
	                        <td id="ongoingDate"><p>${artistConcerts.con_startdate} ~ ${artistConcerts.con_enddate}</p></td>
	                    </tr>     
                   	</c:forEach>
                </Table>
            </div>
            
           
            
            <div class="contentView" id="artistSong">                
            		<ul class="ul_artistSong">
            		  <c:forEach var="hitSongs" items="${hitSongs}">
                        <li class="innerCards" >
                        	<div class="artistVideoWrap">
                        		<iframe width="416" height="246" src="${hitSongs.song_link}" frameborder="0" allowfullscreen></iframe>                        	
                        	</div>
                        	<div class="artistVideoTitle">
                        		<p><span>♬ </span>${hitSongs.song_title}</p>
                        	</div>
                        </li>
                        </c:forEach>
            
            		</ul>
            		
                
                <p class="p_review">
                	<input id="write_review" class="innerButton" type="button" value="후기 작성">
                </p>
            </div>
            
            
            
            <footer></footer>
    