<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
    <h1>ARTIST INFORMATION</h1>
        	<h2 id="concertTitle">${artistInfo.art_name}
        	<div id="innerButtonBox">
            	    <c:if test="${liked eq 'n'}">
                    	<input id="likeToGo" class="innerButton button" type="button" value="좋아요" onclick="location='likeArtist?ui_member='+${sessionScope.mvo.mem_num}+'&ui_artist='+${artistInfo.art_num}"/>
                    </c:if>
                    <c:if test="${liked eq 'y'}">
                    	<input id="likeToGo" class="innerButton button" type="button" value="관심 해제" onclick="location='unlikeArtist?ui_member='+${sessionScope.mvo.mem_num}+'&ui_artist='+${artistInfo.art_num}"/>
                    </c:if>
            </div></h2>
            	
            
            <div class="concertProfileBox profileSize">
            	<div class="concertPoster profileSize" >
                	<img src="${artistInfo.art_img}" width="225" height="225" />
                </div>
                <div class="concertProfile profileSize">
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
            ${artistInfo.art_intro}
<!--             	<img src="../img/apple_intro.png" width="900"> -->
            </div>
            
           
           <div class="contentView" id="artistConcert">
            	<Table id="table_ongoing">
                    <tr class="tr_ongoing">
                        <th class="ongoingTitle"><p>공연 제목</p></th>
                        <th class="ongoingDate"><p>공연 기간</p></th>
                    </tr>
                    <c:forEach var="artistConcerts" items="${artistConcerts}">
	                    <tr class="tr_ongoing">
	                        <td class="ongoingTitle"><p><a href="concertInfo?con_num=${artistConcerts.con_num}">${artistConcerts.con_name}</a></p></td>
	                        <td class="ongoingDate"><p>${artistConcerts.con_startdate} ~ ${artistConcerts.con_enddate}</p></td>
	                    </tr>     
                   	</c:forEach>
                </Table>
            </div>
            
           
            
            <div class="contentView" id="artistSong">                
            		<ul class="ul_artistSong">
                        <li class="innerCards innerCard1" >
                        	<div class="artistVideoWrap">
                        		
                        	</div>
                        	<div class="artistVideoTitle">
                        		<p><span>♬ </span>PIA - Urban Explorer</p>
                        	</div>
                        </li>
                        <li class="innerCards innerCard2" >
                        	<div class="artistVideoWrap">
                        		
                        	</div>
                        	<div class="artistVideoTitle">
                        		<p><span>♬ </span>PIA - Urban Explorer</p>
                        	</div>
                        </li>
            		</ul>
            		
            		<ul class="ul_artistSong">
                        <li class="innerCards innerCard1" >
                        	<div class="artistVideoWrap">
                        		
                        	</div>
                        	<div class="artistVideoTitle">
                        		<p><span>♬ </span>PIA - Urban Explorer</p>
                        	</div>
                        </li>
                        <li class="innerCards innerCard2" >
                        	<div class="artistVideoWrap">
                        		
                        	</div>
                        	<div class="artistVideoTitle">
                        		<p><span>♬ </span>PIA - Urban Explorer</p>
                        	</div>
                        </li>
            		</ul>
            		
            		<ul class="ul_artistSong">
                        <li class="innerCards innerCard1" >
                        	<div class="artistVideoWrap">
                        		
                        	</div>
                        	<div class="artistVideoTitle">
                        		<p><span>♬ </span>PIA - Urban Explorer</p>
                        	</div>
                        </li>
                        <li class="innerCards innerCard2" >
                        	<div class="artistVideoWrap">
                        		
                        	</div>
                        	<div class="artistVideoTitle">
                        		<p><span>♬ </span>PIA - Urban Explorer</p>
                        	</div>
                        </li>
            		</ul>
            		
                
                <p id="p_review">
                	<input id="write_review" class="innerButton button" type="button" value="후기 작성"/>
                </p>
            </div>
            
            
            
            <footer></footer>
    