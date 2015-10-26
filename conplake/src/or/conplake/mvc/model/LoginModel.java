package or.conplake.mvc.model;

import or.conplake.vo.MemberVO;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginModel {
	@RequestMapping(value={"/login","/"})
	public String loginForm(){
		return "login.loginForm";
	}
//	
//	@RequestMapping(value="")
//	public String login(MemberVO mvo){
//		return "login.login
//	}
}
