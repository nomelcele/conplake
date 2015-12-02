package or.conplake.mvc.model;

import or.conplake.mvc.dao.ArtistDao;
import or.conplake.mvc.dao.ConcertDao;
import or.conplake.vo.ArtistVO;
import or.conplake.vo.ConcertVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AddInfoModel {
	@Autowired
	private ConcertDao cdao;
	@Autowired
	private ArtistDao adao;
	
	@RequestMapping(value="/addConcertForm")
	public String addConcertForm(){
		return "concert.addConcertInfo";
	}
	
	@RequestMapping(value="/addConcert")
	public String addConcert(ConcertVO cvo){
		// 콘서트 정보 추가
		cdao.addConcert(cvo);
		return "concert.addConcertInfo";
	}
	
	@RequestMapping(value="/addArtistForm")
	public String addArtistForm(){
		return "artist.addArtistInfo";
	}

	@RequestMapping(value="/addArtist")
	public String addArtist(ArtistVO avo){
		// 아티스트 정보 추가
		adao.addArtist(avo);
		return "artist.addArtistInfo";
	}
	
}
