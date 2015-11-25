package or.conplake.mvc.model;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import or.conplake.mvc.dao.CommDao;
import or.conplake.mvc.dao.ConcertDao;
import or.conplake.mvc.dao.PostDao;
import or.conplake.mvc.dao.SongDao;
import or.conplake.mvc.dao.UserinteractionDao;
import or.conplake.mvc.service.ConcertService;
import or.conplake.vo.CommVO;
import or.conplake.vo.ConcertVO;
import or.conplake.vo.MemberVO;
import or.conplake.vo.PostVO;
import or.conplake.vo.SongVO;
import or.conplake.vo.UserinteractionVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
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
	@Autowired
	private UserinteractionDao udao;
	@Autowired
	@Qualifier(value="concert")
	private ConcertService service;

	@RequestMapping(value = "/main")
	public String main(Model model) {
		model.addAttribute("conList", cdao.concertList());
		return "concert.main";
	}

	@RequestMapping(value = "/concertInfo")
	public String concertInfo(@RequestParam HashMap<String, String> map, HttpSession session,
			Model model) {
		model.addAttribute("conInfo",
				cdao.concertInfo(Integer.parseInt(map.get("con_num"))));
		model.addAttribute("reviewList", pdao.reviewList(map));
		model.addAttribute("setlist", sdao.setlist(Integer.parseInt(map.get("con_num"))));
		
		UserinteractionVO uivo = new UserinteractionVO();
		uivo.setUi_concert(Integer.parseInt(map.get("con_num")));
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		uivo.setUi_member(mvo.getMem_num());
		model.addAttribute("liked", udao.isLikedConcert(uivo));
		
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
		List<MultipartFile> files = pvo.getFiles(); // 업로드할 파일들이 저장된 List

		if (null != files & files.size() > 0) {
			for (MultipartFile multipartFile : files) { // List에서 파일을 읽어서 하나씩
														// 업로드
				String fileName = multipartFile.getOriginalFilename(); // 파일의 이름

				if (fileName != "") {
					String path = "C:\\conplake\\ws\\conplake\\WebContent\\upload\\"
							+ fileName;
					// 파일을 저장할 경로
					System.out.println("File Upload Path: " + path);
					File file = new File(path);
					file.mkdirs(); // File 객체 생성 후 지정한 경로에 파일 업로드

					try {
						multipartFile.transferTo(file); // 업로드된 파일 데이터를 지정한 파일에
														// 저장
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}

		pdao.writeReview(pvo);
		return "redirect:/concertInfo?con_num=" + pvo.getPost_concert();
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
		return "redirect:/readReview?post_num=" + commvo.getComm_post();
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
		service.saveSetlist(cvo, songs_title, songs_order);
		
//		return "redirect:setlist?con_num="+cvo.getCon_num();
		model.addAttribute("setlist", sdao.setlist(cvo.getCon_num()));
		return "concert/setlist";
	}
	
//	@RequestMapping(value="/setlist")
//	public String setlist(int con_num, Model model){
//		model.addAttribute("setlist", sdao.setlist(con_num));
//		return "concert/setlist";
//	}
	
	@RequestMapping(value="/deleteComm")
	public String deleteComm(CommVO cmvo){
		// 댓글 삭제
		cmdao.deleteComm(cmvo.getComm_num());
		return "redirect:/readReview?post_num="+cmvo.getComm_post();
	}

	@RequestMapping(value="/deleteReview")
	public String deleteReview(PostVO pvo){
		// 리뷰 삭제
		pdao.deleteReview(pvo.getPost_num());
		return "redirect:/concertInfo?con_num="+pvo.getPost_concert();
	}
	
	@RequestMapping(value="/likeConcert")
	public String likeConcert(UserinteractionVO uivo){
		// 관심 공연 추가
		udao.likeConcert(uivo);
		return "redirect:/concertInfo?con_num="+uivo.getUi_concert();
	}

	@RequestMapping(value="/unlikeConcert")
	public String unlikeConcert(UserinteractionVO uivo){
		// 관심 공연 해제
		udao.unlikeConcert(uivo);
		return "redirect:/concertInfo?con_num="+uivo.getUi_concert();
	}
}
