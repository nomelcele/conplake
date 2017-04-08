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
		// �α��� Ȯ�� -> ���̵�/��� ����
		MemberVO memInfo = mdao.login(mvo);
		
		if(memInfo == null){
			// �α��� ����
			System.out.println("�α��� ����");
			return "redirect:loginForm";
		} else {
			// �α��� ����
			System.out.println("�α��� ����");
			session.setAttribute("mem_num",memInfo.getMem_num());
			
			/////////////////////////////////////////
			/////////////////////////////////////////
			// �����ڷ� �α������� ��
			// ���� ���� ������Ʈ
			if(memInfo.getMem_id().equals("admin")){
				String serviceKey = "hrRaabnR27NNLhagFx%2F7JCUqbmimBOXErGAvS2yl%2FDpIAcFMzKnwdueoYXrlysShsP1YB6XOjsZMnTV6yqGhmw%3D%3D";
				// 1. �Ⱓ�� ���� �˻�
				// => ���� ���� ���� ������ �ҷ��;� ��
				// enddate(������)�� ���� ��¥���� �����̸� �� ��
				// startdate: ���� ��¥-7,  enddate: ���� ��¥
				SAXBuilder builder = new SAXBuilder(); // ���� ��ü�� �����ϱ� ���� �ʿ�
							
				Date fromDate = new Date(); // ���� ��¥
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
					// �оߺ� �˻� -> ī�װ����� '����'�� ������ �˻�
					
					Document doc = builder.build(conUrl); // xml�� �о ���� ��ü ����
					List<Element> concerts = doc.getRootElement().getChild("msgBody").getChildren("perforList");
					// �±� �̸��� 'perforList'�� ������Ʈ���� ��� �о� List�� ����
					Iterator<Element> it = concerts.iterator();
					
					while(it.hasNext()){
						// ������Ʈ�� �ϳ��� ����
							Element info = it.next();
							
							URL detailUrl = new URL("http://www.culture.go.kr/openapi/rest/publicperformancedisplays/d/?"+
							"seq="+info.getChildText("seq")+
							"&serviceKey="+serviceKey);
							// ���� ���� ��ȣ�� ���� ���� �� ���� �˻�
							
							Document detailDoc = builder.build(detailUrl);
							Element detail = detailDoc.getRootElement().getChild("msgBody").getChild("perforInfo");
							

							if(cdao.checkConcert(Integer.parseInt(detail.getChildText("seq")))){
								System.out.println(detail.getChildText("title"));
								// ������ �̹� ����� ���������� üũ
								// �ߺ��� �����Ͱ� �ƴϸ� ���̺��� �ִ´�.
								// �о �����͸� DB�� ����
								ConcertVO cvo = new ConcertVO();
								cvo.setCon_num(Integer.parseInt(detail.getChildText("seq"))); // ���� ���� ��ȣ
								cvo.setCon_name(detail.getChildText("title")); // ���� �̸�
								cvo.setCon_poster(detail.getChildText("imgUrl")); // ���� ������
								cvo.setCon_startdate(detail.getChildText("startDate")); // ������
								cvo.setCon_enddate(detail.getChildText("endDate")); // ������
							    cvo.setCon_venue(chdao.searchConcerthallByName(detail.getChildText("place"))); // ���� ���
							    cvo.setCon_artist(0);
								cvo.setCon_link(detail.getChildText("url")); // ���� ���� ��ũ
								cvo.setCon_detailimg(detail.getChildText("contents1")); // ���� �� �Ұ�
								cvo.setCon_price(detail.getChildText("price")); // ���� ������
								cvo.setCon_tel(detail.getChildText("phone")); // ���� ���� ���� ����ó
												
								cdao.addConcert(cvo);
							}
							
					}
					
					////////////////////////////////////
					////////////////////////////////////
					// ������ ���� ������Ʈ
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
//							// ������ �̹� ����� ���������� üũ
//							// �ߺ��� �����Ͱ� �ƴϸ� ���̺��� �ִ´�.
//							System.out.println(challDetail.getChildText("culName"));
//							ConcerthallVO chvo = new ConcerthallVO();
//							chvo.setChall_num(Integer.parseInt(challDetail.getChildText("seq"))); // ������ ���� ��ȣ
//							chvo.setChall_name(challDetail.getChildText("culName")); // ������ �̸�
//							chvo.setChall_addr(challDetail.getChildText("culAddr")); // ������ �ּ�
//							chvo.setChall_tel(challDetail.getChildText("culTel")); // ������ ����ó
//							chvo.setChall_official(challDetail.getChildText("culHomeUrl")); // ������ ���� ����Ʈ �ּ�
//							chvo.setChall_img(challDetail.getChildText("culViewImg1")); // ������ ����
//							// ������ �¼�ǥ ����
//							chvo.setChall_intro(challDetail.getChildText("culCont")); // ������ �Ұ�
//							
//							if(challDetail.getChildText("gpsX") == ""){
//								chvo.setChall_gpsx(0);
//								chvo.setChall_gpsy(0);
//							} else {
//								// ���� ó�� -> �� ���� �˻� �� gps �����Ͱ� ��ȸ���� �ʴ� �������� ����
//								// ���߿� ���� ������ �ֱ�
//								chvo.setChall_gpsx(Double.parseDouble(challDetail.getChildText("gpsX"))); // ������ gps-x
//								chvo.setChall_gpsy(Double.parseDouble(challDetail.getChildText("gpsY"))); // ������ gps-y
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
		System.out.println("�α׾ƿ�");
		return "redirect:loginForm";
	}
	

	@RequestMapping(value="/findPwd")
	public String findPwd(){
		// ��й�ȣ ã��
		return "login/findPwd";
	}
	
	@RequestMapping(value="/sendPwdMail")
	public String sendPwdMail(MemberVO mvo, HttpSession session, Model model) throws Exception{
		// ��й�ȣ ã�� ���� ���� �߼�
		MemberVO memInfo = mdao.confirmIdMail(mvo);
		if(memInfo != null){
			// ����ڰ� �Է��� ���̵�� ������ ȸ�� ������ �´� ���
			// ���� ����
			int code = (int)((Math.random()*900000)+100000); // 6�ڸ� ���� ��ȣ
			String sender = "saluthiver@gmail.com";
			String recipient = memInfo.getMem_mail();
			String subject = "[CONPLAKE] ��й�ȣ ã�� ���� �����Դϴ�.";
			String content = memInfo.getMem_name()+"��, ��й�ȣ ã�� ���� ��ȣ�� "+code+
					"�Դϴ�. \n ���� ��ȣ �Է� �� ��й�ȣ�� ������ �ּ���.";
			
			// ������ ��� ���� ��ü
			Properties p = new Properties();
			// SMTP ������ ���� ����
			// Naver�� ������ ��� ���̹� ���̵� ����
			// Google�� ������ ��� ������ Gmail �ּ�
			p.put("mail.smtp.user", sender);
			// SMTP ���� ���� ����
			// ���̹��� ��� smtp.naver.com
			// Google�� ��� smtp.gmail.com
			p.put("mail.smtp.host", "smtp.gmail.com");
			// �Ʒ� ������ ���̹��� ������ ����
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
				// ������ ������ �� ���� ��Ȳ�� �ֿܼ� ���
				ses.setDebug(true);
				// ������ ������ ��� ���� ��ü
				MimeMessage msg = new MimeMessage(ses);
				// ���� ����
				msg.setSubject(subject);
				// ������ ����� ���� �ּ�
				Address fromAddr = new InternetAddress(sender);
				msg.setFrom(fromAddr);
				// �޴� ����� ���� �ּ�
				Address toAddr = new InternetAddress(recipient);
				msg.addRecipient(Message.RecipientType.TO, toAddr);
				// �޽��� ������ ����� ����, ĳ���� �� ����
				msg.setContent(content, "text/html;charset=UTF-8");
				// �߼�
				Transport.send(msg);
			} catch (Exception mex) {
				mex.printStackTrace();
				throw new Exception("���� ���ۿ� �����߽��ϴ�.");
			}
			session.setAttribute("code", code);
			model.addAttribute("memInfo", memInfo);
		} else {
			throw new Exception("���̵� ���� �ּҰ� Ʋ�Ƚ��ϴ�. �ٽ� Ȯ���� �ּ���.");
		}
		
		return "login/enterCode";
	}
	
	@RequestMapping(value="/checkCode")
	public String checkCode(int userCode, HttpSession session) throws Exception{
		// ����ڰ� �Է��� ���� ��ȣ�� �ùٸ��� Ȯ��
		if((int)session.getAttribute("code") == userCode){
			return "login/enterCode";
		} else {
			throw new Exception("������ȣ�� ��ġ���� �ʽ��ϴ�.");
		}
		
	}
	
	@RequestMapping(value="/changePwd")
	public String changePwd(MemberVO mvo){
		mdao.changePwd(mvo);
		return "login/enterCode";
	}
}