package or.conplake.mvc.model;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import or.conplake.mvc.dao.ArtistDao;
import or.conplake.mvc.dao.ConcertDao;
import or.conplake.vo.ArtistVO;
import or.conplake.vo.ConcertVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	
	@RequestMapping(value="/addNewConcert")
	public String addNewConcert(ConcertVO cvo, HttpSession session){
		// 콘서트 정보 추가
		// 파일 업로드
		MultipartFile poster = cvo.getPosterFile(); // 포스터
		MultipartFile detail = cvo.getDetailFile(); // 상세 이미지
		
		String posterPath = session.getServletContext().getRealPath("/")+"resources\\posterImg\\";
		String detailPath = session.getServletContext().getRealPath("/")+"resources\\detailImg\\";
		String posterName = poster.getOriginalFilename();
		String detailName = detail.getOriginalFilename();
		
		File posterFile = new File(posterPath+posterName);
		File detailFile = new File(detailPath+detailName);
		if(!posterFile.exists()){
			posterFile.mkdirs();
		}
		if(!detailFile.exists()){
			detailFile.mkdirs();
		}
		
		try {
			poster.transferTo(posterFile);
			detail.transferTo(detailFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		cvo.setCon_poster("resources/posterImg/"+posterName);
		cvo.setCon_detailimg("<img src='resources/detailImg/"+detailName+"' width='700'/>");
		cdao.addNewConcert(cvo);
		return "concert.addConcertInfo";
	}
	
	@RequestMapping(value="/addArtistForm")
	public String addArtistForm(){
		return "artist.addArtistInfo";
	}

	@RequestMapping(value="/addArtist")
	public String addArtist(ArtistVO avo, HttpSession session){
		// 아티스트 정보 추가
	
		// 이미지 파일 업로드
		MultipartFile art_file = avo.getArt_file();
//		String r_path = "C:\\conplake\\ws\\conplake\\WebContent\\resources\\artistImg\\";
		String r_path = session.getServletContext().getRealPath("/")+"resources\\artistImg\\";

		String fileName = art_file.getOriginalFilename();
		StringBuffer path = new StringBuffer();
		path.append(r_path).append(fileName);
		System.out.println("Artist Img Upload Path: "+path.toString());
		avo.setArt_img("resources/artistImg/"+fileName); // 이미지 경로를 db에 저장해야 하므로
		
		File file = new File(path.toString());
		if(!file.exists()){
			file.mkdirs();
		}
		
		try {
			art_file.transferTo(file);
		} catch(Exception e){
			e.printStackTrace();
		}
		
		// db에 데이터 추가
		adao.addArtist(avo);
		return "artist.addArtistInfo";
	}
	
}
