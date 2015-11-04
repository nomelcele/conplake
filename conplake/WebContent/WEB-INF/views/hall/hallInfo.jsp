<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>HALL INFORMATION</h1>
        	<h2 id="concertTitle">쏜애플(THORNAPPLE) 콘서트 ‘한낮’
            	<div id="innerButtonBox">
                    <input id="GoTogether" class="innerButton button" type="button" value="함께가요" onclick=""/>
                    <input id="likeToGo" class="innerButton button" type="button" value="갈거예요" onclick=""/>
                </div>
            </h2>
            
            <div id="concertProfileBox">
            	<div id="concertPoster">
                	<img src="../img/apple.png" width="225" height="300" />
                </div>
                <div id="concertProfile">
                	<hgroup>
                    <h4>장르 : 발라드</h4>
                    <h4>일시 : 2014/12/24 ~ 2014/12/25</h4>
                    <h4>장소 : <span><a href="#">서울 잠실 학생체육관</a></span></h4>
                    <h4>출연 : <span><a href="#">쏜애플</a></span></h4>
                    <h4>관란등급 : 만 7세 이상</h4>
                    <h4>관람시간 : 120분</h4>
                    </hgroup>
                </div>
            </div>
            
            <div id="tabBox">
            	<ul class="tabs">
                  <li><a class="tab" id="tab1" href="#">공연장 소개</a></li>
                  <li><a class="tab" id="tab2" href="#">공연장 약도</a></li>
                  <li><a class="tab" id="tab3" href="#">진행 중인 공연</a></li>
                  <li><a class="tab" id="tab4" href="#">좌석</a></li>
                  <li><a class="tab" id="tab5" href="#">좌석별 시야</a></li>
                </ul>
            </div>
            
            <div class="contentView" id="hallIntro">
            	<img src="../img/apple_intro.png" width="900">
            </div>
            
            <div class="contentView" id="hallMap">
            	<img src="../img/map.png" />
            </div>
           
           <div class="contentView" id="hallOngoing">
            	<Table id="table_ongoing">
                    <tr class="tr_ongoing">
                        <th class="ongoingTitle"><p>공연 제목</p></th>
                        <th class="ongoingDate"><p>공연 기간</p></th>
                    </tr>
                    <tr class="tr_ongoing">
                        <td class="ongoingTitle"><p></p></td>
                        <td class="ongoingDate"><p></p></td>
                    </tr>
                    <tr class="tr_ongoing">
                        <td class="ongoingTitle"><p></p></td>
                        <td class="ongoingDate"><p></p></td>
                    </tr>
                    
                  
                </Table>
            </div>
            
            <div class="contentView" id="hallSeat">
            	<img src="../img/seat1.png" />
            </div>
            
            <div class="contentView" id="seatReview">
            	<p id="p_searchReview">
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

</body>
</html>