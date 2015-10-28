package or.conplake.mvc.model;

import javax.servlet.http.HttpSession;

import or.conplake.mvc.dao.MemberDao;
import or.conplake.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginModel {
	@Autowired
	private MemberDao mdao;
	
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
