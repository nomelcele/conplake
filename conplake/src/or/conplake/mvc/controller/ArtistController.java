package or.conplake.mvc.model;

import javax.servlet.http.HttpSession;

import or.conplake.mvc.dao.ArtistDao;
import or.conplake.mvc.dao.ConcertDao;
import or.conplake.mvc.dao.SongDao;
import or.conplake.mvc.dao.UserinteractionDao;
import or.conplake.vo.MemberVO;
import or.conplake.vo.UserinteractionVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ArtistModel {
	@Autowired
	private ArtistDao adao;
	@Autowired
	private ConcertDao cdao;
	@Autowired
	private SongDao sdao;
	@Autowired
	private UserinteractionDao udao;
	
	@RequestMapping(value="/artistInfo")
	public String artistInfo(int art_num, Model model, HttpSession session){
		model.addAttribute("artistInfo", adao.artistInfo(art_num)); // ��Ƽ��Ʈ ����
		model.addAttribute("artistConcerts", cdao.artistConcerts(art_num)); // ��Ƽ��Ʈ ���� ���
		model.addAttribute("hitSongs", sdao.hitSongs(art_num)); // ��Ƽ��Ʈ ��ǥ�� ���
		
		UserinteractionVO uivo = new UserinteractionVO();
		uivo.setUi_artist(art_num);
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		uivo.setUi_member(mvo.getMem_num());
		model.addAttribute("liked", udao.isLikedArtist(uivo));
		
		return "artist.artistInfo";
	}
	
	@RequestMapping(value="likeArtist")
	public String likeArtist(UserinteractionVO uivo){
		// ���� ��Ƽ��Ʈ �߰�
		udao.likeArtist(uivo);
		return "redirect:/artistInfo?art_num="+uivo.getUi_artist();
	}
	
	@RequestMapping(value="unlikeArtist")
	public String unlikeArtist(UserinteractionVO uivo){
		// ���� ��Ƽ��Ʈ ����
		udao.unlikeArtist(uivo);
		return "redirect:/artistInfo?art_num="+uivo.getUi_artist();
	}
	
	@RequestMapping(value="/artistSearch")
	public String artistSearch(String art_name, String searchType, Model model){
		// ��Ƽ��Ʈ �˻�
		model.addAttribute("artResult", adao.artistSearch(art_name));
		model.addAttribute("resultType", "artist");
		
		String url = "";
		if(searchType.equals("searchLeft")){
			url = "search.searchResult";
		} else {
			url = "concert/searchArtist";
		}
		return url;
	}

}
