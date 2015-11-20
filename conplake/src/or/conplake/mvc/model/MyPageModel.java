package or.conplake.mvc.model;

import javax.servlet.http.HttpSession;

import or.conplake.mvc.dao.MemberDao;
import or.conplake.mvc.dao.UserinteractionDao;
import or.conplake.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageModel {
	@Autowired
	private MemberDao mdao;
	@Autowired
	private UserinteractionDao udao;
	
	@RequestMapping(value="/modifyInfo")
	public String modifyInfo(MemberVO mvo, HttpSession session){
		// ���� ���� ����
		mdao.modifyInfo(mvo);
		return "";
	}
	
	@RequestMapping(value="/friendsList")
	public String friendsList(int mem_num, Model model){
		// ģ�� ���
		model.addAttribute("friends", udao.friendsList(mem_num));
		return "";
	}
	
}
