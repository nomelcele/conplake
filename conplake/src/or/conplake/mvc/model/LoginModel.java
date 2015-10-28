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
