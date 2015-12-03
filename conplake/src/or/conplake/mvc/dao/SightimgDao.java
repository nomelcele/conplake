package or.conplake.mvc.dao;

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
}
