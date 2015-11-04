<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <h1>CONCERT INFORMATION</h1>
        	<h2 id="concertTitle">${conInfo.con_name}
            	<div id="innerButtonBox">
                    <input id="GoTogether" class="innerButton button" type="button" value="함께가요" onclick=""/>
                    <input id="likeToGo" class="innerButton button" type="button" value="갈거예요" onclick=""/>
                </div>
            </h2>
            
            <div id="concertProfileBox">
            	<div id="concertPoster">
                	<img src="${conInfo.con_poster}" width="225" height="300" />
                </div>
                <div id="concertProfile">
                	<hgroup>
                    <h4>일시 : ${conInfo.con_startdate} ~ ${conInfo.con_enddate}</h4>
                    <h4>장소 : <span><a href="#">${conInfo.con_venue}</a></span></h4>
                    <h4>출연 : <span><a href="#">${conInfo.con_artist}</a></span></h4>
                    </hgroup>
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
                    <tr class="tr_setList">
                        <td class="setListNum"><p></p></td>
                        <td class="setListTitle"><p></p></td>
                        <td class="setListLink"><p></p></td>
                    </tr>
                    <tr class="tr_setList">
                        <td class="setListNum"><p></p></td>
                        <td class="setListTitle"><p></p></td>
                        <td class="setListLink"><p></p></td>
                    </tr>
                    
                  
                </Table>
                <p id="p_setList"><input id="edit_setList" class="innerButton button" type="button" value="수정"/></p>
            </div>
            
            
            <div class="contentView" id="concertReview">
            	<p id="p_searchReview">
                	<span id="btn_searchReview"><a href="#"></a></span>
                    <input name="input_searchReview" class="inputStyle input_searchReview" type="text" placeholder="검색어를 입력하세요." autocomplete="off" >
                	<select class="inputStyle input_categoryReview" >
                        <option selected>제목</option>
                        <option>작성자</option>
                        <option>내용</option>
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
                    <tr class="tr_review">
                        <td class="reviewNum"><p>10</p></td>
                        <td class="reviewTitle"><p>후기제목후기제목후기제목후기제목후기제목후기제목후기제목후기제목후기제목후기제목후기제목12341234</p></td>
                        <td class="reviewID"><p></p></td>
                        <td class="reviewDate"><p></p></td>
                        <td class="reviewHits"><p></p></td>
                    </tr>
                    <tr class="tr_review">
                        <td class="reviewNum"><p>9</p></td>
                        <td class="reviewTitle"><p></p></td>
                        <td class="reviewID"><p></p></td>
                        <td class="reviewDate"><p></p></td>
                        <td class="reviewHits"><p></p></td>
                    </tr>
                    <tr class="tr_review">
                        <td class="reviewNum"><p>8</p></td>
                        <td class="reviewTitle"><p></p></td>
                        <td class="reviewID"><p></p></td>
                        <td class="reviewDate"><p></p></td>
                        <td class="reviewHits"><p></p></td>
                    </tr>
                    <tr class="tr_review">
                        <td class="reviewNum"><p>7</p></td>
                        <td class="reviewTitle"><p></p></td>
                        <td class="reviewID"><p></p></td>
                        <td class="reviewDate"><p></p></td>
                        <td class="reviewHits"><p></p></td>
                    </tr>
                    <tr class="tr_review">
                        <td class="reviewNum"><p>6</p></td>
                        <td class="reviewTitle"><p></p></td>
                        <td class="reviewID"><p></p></td>
                        <td class="reviewDate"><p></p></td>
                        <td class="reviewHits"><p></p></td>
                    </tr>
                    <tr class="tr_review">
                        <td class="reviewNum"><p>5</p></td>
                        <td class="reviewTitle"><p></p></td>
                        <td class="reviewID"><p></p></td>
                        <td class="reviewDate"><p></p></td>
                        <td class="reviewHits"><p></p></td>
                    </tr>
                    <tr class="tr_review">
                        <td class="reviewNum"><p>4</p></td>
                        <td class="reviewTitle"><p></p></td>
                        <td class="reviewID"><p></p></td>
                        <td class="reviewDate"><p></p></td>
                        <td class="reviewHits"><p></p></td>
                    </tr>
                    <tr class="tr_review">
                        <td class="reviewNum"><p>3</p></td>
                        <td class="reviewTitle"><p></p></td>
                        <td class="reviewID"><p></p></td>
                        <td class="reviewDate"><p></p></td>
                        <td class="reviewHits"><p></p></td>
                    </tr>
                    <tr class="tr_review">
                        <td class="reviewNum"><p>2</p></td>
                        <td class="reviewTitle"><p></p></td>
                        <td class="reviewID"><p></p></td>
                        <td class="reviewDate"><p></p></td>
                        <td class="reviewHits"><p></p></td>
                    </tr>
                    
                  
                </Table>
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
                <input id="write_review" class="innerButton button" type="button" value="후기 작성" onclick="location='writeReview'"/></p>
            </div>
            
            <div class="contentView" id="concertTimeLine">
            	<!-- 타임라인 -->
            </div>
            
            
            <footer></footer>
    
<!-- 			<h1>CONCERT INFORMATION</h1> -->
<!--         	<h2 id="concertTitle">쏜애플(THORNAPPLE) 콘서트 ‘한낮’ -->
<!--             	<div id="innerButtonBox"> -->
<!--                     <input id="GoTogether" class="innerButton button" type="button" value="함께가요" onclick=""/> -->
<!--                     <input id="likeToGo" class="innerButton button" type="button" value="갈거예요" onclick=""/> -->
<!--                 </div> -->
<!--             </h2> -->
            
<!--             <div id="concertProfileBox"> -->
<!--             	<div id="concertPoster"> -->
<!--                 	<img src="resources/img/apple.png" width="225" height="300" /> -->
<!--                 </div> -->
<!--                 <div id="concertProfile"> -->
<!--                 	<hgroup> -->
<!--                     <h4>장르 : 발라드</h4> -->
<!--                     <h4>일시 : 2014/12/24 ~ 2014/12/25</h4> -->
<!--                     <h4>장소 : <span><a href="#">서울 잠실 학생체육관</a></span></h4> -->
<!--                     <h4>출연 : <span><a href="#">쏜애플</a></span></h4> -->
<!--                     <h4>관란등급 : 만 7세 이상</h4> -->
<!--                     <h4>관람시간 : 120분</h4> -->
<!--                     </hgroup> -->
<!--                 </div> -->
<!--             </div> -->
            
<!--             <div id="tabBox"> -->
<!--             	<ul class="tabs"> -->
<!--                   <li><a class="tab" id="tab1" href="#">공연 소개</a></li> -->
<!--                   <li><a class="tab" id="tab2" href="#">세트리스트</a></li> -->
<!--                   <li><a class="tab" id="tab3" href="#">공연 후기</a></li> -->
<!--                 </ul> -->
<!--             </div> -->
            
<!--             <div class="contentView" id="concertIntro"> -->
<!--             	<img src="resources/img/apple_intro.png" width="900"> -->
<!--             </div> -->
           
<!--            <div class="contentView" id="concertSetList"> -->
<!--             	<Table id="table_setList"> -->
<!--                     <tr class="tr_setList"> -->
<!--                         <th class="setListNum"><p>순서</p></th> -->
<!--                         <th class="setListTitle"><p>곡 제목</p></th> -->
<!--                         <th class="setListLink"><p>링크</p></th> -->
<!--                     </tr> -->
<!--                     <tr class="tr_setList"> -->
<!--                         <td class="setListNum"><p></p></td> -->
<!--                         <td class="setListTitle"><p></p></td> -->
<!--                         <td class="setListLink"><p></p></td> -->
<!--                     </tr> -->
<!--                     <tr class="tr_setList"> -->
<!--                         <td class="setListNum"><p></p></td> -->
<!--                         <td class="setListTitle"><p></p></td> -->
<!--                         <td class="setListLink"><p></p></td> -->
<!--                     </tr> -->
                    
                  
<!--                 </Table> -->
<!--                 <p id="p_setList"><input id="edit_setList" class="innerButton button" type="button" value="수정"/></p> -->
<!--             </div> -->
            
            
<!--             <div class="contentView" id="concertReview"> -->
<!--             	<p id="p_searchReview"> -->
<!--                 	<span id="btn_searchReview"><a href="#"></a></span> -->
<!--                     <input name="input_searchReview" class="inputStyle input_searchReview" type="text" placeholder="검색어를 입력하세요." autocomplete="off" > -->
<!--                 	<select class="inputStyle input_categoryReview" > -->
<!--                         <option selected>제목</option> -->
<!--                         <option>작성자</option> -->
<!--                         <option>내용</option> -->
<!--                     </select> -->
<!--                 </p> -->
<!--             	<Table id="table_review"> -->
<!--                     <tr class="tr_review"> -->
<!--                         <th class="reviewNum"><p>번호</p></th> -->
<!--                         <th class="reviewTitle"><p>제목</p></th> -->
<!--                         <th class="reviewId"><p>작성자</p></th> -->
<!--                         <th class="reviewDate"><p>날짜</p></th> -->
<!--                         <th class="reviewHits"><p>조회수</p></th> -->
<!--                     </tr> -->
<!--                     <tr class="tr_review"> -->
<!--                         <td class="reviewNum"><p>10</p></td> -->
<!--                         <td class="reviewTitle"><p>후기제목후기제목후기제목후기제목후기제목후기제목후기제목후기제목후기제목후기제목후기제목12341234</p></td> -->
<!--                         <td class="reviewID"><p></p></td> -->
<!--                         <td class="reviewDate"><p></p></td> -->
<!--                         <td class="reviewHits"><p></p></td> -->
<!--                     </tr> -->
<!--                     <tr class="tr_review"> -->
<!--                         <td class="reviewNum"><p>9</p></td> -->
<!--                         <td class="reviewTitle"><p></p></td> -->
<!--                         <td class="reviewID"><p></p></td> -->
<!--                         <td class="reviewDate"><p></p></td> -->
<!--                         <td class="reviewHits"><p></p></td> -->
<!--                     </tr> -->
<!--                     <tr class="tr_review"> -->
<!--                         <td class="reviewNum"><p>8</p></td> -->
<!--                         <td class="reviewTitle"><p></p></td> -->
<!--                         <td class="reviewID"><p></p></td> -->
<!--                         <td class="reviewDate"><p></p></td> -->
<!--                         <td class="reviewHits"><p></p></td> -->
<!--                     </tr> -->
<!--                     <tr class="tr_review"> -->
<!--                         <td class="reviewNum"><p>7</p></td> -->
<!--                         <td class="reviewTitle"><p></p></td> -->
<!--                         <td class="reviewID"><p></p></td> -->
<!--                         <td class="reviewDate"><p></p></td> -->
<!--                         <td class="reviewHits"><p></p></td> -->
<!--                     </tr> -->
<!--                     <tr class="tr_review"> -->
<!--                         <td class="reviewNum"><p>6</p></td> -->
<!--                         <td class="reviewTitle"><p></p></td> -->
<!--                         <td class="reviewID"><p></p></td> -->
<!--                         <td class="reviewDate"><p></p></td> -->
<!--                         <td class="reviewHits"><p></p></td> -->
<!--                     </tr> -->
<!--                     <tr class="tr_review"> -->
<!--                         <td class="reviewNum"><p>5</p></td> -->
<!--                         <td class="reviewTitle"><p></p></td> -->
<!--                         <td class="reviewID"><p></p></td> -->
<!--                         <td class="reviewDate"><p></p></td> -->
<!--                         <td class="reviewHits"><p></p></td> -->
<!--                     </tr> -->
<!--                     <tr class="tr_review"> -->
<!--                         <td class="reviewNum"><p>4</p></td> -->
<!--                         <td class="reviewTitle"><p></p></td> -->
<!--                         <td class="reviewID"><p></p></td> -->
<!--                         <td class="reviewDate"><p></p></td> -->
<!--                         <td class="reviewHits"><p></p></td> -->
<!--                     </tr> -->
<!--                     <tr class="tr_review"> -->
<!--                         <td class="reviewNum"><p>3</p></td> -->
<!--                         <td class="reviewTitle"><p></p></td> -->
<!--                         <td class="reviewID"><p></p></td> -->
<!--                         <td class="reviewDate"><p></p></td> -->
<!--                         <td class="reviewHits"><p></p></td> -->
<!--                     </tr> -->
<!--                     <tr class="tr_review"> -->
<!--                         <td class="reviewNum"><p>2</p></td> -->
<!--                         <td class="reviewTitle"><p></p></td> -->
<!--                         <td class="reviewID"><p></p></td> -->
<!--                         <td class="reviewDate"><p></p></td> -->
<!--                         <td class="reviewHits"><p></p></td> -->
<!--                     </tr> -->
                    
                  
<!--                 </Table> -->
<!--                 <p id="p_review"> -->
<!--                 	<span> -->
<!--                     	<a href="#" class="page" id="page_prev"><</a> -->
<!--                     	<a href="#">1</a> -->
<!--                         <a href="#">2</a> -->
<!--                         <a href="#">3</a> -->
<!--                         <a href="#">4</a> -->
<!--                         <a href="#">5</a> -->
<!--                         <a href="#">6</a> -->
<!--                         <a href="#">7</a> -->
<!--                         <a href="#">8</a> -->
<!--                         <a href="#">9</a> -->
<!--                         <a href="#" class="page" id="page_next">></a> -->
<!--                     </span> -->
<!--                 <input id="write_review" class="innerButton button" type="button" value="후기 작성"/></p> -->
<!--             </div> -->
            
<!--             <footer></footer> -->
