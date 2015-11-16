<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>EDIT SETLIST</h1>
            	<p class="concert_subTitle">
                	<input id="remove_setList" class="innerButton button" type="button" value="행 삭제" onclick="removeRow()"/>
                    <input id="edit_setList" class="innerButton button" type="button" value="행 추가" onclick="createRow()"/>
                    
                </p>
            	<Table id="table_setList">
                    <tr class="tr_setList">
                        <th class="setListCheck">
                        	<input class="input_check" id="input_check0" name="s_checkAll" type="checkbox"/>
                            <label class="label_check" for="input_check0"></label>
                        </th>
                        <th class="setListNum">순서</th>
                        <th class="setListTitle">곡 제목</th>
                    </tr>
                    <tr class="tr_setList">
                    	<td class="setListCheck">
                        	<input class="input_check" id="input_check1" name="s_check" type="checkbox"/>
                            <label class="label_check" for="input_check1"></label>
                        </td>
                        <td class="setListNum">
                        	<input class="input_setList" id="input_setListNum" type="number" />
                        </td>
                        <td class="setListTitle">
                        	<input class="input_setList" id="input_setListTitle" type="text" />
                        </td>
                      
                    </tr>
                    
                </Table>
                
                <input id="setList_submit" class="button" type="submit" value="저장" name="setList_submit">
                
                <footer></footer>    