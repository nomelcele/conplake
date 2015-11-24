package or.conplake.mvc.model;

import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import or.conplake.mvc.dao.ConcertDao;
import or.conplake.mvc.dao.ConcerthallDao;
import or.conplake.mvc.dao.MemberDao;
import or.conplake.vo.ConcertVO;
import or.conplake.vo.ConcerthallVO;
import or.conplake.vo.MemberVO;

import org.jdom2.Content;
import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;
import org.jdom2.util.IteratorIterable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginModel {
	@Autowired
	private MemberDao mdao;
	@Autowired
	private ConcertDao cdao;
	@Autowired
	private ConcerthallDao chdao;
	
	@RequestMapping(value={"/loginForm","/"})
	public String loginForm(HttpSession session){
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		if(mvo == null){
			return "login.loginForm";
		} else {
			return "redirect:main";
		}
	}

	@RequestMapping(value="/login")
	public String login(MemberVO mvo, HttpSession session){
		// 로그인 확인 -> 아이디/비번 대조
		MemberVO memInfo = mdao.login(mvo);
		
		if(memInfo == null){
			// 로그인 실패
			System.out.println("로그인 실패");
			return "redirect:loginForm";
		} else {
			// 로그인 성공
			System.out.println("로그인 성공");
			session.setAttribute("mem_num",memInfo.getMem_num());
			
			/////////////////////////////////////////
			/////////////////////////////////////////
			// 관리자로 로그인했을 때
			// 공연 정보 업데이트
			if(memInfo.getMem_id().equals("admin")){
				String serviceKey = "hrRaabnR27NNLhagFx%2F7JCUqbmimBOXErGAvS2yl%2FDpIAcFMzKnwdueoYXrlysShsP1YB6XOjsZMnTV6yqGhmw%3D%3D";
				// 1. 기간별 공연 검색
				// => 현재 진행 중인 공연만 불러와야 함
				// enddate(종료일)이 현재 날짜보다 이전이면 안 됨
				// startdate: 현재 날짜-7,  enddate: 현재 날짜
				SAXBuilder builder = new SAXBuilder(); // 문서 객체를 생성하기 위해 필요
							
				Date fromDate = new Date(); // 현재 날짜
				Calendar cal = Calendar.getInstance();
				cal.add(Calendar.DATE, 60);
				Date toDate = cal.getTime();
	
				String to = new SimpleDateFormat("yyyyMMdd").format(toDate);
				String from = new SimpleDateFormat("yyyyMMdd").format(fromDate);
								
				try {
					URL conUrl = new URL("http://www.culture.go.kr/openapi/rest/publicperformancedisplays/realm?"+
										"realmCode=B000&cPage=1&rows=300&"+"from="+from+"&to="+to+
										"&sido=&gugun=&place=&gpsxfrom=&gpsyfrom=&gpsxto=&gpsyto="+
										"&keyword=&sortStdr=1&"+"serviceKey="+serviceKey);
					// 분야별 검색 -> 카테고리가 '음악'인 공연만 검색
					
					Document doc = builder.build(conUrl); // xml을 읽어서 문서 객체 생성
					List<Element> concerts = doc.getRootElement().getChild("msgBody").getChildren("perforList");
					// 태그 이름이 'perforList'인 엘리먼트들을 모두 읽어 List에 저장
					Iterator<Element> it = concerts.iterator();
					
					while(it.hasNext()){
						// 엘리먼트를 하나씩 읽음
							Element info = it.next();
							
							URL detailUrl = new URL("http://www.culture.go.kr/openapi/rest/publicperformancedisplays/d/?"+
							"seq="+info.getChildText("seq")+
							"&serviceKey="+serviceKey);
							// 공연 고유 번호를 통해 공연 상세 정보 검색
							
							Document detailDoc = builder.build(detailUrl);
							Element detail = detailDoc.getRootElement().getChild("msgBody").getChild("perforInfo");
							

							if(cdao.checkConcert(Integer.parseInt(detail.getChildText("seq")))){
								System.out.println(detail.getChildText("title"));
								// 기존에 이미 저장된 데이터인지 체크
								// 중복된 데이터가 아니면 테이블에 넣는다.
								// 읽어낸 데이터를 DB에 저장
								ConcertVO cvo = new ConcertVO();
								cvo.setCon_num(Integer.parseInt(detail.getChildText("seq"))); // 공연 고유 번호
								cvo.setCon_name(detail.getChildText("title")); // 공연 이름
								cvo.setCon_poster(detail.getChildText("imgUrl")); // 공연 포스터
								cvo.setCon_startdate(detail.getChildText("startDate")); // 시작일
								cvo.setCon_enddate(detail.getChildText("endDate")); // 종료일
							    cvo.setCon_venue(chdao.searchConcerthallByName(detail.getChildText("place"))); // 공연 장소
								cvo.setCon_link(detail.getChildText("url")); // 공연 예매 링크
								cvo.setCon_detailimg(detail.getChildText("contents1")); // 공연 상세 소개
								cvo.setCon_price(detail.getChildText("price")); // 공연 관람료
								cvo.setCon_tel(detail.getChildText("phone")); // 공연 관련 문의 연락처
												
								cdao.addConcert(cvo);
							}
							
					}
					
					////////////////////////////////////
					////////////////////////////////////
					// 공연장 정보 업데이트
//					URL challUrl = new URL("http://www.culture.go.kr/openapi/rest/cultureartspaces/performingplace?cPage=4&rows=200&gpsxfrom=&gpsyfrom=&gpsxto=&gpsyto=&keyword=&serviceKey="+serviceKey);
//					Document challDoc = builder.build(challUrl);
//					List<Element> challs = challDoc.getRootElement().getChild("msgBody").getChildren("placeList");
//					Iterator<Element> challIt = challs.iterator();
//					
//					while(challIt.hasNext()){
//						Element info = challIt.next();
//						URL challDetailUrl = new URL("http://www.culture.go.kr/openapi/rest/cultureartspaces/d/?"+
//						"seq="+info.getChildText("seq")+
//						"&serviceKey="+serviceKey);
//					
//						Document challDetailDoc = builder.build(challDetailUrl);
//						Element challDetail = challDetailDoc.getRootElement().getChild("msgBody").getChild("placeInfo");
//						
//						if(chdao.checkConcerthall(Integer.parseInt(challDetail.getChildText("seq")))){
//							// 기존에 이미 저장된 데이터인지 체크
//							// 중복된 데이터가 아니면 테이블에 넣는다.
//							System.out.println(challDetail.getChildText("culName"));
//							ConcerthallVO chvo = new ConcerthallVO();
//							chvo.setChall_num(Integer.parseInt(challDetail.getChildText("seq"))); // 공연장 고유 번호
//							chvo.setChall_name(challDetail.getChildText("culName")); // 공연장 이름
//							chvo.setChall_addr(challDetail.getChildText("culAddr")); // 공연장 주소
//							chvo.setChall_tel(challDetail.getChildText("culTel")); // 공연장 연락처
//							chvo.setChall_official(challDetail.getChildText("culHomeUrl")); // 공연장 공식 사이트 주소
//							chvo.setChall_img(challDetail.getChildText("culViewImg1")); // 공연장 사진
//							// 공연장 좌석표 사진
//							chvo.setChall_intro(challDetail.getChildText("culCont")); // 공연장 소개
//							
//							if(challDetail.getChildText("gpsX") == ""){
//								chvo.setChall_gpsx(0);
//								chvo.setChall_gpsy(0);
//							} else {
//								// 예외 처리 -> 상세 정보 검색 시 gps 데이터가 조회되지 않는 공연장이 있음
//								// 나중에 따로 데이터 넣기
//								chvo.setChall_gpsx(Double.parseDouble(challDetail.getChildText("gpsX"))); // 공연장 gps-x
//								chvo.setChall_gpsy(Double.parseDouble(challDetail.getChildText("gpsY"))); // 공연장 gps-y
//							}
//							chdao.addConcerthall(chvo);
//						}
//					}
//					
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
			
			session.setAttribute("mvo", memInfo);
			return "redirect:main";
		}
		
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session){
		session.invalidate();
		System.out.println("로그아웃");
		return "redirect:loginForm";
	}
	

	@RequestMapping(value="/findPwd")
	public String findPwd(){
		// 비밀번호 찾기
		return "login/findPwd";
	}
	
	@RequestMapping(value="/sendPwdMail")
	public String sendPwdMail(MemberVO mvo, HttpSession session, Model model) throws Exception{
		// 비밀번호 찾기 인증 메일 발송
		MemberVO memInfo = mdao.confirmIdMail(mvo);
		if(memInfo != null){
			// 사용자가 입력한 아이디와 메일이 회원 정보와 맞는 경우
			// 메일 전송
			int code = (int)((Math.random()*900000)+100000); // 6자리 인증 번호
			String sender = "saluthiver@gmail.com";
			String recipient = memInfo.getMem_mail();
			String subject = "[CONPLAKE] 비밀번호 찾기 인증 메일입니다.";
			String content = memInfo.getMem_name()+"님, 비밀번호 찾기 인증 번호는 "+code+
					"입니다. \n 인증 번호 입력 후 비밀번호를 변경해 주세요.";
			
			//정보를 담기 위한 객체
			Properties p = new Properties();
			//SMTP 서버의 계정 설정
			//Naver와 연결할 경우 네이버 아이디 지정
			//Google과 연결할 경우 본인의 Gmail 주소
			p.put("mail.smtp.user", sender);
			//SMTP 서버 정보 설정
			//네이버일 경우 smtp.naver.com
			//Google일 경우 smtp.gmail.com
			p.put("mail.smtp.host", "smtp.gmail.com");
			//아래 정보는 네이버와 구글이 동일하므로 수정하지 마세요.
			p.put("mail.smtp.port", "465");
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.auth", "true");
			p.put("mail.smtp.debug", "true");
			p.put("mail.smtp.socketFactory.port", "465");
			p.put("mail.smtp.socketFactory.class",
					"javax.net.ssl.SSLSocketFactory");
			p.put("mail.smtp.socketFactory.fallback", "false");

			try {
				Authenticator auth = new Authenticator() {
					@Override
					protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
						return new javax.mail.PasswordAuthentication(sender, "152appconplake");
					}
				};
				Session ses = Session.getInstance(p, auth);
				// 메일을 전송할 때 상세한 상황을 콘솔에 출력한다.
				ses.setDebug(true);
				// 메일의 내용을 담기 위한 객체
				MimeMessage msg = new MimeMessage(ses);
				// 제목 설정
				msg.setSubject(subject);
				// 보내는 사람의 메일주소
				Address fromAddr = new InternetAddress(sender);
				msg.setFrom(fromAddr);
				// 받는 사람의 메일주소
				Address toAddr = new InternetAddress(recipient);
				msg.addRecipient(Message.RecipientType.TO, toAddr);
				// 메시지 본문의 내용과 형식, 캐릭터 셋 설정
				msg.setContent(content, "text/html;charset=UTF-8");
				// 발송하기
				Transport.send(msg);
			} catch (Exception mex) {
				mex.printStackTrace();
				throw new Exception("메일 전송에 실패했습니다.");
			}
			session.setAttribute("code", code);
			model.addAttribute("memInfo", memInfo);
		} else {
			throw new Exception("아이디나 메일 주소가 틀렸습니다. 다시 확인해 주세요.");
		}
		
		System.out.println("???????");
		return "login/enterCode";
	}
	
	@RequestMapping(value="/checkCode")
	public String checkCode(int userCode, HttpSession session) throws Exception{
		// 사용자가 입력한 인증 번호가 올바른지 확인
		if((int)session.getAttribute("code") == userCode){
			return "login/enterCode";
		} else {
			throw new Exception("인증번호가 일치하지 않습니다.");
		}
		
	}
	
	@RequestMapping(value="/changePwd")
	public void changePwd(MemberVO mvo){
		mdao.changePwd(mvo);
	}
}
