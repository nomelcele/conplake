<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<h1>WRITE REVIEW</h1>
<form id="writeReviewForm" action="writeReview" method="post" enctype="multipart/form-data">
	<input type="hidden" name="post_author" value="${sessionScope.mvo.mem_num}">
	<input type="hidden" name="post_concert" value="${conWriteInfo.con_num}">
	<input type="hidden" id="post_sightsound" name="post_sightsound">
	<input type="hidden" id="post_facility" name="post_facility">
	<input type="hidden" id="post_perform" name="post_perform">
	
	<div class="formBox" id="formBoxRight">
        	<p class="p_write" id="p_write_first">리뷰 제목</p>
        	<p class="rinputBox" id="p_reviewTitle"><input class="rInputStyle" id="reviewTitle" type="text" autofocus spellcheck="false" value="" placeholder="리뷰 제목을 입력하세요." name="post_title"></p>
            
            <p class="p_write">공연장 시야 및 음향</p>
    		<div id="profile_txt">
                
                <div class="reviewContent" id="reviewSightsound" contentEditable="true" ></div>
                <div class="fileBox" id="fileBox0">
                	<div class="fileNameBox" id="fileNameBox0">
                		<!-- p_fileName 들어갈 자리 -->
                	</div>
	                <input type="file" name="files[0]" class="reviewFile" id="reviewFile0" multiple="multiple"/>
	            </div>
            </div>
    		
            <p class="p_write">공연장 시설</p>
    		<div id="profile_txt">
                
                <div class="reviewContent" id="reviewFacility" contentEditable="true" ></div>
                <div class="fileBox"  id="fileBox1">
                	<div class="fileNameBox" id="fileNameBox1">
                		<!-- p_fileName 들어갈 자리 -->
                	</div>
                	<input type="file" name="files[1]" class="reviewFile" id="reviewFile1" multiple="multiple"/>
                </div>
            </div>
            
            <p class="p_write">공연 내용</p>
    		<div id="profile_txt">
                
                <div class="reviewContent" id="reviewPerform" contentEditable="true" ></div>
                <div class="fileBox"  id="fileBox2">
                	<div class="fileNameBox" id="fileNameBox2">
                		<!-- p_fileName 들어갈 자리 -->
                	</div>
                	<input type="file" name="files[2]" class="reviewFile" id="reviewFile2" multiple="multiple"/>
                </div>
            </div>
    </div>

	<div class="formBox" id="formBoxLeft">
  		
  		
        <p class="rinputBox"><label class="inputLabel">공연명</label><input class="rInputStyle" id="id" type="text" maxlength="30" autofocus spellcheck="false" value="${conWriteInfo.con_name}" readonly></p>
          
        
        <p class="rinputBox"><label class="inputLabel">공연 장소</label><input class="rInputStyle" id="passwd" type="text" value="${conWriteInfo.venuename}" readonly></p>
        
        
        <p class="rinputBox"><label class="inputLabel">관람일</label><input class="rInputStyle" type="date" max="${conWriteInfo.con_enddate}" min="${conWriteInfo.con_startdate}" name="post_concertdate"></p>
        
      
        <p class="rinputBox"><label class="inputLabel">좌석</label><input class="rInputStyle" type="text"  name="post_seat"></p>
        
        
 		<Table id="table_RsetList">
        	<caption>세트리스트</caption>
            <tbody>
            <tr class="tr_RsetList">
                <th class="rsetListNum"><p>순서</p></th>
                <th class="rsetListTitle"><p>곡 제목</p></th>
                <th class="rsetListLink"><p>링크</p></th>
            </tr>
            <c:forEach var="setlist" items="${setlist}">
            <tr class="tr_RsetList">
                <td class="rsetListNum"><p>${setlist.song_order}</p></td>
                <td class="rsetListTitle"><p>${setlist.song_title}</p></td>
                <td class="rsetListLink"><p><a href="https://www.youtube.com/results?search_query=${setlist.artistname}+${setlist.song_title}">link</a></p></td>
            </tr>
			</c:forEach>

            </tbody>
          
        </Table>
      
  </div>
</form>

	
    
    
    
  



<p id="memberButtonBox">
            <input id="writeReviewBtn" onclick="writeReview()" class="rButton" type="button" value="확인" name="mem_submit">
</p>