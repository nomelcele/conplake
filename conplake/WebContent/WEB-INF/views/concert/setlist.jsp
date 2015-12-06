<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
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
	                        <td class="setListLink"><p><a href="${setlist.song_link}" target="_blank"><img src="resources/img/playIcon.gif" width="15"></a></p></td>
	                    </tr>
                    </c:forEach>
                  
                </Table>
                <p id="p_setList"><input id="edit_setListBtn" class="innerButton" type="button" value="수정" onclick="editSetlist()"/></p>