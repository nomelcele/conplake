package or.conplake.mvc.model;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import or.conplake.mvc.dao.ConcertDao;
import or.conplake.mvc.dao.ConcerthallDao;
import or.conplake.mvc.dao.PostDao;
import or.conplake.mvc.dao.SightimgDao;
import or.conplake.vo.SightimgVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ConcerthallModel {
	@Autowired
	private ConcerthallDao chdao;
	@Autowired
	private ConcertDao cdao;
	@Autowired
	private PostDao pdao;
	@Autowired
	private SightimgDao sidao;
	
	@RequestMapping(value="/concerthallSearch")
	public String concerthallSearch(String chall_name, Model model){
		model.addAttribute("challResult", chdao.concerthallSearch(chall_name));
		model.addAttribute("resultType", "concerthall");
		return "search.searchResult";
	}
	
	@RequestMapping(value="/concerthallInfo")
	public String concerthallInfo(int chall_num, Model model){
		model.addAttribute("challInfo", chdao.concerthallInfo(chall_num));
		model.addAttribute("ongoingCons", cdao.ongoingConcerts(chall_num));
		model.addAttribute("reviews", pdao.concerthallReviews(chall_num));
		return "hall.hallInfo";
	}
	
	@RequestMapping(value="/addSightimg")
	public String addSightimg(SightimgVO sivo, HttpSession session){
		// 좌석 시야 이미지 업로드
		MultipartFile sightimgFile = sivo.getSightimgFile(); // 업로드할 파일
		String t_path = session.getServletContext().getRealPath("/"); // 임시 경로
		String r_path = "C:\\conplake\\ws\\conplake\\WebContent\\resources\\sightImg\\";
		String fileName = sightimgFile.getOriginalFilename(); // 파일 이름
		
		File t_file = new File(t_path+fileName); // 임시 파일
		if(!t_file.exists()){
			t_file.mkdirs(); 
		}
		File r_file = new File(r_path+fileName);
		if(!r_file.exists()){
			r_file.mkdirs();
		}

		try {
			sightimgFile.transferTo(t_file); // 임시 파일 업로드
			sightimgFile.transferTo(r_file);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		sivo.setSi_imgname(fileName); // 이미지 파일 이름 저장
		sidao.addSightimg(sivo);
		return "hall.hallInfo"; // 나중에 고쳐
	}
	
}
