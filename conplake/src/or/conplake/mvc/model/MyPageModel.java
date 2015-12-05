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
		// 개인 정보 수정
		mdao.modifyInfo(mvo);
		return "";
	}
	
	@RequestMapping(value="/myFriends")
	public String myFriends(int mem_num, Model model){
		// 친구 목록
		model.addAttribute("friends", udao.myFriends(mem_num));
		return "myPage/myFriends";
	}
	
	@RequestMapping(value="/myPage")
	public String myPage(int mem_num, Model model){
		// 마이 페이지
		model.addAttribute("myProfile", mdao.myProfile(mem_num)); // 프로필
		model.addAttribute("likedArtists", udao.likedArtists(mem_num)); // 관심 아티스트
		model.addAttribute("likedConcerts", udao.likedConcerts(mem_num)); // 관심 공연
		model.addAttribute("myReviews", pdao.myReviews(mem_num)); // 작성 후기
		
		return "myPage.myPage";
	}
}
