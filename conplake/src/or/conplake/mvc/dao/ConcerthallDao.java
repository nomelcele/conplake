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
			// �ߺ��� �����Ͱ� �ƴϸ�
			return true; 
		} else {
			// �ߺ��� �������̸�
			return false;
		}	
	}
	
}
