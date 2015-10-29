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
		// �α��� Ȯ�� -> ���̵�/��� ����
		int mem_num = mdao.login(mvo);
		
		if(mem_num == 0){
			// �α��� ����
			System.out.println("�α��� ����");
			return "redirect:loginForm";
		} else {
			// �α��� ����
			System.out.println("�α��� ����");
			session.setAttribute("mem_num",mem_num);
			
			
			////////////////////////////////////
			////////////////////////////////////
			// xml ���� db�� �ֱ� �׽�Ʈ
			SAXBuilder builder = new SAXBuilder();
			try {
				
				ConcertVO cvo = new ConcertVO();
				
				URL url = new URL("http://www.culture.go.kr/openapi/rest/publicperformancedisplays/d/?seq=103687&serviceKey=hrRaabnR27NNLhagFx%2F7JCUqbmimBOXErGAvS2yl%2FDpIAcFMzKnwdueoYXrlysShsP1YB6XOjsZMnTV6yqGhmw%3D%3D");
				Document doc = builder.build(url);
				Element root = doc.getRootElement();
				Element body = root.getChild("msgBody");
				Element info = body.getChild("perforInfo");

				System.out.println(info.getContentSize());
				cvo.setCon_name(info.getChildText("title")); // ���� �̸�
				cvo.setCon_poster(info.getChildText("imgUrl")); // ���� ������
				cvo.setCon_startdate(info.getChildText("startDate")); // ������
				cvo.setCon_enddate(info.getChildText("endDate")); // ������
				cvo.setCon_venue(Integer.parseInt(info.getChildText("placeSeq")));
				// ���� ��� => sequence ���� ���� ���� �����Ϳ��� �����ϴ� ���� ��ȣ�� �״�� num�� �ֱ�
				// cvo.setCon_artist(con_artist); // ��Ƽ��Ʈ
				// ��Ƽ��Ʈ�� ��¿?
				cvo.setCon_link(info.getChildText("url")); // ���� ���� ��ũ
				cvo.setCon_detailimg(info.getChildText("contents1")); // ���� �� �Ұ�
				cvo.setCon_price(info.getChildText("price")); // ���� ������
				cvo.setCon_tel(info.getChildText("phone")); // ���� ���� ���� ����ó
				
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
		System.out.println("�α׾ƿ�");
		return "redirect:loginForm";
	}
}
