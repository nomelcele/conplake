package or.conplake.mvc.model;

import java.util.List;

import javax.servlet.http.HttpSession;

import or.conplake.mvc.dao.MemberDao;
import or.conplake.mvc.dao.PostDao;
import or.conplake.mvc.dao.UserinteractionDao;
import or.conplake.vo.ArtistVO;
import or.conplake.vo.MemberVO;
import or.conplake.vo.PostVO;
import or.conplake.vo.UserinteractionVO;

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
	
	@RequestMapping(value="/modifyInfoForm")
	public String modifyInfoForm(HttpSession session, Model model){
		// 개인 정보 수정 페이지 이동
		System.out.println("왜 일로 오니 얘야....");
		int mem_num = ((MemberVO)session.getAttribute("mvo")).getMem_num();
		model.addAttribute("type", "modify");
		MemberVO memInfo = mdao.memInfo(mem_num);
		model.addAttribute("memInfo", memInfo);
		
		String mem_mail = memInfo.getMem_mail(); // 메일 주소
		model.addAttribute("mailId",mem_mail.substring(0, mem_mail.indexOf("@")));
		model.addAttribute("mailDomain",mem_mail.substring(mem_mail.indexOf("@")+1));
		
		String[] mem_addr = memInfo.getMem_addr().split("/"); // 주소
		String postcode = mem_addr[0];
		model.addAttribute("postcode1",postcode.substring(0,postcode.indexOf("-")));
		model.addAttribute("postcode2",postcode.substring(postcode.indexOf("-")+1));
		model.addAttribute("address1",mem_addr[1]);
		model.addAttribute("address2",mem_addr[2]);
		
		return "join.joinForm";
	}
	
	@RequestMapping(value="/modifyMemInfo")
	public String modifyInfo(MemberVO mvo, Model model, HttpSession session){
		// 개인 정보 수정
		mdao.modifyInfo(mvo);
		
		int mem_num = mvo.getMem_num();
		model.addAttribute("myProfile", mdao.myProfile(mem_num)); // 프로필
		model.addAttribute("likedArtists", udao.likedArtists(mem_num)); // 관심 아티스트
		model.addAttribute("likedConcerts", udao.likedConcerts(mem_num)); // 관심 공연
		model.addAttribute("myReviews", pdao.myReviews(mem_num)); // 작성 후기
		model.addAttribute("isFriend", "currentUser");
		return "myPage.myPage";
	}
	
	@RequestMapping(value="/myFriends")
	public String myFriends(int mem_num, Model model){
		// 친구 목록
		model.addAttribute("friends", udao.myFriends(mem_num));
		return "myPage/myFriends";
	}
	
	@RequestMapping(value="/myPage")
	public String myPage(int mem_num, Model model, HttpSession session){
		// 마이 페이지
		model.addAttribute("myProfile", mdao.myProfile(mem_num)); // 프로필
		model.addAttribute("likedArtists", udao.likedArtists(mem_num)); // 관심 아티스트
		model.addAttribute("likedConcerts", udao.likedConcerts(mem_num)); // 관심 공연
		model.addAttribute("myReviews", pdao.myReviews(mem_num)); // 작성 후기
		// 친구 여부 확인(다른 유저의 마이 페이지인 경우)
		int current_userNum = ((MemberVO)session.getAttribute("mvo")).getMem_num();
		if(current_userNum != mem_num){
			UserinteractionVO uivo = new UserinteractionVO();
			uivo.setUi_friend(mem_num);
			uivo.setUi_member(current_userNum);
			model.addAttribute("isFriend", udao.isFriend(uivo));
		} else {
			model.addAttribute("isFriend", "currentUser");
		}
		
		return "myPage.myPage";
	}
	
	@RequestMapping(value="/deleteFriend")
	public String deleteFriend(UserinteractionVO uivo, String type, Model model, HttpSession session){
		// 친구 삭제
		udao.deleteFriend(uivo);
		String url = "";
		if(type.equals("myFriends")){
			url = "redirect:/myFriends?mem_num="+uivo.getUi_member();
		} else {
			int mem_num = uivo.getUi_friend();
			model.addAttribute("myProfile", mdao.myProfile(mem_num)); // 프로필
			model.addAttribute("likedArtists", udao.likedArtists(mem_num)); // 관심 아티스트
			model.addAttribute("likedConcerts", udao.likedConcerts(mem_num)); // 관심 공연
			model.addAttribute("myReviews", pdao.myReviews(mem_num)); // 작성 후기
			// 친구 여부 확인(다른 유저의 마이 페이지인 경우)
			int current_userNum = ((MemberVO)session.getAttribute("mvo")).getMem_num();
				UserinteractionVO uivoRe = new UserinteractionVO();
				uivoRe.setUi_friend(mem_num);
				uivoRe.setUi_member(current_userNum);
				model.addAttribute("isFriend", udao.isFriend(uivoRe));
			
			url = "myPage/myPage";

		}
		return url;
	}
	
	@RequestMapping(value="/addFriend")
	public String addFriend(UserinteractionVO uivo, Model model, HttpSession session){
		// 친구 추가
		udao.addFriend(uivo);
		
		int mem_num = uivo.getUi_friend();
		model.addAttribute("myProfile", mdao.myProfile(mem_num)); // 프로필
		model.addAttribute("likedArtists", udao.likedArtists(mem_num)); // 관심 아티스트
		model.addAttribute("likedConcerts", udao.likedConcerts(mem_num)); // 관심 공연
		model.addAttribute("myReviews", pdao.myReviews(mem_num)); // 작성 후기
		// 친구 여부 확인(다른 유저의 마이 페이지인 경우)
		int current_userNum = ((MemberVO)session.getAttribute("mvo")).getMem_num();
			UserinteractionVO uivoRe = new UserinteractionVO();
			uivoRe.setUi_friend(mem_num);
			uivoRe.setUi_member(current_userNum);
			model.addAttribute("isFriend", udao.isFriend(uivoRe));
		
		return "myPage/myPage";
//		return "redirect:/myPage?mem_num="+uivo.getUi_friend();
	}
}
