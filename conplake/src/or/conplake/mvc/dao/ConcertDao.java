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
	
	public boolean checkConcert(int con_num){
		if(st.selectOne("con.checkConcert", con_num) == null){
			// 중복된 데이터가 아니면
			return true; 
		} else {
			// 중복된 데이터이면
			return false;
		}	
	}

}
