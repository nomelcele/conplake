package or.conplake.mvc.dao;

import or.conplake.vo.ConcertVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ConcertDao {
	@Autowired
	private SqlSessionTemplate st;
	
	public void addConcert(ConcertVO cvo){
		st.insert("con.addConcert", cvo);
	}

}
