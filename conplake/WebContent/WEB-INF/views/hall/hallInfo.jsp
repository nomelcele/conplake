<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<input type="hidden" id="gpsx" value="${challInfo.chall_gpsx}">
<input type="hidden" id="gpsy" value="${challInfo.chall_gpsy}">
<input type="hidden" id="concerthallNum" value="${challInfo.chall_num}">

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
                  <li><a class="tab" id="tab4" href="#">좌석표</a></li>
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
            	
            	<div id="div_seatPic">
            	<c:if test="${challInfo.chall_seatsimg ne null}"> 
            		<img src="resources/seatsImg/${challInfo.chall_seatsimg}" />
            	</c:if>
            	</div>
            	<p>
            		<input id="btn_Hallseat" class="rButton" type="button" onclick="uploadSeatReviewPic()" value="사진 등록"/>
            	</p>
            	
            </div>
            
            <div class="contentView" id="seatReview">
            	<p id="p_searchSeatReview">
                	<select class="inputStyle input_seatFloor" id="select_floor" onchange="searchSightimg(${challInfo.chall_num})">
                        <option selected value="1">1층</option>
                        <option value="2">2층</option>
                        <option value="3">3층</option>
                    </select>
                    <select class="inputStyle input_seatStanding" id="select_standseat" onchange="searchSightimg(${challInfo.chall_num})">
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
<!--                         <a href="#">2</a> -->
<!--                         <a href="#">3</a> -->
                        <a href="#" class="page" id="page_next">></a>
                    </span>
                	<input id="write_review" class="innerButton" type="button" onclick="uploadSeatPic()" value="사진 등록"/>
            	</p>
            </div>
            
            
            <div class="contentView" id="hallReview">
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
	            			<p id="content_hallReview">${reviews.post_sightsound}</p>
	            		</div>
	            	</div>
            	</c:forEach>
<!--             	<div class="box_hallReview"> -->
<!--             		<div class="boxT_hallReview"> -->
<!--             			<span class="span_hallReviewTitle">공연제목</span> -->
<!-- 	            		<ul class="ul_hallReview"> -->
<!--         					<li class="li_hallReviewSeat">B구역 11열 87</li> -->
<!-- 	            			<li class="li_hallReviewDate">2015.05.05</li> -->
<!-- 	            			<li class="li_hallReviewId"><a href="">user_id</a></li> -->
<!-- 	            		</ul> -->
<!--             		</div> -->
            		
<!--             		<div class="boxB_hallReview"> -->
<!--             			<p id="content_hallReview">sadfasdfadsfafd</p> -->
<!--             		</div> -->
<!--             	</div> -->
            	
                <p class="p_review" id="page_hallReview">
                	<span id="span_hallReview">
                    	<a href="#" class="page" id="page_prev"><</a>
                    	<a href="#">1</a>
<!--                         <a href="#">2</a> -->
<!--                         <a href="#">3</a> -->
                        <a href="#" class="page" id="page_next">></a>
                    </span>
                </p>
            </div>
            
            
            
            <!-- 좌석표 사진등록 모달 -->
            <div class="modalWindowWrap" id="modalWindowWrap_seat">
            		<div class="modalWindow2" id="modalWindow2_seat">	
            			<div class="mdHeader">
            				<p>UPLOAD PICTURE<input class="mdClose" type="button" value="X" onclick="mdClose()"/></p>
            			</div>
            			
            			<form action="uploadSeatsimg" method="post" enctype="multipart/form-data">
            			<input type="hidden" name="chall_num" value="${challInfo.chall_num}">
            			<div id="mdBody2">
            				<p class="rinputBox" id="p_seatPic">
							    <label id="label_seatPic">좌석표 이미지</label>
							    <label class="inputLabel rInputStyle a_width input_fileImgBtn" id="">Browse..
							        <input type="file" name="seatsimgFile" id="input_seatPic" class="rInputStyle input_fileImg"/>
							    </label>
							    
							    <input type="text" class="rInputStyle a_width input_fileImgName" id="input_seatPicName" readonly/> 
							</p>
							
							<div id="seatPicWrap"></div>
							<input class="innerButton" id="submit_seatPic" type="submit" value="올리기"/>
            			</div>
            			</form>

            		</div>
            	</div>
            
            
            
            <!-- 좌석별 시야 사진 등록 모달 -->
            <div class="modalWindowWrap" id="modalWindowWrap_seatReview">
            		<div class="modalWindow2">	
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
								    <label id="label_seatReviewPic">시야 사진</label>
								    <label class="inputLabel rInputStyle a_width input_fileImgBtn" id="">Browse..
								        <input type="file" name="sightimgFile" id="input_seatReviewPic" class="rInputStyle input_fileImg"/>
								    </label>
								    
								    <input type="text" class="rInputStyle a_width input_fileImgName" id="input_seatReviewPicName" readonly/> 
								</p>
								
								<div id="seatReviewPicWrap"></div>
								<input class="innerButton" id="submit_seatReviewPic" type="submit" value="올리기"/>
	            			</div>
            			</form>

            		</div>
            	</div>
            
            
            <footer></footer>
