package or.conplake.mvc.model;

import java.util.List;

import or.conplake.mvc.dao.ConcertDao;
import or.conplake.vo.ConcertVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ConcertModel {
	@Autowired
	private ConcertDao cdao;

	@RequestMapping(value="/main")
	public String main(Model model){
		model.addAttribute("conList", cdao.concertList());
		return "concert.main";
	}
	
	@RequestMapping(value="/concertInfo")
	public String concertInfo(int con_num, Model model){
		model.addAttribute("conInfo", cdao.concertInfo(con_num));
		return "concert.concertInfo";
	}
	
	@RequestMapping(value="/concertSearch")
	public String concertSearch(ConcertVO cvo, Model model){
		model.addAttribute("conResult", cdao.concertSearch(cvo));
		return "search.searchResult";
	}
	
	@RequestMapping(value="/writeReview")
	public String writeReview(){
		return "concert.writeReview";
	}
	
}
