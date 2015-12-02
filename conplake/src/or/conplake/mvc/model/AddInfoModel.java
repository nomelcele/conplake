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
		// �ܼ�Ʈ ���� �߰�
		cdao.addConcert(cvo);
		return "concert.addConcertInfo";
	}
	
	@RequestMapping(value="/addArtistForm")
	public String addArtistForm(){
		return "artist.addArtistInfo";
	}

	@RequestMapping(value="/addArtist")
	public String addArtist(ArtistVO avo, @RequestParam("art_img")MultipartFile art_img){
		// ��Ƽ��Ʈ ���� �߰�
	
		// �̹��� ���� ���ε�
		String r_path = "C:\\conplake\\ws\\conplake\\WebContent\\resources\\artistImg\\";
		String fileName = art_img.getOriginalFilename();
		StringBuffer path = new StringBuffer();
		path.append(r_path).append(fileName);
		System.out.println("Artist Img Upload Path: "+path.toString());
		avo.setArt_img(path.toString()); // �̹��� ��θ� db�� �����ؾ� �ϹǷ�
		
		File file = new File(path.toString());
		if(!file.exists()){
			file.mkdirs();
		}
		
		try {
			art_img.transferTo(file);
		} catch(Exception e){
			e.printStackTrace();
		}
		
		// db�� ������ �߰�
		adao.addArtist(avo);
		return "artist.addArtistInfo";
	}
	
}
