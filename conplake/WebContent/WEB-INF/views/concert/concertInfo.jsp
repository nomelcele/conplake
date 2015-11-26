<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
    <h1>CONCERT INFORMATION</h1>
    <input type="hidden" id="concertNumber" value="${conInfo.con_num}">
    <input type="hidden" id="concertArtist" value="${conInfo.con_artist}">
    <input type="hidden" id="currentUserNum" value="${sessionScope.mvo.mem_num}">
        	<h2 id="concertTitle">${conInfo.con_name}
            	<div id="innerButtonBox">
                    <input id="GoTogether" class="innerButton button" type="button" value="함께가요" onclick=""/>
                    <c:if test="${liked eq 'n'}">
                    	<input id="likeToGo" class="innerButton button" type="button" value="갈거예요" onclick="location='likeConcert?ui_member='+${sessionScope.mvo.mem_num}+'&ui_concert='+${conInfo.con_num}"/>
                    </c:if>
                    <c:if test="${liked eq 'y'}">
                    	<input id="likeToGo" class="innerButton button" type="button" value="관심 해제" onclick="location='unlikeConcert?ui_member='+${sessionScope.mvo.mem_num}+'&ui_concert='+${conInfo.con_num}"/>
                    </c:if>
                </div>
            </h2>
            
            <div class="concertProfileBox">
            	<div class="concertPoster">
                	<img src="${conInfo.con_poster}" width="225" height="300" />
                </div>
                <div class="concertProfile">   	
                    <p>일시 : <span>${conInfo.con_startdate} ~ ${conInfo.con_enddate}</span></p>
                    <p>장소 : <span><a href="concerthallInfo?chall_num=${conInfo.con_venue}">${conInfo.venuename}</a></span></p>
                    <p>출연 : <span><a href="artistInfo?art_num=${conInfo.con_artist}">
                    	<c:if test="${!empty conInfo.artistname}">
                    	${conInfo.artistname}
                    	</c:if>
                    	<c:if test="${empty conInfo.artistname}">
                    	${conInfo.con_artist}
                    	</c:if>
                    </a></span></p>
                    <p>관람료 : <span>${conInfo.con_price}</span></p>
                    <p>문의 : <span>${conInfo.con_tel}</span></p>
                    <p>공식 사이트 : <span><a href="${conInfo.con_link}">${conInfo.con_link}</a></span></p>

                </div>
            </div>
            
            <div id="tabBox">
            	<ul class="tabs">
                  <li><a class="tab" id="tab1" href="#">공연 소개</a></li>
                  <li><a class="tab" id="tab2" href="#">세트리스트</a></li>
                  <li><a class="tab" id="tab3" href="#">공연 후기</a></li>
                  <li><a class="tab" id="tab4" href="#">타임라인</a></li>
                </ul>
            </div>
            
            <div class="contentView" id="concertIntro">
            	${conInfo.con_detailimg}
            </div>
           
           <div class="contentView" id="concertSetList">
            	<Table id="table_setList">
                    <tr class="tr_setList">
                        <th class="setListNum"><p>순서</p></th>
                        <th class="setListTitle"><p>곡 제목</p></th>
                        <th class="setListLink"><p>링크</p></th>
                    </tr>
                    <c:forEach var="setlist" items="${setlist}">
	                    <tr class="tr_setList">
	                        <td class="setListNum"><p>${setlist.song_order}</p></td>
	                        <td class="setListTitle"><p>${setlist.song_title}</p></td>
	                        <td class="setListLink"><p><a href="https://www.youtube.com/results?search_query=${setlist.artistname}+${setlist.song_title}">link</a></p></td>
	                    </tr>
                    </c:forEach>
                    
                  
                </Table>
                <p id="p_setList"><input id="edit_setListBtn" class="innerButton button" type="button" value="수정"/></p>
            </div>
            
            
            <div class="contentView" id="concertReview">
            	<p id="p_searchReview">
                	<span id="btn_searchReview"><a href="#"></a></span>
                    <input id="reviewSearchKeyword" name="input_searchReview" class="inputStyle input_searchReview" type="text" placeholder="검색어를 입력하세요." autocomplete="off" >
                	<select class="inputStyle input_categoryReview" id="reviewSearchCategory">
                        <option selected="selected" value="title">제목</option>
                        <option value="author">작성자</option>
                        <option value="cont">내용</option>
                    </select>
                </p>
            	<Table id="table_review">
                    <tr class="tr_review">
                        <th class="reviewNum"><p>번호</p></th>
                        <th class="reviewTitle"><p>제목</p></th>
                        <th class="reviewId"><p>작성자</p></th>
                        <th class="reviewDate"><p>날짜</p></th>
                        <th class="reviewHits"><p>조회수</p></th>
                    </tr>
                    <c:forEach var="reviewList" items="${reviewList}">
	                    <tr class="tr_review">
	                        <td class="reviewNum"><p>${reviewList.post_num}</p></td>
	                        <td class="reviewTitle"><p><a href="readReview?post_num=${reviewList.post_num}">${reviewList.post_title}</a></p></td>
	                        <td class="reviewID"><p>${reviewList.authorname}</p></td>
	                        <td class="reviewDate"><p>${reviewList.post_date}</p></td>
	                        <td class="reviewHits"><p>${reviewList.post_hit}</p></td>
	                    </tr>
                    </c:forEach>

                                      
                </Table>
                <p id="p_review">
                	<span>
                    	<a href="#" class="page" id="page_prev"><</a>
                    	<a href="#">1</a>
<!--                         <a href="#">2</a> -->
<!--                         <a href="#">3</a> -->
                        <a href="#" class="page" id="page_next">></a>
                    </span>
                <input id="write_review" class="innerButton button" type="button" value="후기 작성" onclick="location='writeReviewForm?con_num=${conInfo.con_num}'"/>
                </p>
            </div>
            
            
            
            <div class="contentView" id="concertTimeLine">
            	<!-- 타임라인 -->
            	<div id="timeLineWrap" class="timeLine">
            		<div id="timeLineHeader" class="timeLine">
            			<p>TIMELINE</p>
            		</div>
            		
            		<div id="timeLineBody" class="timeLine">
            			<ul>
            			<c:forEach var="timeline" items="${timeline}">
	            			<li>
	            				<div class="tLImgWrap"><img src="resources/memberImg/${timeline.authorimg}" width="50" height="50"/></div>
	            				<div class="tLTextWrap">
	            					<p id="tLUserName">${timeline.authorname}<span>${timeline.tl_date}</span></p>
	            					<p id="tLText">${timeline.tl_cont}</p>
	            					<p><a href="" onclick="readTimelineComm(${timeline.tl_num})">댓글(${timeline.tlcount})</a></p>
	            				</div>
	            			</li>
	            		</c:forEach>
            			
<!--             			<li> -->
<!--             				<div class="tLImgWrap"><img src="resources/img/nell.jpg" width="50" height="50"/></div> -->
<!--             				<div class="tLTextWrap"> -->
<!--             					<p id="tLUserName">user_name<span>2015.05.05</span></p> -->
<!--             					<p id="tLText">text최대 두줄</p> -->
<!--             					<p><a href="">댓글(0)</a></p> -->
<!--             				</div> -->
<!--             			</li> -->
            			
<!--             			<li> -->
<!--             				<div class="tLImgWrap"><img src="resources/img/nell.jpg" width="50" height="50"/></div> -->
<!--             				<div class="tLTextWrap"> -->
<!--             					<p id="tLUserName">user_name<span>2015.05.05</span></p> -->
<!--             					<p id="tLText">text최대 두줄</p> -->
<!--             					<p><a href="">댓글(0)</a></p> -->
<!--             				</div> -->
<!--             			</li> -->
            			
<!--             			<li> -->
<!--             				<div class="tLImgWrap"><img src="resources/img/nell.jpg" width="50" height="50"/></div> -->
<!--             				<div class="tLTextWrap"> -->
<!--             					<p id="tLUserName">user_name<span>2015.05.05</span></p> -->
<!--             					<p id="tLText">text최대 두줄</p> -->
<!--             					<p><a href="">댓글(0)</a></p> -->
<!--             				</div> -->
<!--             			</li> -->

            			</ul>
            		</div>
            		
            		<div id="timeLineFooter" class="timeLine">
            			<input class="inputStyle" id="tLInputText" type="text" placeholder="메시지를 입력하세요."/>
            			<input class="innerButton button" id="tLInputBtn" type="button" value="입력"/>
            		</div>
            	</div>
            	
            	<div id="modalWindowWrap">
            		<div id="modalWindow">	
            			<div id="mdHeader">
            				<p>REPLY<input id="mdClose" type="button" value="X" onclick="mdClose()"/></p>
            			</div>
            			<div id="mdBody">
            				<ul>
	            			<li>
	            				<div class="mdImgWrap"><img src="resources/img/nell.jpg" width="50" height="50"/></div>
	            				<div class="mdTextWrap">
	            					<p id="mdUserName">user_name<span>2015.05.05</span></p>
	            					<p id="mdText">text최대 두줄</p>
	            					<input class="innerButton button" id="mdDelete" type="button" value="삭제"/>
	            				</div>
	            			</li>
	            			<li>
	            				<div class="mdImgWrap"><img src="resources/img/nell.jpg" width="50" height="50"/></div>
	            				<div class="mdTextWrap">
	            					<p id="mdUserName">user_name<span>2015.05.05</span></p>
	            					<p id="mdText">text최대 두줄texttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttext</p>
	            				</div>
	            			</li>
	            			<li>
	            				<div class="mdImgWrap"><img src="resources/img/nell.jpg" width="50" height="50"/></div>
	            				<div class="mdTextWrap">
	            					<p id="mdUserName">user_name<span>2015.05.05</span></p>
	            					<p id="mdText">text최대 두줄</p>
	            				</div>
	            			</li>
	            			
	            			<li>
	            				<div class="mdImgWrap"><img src="resources/img/nell.jpg" width="50" height="50"/></div>
	            				<div class="mdTextWrap">
	            					<p id="mdUserName">user_name<span>2015.05.05</span></p>
	            					<p id="mdText">text최대 두줄</p>
	            				</div>
	            			</li>
	            			
	            			<li>
	            				<div class="mdImgWrap"><img src="resources/img/nell.jpg" width="50" height="50"/></div>
	            				<div class="mdTextWrap">
	            					<p id="mdUserName">user_name<span>2015.05.05</span></p>
	            					<p id="mdText">text최대 두줄</p>
	            				</div>
	            			</li>
	            			
	            			<li>
	            				<div class="mdImgWrap"><img src="resources/img/nell.jpg" width="50" height="50"/></div>
	            				<div class="mdTextWrap">
	            					<p id="mdUserName">user_name<span>2015.05.05</span></p>
	            					<p id="mdText">text최대 두줄</p>
	            				</div>
	            			</li>
	            			
	            			<li>
	            				<div class="mdImgWrap"><img src="resources/img/nell.jpg" width="50" height="50"/></div>
	            				<div class="mdTextWrap">
	            					<p id="mdUserName">user_name<span>2015.05.05</span></p>
	            					<p id="mdText">text최대 두줄</p>
	            				</div>
	            			</li>
	            			
	            			</ul>
            			</div>
            			<div id="mdFooter">
            				<input class="inputStyle" id="mdInputText" type="text" placeholder="댓글 내용을 입력하세요."/>
            				<input class="innerButton button" id="mdInputBtn" type="button" value="입력"/>
            			</div>
            		</div>
            	</div>
            </div>
            
            
            <footer></footer>
    
