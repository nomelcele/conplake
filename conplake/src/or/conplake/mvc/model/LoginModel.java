package or.conplake.mvc.model;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginModel {
	@RequestMapping(value={"/login","/"})
	public String loginForm(){
		return "login.login";
	}
}
