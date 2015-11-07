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
		// 회원 가입 폼 이동
		return "join.joinForm";
	}
	
	@RequestMapping(value="/joinMember")
	public String joinMember(MemberVO mvo){		
		// 회원 가입
		System.out.println("들어오긴 하니ㅡㅡ");

		// 입력한 정보 회원 데이터베이스에 저장
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
			// 중복된 아이디가 존재하는 경우
			pw.write("이미 사용 중인 아이디입니다.");
			pw.flush();
		} else {
			pw.write("사용 가능한 아이디입니다.");
			pw.flush();
		}
	}
	
}
