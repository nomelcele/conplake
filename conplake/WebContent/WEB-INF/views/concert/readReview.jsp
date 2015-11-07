<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>READ REVIEW</h1>
            	
                    <table id="table_readReview">
                        <tr id="tr_titleReadReview">
                            <th id="th_titleReadReview" colspan="2">${reviewDetail.post_title}</th>
                        </tr>
                        <tr id="tr_infoReadReview">
                            <th id="th_infoReadReview" colspan="2">
                            	<ul>
                                	<li><span id=""><a href="#">${reviewDetail.authorname}</a></span></li>
                                    <li><span id="">${reviewDetail.post_date}</span></li>
                                	<li><span>조회: </span><span id="">${reviewDetail.post_hit}</span></li>
                                </ul>
                            </th>
                        </tr>
                        <tr id="tr_concertInfoReadReview">
                            <th id="th_concertInfoReadReview" colspan="2">
                            	<div style="float:left; padding-right:20px;">
                                <img src="${reviewDetail.concertposter}" width="60" height="80"/>
                                </div>
                                <div style="float:left">
                                    <p>공연명 : <span id="">${reviewDetail.concertname}</span></p>
                                    <p>공연 장소 : <span id="">${reviewDetail.venuename}</span></p>
                                    <p>관람일 : <span id="">${reviewDetail.post_concertdate}</span></p>
                                    <p>좌석 : <span id="">${reviewDetail.post_seat}</span></p>
                                </div>
                            </th>
                        </tr>
                        <tr class="tr_readReview">
                            <td class="td_readReview">공연장 시야 및 음향</td>
                            <td class="td2_readReview" id="sightSoundReview">${reviewDetail.post_sightsound}</td>
                        </tr>
                        <tr class="tr_readReview">
                            <td class="td_readReview">공연장 시설</td>
                            <td class="td2_readReview" id="hallReview">${reviewDetail.post_facility}</td>
                        </tr>
                        <tr class="tr_readReview">
                            <td class="td_readReview">공연 내용</td>
                            <td class="td2_readReview" id="contentReview">${reviewDetail.post_perform}</td>
                        </tr>
                        
                        <tr class="tr_readReview" id="tr_button">
                            <td colspan="2">
                            	<input id="deleteReview" class="innerButton button" type="button" value="글 삭제" onclick=""/>
                            	<input id="editReview" class="innerButton button" type="button" value="수정" onclick=""/>
                            </td>
                        </tr>
                    	
                    	
                    	
                    </table>
                    
                    <p id="p_reply">REPLY</p>
                    
                    <table id="table_reply"> <!-- 유저 댓글 보이는 목록 -->
                    	
                    	<tr class="tr_readReply tr_reply" > <!-- 유저댓글 1 -->
                            <td class="td_readReply" id="td_replyId" ><img src="resources/img/profile_img_default.png" width="60" height="60"/></td>
                            <td class="td2_readReply" id="td_replyContent">
                            	<p id="p_replyId">user_id</p>
                            	<p id="p_replyContent">댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용내용댓글내용댓글내용댓글내용댓글내용</p>
                            </td>
                            <td class="td_readReply" id="td_replyDate">
                            	<p id="p_replyDate">2015.05.05</p>
                            	<p><input id="deleteReply" class="innerButton button" type="button" value="삭제" onclick=""/></p>
                            </td>
                        </tr>
                        
                        <tr class="tr_readReply tr_reply" > <!-- 유저 댓글 2 -->
                            <td class="td_readReply" id="td_replyId" ><img src="resources/img/profile_img_default.png" width="60" height="60"/></td>
                            <td class="td2_readReply" id="td_replyContent">
                            	<p id="p_replyId">user_id</p>
                            	<p id="p_replyContent">댓글내용댓글내용댓글내용댓용</p>
                            </td>
                            <td class="td_readReply" id="td_replyDate">
                            	<p id="p_replyDate">2015.05.05</p>
                            	<p><input id="deleteReply" class="innerButton button" type="button" value="삭제" onclick=""/></p>
                            </td>
                        </tr>
                    </table>
                    
                    <div id="div_inputReply"> <!-- 고정부분 댓글 입력 -->
                            	<textarea id="searchKeyword" class="inputStyle input_search" placeholder="댓글 내용을 입력하세요." ></textarea>
                            	<input id="inputReply" class="innerButton button" type="button" value="입력" onclick=""/>
                           
                   </div>
                  
            
            <footer></footer>