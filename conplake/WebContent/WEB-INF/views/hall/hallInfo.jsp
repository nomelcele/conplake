<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<input type="hidden" id="gpsx" value="${challInfo.chall_gpsx}">
<input type="hidden" id="gpsy" value="${challInfo.chall_gpsy}">

<h1>CONCERTHALL INFORMATION</h1>
        	<h2 id="concertTitle">${challInfo.chall_name}</h2>
            <div class="concertProfileBox profileSize" >
            	<div class="concertPoster profileSize">
                	<img src="${challInfo.chall_img}" width="225" height="225" />
                </div>
                <div class="concertProfile profileSize">
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
                  <li><a class="tab" id="tab6" href="#">공연장 후기</a></li>
                </ul>
            </div>
            
            <div class="contentView" id="hallIntro">
          	  ${challInfo.chall_intro}
            </div>
            
            <div class="contentView" id="hallMap">
            	<div id="concerthallMap"></div>
            </div>
           
           <div class="contentView" id="hallOngoing">
            	<Table class="table_list">
                    <tr class="tr_list">
                        <th class="ongoingTitle" id="ongoingTitle"><p>공연 제목</p></th>
                        <th class="ongoingDate" id="ongoingDate"><p>공연 기간</p></th>
                    </tr>
                    <c:forEach var="ongoingCons" items="${ongoingCons}">
	                    <tr class="tr_list">
	                        <td class="ongoingTitle" id="ongoingTitle"><p><a href="concertInfo?con_num=${ongoingCons.con_num}">${ongoingCons.con_name}</a></p></td>
	                        <td class="ongoingDate" id="ongoingDate"><p>${ongoingCons.con_startdate} ~ ${ongoingCons.con_enddate}</p></td>
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
                        <option selected value="1">1층</option>
                        <option value="2">2층</option>
                        <option value="3">3층</option>
                    </select>
                    <select class="inputStyle input_seatStanding" >
                        <option selected value="seat">좌석</option>
                        <option value="stand">스탠딩</option>
                    </select>
                </p>
                
            		<ul class="ul_seatReview">
                        <c:forEach var="sightimgs" items="${sightimgs}">
	                        <li id="list_seat">
	                            <a href="resources/sightImg/${sightimgs.si_imgname}" rel="prettyPhoto" title="${sightimgs.si_floor}층 (${sightimgs.si_standseat}) ${sightimgs.si_area}구역 ${sightimgs.si_row}열 ${sightimgs.si_seatnum}번">                            
	                            	<img width="156" height="156" src="resources/sightImg/${sightimgs.si_imgname}">
	                            </a>
	                            <p class="seat_title">${sightimgs.si_area}구역 ${sightimgs.si_row}열 ${sightimgs.si_seatnum}번</p>
	                        </li>
                        </c:forEach>
                        
<!--                         <li id="list_seat"> -->
<!--                             <a href="resources/img/gmf.png" rel="prettyPhoto" title="This is the description">                             -->
<!--                             	<img width="156" height="156" src="resources/img/gmf.png"> -->
<!--                             </a> -->
<!--                             <p class="seat_title">A구역 5열 3번</p> -->
<!--                         </li> -->

            		</ul>
                
                <p class="p_review">
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
                <input id="write_review" class="innerButton button" type="button" onclick="uploadSeatPic()" value="사진 등록"/></p>
            </div>
            
            
            <div class="contentView" id="hallReview">
            	<p id="p_searchReview">
                	<span id="btn_searchReview"><a href="#"></a></span>
                    <input id="reviewSearchKeyword" name="input_searchReview" class="inputStyle input_searchReview" type="text" placeholder="검색어를 입력하세요." autocomplete="off" >
                	<select class="inputStyle input_categoryReview" id="reviewSearchCategory">
                        <option selected="selected" value="title">제목</option>
                        <option value="author">작성자</option>
                        <option value="cont">내용</option>
                    </select>
                </p>
            	<Table class="table_list">
                    <tr class="tr_list">
                        <th id="reviewNum"><p>번호</p></th>
                        <th id="reviewTitle"><p>제목</p></th>
                        <th id="reviewId"><p>작성자</p></th>
                        <th id="reviewDate"><p>날짜</p></th>
                        <th id="reviewHits"><p>조회수</p></th>
                    </tr>
                    <c:forEach var="reviewList" items="${reviewList}">
	                    <tr class="tr_list">
	                        <td id="reviewNum"><p>${reviewList.post_num}</p></td>
	                        <td id="reviewTitle"><p><a href="readReview?post_num=${reviewList.post_num}">${reviewList.post_title}</a></p></td>
	                        <td id="reviewID"><p>${reviewList.authorname}</p></td>
	                        <td id="reviewDate"><p>${reviewList.post_date}</p></td>
	                        <td id="reviewHits"><p>${reviewList.post_hit}</p></td>
	                    </tr>
                    </c:forEach>

                                      
                </Table>
                <p class="p_review">
                	<span id="span_hallReview">
                    	<a href="#" class="page" id="page_prev"><</a>
                    	<a href="#">1</a>
<!--                         <a href="#">2</a> -->
<!--                         <a href="#">3</a> -->
                        <a href="#" class="page" id="page_next">></a>
                    </span>
                </p>
            </div>
            
            <div class="modalWindowWrap">
            		<div id="modalWindow2">	
            			<div class="mdHeader">
            				<p>UPLOAD PICTURE<input class="mdClose" type="button" value="X" onclick="mdClose()"/></p>
            			</div>

            			

            			<form action="addSightimg" method="post" enctype="multipart/form-data">
            				<input type="hidden" name="si_concerthall" value="${challInfo.chall_num}">
	            			<div id="mdBody1">
	            				<p id="p_searchSeatReview">
	            					<span>관람석 위치</span>
				                	<select class="inputStyle input_seatFloor" name="si_floor">
				                        <option selected value="1">1층</option>
				                        <option value="2">2층</option>
				                        <option value="3">3층</option>
				                    </select>
				                    <select class="inputStyle input_seatStanding" name="si_standseat">
				                        <option selected value="좌석">좌석</option>
				                        <option value="스탠딩">스탠딩</option>
				                    </select>
				                    <input class="inputStyle inputSeat" name="si_area" placeholder="구역"/>
				                    <input class="inputStyle inputSeat" name="si_row" placeholder="열"/>
				                    <input class="inputStyle inputSeat" name="si_seatnum" placeholder="좌석"/>
				                </p>
	            			</div>
	            			<div id="mdBody2">
	            				<p class="rinputBox" id="p_seatPic">
								    <label id="label_seatPic">시야 사진</label>
								    <label class="inputLabel rInputStyle a_width input_fileImgBtn" id="">Browse..
								        <input type="file" name="sightimgFile" id="input_seatPic" class="rInputStyle input_fileImg"/>
								    </label>
								    
								    <input type="text" class="rInputStyle a_width input_fileImgName" id="input_seatPicName" readonly/> 
								</p>
								
								<div id="seatPicWrap"></div>
								<input class="innerButton" id="submit_seatPic" type="submit" value="올리기"/>
	            			</div>
            			</form>

            		</div>
            	</div>
            
            
            <footer></footer>
