package or.conplake.mvc.dao;

import java.util.List;

import or.conplake.vo.SightimgVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SightimgDao {
	@Autowired
	private SqlSessionTemplate st;
	
	public void addSightimg(SightimgVO sivo){
		st.insert("si.addSightimg", sivo);
	}
	
	public List<SightimgVO> sightimgList(int si_concerthall){
		return st.selectList("si.sightimgList", si_concerthall);
	}
	
	public List<SightimgVO> searchSightimg(SightimgVO sivo){
		return st.selectList("si.searchSightimg", sivo);
	}
}
