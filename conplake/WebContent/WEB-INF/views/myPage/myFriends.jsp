<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<div id="modalWindow_fri">	
       			<div class="mdHeader">
       				<p>친구 목록<input class="mdClose" type="button" value="X" onclick="mdClose_fri_header()"/></p>
       			</div>
       			<div class="mdBody">
       				<ul class="ul_commList">
            			<li>
            				<div class="mdImgWrap"><img src="resources/css/profile_img_default.png" width="50" height="50"/></div>
            				<div class="mdTextWrap">
            					<p id="p_friend">
            						<strong>asdfasdf<span> (ddaf)</span></strong>
         							<input class="innerButton button" id="mdDelete" type="button" value="삭제" onclick=""/>
         							<input class="innerButton button" id="friendNoteBtn" type="button" value="&#9993;" onclick=""/>
            					</p>
            				</div>
            			</li>
           			</ul>
       			</div>
       </div>    
    