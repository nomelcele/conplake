package or.conplake.mvc.model;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import or.conplake.mvc.dao.CommDao;
import or.conplake.mvc.dao.ConcertDao;
import or.conplake.mvc.dao.PostDao;
import or.conplake.vo.CommVO;
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
	@Autowired
	private CommDao cmdao;

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
		List<MultipartFile> files = pvo.getFiles(); // 업로드할 파일들이 저장된 List
		
		if(null != files & files.size()>0){
			for(MultipartFile multipartFile:files){ // List에서 파일을 읽어서 하나씩 업로드
				String fileName = multipartFile.getOriginalFilename(); // 파일의 이름
				
				if(fileName != ""){
					String path = "C:\\conplake\\ws\\conplake\\WebContent\\upload\\"+fileName;
					// 파일을 저장할 경로
					System.out.println("File Upload Path: "+path);
					File file = new File(path);
					file.mkdirs(); // File 객체 생성 후 지정한 경로에 파일 업로드
					
					try {
						multipartFile.transferTo(file); // 업로드된 파일 데이터를 지정한 파일에 저장 
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
		model.addAttribute("commList", cmdao.postCommList(post_num));
		return "concert.readReview";
	}
	
	@RequestMapping(value="/writePostComm")
	public String writePostComm(CommVO commvo){
		cmdao.writePostComm(commvo);
		return "redirect:readReview?post_num="+commvo.getComm_post();
	}

}
