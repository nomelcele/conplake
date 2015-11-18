package or.conplake.mvc.model;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import or.conplake.mvc.dao.CommDao;
import or.conplake.mvc.dao.ConcertDao;
import or.conplake.mvc.dao.PostDao;
import or.conplake.mvc.dao.SongDao;
import or.conplake.vo.CommVO;
import or.conplake.vo.ConcertVO;
import or.conplake.vo.PostVO;
import or.conplake.vo.SongVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ConcertModel {
	@Autowired
	private ConcertDao cdao;
	@Autowired
	private PostDao pdao;
	@Autowired
	private CommDao cmdao;
	@Autowired
	private SongDao sdao;

	@RequestMapping(value = "/main")
	public String main(Model model) {
		model.addAttribute("conList", cdao.concertList());
		return "concert.main";
	}

	@RequestMapping(value = "/concertInfo")
	public String concertInfo(@RequestParam HashMap<String, String> map,
			Model model) {
		model.addAttribute("conInfo",
				cdao.concertInfo(Integer.parseInt(map.get("con_num"))));
		model.addAttribute("reviewList", pdao.reviewList(map));
		model.addAttribute("setlist", sdao.setlist(Integer.parseInt(map.get("con_num"))));
		return "concert.concertInfo";
		// model.addAttribute("conInfo", cdao.concertInfo(con_num));
		// model.addAttribute("reviewList", pdao.reviewList(con_num));
		// return "concert.concertInfo";
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
		model.addAttribute("setlist", sdao.setlist(con_num));
		return "concert.writeReview";
	}

	@RequestMapping(value = "/writeReview")
	public String writeReview(PostVO pvo) {
		List<MultipartFile> files = pvo.getFiles(); // ���ε��� ���ϵ��� ����� List

		if (null != files & files.size() > 0) {
			for (MultipartFile multipartFile : files) { // List���� ������ �о �ϳ���
														// ���ε�
				String fileName = multipartFile.getOriginalFilename(); // ������ �̸�

				if (fileName != "") {
					String path = "C:\\conplake\\ws\\conplake\\WebContent\\upload\\"
							+ fileName;
					// ������ ������ ���
					System.out.println("File Upload Path: " + path);
					File file = new File(path);
					file.mkdirs(); // File ��ü ���� �� ������ ��ο� ���� ���ε�

					try {
						multipartFile.transferTo(file); // ���ε�� ���� �����͸� ������ ���Ͽ�
														// ����
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

	@RequestMapping(value = "/writePostComm")
	public String writePostComm(CommVO commvo) {
		cmdao.writePostComm(commvo);
		return "redirect:readReview?post_num=" + commvo.getComm_post();
	}

	@RequestMapping(value = "/reviewSearch")
	public String reviewSearch(@RequestParam HashMap<String, String> map,
			Model model) {
		return "";
	}

	@RequestMapping(value = "/editSetlist")
	public String editSetlist(ConcertVO cvo, Model model) {
		model.addAttribute("concertInfo", cvo);
		model.addAttribute("setlist", sdao.setlist(cvo.getCon_num()));
		return "concert/editSetlist";
	}

	@RequestMapping(value = "/saveSetlist")
	public String saveSetlist(ConcertVO cvo, String[] songs_title, int[] songs_order, Model model) {
		for(int i=0; i<songs_title.length; i++){
			SongVO svo = new SongVO();
			svo.setSong_artist(cvo.getCon_artist());
			svo.setSong_concert(cvo.getCon_num());
			svo.setSong_order(songs_order[i]);
			svo.setSong_title(songs_title[i]);
			sdao.addSetlist(svo);
		}
		
//		return "redirect:setlist?con_num="+cvo.getCon_num();
		model.addAttribute("setlist", sdao.setlist(cvo.getCon_num()));
		return "concert/setlist";
	}
	
//	@RequestMapping(value="/setlist")
//	public String setlist(int con_num, Model model){
//		model.addAttribute("setlist", sdao.setlist(con_num));
//		return "concert/setlist";
//	}
	
	

}
