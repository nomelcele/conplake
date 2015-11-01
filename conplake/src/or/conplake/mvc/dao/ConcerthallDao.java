package or.conplake.mvc.dao;

import or.conplake.vo.ConcerthallVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ConcerthallDao {
	@Autowired
	private SqlSessionTemplate st;
	
	public void addConcerthall(ConcerthallVO chvo){
		st.insert("chall.addConcerthall", chvo);
	}
	
	public boolean checkConcerthall(int chall_num){
		if(st.selectOne("chall.checkConcerthall", chall_num) == null){
			// 중복된 데이터가 아니면
			return true; 
		} else {
			// 중복된 데이터이면
			return false;
		}	
	}
	
}
