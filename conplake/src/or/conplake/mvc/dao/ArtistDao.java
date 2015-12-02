package or.conplake.mvc.dao;

import java.util.List;

import or.conplake.vo.ArtistVO;
import or.conplake.vo.ConcertVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ArtistDao {
	@Autowired
	private SqlSessionTemplate st;
	
	public ArtistVO artistInfo(int art_num){
		return st.selectOne("art.artistInfo", art_num);
	}
	
	public List<ArtistVO> artistSearch(String art_name){
		return st.selectList("art.artistSearch", art_name);
	}
	
	public void addArtist(ArtistVO avo){
		st.insert("art.addArtist", avo);
	}
	
}
