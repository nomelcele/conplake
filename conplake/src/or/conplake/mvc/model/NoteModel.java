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
		// ���� ����
		ndao.writeNote(nvo);
		return "";
	}
	
	@RequestMapping(value="/inbox")
	public String inbox(HttpSession session, Model model){
		// ���� ���� ����Ʈ
		MemberVO mvo = (MemberVO) session.getAttribute("mvo"); // �α����� ȸ���� ����
		model.addAttribute("noteList", ndao.inbox(mvo.getMem_num()));
		model.addAttribute("inboxSent", "inbox");
		return "";
	}
	
	@RequestMapping(value="/readNote")
	public String readNote(int note_num, Model model){
		// ���� �б�
		model.addAttribute("note", ndao.readNote(note_num));
		return "";
	}
	
	@RequestMapping(value="/sent")
	public String sent(HttpSession session, Model model){
		// ���� ���� ����Ʈ
		MemberVO mvo = (MemberVO) session.getAttribute("mvo"); // �α����� ȸ���� ����
		model.addAttribute("noteList", ndao.sent(mvo.getMem_num()));
		model.addAttribute("inboxSent", "sent");
		return "";
	}
}
