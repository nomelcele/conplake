package or.conplake.vo;

import org.springframework.web.multipart.MultipartFile;

public class ArtistVO {
	private int art_num;
	private String art_name, art_img, art_intro, art_official, art_sns, art_country, art_type, art_genre;
	private MultipartFile art_file;
	
	public int getArt_num() {
		return art_num;
	}
	public void setArt_num(int art_num) {
		this.art_num = art_num;
	}
	public String getArt_name() {
		return art_name;
	}
	public void setArt_name(String art_name) {
		this.art_name = art_name;
	}
	public String getArt_img() {
		return art_img;
	}
	public void setArt_img(String art_img) {
		this.art_img = art_img;
	}
	public String getArt_intro() {
		return art_intro;
	}
	public void setArt_intro(String art_intro) {
		this.art_intro = art_intro;
	}
	public String getArt_official() {
		return art_official;
	}
	public void setArt_official(String art_official) {
		this.art_official = art_official;
	}
	public String getArt_sns() {
		return art_sns;
	}
	public void setArt_sns(String art_sns) {
		this.art_sns = art_sns;
	}
	public String getArt_genre() {
		return art_genre;
	}
	public void setArt_genre(String art_genre) {
		this.art_genre = art_genre;
	}
	public String getArt_type() {
		return art_type;
	}
	public void setArt_type(String art_type) {
		this.art_type = art_type;
	}
	public String getArt_country() {
		return art_country;
	}
	public void setArt_country(String art_country) {
		this.art_country = art_country;
	}
	public MultipartFile getArt_file() {
		return art_file;
	}
	public void setArt_file(MultipartFile art_file) {
		this.art_file = art_file;
	}
	
	

}
