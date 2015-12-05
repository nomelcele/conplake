<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
        	<h1>CONCERT</h1>
        <form id="mainForm" method="post"> 
        <input type="hidden" id="con_num" name="con_num">
            <ul class="ul_concert">
            	<c:forEach var="conList" items="${conList}">
            		<li id="list_concert1">
	                    <a href="concertInfo?con_num=${conList.con_num}"><img width="198" height="248" alt="콘서트이미지1" src="${conList.con_poster}"></a>
	                        <p class="concert_title"><a href="concertInfo?con_num=${conList.con_num}">${conList.con_name}</a></p>
	                        <p class="concert_date">${conList.con_startdate} ~ ${conList.con_enddate}</p>
	                        <p class="concert_place"><a href="concerthallInfo?chall_num=${conList.con_venue}">${conList.venuename}</a></p>
	                </li>

                </c:forEach>
               
            </ul>
            </form>
    
    
