<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
        	<h1>CONCERT</h1>
        <form id="mainForm" method="post"> 
        <input type="hidden" id="con_num" name="con_num">
            <ul class="ul_concert">
            	<c:forEach var="conList" items="${conList}">
            		<li id="list_concert1">
	                    <a href="javascript:concertInfo(${conList.con_num})"><img width="198" height="248" alt="콘서트이미지1" src="${conList.con_poster}"></a>
	                        <p class="concert_title"><a href="#">${conList.con_name}</a></p>
	                        <p class="concert_date">${conList.con_startdate} ~ ${conList.con_enddate}</p>
	                        <p class="concert_place"><a href="#">${conList.con_venue}</a></p>
	                </li>
<!-- 	                <li id="list_concert1"> -->
<!-- 	                    <a href="#"><img width="198" height="248" alt="콘서트이미지1" src="resources/img/gmf.png"></a> -->
<!-- 	                        <p class="concert_title"><a href="#">그랜드 민트 페스티벌 2015</a></p> -->
<!-- 	                        <p class="concert_date">2015.10.17 ~ 2015.10.18</p> -->
<!-- 	                        <p class="concert_place"><a href="#">서울시 송파구 올림픽공원</a></p> -->
<!-- 	                </li> -->
	                
<!-- 	                <li id="list_concert1"> -->
<!-- 	                    <a href="#"><img width="198" height="248" alt="콘서트이미지1" src="resources/img/apple.png"></a> -->
<!-- 	                        <p class="concert_title"><a href="#">쏜애플(THORNAPPLE) 콘서트 ‘한낮’</a></p> -->
<!-- 	                        <p class="concert_date">2015.12.19</p> -->
<!-- 	                        <p class="concert_place"><a href="#">AX-KOREA</a></p> -->
<!-- 	                </li> -->
	                
	                
<!-- 	                 <li id="list_concert1"> -->
<!-- 	                    <a href="#"><img width="198" height="248" alt="콘서트이미지1" src="resources/img/sg.png"></a> -->
<!-- 	                        <p class="concert_title"><a href="#">SG워너비 컴백 콘서트 ＇I WANNA BE WITH YOU＇</a></p> -->
<!-- 	                        <p class="concert_date">2015.10.09 ~ 2015.10.10</p> -->
<!-- 	                        <p class="concert_place"><a href="#">올림픽공원 올림픽홀</a></p> -->
<!-- 	                </li> -->
	                
<!-- 	                <li id="list_concert1"> -->
<!-- 	                    <a href="#"><img width="198" height="248" alt="콘서트이미지1" src="resources/img/crush.png"></a> -->
<!-- 	                        <p class="concert_title"><a href="#">2015 크러쉬 콘서트〈Crush on You</a></p> -->
<!-- 	                        <p class="concert_date">2015.11.13 ~ 2015.11.14</p> -->
<!-- 	                        <p class="concert_place"><a href="#">롯데카드 아트센터 아트홀</a></p> -->
<!-- 	                </li> -->
	                
<!-- 	                <li id="list_concert1"> -->
<!-- 	                    <a href="#"><img width="198" height="248" alt="콘서트이미지1" src="resources/img/apple.png"></a> -->
<!-- 	                        <p class="concert_title"><a href="#">쏜애플(THORNAPPLE) 콘서트 ‘한낮’</a></p> -->
<!-- 	                        <p class="concert_date">2015.12.19</p> -->
<!-- 	                        <p class="concert_place"><a href="#">AX-KOREA</a></p> -->
<!-- 	                </li> -->
	                
<!-- 	                <li id="list_concert1"> -->
<!-- 	                    <a href="#"><img width="198" height="248" alt="콘서트이미지1" src="resources/img/crush.png"></a> -->
<!-- 	                        <p class="concert_title"><a href="#">2015 크러쉬 콘서트〈Crush on You</a></p> -->
<!-- 	                        <p class="concert_date">2015.11.13 ~ 2015.11.14</p> -->
<!-- 	                        <p class="concert_place"><a href="#">롯데카드 아트센터 아트홀</a></p> -->
<!-- 	                </li> -->
	                
<!-- 	                <li id="list_concert1"> -->
<!-- 	                    <a href="#"><img width="198" height="248" alt="콘서트이미지1" src="resources/img/gmf.png"></a> -->
<!-- 	                        <p class="concert_title"><a href="#">그랜드 민트 페스티벌 2015</a></p> -->
<!-- 	                        <p class="concert_date">2015.10.17 ~ 2015.10.18</p> -->
<!-- 	                        <p class="concert_place"><a href="#">서울시 송파구 올림픽공원</a></p> -->
<!-- 	                </li> -->
	                
<!-- 	                <li id="list_concert1"> -->
<!-- 	                    <a href="#"><img width="198" height="248" alt="콘서트이미지1" src="resources/img/sg.png"></a> -->
<!-- 	                        <p class="concert_title"><a href="#">SG워너비 컴백 콘서트 ＇I WANNA BE WITH YOU＇</a></p> -->
<!-- 	                        <p class="concert_date">2015.10.09 ~ 2015.10.10</p> -->
<!-- 	                        <p class="concert_place"><a href="#">올림픽공원 올림픽홀</a></p> -->
<!-- 	                </li> -->
	                
                
                </c:forEach>
               
            </ul>
            </form>
    
    
