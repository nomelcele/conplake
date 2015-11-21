package or.conplake.mvc.dao;

import java.util.List;

import or.conplake.vo.SongVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SongDao {
	@Autowired
	private SqlSessionTemplate st;
	
	public void addSetlist(SongVO svo){
		st.insert("song.addSetlist", svo);
	}
	
	public List<SongVO> setlist(int con_num){
		return st.selectList("song.setlist", con_num);
	}
	
	public List<SongVO> hitSongs(int art_num){
		return st.selectList("song.hitSongs", art_num);
	}
}
