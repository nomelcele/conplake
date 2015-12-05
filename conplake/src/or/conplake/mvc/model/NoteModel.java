package or.conplake.mvc.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import or.conplake.mvc.dao.MemberDao;
import or.conplake.mvc.dao.NoteDao;
import or.conplake.mvc.dao.UserinteractionDao;
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
	@Autowired
	private MemberDao mdao;
	@Autowired
	private UserinteractionDao udao;
	
	@RequestMapping(value="/writeNote")
	public String writeNote(NoteVO nvo, String toNameId){
		// 쪽지 쓰기
		int startIdx = toNameId.indexOf("(")+1;
		int endIdx = toNameId.indexOf(")");
		String toId = toNameId.substring(startIdx, endIdx);
		int note_to = mdao.findMemnum(toId);
		nvo.setNote_to(note_to);
		
		ndao.writeNote(nvo);
		return "redirect:/inbox?mem_num="+nvo.getNote_from();
	}
	
	@RequestMapping(value="/inbox")
	public String inbox(int mem_num, Model model){
		// 받은 쪽지 리스트
		model.addAttribute("noteList", ndao.inbox(mem_num));
		model.addAttribute("inboxSent", "inbox");
		return "note/noteList";
	}
	
	@RequestMapping(value="/readNote")
	public String readNote(int note_num, Model model){
		// 쪽지 읽기
		model.addAttribute("note", ndao.readNote(note_num));
		return "note/readNote";
	}
	
	@RequestMapping(value="/sent")
	public String sent(int mem_num, Model model){
		// 보낸 쪽지 리스트
		model.addAttribute("noteList", ndao.sent(mem_num));
		model.addAttribute("inboxSent", "sent");
		return "note/noteList";
	}
	
	@RequestMapping(value="/writeNoteForm")
	public String writeNoteForm(String type, int note_from, Model model){
		if(type.equals("normal")){
			model.addAttribute("replyId", "");
		} else {
			// 답장 쓸 때
			model.addAttribute("replyId", mdao.myProfile(note_from));
		}
		return "note/writeNote";	
	}
	
	@RequestMapping(value="/addressBook")
	public void addressBook(HttpSession session, HttpServletResponse response) throws IOException{
		int mem_num = ((MemberVO)session.getAttribute("mvo")).getMem_num();
		List<MemberVO> friends = udao.myFriends(mem_num);
		
		String[] names = new String[friends.size()];
		String[] ids = new String[friends.size()];
		
		// json 형식으로 전송할 데이터(이름+아이디)
		StringBuffer sb = new StringBuffer();
		sb.append("[");
		for(int i=0; i<friends.size(); i++){
			names[i] = friends.get(i).getMem_name();
			ids[i] = friends.get(i).getMem_id();
			sb.append("\"");
			sb.append(names[i]+" ("+ids[i]+")");
			sb.append("\"");
			if(!(i == friends.size()-1)){
				sb.append(",");
			}
		}
		sb.append("]");
		
		PrintWriter pw = response.getWriter();
		pw.write(sb.toString());
		pw.flush();
		pw.close();
		
		
	}
}
