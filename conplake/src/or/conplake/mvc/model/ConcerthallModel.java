package or.conplake.mvc.model;

import or.conplake.mvc.dao.ConcertDao;
import or.conplake.mvc.dao.ConcerthallDao;
import or.conplake.mvc.dao.PostDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ConcerthallModel {
	@Autowired
	private ConcerthallDao chdao;
	@Autowired
	private ConcertDao cdao;
	@Autowired
	private PostDao pdao;
	
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
	
}
