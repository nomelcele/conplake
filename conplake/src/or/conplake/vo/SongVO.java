package or.conplake.vo;

public class SongVO {
	private int song_num, song_artist, song_concert, song_order;
	private String song_title, song_popular,
	artistname;
	
	public String getArtistname() {
		return artistname;
	}
	public void setArtistname(String artistname) {
		this.artistname = artistname;
	}
	public int getSong_num() {
		return song_num;
	}
	public void setSong_num(int song_num) {
		this.song_num = song_num;
	}
	public int getSong_artist() {
		return song_artist;
	}
	public void setSong_artist(int song_artist) {
		this.song_artist = song_artist;
	}
	public int getSong_concert() {
		return song_concert;
	}
	public void setSong_concert(int song_concert) {
		this.song_concert = song_concert;
	}
	public int getSong_order() {
		return song_order;
	}
	public void setSong_order(int song_order) {
		this.song_order = song_order;
	}
	public String getSong_title() {
		return song_title;
	}
	public void setSong_title(String song_title) {
		this.song_title = song_title;
	}
	public String getSong_popular() {
		return song_popular;
	}
	public void setSong_popular(String song_popular) {
		this.song_popular = song_popular;
	}
	
	

}
