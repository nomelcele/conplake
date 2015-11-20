package or.conplake.mvc.model;

import javax.servlet.http.HttpSession;

import or.conplake.mvc.dao.NoteDao;
import or.conplake.vo.MemberVO;
import or.conplake.vo.NoteVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoteModel {
	@Autowired
	private NoteDao ndao;
	
	@RequestMapping(value="/writeNote")
	public String writeNote(NoteVO nvo){
		// 쪽지 쓰기
		ndao.writeNote(nvo);
		return "";
	}
	
	@RequestMapping(value="/inbox")
	public String inbox(HttpSession session, Model model){
		// 받은 쪽지 리스트
		MemberVO mvo = (MemberVO) session.getAttribute("mvo"); // 로그인한 회원의 정보
		model.addAttribute("noteList", ndao.inbox(mvo.getMem_num()));
		model.addAttribute("inboxSent", "inbox");
		return "";
	}
	
	@RequestMapping(value="/readNote")
	public String readNote(int note_num, Model model){
		// 쪽지 읽기
		model.addAttribute("note", ndao.readNote(note_num));
		return "";
	}
	
	@RequestMapping(value="/sent")
	public String sent(HttpSession session, Model model){
		// 보낸 쪽지 리스트
		MemberVO mvo = (MemberVO) session.getAttribute("mvo"); // 로그인한 회원의 정보
		model.addAttribute("noteList", ndao.sent(mvo.getMem_num()));
		model.addAttribute("inboxSent", "sent");
		return "";
	}
}
