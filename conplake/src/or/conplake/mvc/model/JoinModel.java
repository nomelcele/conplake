package or.conplake.mvc.model;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	public String joinMember(MemberVO mvo, @RequestParam("mem_img")MultipartFile mem_img, HttpSession session){
		// ���� ����
		// ȸ�� ����
		System.out.println("ȸ�� ����!!!!!!!!!!!!!");
		
		// �̹��� ���� ���ε�
		String r_path = session.getServletContext().getRealPath("/");
		String oriFn = mem_img.getOriginalFilename();
		StringBuffer path = new StringBuffer();
		path.append(r_path).append("upload\\").append(oriFn);
		System.out.println("Member Img Upload Path: "+path.toString());
		
		File file = new File(path.toString());
		if(!file.exists()){
			file.mkdirs();
		}
		
		try {
			mem_img.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
		} 

		
		// �Է��� ���� ȸ�� �����ͺ��̽��� ����
		mdao.joinMember(mvo);
		return "login.loginForm";
	}
	
}
