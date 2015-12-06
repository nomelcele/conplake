<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<script src="js/edit_setList.js"></script>
<h1>EDIT SETLIST</h1>
	<input type="hidden" id="setList_con_num" value="${concertInfo.con_num}">
	<input type="hidden" id="setList_con_artist" value="${concertInfo.con_artist}">
    <input type="hidden" id="setList_artistname" value="${concertInfo.artistname}">
            	<p class="concert_subTitle">
                	<input id="remove_setList" class="innerButton" type="button" value="행 삭제" onclick="removeRow()"/>
                    <input id="edit_setList" class="innerButton" type="button" value="행 추가" onclick="createRow()"/>
                    
                </p>
            	<Table id="table_editSetList">
                    <tr class="tr_setList">
                        <th class="setListCheck">
                        	<input class="input_check" id="input_check0" name="s_checkAll" type="checkbox"/>
                            <label class="label_check" for="input_check0"></label>
                        </th>
                        <th class="setListNum">순서</th>
                        <th class="setListTitle">곡 제목</th>
                        <th class="setListLink">링크 주소</th>
                    </tr>
                    <c:forEach var="setlist" items="${setlist}">
	                    <tr class="tr_setList">
		                    <td class="setListCheck">
	                        	<input class="input_check" id="input_check_${setlist.song_order}" name="s_check" type="checkbox"/>
	                            <label class="label_check" for="input_check_${setlist.song_order}"></label>
	                        </td>
	                        <td class="setListNum">
	                        	<input class="input_setList" id="input_setListNum" name="input_setListNum" type="number" value="${setlist.song_order}"/>
	                        </td>
	                        <td class="setListTitle">
	                        	<input class="input_setList" id="input_setListTitle_${setlist.song_order}" name="input_setListTitle" type="text" value="${setlist.song_title}" onkeydown="setSearchQuery(${setlist.artistname},${setlist.song_order})"/>
	                        </td>
	                        <td class="setListLink">
	                        	<input class="input_setList" id="input_setListLink_${setlist.song_order}" name="input_setListTitle" type="text" value="${setlist.song_link}"/>
	                        	<span class="btn_searchReview"><a id="searchLink_${setlist.song_order}" href="#" target="_blank"></a></span>
	                        </td>
	                    </tr>
                    </c:forEach>
                    <tr class="tr_setList">
                    	<td class="setListCheck">
                        	<input class="input_check" id="input_check1" name="s_check" type="checkbox"/>
                            <label class="label_check" for="input_check1"></label>
                        </td>
                        <td class="setListNum">
                        	<input class="input_setList" id="input_setListNum" name="input_setListNum" type="number" />
                        </td>
                        <td class="setListTitle">
                        	<input class="input_setList" id="input_setListTitle" name="input_setListTitle" type="text" onkeydown="setSearchQuery(${concertInfo.artistname})"/>
                        </td>
                        <td class="setListLink">
                        	<input class="input_setList" id="input_setListLink" name="input_setListTitle" type="text" value=""/>
                        	<span class="btn_searchReview"><a id="searchLink" href="#"></a></span>
                        </td>
                      
                    </tr>
                    
                    
                    
                    
                    
                </Table>
                
                <input id="setList_saveBtn" class="button" type="submit" value="저장" name="setList_submit">
                
                <footer></footer>    