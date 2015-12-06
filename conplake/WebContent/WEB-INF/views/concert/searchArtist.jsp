<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
	<div class="modalWindow" id="modalWindow_searchArtist">	
		<div class="mdHeader">
			<p>SEARCH ARTIST<input class="mdClose" type="button" value="X" onclick="mdClose()"/></p>
		</div>
		
		<div class="mdBody">
			<div class="mdBody_searchWrap">
				<p>아티스트 
					<span class="btn_searchReview" id="span_addSearch" ><a class="addSearch" id="btn_searchArtist" href="" onclick="searchArtist(); return false;"></a></span>
					<input class="rInputStyle s_width" id="artKeyword" type="text" maxlength="30" autofocus spellcheck="false" placeholder="검색어를 입력하세요.">
				</p>
			</div>
			<div class="mdBody_searchResult">
				<ul id="ul_searchResult">
					<c:forEach var="artResult" items="${artResult}">
						<li>
							<p>
								<span>${artResult.art_name}</span>
								<input class="innerButton" id="mdSearchSelect" type="button" value="선택" onclick="selectArtist('${artResult.art_name}',${artResult.art_num})"/>
							</p>
						</li>
					</c:forEach>
				</ul>
			</div>
				
		</div>

	</div>