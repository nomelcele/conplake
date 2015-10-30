<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="concertSetlist">
	<h3 class="concert_subTitle">세트리스트
    	<input id="submit_setList" class="innerButton button" type="submit" value="저장" onclick=""/>
        <input id="edit_setList" class="innerButton button" type="button" value="행 추가" onclick="createRow()"/>
        
    </h3>
	<Table id="table_setList">
        <tr class="tr_setList">
            <th class="setListNum">순서</th>
            <th class="setListTitle">곡 제목</th>
        </tr>
        <tr class="tr_setList">
            <td class="setListNum">
            	<input class="input_setList" id="input_setListNum" type="number" />
            </td>
            <td class="setListTitle">
            	<input class="input_setList" id="input_setListTitle" type="text" />
            </td>
        </tr>
    </Table>
</div>