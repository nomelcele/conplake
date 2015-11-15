<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<input type="hidden" id="gpsx" value="${challInfo.chall_gpsx}">
<input type="hidden" id="gpsy" value="${challInfo.chall_gpsy}">

<h1>CONCERTHALL INFORMATION</h1>
        	<h2 id="concertTitle">${challInfo.chall_name}</h2>
<!--             	<div id="innerButtonBox"> -->
<!--                     <input id="GoTogether" class="innerButton button" type="button" value="함께가요" onclick=""/> -->
<!--                     <input id="likeToGo" class="innerButton button" type="button" value="갈거예요" onclick=""/> -->
<!--                 </div> -->
            
            <div id="concertProfileBox">
            	<div id="concertPoster">
                	<img src="${challInfo.chall_img}" width="225" height="300" />
                </div>
                <div id="concertProfile">
                    <p>주소 : <span>${challInfo.chall_addr}</span></p>
                    <p>문의 : <span>${challInfo.chall_tel}</span></p>
                    <p>공식 사이트 : <span><a href="${challInfo.chall_official}">${challInfo.chall_official}</a></span></p>
                </div>
            </div>
            
            <div id="tabBox">
            	<ul class="tabs">
                  <li><a class="tab" id="tab1" href="#">공연장 소개</a></li>
                  <li><a class="tab" id="tab2" href="#">공연장 지도</a></li>
                  <li><a class="tab" id="tab3" href="#">진행 중인 공연</a></li>
                  <li><a class="tab" id="tab4" href="#">좌석</a></li>
                  <li><a class="tab" id="tab5" href="#">좌석별 시야</a></li>
                </ul>
            </div>
            
            <div class="contentView" id="hallIntro">
            ${challInfo.chall_intro}
<!--             	<img src="../img/apple_intro.png" width="900"> -->
            </div>
            
            <div class="contentView" id="hallMap">
            	<div id="concerthallMap"></div>
            </div>
           
           <div class="contentView" id="hallOngoing">
            	<Table id="table_ongoing">
                    <tr class="tr_ongoing">
                        <th class="ongoingTitle"><p>공연 제목</p></th>
                        <th class="ongoingDate"><p>공연 기간</p></th>
                    </tr>
                    <c:forEach var="ongoingCons" items="${ongoingCons}">
	                    <tr class="tr_ongoing">
	                        <td class="ongoingTitle"><p><a href="concertInfo?con_num=${ongoingCons.con_num}">${ongoingCons.con_name}</a></p></td>
	                        <td class="ongoingDate"><p>${ongoingCons.con_startdate} ~ ${ongoingCons.con_enddate}</p></td>
	                    </tr>     
                    </c:forEach>
                </Table>
            </div>
            
            <div class="contentView" id="hallSeat">
            	<img src="${challInfo.chall_seatsimg}" />
            </div>
            
            <div class="contentView" id="seatReview">
            	<p id="p_searchSeatReview">
                	<select class="inputStyle input_seatFloor" >
                        <option selected>1층</option>
                        <option>2층</option>
                        <option>3층</option>
                    </select>
                    <select class="inputStyle input_seatStanding" >
                        <option selected>좌석</option>
                        <option>스탠딩</option>
                    </select>
                </p>
                
            		<ul class="ul_seatReview">
                        <li id="list_seat">
                            <a href="#"><img width="158" height="158" alt="콘서트이미지1" src="../img/gmf.png"></a>
                                <p class="seat_title">A구역 5열 3번</p>
                        </li>
                        
                        <li id="list_seat">
                            <a href="#"><img width="158" height="158" alt="콘서트이미지1" src="../img/apple.png"></a>
                                 <p class="seat_title">A구역 5열 3번</p>
                        </li>
                        
                        
                         <li id="list_seat">
                            <a href="#"><img width="158" height="158" alt="콘서트이미지1" src="../img/sg.png"></a>
                                 <p class="seat_title">A구역 5열 3번</p>
                        </li>
                        
                        <li id="list_seat">
                            <a href="#"><img width="158" height="158" alt="콘서트이미지1" src="../img/crush.png"></a>
                                 <p class="seat_title">A구역 5열 3번</p>
                        </li>
                      
                        <li id="list_seat" class="list_lastLine">
                            <a href="#"><img width="158" height="158" alt="콘서트이미지1" src="../img/apple.png"></a>
                                 <p class="seat_title">A구역 5열 3번</p>
                        </li>
                        
                        <li id="list_seat">
                            <a href="#"><img width="158" height="158" alt="콘서트이미지1" src="../img/crush.png"></a>
                                 <p class="seat_title">A구역 5열 3번</p>
                        </li>
                        
                        <li id="list_seat">
                            <a href="#"><img width="158" height="158" alt="콘서트이미지1" src="../img/gmf.png"></a>
                                 <p class="seat_title">A구역 5열 3번</p>
                        </li>
                        
                        <li id="list_seat">
                            <a href="#"><img width="158" height="158" alt="콘서트이미지1" src="../img/sg.png"></a>
                                 <p class="seat_title">A구역 5열 3번</p>
                        </li>
                        
                        <li id="list_seat">
                            <a href="#"><img width="158" height="158" alt="콘서트이미지1" src="../img/sg.png"></a>
                                 <p class="seat_title">A구역 5열 3번</p>
                        </li>
                        
                        <li id="list_seat" class="list_lastLine">
                            <a href="#"><img width="158" height="158" alt="콘서트이미지1" src="../img/sg.png"></a>
                                 <p class="seat_title">A구역 5열 3번</p>
                        </li>
            		</ul>
                
                <p id="p_review">
                	<span>
                    	<a href="#" class="page" id="page_prev"><</a>
                    	<a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#">4</a>
                        <a href="#">5</a>
                        <a href="#">6</a>
                        <a href="#">7</a>
                        <a href="#">8</a>
                        <a href="#">9</a>
                        <a href="#" class="page" id="page_next">></a>
                    </span>
                <input id="write_review" class="innerButton button" type="button" value="후기 작성"/></p>
            </div>
            
            
            
            <footer></footer>
