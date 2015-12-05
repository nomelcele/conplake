<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <table class="table_list" id="table_readNote">
		<tr class="tr_list">
			<td class="td_list" id="td_infoNote">
				<p>보낸 사람: <span>${note.fromname} (${note.fromid})</span></p>
				<p>받는 사람: <span>${note.toname} (${note.toid})</span></p>
				<p>보낸 날짜: <span>${note.note_date}</span></p>
			</td>
		</tr>
		<tr class="tr_list">
			<td class="td_list" id="td_contentNote">
				${note.note_cont}
			</td>
		</tr>
		
		<tr class="tr_list">
			<td class="td_list" id="td_buttonNote">
				<input id="replyNote" class="innerButton button" type="button" value="답장" onclick="replyNote(${note.note_from})"/>
			</td>
		</tr>
	</table>