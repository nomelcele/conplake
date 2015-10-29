package or.conplake.mvc.model;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import or.conplake.mvc.dao.ConcertDao;
import or.conplake.mvc.dao.MemberDao;
import or.conplake.vo.ConcertVO;
import or.conplake.vo.MemberVO;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginModel {
	@Autowired
	private MemberDao mdao;
	@Autowired
	private ConcertDao cdao;
	
	@RequestMapping(value={"/loginForm","/"})
	public String loginForm(){
		return "login.loginForm";
	}

	@RequestMapping(value="/login")
	public String login(MemberVO mvo, HttpSession session){
		// 로그인 확인 -> 아이디/비번 대조
		int mem_num = mdao.login(mvo);
		
		if(mem_num == 0){
			// 로그인 실패
			System.out.println("로그인 실패");
			return "redirect:loginForm";
		} else {
			// 로그인 성공
			System.out.println("로그인 성공");
			session.setAttribute("mem_num",mem_num);
			
			
			////////////////////////////////////
			////////////////////////////////////
			// xml 파일 db에 넣기 테스트
			SAXBuilder builder = new SAXBuilder();
			try {
				
				ConcertVO cvo = new ConcertVO();
				
				URL url = new URL("http://www.culture.go.kr/openapi/rest/publicperformancedisplays/d/?seq=103687&serviceKey=hrRaabnR27NNLhagFx%2F7JCUqbmimBOXErGAvS2yl%2FDpIAcFMzKnwdueoYXrlysShsP1YB6XOjsZMnTV6yqGhmw%3D%3D");
				Document doc = builder.build(url);
				Element root = doc.getRootElement();
				Element body = root.getChild("msgBody");
				Element info = body.getChild("perforInfo");

				System.out.println(info.getContentSize());
				cvo.setCon_name(info.getChildText("title")); // 공연 이름
				cvo.setCon_poster(info.getChildText("imgUrl")); // 공연 포스터
				cvo.setCon_startdate(info.getChildText("startDate")); // 시작일
				cvo.setCon_enddate(info.getChildText("endDate")); // 종료일
				cvo.setCon_venue(Integer.parseInt(info.getChildText("placeSeq")));
				// 공연 장소 => sequence 쓰지 말고 공공 데이터에서 제공하는 고유 번호를 그대로 num에 넣기
				// cvo.setCon_artist(con_artist); // 아티스트
				// 아티스트는 어쩔?
				cvo.setCon_link(info.getChildText("url")); // 공연 예매 링크
				cvo.setCon_detailimg(info.getChildText("contents1")); // 공연 상세 소개
				cvo.setCon_price(info.getChildText("price")); // 공연 관람료
				cvo.setCon_tel(info.getChildText("phone")); // 공연 관련 문의 연락처
				
				cdao.addConcert(cvo);
			} catch (Exception e) {
				e.printStackTrace();
			}

			////////////////////////////////////
			////////////////////////////////////
			return "concert.main";
		}
		
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session){
		session.invalidate();
		System.out.println("로그아웃");
		return "redirect:loginForm";
	}
}
