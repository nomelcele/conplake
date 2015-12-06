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
	public String concerthallSearch(String chall_name, String searchType, Model model){
		model.addAttribute("challResult", chdao.concerthallSearch(chall_name));
		model.addAttribute("resultType", "concerthall");
		
		String url = "";
		if(searchType.equals("searchLeft")){
			url = "search.searchResult";
		} else {
			url = "concert/searchConcerthall";
		}
		return url;
	}
	
	@RequestMapping(value="/concerthallInfo")
	public String concerthallInfo(int chall_num, Model model){
		model.addAttribute("challInfo", chdao.concerthallInfo(chall_num));
		model.addAttribute("ongoingCons", cdao.ongoingConcerts(chall_num));
		model.addAttribute("reviews", pdao.concerthallReviews(chall_num));
		model.addAttribute("sightimgs", sidao.sightimgList(chall_num));
		return "hall.hallInfo";
	}
	
	@RequestMapping(value="/addSightimg")
	public String addSightimg(SightimgVO sivo, HttpSession session){
		// �¼� �þ� �̹��� ���ε�
		MultipartFile t_sightimgFile = sivo.getSightimgFile(); // ���ε��� ����(�ӽ�)
//		MultipartFile r_sightimgFile = sivo.getSightimgFile();
		String t_path = session.getServletContext().getRealPath("/")+"resources\\sightImg\\"; // �ӽ� ���
//		String r_path = "C:\\conplake\\ws\\conplake\\WebContent\\resources\\sightImg\\";
		System.out.println("t_path: "+t_path);
		String fileName = t_sightimgFile.getOriginalFilename(); // ���� �̸�
		
		File t_file = new File(t_path+fileName); // �ӽ� ����
		if(!t_file.exists()){
			t_file.mkdirs(); 
		}
//		File r_file = new File(r_path+fileName);
//		if(!r_file.exists()){
//			r_file.mkdirs();
//		}

		try {
			t_sightimgFile.transferTo(t_file); // �ӽ� ���� ���ε�
//			r_sightimgFile.transferTo(r_file);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		sivo.setSi_imgname(fileName); // �̹��� ���� �̸� ����
		sidao.addSightimg(sivo);
		return "redirect:/concerthallInfo?chall_num="+sivo.getSi_concerthall(); // ���߿� ����
	}
	
	@RequestMapping(value="/searchSightimg")
	public String searchSightimg(SightimgVO sivo, Model model){
		model.addAttribute("sightimgs", sidao.searchSightimg(sivo));
		return "hall/sightImgList";
	}
	
}
