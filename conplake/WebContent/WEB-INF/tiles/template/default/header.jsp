<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
	<form id="myPageForm" action="myPage" method="post">
		<input type="hidden" name="mem_num" value="${sessionScope.mvo.mem_num}">
	</form>
	<div class="util_menuWrap">
    	<ul class="util_menu">
    		<li>
    			<a id="a_addMenu" href="#" onclick="toggle_addMenu(); return false;">정보 등록</a></li>
    		</li>
    		
    		<li>
	    		<c:if test="${!empty sessionScope.mvo.mem_name}">
	    			<a id="a_myMenu" href="#" onclick="toggle_myMenu(); return false;"><strong>${sessionScope.mvo.mem_name}</strong> 님 환영합니다.</a></li>
	    		</c:if>
    		</li>
        </ul>
        <ul class="pop" id="pop_myMenu">
        	<li><a href="#">개인정보수정</a></li>
        	<li id="mypage"><a href="#">마이페이지</a></li>
        	<li><a href="#">친구목록</a></li>
        	<li><a href="#" onclick="mdOpen_header(); return false;">쪽지</a></li>
        	<li id="logout"><a href="logout">로그아웃</a></li>
        </ul>
        
        <ul class="pop" id="pop_addMenu">
        	<li><a href="addConcertForm">공연정보</a></li>
        	<li><a href="addArtistForm">아티스트정보</a></li>
        	
        </ul>
    	</div>    
       <div id="modalWindowWrap_header">
       		<div id="modalWindow3">	
       			<div id="mdHeader">
       				<p>NOTE<input id="mdClose" type="button" value="X" onclick="mdClose_header()"/></p>
       			</div>
       			<div id="mdBody_left">
       				<ul>
       					<li><input class="innerButton" id="write_note" type="button" value="쪽지 쓰기"/></li>
       					<li><a href="#">받은 쪽지함 <span>(0)</span></a></li>
       					<li><a href="#">보낸 쪽지함 <span>(0)</span></a></li>
       				</ul>
       			</div>
       			<div id="mdBody_right">
       				<p class="concert_subTitle">
                	<input id="remove_setList" class="innerButton button" type="button" value="행 삭제" onclick="removeRow()"/>
                    <input id="edit_setList" class="innerButton button" type="button" value="행 추가" onclick="createRow()"/>
                    
                </p>
            	<Table id="table_editSetList">
                    <tr class="tr_setList">
                        <th class="setListCheck">
                        	<input class="input_check" id="input_check0" name="s_checkAll" type="checkbox"/>
                            <label class="label_check" for="input_check0"></label>
                        </th>
                        <th class="setListNum">순서</th>
                        <th class="setListTitle">곡 제목</th>
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
	                        	<input class="input_setList" id="input_setListTitle" name="input_setListTitle" type="text" value="${setlist.song_title}"/>
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
                        	<input class="input_setList" id="input_setListTitle" name="input_setListTitle" type="text" />
                        </td>
                      
                    </tr>
                    
                    
                    
                    
                    
                </Table>
	            	
	                
       			</div>
            			
            			
            		
       </div>
        
    </div>
    
    
    <div class="gnb">
    	<a id="logo" href="main"><img id="imgLogo" src="resources/img/logo_main.png" alt="CONPLAKE" /></a>
    </div>
</header>