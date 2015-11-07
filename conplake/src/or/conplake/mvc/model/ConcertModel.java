package or.conplake.mvc.model;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import or.conplake.mvc.dao.ConcertDao;
import or.conplake.mvc.dao.PostDao;
import or.conplake.vo.ConcertVO;
import or.conplake.vo.PostVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ConcertModel {
	@Autowired
	private ConcertDao cdao;
	@Autowired
	private PostDao pdao;

	@RequestMapping(value = "/main")
	public String main(Model model) {
		model.addAttribute("conList", cdao.concertList());
		return "concert.main";
	}

	@RequestMapping(value = "/concertInfo")
	public String concertInfo(int con_num, Model model) {
		model.addAttribute("conInfo", cdao.concertInfo(con_num));
		model.addAttribute("reviewList", pdao.reviewList(con_num));
		return "concert.concertInfo";
	}

	@RequestMapping(value = "/concertSearch")
	public String concertSearch(ConcertVO cvo, Model model) {
		model.addAttribute("conResult", cdao.concertSearch(cvo));
		model.addAttribute("resultType", "concert");
		return "search.searchResult";
	}

	@RequestMapping(value = "/writeReviewForm")
	public String writeReviewForm(int con_num, Model model) {
		model.addAttribute("conWriteInfo", cdao.concertInfo(con_num));
		return "concert.writeReview";
	}

	@RequestMapping(value = "/writeReview")
	public String writeReview(PostVO pvo) {
		List<MultipartFile> files = pvo.getFiles();
		List<String> fileNames = new ArrayList<String>();
		
		if(null != files & files.size()>0){
			for(MultipartFile multipartFile:files){
//				String fileName = multipartFile.getOriginalFilename();
//				fileNames.add(fileName);
//				try {
//					multipartFile.transferTo(new File("C:\\conplake\\ws\\conplake\\WebContent\\upload\\"+fileName));
//				} catch (Exception e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
				
				String fileName = multipartFile.getOriginalFilename();
				
				if(fileName != ""){
					String path = "C:\\conplake\\ws\\conplake\\WebContent\\upload\\"+fileName;
					System.out.println("File Upload Path: "+path);
					File file = new File(path);
					file.mkdirs();
					
					try {
						multipartFile.transferTo(file);
					} catch (Exception e) {
						e.printStackTrace();
					} 
				}
			}
		}
		
		
		pdao.writeReview(pvo);
		return "redirect:concertInfo?con_num=" + pvo.getPost_concert();
	}

	@RequestMapping(value = "/readReview")
	public String readReview(int post_num, Model model) {
		model.addAttribute("reviewDetail", pdao.readReview(post_num));
		return "concert.readReview";
	}

}
