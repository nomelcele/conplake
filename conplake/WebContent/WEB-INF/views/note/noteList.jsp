<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<Table id="table_list">
	<tr class="tr_list">
	    <th id="noteSelect"><p>
	    	<input class="input_check" id="input_n_check0" name="s_checkAll" type="checkbox"/>
	    	<label class="label_check" for="input_n_check0"></label>
	    </p></th>
	    <th id="noteTo"><p>
	    	<c:if test="${inboxSent eq 'inbox'}">보낸 사람</c:if>
	    	<c:if test="${inboxSent eq 'sent'}">받는 사람</c:if>
	    </p></th>
	    <th id="noteTitle"><p>내용</p></th>
	    <th id="noteDate"><p>보낸 날짜</p></th>
	    
	</tr>
	
	<!-- id="input_n_check1" 숫자바꾸기귀찮아서 내비둠 데헷 -->
	<c:forEach var="noteList" items="${noteList}">
	    <tr class="tr_list">
	        <td id="noteSelect"><p>
	        	<input class="input_check" id="input_n_check1" name="s_check" type="checkbox"/>
	         <label class="label_check" for="input_n_check1"></label>
	        </p></td>
	        <td id="noteTo"><p>
	        	<c:if test="${inboxSent eq 'inbox'}">	
	        		<a href="#">${noteList.fromname}</a>
				</c:if>
				<c:if test="${inboxSent eq 'sent'}">	        
					<a href="#">${noteList.toname}</a>
				</c:if>
	        </p></td>
	        <td id="noteTitle"><p>${noteList.note_cont}</p></td>
	        <td id="noteDate"><p>${noteList.note_date}</p></td>
	    </tr>
	</c:forEach>    
<!-- 	    <tr class="tr_list"> -->
<!-- 	        <td id="noteSelect"><p> -->
<!-- 	        	<input class="input_check" id="input_n_check2" name="s_check" type="checkbox"/> -->
<!-- 	         <label class="label_check" for="input_n_check2"></label> -->
<!-- 	        </p></td> -->
<!-- 	        <td id="noteTo"><p><a href="#">sdfa</a></p></td> -->
<!-- 	        <td id="noteTitle"><p>asd</p></td> -->
<!-- 	        <td id="noteDate"><p>sd</p></td> -->
<!-- 	    </tr> -->
	</Table>
	
	<p class="p_review" id="p_note">
		<span id="span_hallReview">
	    	<a href="#" class="page" id="page_prev"><</a>
	    	<a href="#">1</a>
	    <a href="#" class="page" id="page_next">></a>
	</span>
	<input id="remove_note" class="innerButton button" onclick="removeNote()" type="button" value="삭제" />
	</p>
