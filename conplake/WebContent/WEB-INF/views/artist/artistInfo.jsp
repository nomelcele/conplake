<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <h1>ARTIST INFORMATION</h1>
        	<h2 id="concertTitle"></h2>
<!--             	<div id="innerButtonBox"> -->
<!--                     <input id="GoTogether" class="innerButton button" type="button" value="함께가요" onclick=""/> -->
<!--                     <input id="likeToGo" class="innerButton button" type="button" value="갈거예요" onclick=""/> -->
<!--                 </div> -->
            
            <div class="concertProfileBox profileSize">
            	<div class="concertPoster profileSize" >
                	<img src="" width="225" height="225" />
                </div>
                <div class="concertProfile profileSize">
                    <p>SNS : <span></span></p>
                    <p>공식 사이트 : <span><a href=""></a></span></p>
                </div>
            </div>
            
            <div id="tabBox">
            	<ul class="tabs">
                  <li><a class="tab" id="tab1" href="#">프로필</a></li>
                  <li><a class="tab" id="tab2" href="#">공연 목록</a></li>
                  <li><a class="tab" id="tab3" href="#">대표곡</a></li>
                </ul>
            </div>
            
            <div class="contentView" id="artistIntro">
            ${challInfo.chall_intro}
<!--             	<img src="../img/apple_intro.png" width="900"> -->
            </div>
            
           
           <div class="contentView" id="artistConcert">
            	<Table id="table_ongoing">
                    <tr class="tr_ongoing">
                        <th class="ongoingTitle"><p>공연 제목</p></th>
                        <th class="ongoingDate"><p>공연 기간</p></th>
                    </tr>
                    
                    <tr class="tr_ongoing">
                        <td class="ongoingTitle"><p><a href=""></a></p></td>
                        <td class="ongoingDate"><p>sdafasdf</p></td>
                    </tr>     
                   
                </Table>
            </div>
            
           
            
            <div class="contentView" id="artistSong">                
            		<ul class="ul_artistSong">
                        <li class="innerCards innerCard1" >
                        	<div class="artistVideoWrap">
                        		
                        	</div>
                        	<div class="artistVideoTitle">
                        		<p><span>♬ </span>PIA - Urban Explorer</p>
                        	</div>
                        </li>
                        <li class="innerCards innerCard2" >
                        	<div class="artistVideoWrap">
                        		
                        	</div>
                        	<div class="artistVideoTitle">
                        		<p><span>♬ </span>PIA - Urban Explorer</p>
                        	</div>
                        </li>
            		</ul>
            		
            		<ul class="ul_artistSong">
                        <li class="innerCards innerCard1" >
                        	<div class="artistVideoWrap">
                        		
                        	</div>
                        	<div class="artistVideoTitle">
                        		<p><span>♬ </span>PIA - Urban Explorer</p>
                        	</div>
                        </li>
                        <li class="innerCards innerCard2" >
                        	<div class="artistVideoWrap">
                        		
                        	</div>
                        	<div class="artistVideoTitle">
                        		<p><span>♬ </span>PIA - Urban Explorer</p>
                        	</div>
                        </li>
            		</ul>
            		
            		<ul class="ul_artistSong">
                        <li class="innerCards innerCard1" >
                        	<div class="artistVideoWrap">
                        		
                        	</div>
                        	<div class="artistVideoTitle">
                        		<p><span>♬ </span>PIA - Urban Explorer</p>
                        	</div>
                        </li>
                        <li class="innerCards innerCard2" >
                        	<div class="artistVideoWrap">
                        		
                        	</div>
                        	<div class="artistVideoTitle">
                        		<p><span>♬ </span>PIA - Urban Explorer</p>
                        	</div>
                        </li>
            		</ul>
            		
                
                <p id="p_review">
                	<input id="write_review" class="innerButton button" type="button" value="후기 작성"/>
                </p>
            </div>
            
            
            
            <footer></footer>
    