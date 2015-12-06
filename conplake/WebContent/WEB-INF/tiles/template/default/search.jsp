<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <form id="searchForm" method="post">
    		<input type="hidden" id="searchType" name="searchType">
        	<ul>
            	<li id="text_search"><p>SEARCH</p></li>
            	<li id="categoryBox">
                	<p class="text_sub">category</p>
                	<select class="inputStyle input_category" id="searchCategory">
                        <option selected="selected" value="default">카테고리</option>
                        <option value="artist">아티스트</option>
                        <option value="concert">공연</option>
                        <option value="concerthall">공연장</option>
                    </select>
                </li>
                <li id="searchBox">
                	<p class="text_sub">keyword</p>
                	<input id="searchKeyword" class="inputStyle input_search" type="text" placeholder="검색어를 입력하세요." autocomplete="off" >
                </li>
                <li id="calenderBox">
                	<p class="text_sub">date</p>
                    <p>
                        <span class="text_date">from :</span>
                        <input class="inputStyle input_sday" type="date" id="searchFrom" name="con_startdate" max="2015-12-31">
                    </p>
                    <p>
                        <span class="text_date">to &nbsp;:</span>
                        <input class="inputStyle input_eday" type="date" id="searchTo" name="con_enddate" min="2000-01-02">
                    </p>
                </li>
                <li id="searchBtnBox">
                	<input id="searchBtn" class="button" type="button" value="검색" name="searchBtn">
                
                </li>
            </ul>
    </form>