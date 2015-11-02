package or.conplake.mvc.model;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SearchModel {
	@RequestMapping(value="/searchResult")
	public String searchResult(){
		return "search.searchResult";
	}
}
