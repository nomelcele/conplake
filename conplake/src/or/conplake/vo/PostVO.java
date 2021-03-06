package or.conplake.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class PostVO {
	private int post_num, post_author, post_hit, post_concert;
	private String post_title, post_date, post_type,
	post_seat, post_sightsound, post_facility, post_perform, post_cont, post_concertdate, post_subtype,
	authorname, concertname, concertposter, venuename;
	private List<MultipartFile> files;
	
	public List<MultipartFile> getFiles() {
		return files;
	}
	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
	public String getConcertposter() {
		return concertposter;
	}
	public void setConcertposter(String concertposter) {
		this.concertposter = concertposter;
	}
	public String getConcertname() {
		return concertname;
	}
	public void setConcertname(String concertname) {
		this.concertname = concertname;
	}
	public String getVenuename() {
		return venuename;
	}
	public void setVenuename(String venuename) {
		this.venuename = venuename;
	}
	public String getAuthorname() {
		return authorname;
	}
	public void setAuthorname(String authorname) {
		this.authorname = authorname;
	}
	public String getPost_concertdate() {
		return post_concertdate;
	}
	public void setPost_concertdate(String post_concertdate) {
		this.post_concertdate = post_concertdate;
	}
	public int getPost_num() {
		return post_num;
	}
	public void setPost_num(int post_num) {
		this.post_num = post_num;
	}
	public int getPost_author() {
		return post_author;
	}
	public void setPost_author(int post_author) {
		this.post_author = post_author;
	}
	public int getPost_hit() {
		return post_hit;
	}
	public void setPost_hit(int post_hit) {
		this.post_hit = post_hit;
	}
	public int getPost_concert() {
		return post_concert;
	}
	public void setPost_concert(int post_concert) {
		this.post_concert = post_concert;
	}
	public String getPost_title() {
		return post_title;
	}
	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}
	public String getPost_date() {
		return post_date;
	}
	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}
	public String getPost_type() {
		return post_type;
	}
	public void setPost_type(String post_type) {
		this.post_type = post_type;
	}
	public String getPost_seat() {
		return post_seat;
	}
	public void setPost_seat(String post_seat) {
		this.post_seat = post_seat;
	}
	public String getPost_sightsound() {
		return post_sightsound;
	}
	public void setPost_sightsound(String post_sightsound) {
		this.post_sightsound = post_sightsound;
	}
	public String getPost_facility() {
		return post_facility;
	}
	public void setPost_facility(String post_facility) {
		this.post_facility = post_facility;
	}
	public String getPost_perform() {
		return post_perform;
	}
	public void setPost_perform(String post_perform) {
		this.post_perform = post_perform;
	}
	public String getPost_cont() {
		return post_cont;
	}
	public void setPost_cont(String post_cont) {
		this.post_cont = post_cont;
	}
	public String getPost_subtype() {
		return post_subtype;
	}
	public void setPost_subtype(String post_subtype) {
		this.post_subtype = post_subtype;
	}
	
	

}
