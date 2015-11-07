package or.conplake.mvc.model;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	public String joinMember(MemberVO mvo){		
		// ȸ�� ����
		System.out.println("������ �ϴϤѤ�");

		// �Է��� ���� ȸ�� �����ͺ��̽��� ����
		mdao.joinMember(mvo);
		return "login.loginForm";
	}
	
	@RequestMapping(value="/imgUpload")
	public String imgUpload(){
		return "join/imgUpload";
	}
	
	@RequestMapping(value="/idCheck")
	public void idCheck(String mem_id, HttpServletResponse response) throws IOException{
		PrintWriter pw = response.getWriter();
		if(mdao.idCheck(mem_id)){
			// �ߺ��� ���̵� �����ϴ� ���
			pw.write("�̹� ��� ���� ���̵��Դϴ�.");
			pw.flush();
		} else {
			pw.write("��� ������ ���̵��Դϴ�.");
			pw.flush();
		}
	}
	
}
