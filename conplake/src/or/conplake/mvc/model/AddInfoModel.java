package or.conplake.mvc.model;

import java.io.File;

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
	public String addArtist(ArtistVO avo, @RequestParam("art_img")MultipartFile art_img){
		// 아티스트 정보 추가
	
		// 이미지 파일 업로드
		String r_path = "C:\\conplake\\ws\\conplake\\WebContent\\resources\\artistImg\\";
		String fileName = art_img.getOriginalFilename();
		StringBuffer path = new StringBuffer();
		path.append(r_path).append(fileName);
		System.out.println("Artist Img Upload Path: "+path.toString());
		avo.setArt_img(path.toString()); // 이미지 경로를 db에 저장해야 하므로
		
		File file = new File(path.toString());
		if(!file.exists()){
			file.mkdirs();
		}
		
		try {
			art_img.transferTo(file);
		} catch(Exception e){
			e.printStackTrace();
		}
		
		// db에 데이터 추가
		adao.addArtist(avo);
		return "artist.addArtistInfo";
	}
	
}
