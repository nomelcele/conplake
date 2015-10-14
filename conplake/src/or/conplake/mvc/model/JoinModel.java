package or.conplake.mvc.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import or.conplake.mvc.dao.MemberDao;
import or.conplake.vo.MemberVO;

@Controller
public class JoinModel {
	@Autowired
	private MemberDao mdao;
	
	@RequestMapping(value="/joinForm")
	public String joinForm(){
		// ȸ�� ���� �� �̵�
		return "join.joinForm";
	}
	
	@RequestMapping(value="/joinMember")
	public String joinMember(MemberVO mvo){
		// ȸ�� ����
		// �Է��� ���� ȸ�� �����ͺ��̽��� ����
		mdao.joinMember(mvo);
		return "login.loginForm";
	}
}
