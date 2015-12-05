<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
				<p id="p_searchSeatReview">
                	<select class="inputStyle input_seatFloor" id="select_floor" onchange="searchSightimg(${challInfo.chall_num})">
                        <option value="1">1층</option>
                        <option value="2">2층</option>
                        <option value="3">3층</option>
                    </select>
                    <select class="inputStyle input_seatStanding" id="select_standseat" onchange="searchSightimg(${challInfo.chall_num})">
                        <option value="seat">좌석</option>
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
                	<input id="write_review" class="innerButton button" type="button" onclick="uploadSeatPic()" value="사진 등록"/>
            	</p>
