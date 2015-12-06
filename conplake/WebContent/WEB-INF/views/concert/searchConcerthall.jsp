<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<div class="modalWindow" id="modalWindow_searchPlace">	
		<div class="mdHeader">
			<p>SEARCH CONCERTHALL<input class="mdClose" type="button" value="X" onclick="mdClose()"/></p>
		</div>
		
		<div class="mdBody">
			<div class="mdBody_searchWrap">
				<p>공연장소 
					<span class="btn_searchReview" id="span_addSearch" ><a class="addSearch" id="btn_searchPlace" href="" onclick="searchConcerthall(); return false;"></a></span>
					<input class="rInputStyle s_width" id="challKeyword" type="text" maxlength="30" autofocus spellcheck="false" placeholder="검색어를 입력하세요.">
				</p>
			</div>
			<div class="mdBody_searchResult">
				<ul id="ul_searchResult">
					<c:forEach var="challResult" items="${challResult}">
						<li>
							<p>
								<span>${challResult.chall_name}</span>
								<input class="innerButton" id="mdSearchSelect" type="button" value="선택" onclick="selectConcerthall('${challResult.chall_name}',${challResult.chall_num})"/>
							</p>
						</li>
					</c:forEach>
										
<!-- 					<li> -->
<!-- 						<p> -->
<!-- 							<span>올림픽공원 체조경기장</span> -->
<!-- 							<input class="innerButton button" id="mdSearchSelect" type="button" value="선택" onclick=""/> -->
<!-- 						</p> -->
<!-- 					</li> -->
					
				</ul>
			</div>
			
		</div>

	</div>
