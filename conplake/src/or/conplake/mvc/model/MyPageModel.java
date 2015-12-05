package or.conplake.mvc.model;

import java.util.List;

import javax.servlet.http.HttpSession;

import or.conplake.mvc.dao.MemberDao;
import or.conplake.mvc.dao.PostDao;
import or.conplake.mvc.dao.UserinteractionDao;
import or.conplake.vo.ArtistVO;
import or.conplake.vo.MemberVO;
import or.conplake.vo.PostVO;

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
	@Autowired
	private PostDao pdao;
	
	@RequestMapping(value="/modifyInfo")
	public String modifyInfo(MemberVO mvo, HttpSession session){
		// ���� ���� ����
		mdao.modifyInfo(mvo);
		return "";
	}
	
	@RequestMapping(value="/myFriends")
	public String myFriends(int mem_num, Model model){
		// ģ�� ���
		model.addAttribute("friends", udao.myFriends(mem_num));
		return "myPage/myFriends";
	}
	
	@RequestMapping(value="/myPage")
	public String myPage(int mem_num, Model model){
		// ���� ������
		model.addAttribute("myProfile", mdao.myProfile(mem_num)); // ������
		model.addAttribute("likedArtists", udao.likedArtists(mem_num)); // ���� ��Ƽ��Ʈ
		model.addAttribute("likedConcerts", udao.likedConcerts(mem_num)); // ���� ����
		model.addAttribute("myReviews", pdao.myReviews(mem_num)); // �ۼ� �ı�
		
		return "myPage.myPage";
	}
}
