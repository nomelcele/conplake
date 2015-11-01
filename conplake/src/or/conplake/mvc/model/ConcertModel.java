package or.conplake.mvc.model;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ConcertModel {
	@RequestMapping(value="/concertInfo")
	public String concertInfo(){
		return "concert.concertInfo";
	}
	
}
