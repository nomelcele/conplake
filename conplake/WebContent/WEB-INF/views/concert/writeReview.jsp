<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>WRITE REVIEW</h1>
	<div class="formBox" id="formBoxLeft">
  		
  		<p class="rinputBox"><label class="inputLabel">글 제목</label><input class="rInputStyle" id="reviewTitle" type="text" autofocus spellcheck="false" value="" placeholder="리뷰 제목을 입력하세요." name="post_title"></p>
            
  		
        <p class="rinputBox"><label class="inputLabel">공연명</label><input class="rInputStyle" id="id" type="text" maxlength="30" autofocus spellcheck="false" value="그랜드 민트 페스티벌" readonly></p>
          
        
        <p class="rinputBox"><label class="inputLabel">공연 장소</label><input class="rInputStyle" id="passwd" type="text" value="올림픽공원" readonly></p>
        
        
        <p class="rinputBox"><label class="inputLabel">관람일</label><input class="rInputStyle" id="passwd" type="date" max="2015-11-08" min="2015-11-04" name="post_concertdate"></p>
        
      
        <p class="rinputBox"><label class="inputLabel">좌석</label><input class="rInputStyle" id="email_address" type="text"  name="mem_mail"></p>
        
        
 		<Table id="table_RsetList">
        	<caption>세트리스트</caption>
            <tbody>
            <tr class="tr_RsetList">
                <th class="rsetListNum"><p>순서</p></th>
                <th class="rsetListTitle"><p>곡 제목</p></th>
                <th class="rsetListLink"><p>링크</p></th>
            </tr>
            <tr class="tr_RsetList">
                <td class="rsetListNum"><p>1</p></td>
                <td class="rsetListTitle"><p>asdfasdfasdfasfasfsafsafsadf겁바ㅏ나나나나나나나ㄻㅇㄴㅁㄴㅇㄻㄴㅇㄻㄴ</p></td>
                <td class="rsetListLink"><p></p></td>
            </tr>
            <tr class="tr_RsetList">
                <td class="rsetListNum"><p>2</p></td>
                <td class="rsetListTitle"><p>sadfdasfdasfasfdasdfasdfasdf</p></td>
                <td class="rsetListLink"><p></p></td>
            </tr>
            <tr class="tr_RsetList">
                <td class="rsetListNum"><p>1</p></td>
                <td class="rsetListTitle"><p>asdfasdfasdfasfasfsafsafsadf겁바ㅏ나나나나나나나ㄻㅇㄴㅁㄴㅇㄻㄴㅇㄻㄴ</p></td>
                <td class="rsetListLink"><p></p></td>
            </tr>
            <tr class="tr_RsetList">
                <td class="rsetListNum"><p>2</p></td>
                <td class="rsetListTitle"><p>sadfdasfdasfasfdasdfasdfasdf</p></td>
                <td class="rsetListLink"><p></p></td>
            </tr>
            <tr class="tr_RsetList">
                <td class="rsetListNum"><p>1</p></td>
                <td class="rsetListTitle"><p>asdfasdfasdfasfasfsafsafsadf겁바ㅏ나나나나나나나ㄻㅇㄴㅁㄴㅇㄻㄴㅇㄻㄴ</p></td>
                <td class="rsetListLink"><p></p></td>
            </tr>
            <tr class="tr_RsetList">
                <td class="rsetListNum"><p>2</p></td>
                <td class="rsetListTitle"><p>sadfdasfdasfasfdasdfasdfasdf</p></td>
                <td class="rsetListLink"><p></p></td>
            </tr>
            <tr class="tr_RsetList">
                <td class="rsetListNum"><p>1</p></td>
                <td class="rsetListTitle"><p>asdfasdfasdfasfasfsafsafsadf겁바ㅏ나나나나나나나ㄻㅇㄴㅁㄴㅇㄻㄴㅇㄻㄴ</p></td>
                <td class="rsetListLink"><p></p></td>
            </tr>
            <tr class="tr_RsetList">
                <td class="rsetListNum"><p>2</p></td>
                <td class="rsetListTitle"><p>sadfdasfdasfasfdasdfasdfasdf</p></td>
                <td class="rsetListLink"><p></p></td>
            </tr><tr class="tr_RsetList">
                <td class="rsetListNum"><p>1</p></td>
                <td class="rsetListTitle"><p>asdfasdfasdfasfasfsafsafsadf겁바ㅏ나나나나나나나ㄻㅇㄴㅁㄴㅇㄻㄴㅇㄻㄴ</p></td>
                <td class="rsetListLink"><p></p></td>
            </tr>
            <tr class="tr_RsetList">
                <td class="rsetListNum"><p>2</p></td>
                <td class="rsetListTitle"><p>sadfdasfdasfasfdasdfasdfasdf</p></td>
                <td class="rsetListLink"><p></p></td>
            </tr><tr class="tr_RsetList">
                <td class="rsetListNum"><p>1</p></td>
                <td class="rsetListTitle"><p>asdfasdfasdfasfasfsafsafsadf겁바ㅏ나나나나나나나ㄻㅇㄴㅁㄴㅇㄻㄴㅇㄻㄴ</p></td>
                <td class="rsetListLink"><p></p></td>
            </tr>
            <tr class="tr_RsetList">
                <td class="rsetListNum"><p>2</p></td>
                <td class="rsetListTitle"><p>sadfdasfdasfasfdasdfasdfasdf</p></td>
                <td class="rsetListLink"><p></p></td>
            </tr>
            
            
            
            </tbody>
          
        </Table>
      
  </div>


	<div class="formBox" id="formBoxRight">
        	
            <p class="p_write">공연장 시야 및 음향</p>
    		<div id="profile_txt">
                <div id="hiddenScroll"></div>
            	<div class="reviewArea" id="reviewContent" contentEditable="true" ></div>
                <div id="fileBox"><input type="file" id="imgFile"/></div>
                
            </div>
    		
            <p class="p_write">공연장 시설</p>
    		<div id="profile_txt">
                <div id="hiddenScroll"></div>
            	<div class="reviewArea" id="reviewContent" contentEditable="true" ></div>
                <div id="fileBox"><input type="file" id="imgFile"/></div>
                
            </div>
            
            <p class="p_write">공연 내용</p>
    		<div id="profile_txt">
                <div id="hiddenScroll"></div>
            	<div class="reviewArea" id="reviewContent" contentEditable="true" ></div>
                <div id="fileBox"><input type="file" id="imgFile"/></div>
                
            </div>
    </div>
    
    
    
  



<p id="memberButtonBox">
            <input id="submit" class="rButton" type="submit" value="확인" name="mem_submit">
</p>