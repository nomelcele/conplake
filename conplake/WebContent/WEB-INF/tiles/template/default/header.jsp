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
       				
       				<Table id="table_list">
                    <tr class="tr_list">
                        <th id="noteSelect"><p>
                        	<input class="input_check" id="input_n_check0" name="s_checkAll" type="checkbox"/>
                        	<label class="label_check" for="input_n_check0"></label>
                        </p></th>
                        <th id="noteTo"><p>받는 사람</p></th>
                        <th id="noteTitle"><p>제목</p></th>
                        <th id="noteDate"><p>보낸 날짜</p></th>
                        
                    </tr>
                    
                    <!-- id="input_n_check1" 숫자바꾸기귀찮아서 내비둠 데헷 -->
                    <tr class="tr_list">
                        <td id="noteSelect"><p>
                        	<input class="input_check" id="input_n_check1" name="s_check" type="checkbox"/>
	                        <label class="label_check" for="input_n_check1"></label>
                        </p></td>
                        <td id="noteTo"><p><a href="#">sdfa</a></p></td>
                        <td id="noteTitle"><p>asd</p></td>
                        <td id="noteDate"><p>sd</p></td>
                    </tr>
                    <tr class="tr_list">
                        <td id="noteSelect"><p>
                        	<input class="input_check" id="input_n_check2" name="s_check" type="checkbox"/>
	                        <label class="label_check" for="input_n_check2"></label>
                        </p></td>
                        <td id="noteTo"><p><a href="#">sdfa</a></p></td>
                        <td id="noteTitle"><p>asd</p></td>
                        <td id="noteDate"><p>sd</p></td>
                    </tr>
                    <tr class="tr_list">
                        <td id="noteSelect"><p>
                        	<input class="input_check" id="input_n_check" name="s_check" type="checkbox"/>
	                        <label class="label_check" for="input_n_check"></label>
                        </p></td>
                        <td id="noteTo"><p><a href="#">sdfa</a></p></td>
                        <td id="noteTitle"><p>asd</p></td>
                        <td id="noteDate"><p>sd</p></td>
                    </tr>
                    <tr class="tr_list">
                        <td id="noteSelect"><p>
                        	<input class="input_check" id="input_n_check" name="s_check" type="checkbox"/>
	                        <label class="label_check" for="input_n_check"></label>
                        </p></td>
                        <td id="noteTo"><p><a href="#">sdfa</a></p></td>
                        <td id="noteTitle"><p>asd</p></td>
                        <td id="noteDate"><p>sd</p></td>
                    </tr>
                    <tr class="tr_list">
                        <td id="noteSelect"><p>
                        	<input class="input_check" id="input_n_check" name="s_check" type="checkbox"/>
	                        <label class="label_check" for="input_n_check"></label>
                        </p></td>
                        <td id="noteTo"><p><a href="#">sdfa</a></p></td>
                        <td id="noteTitle"><p>asd</p></td>
                        <td id="noteDate"><p>sd</p></td>
                    </tr>
                    <tr class="tr_list">
                        <td id="noteSelect"><p>
                        	<input class="input_check" id="input_n_check" name="s_check" type="checkbox"/>
	                        <label class="label_check" for="input_n_check"></label>
                        </p></td>
                        <td id="noteTo"><p><a href="#">sdfa</a></p></td>
                        <td id="noteTitle"><p>asd</p></td>
                        <td id="noteDate"><p>sd</p></td>
                    </tr>
                    <tr class="tr_list">
                        <td id="noteSelect"><p>
                        	<input class="input_check" id="input_n_check" name="s_check" type="checkbox"/>
	                        <label class="label_check" for="input_n_check"></label>
                        </p></td>
                        <td id="noteTo"><p><a href="#">sdfa</a></p></td>
                        <td id="noteTitle"><p>asd</p></td>
                        <td id="noteDate"><p>sd</p></td>
                    </tr>
                    <tr class="tr_list">
                        <td id="noteSelect"><p>
                        	<input class="input_check" id="input_n_check" name="s_check" type="checkbox"/>
	                        <label class="label_check" for="input_n_check"></label>
                        </p></td>
                        <td id="noteTo"><p><a href="#">sdfa</a></p></td>
                        <td id="noteTitle"><p>asd</p></td>
                        <td id="noteDate"><p>sd</p></td>
                    </tr>
                    <tr class="tr_list">
                        <td id="noteSelect"><p>
                        	<input class="input_check" id="input_n_check" name="s_check" type="checkbox"/>
	                        <label class="label_check" for="input_n_check"></label>
                        </p></td>
                        <td id="noteTo"><p><a href="#">sdfa</a></p></td>
                        <td id="noteTitle"><p>asd</p></td>
                        <td id="noteDate"><p>sd</p></td>
                    </tr>
                    <tr class="tr_list">
                        <td id="noteSelect"><p>
                        	<input class="input_check" id="input_n_check" name="s_check" type="checkbox"/>
	                        <label class="label_check" for="input_n_check"></label>
                        </p></td>
                        <td id="noteTo"><p><a href="#">sdfa</a></p></td>
                        <td id="noteTitle"><p>asd</p></td>
                        <td id="noteDate"><p>sd</p></td>
                    </tr>                    
                    

                                      
                </Table>
                
                <p class="p_review" id="p_note">
                	<span id="span_hallReview">
                    	<a href="#" class="page" id="page_prev"><</a>
                    	<a href="#">1</a>
<!--                         <a href="#">2</a> -->
<!--                         <a href="#">3</a> -->
                        <a href="#" class="page" id="page_next">></a>
                    </span>
                    <input id="remove_note" class="innerButton button" onclick="removeNote()" type="button" value="삭제" />
                </p>
	            	
	                
       			</div>
            			
            			
            		
       </div>
        
    </div>
    
    
    <div class="gnb">
    	<a id="logo" href="main"><img id="imgLogo" src="resources/img/logo_main.png" alt="CONPLAKE" /></a>
    </div>
</header>