package or.conplake.mvc.dao;

import java.util.List;

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
	
	public int searchConcerthallByName(String chall_name){
		Integer chall_num = st.selectOne("chall.searchConcerthallByName", chall_name);
		if(chall_num == null){ // 공연장 데이터가 테이블에 없는 경우
			chall_num = 0;
		}
		return chall_num;
	}
	
	public List<ConcerthallVO> concerthallSearch(String searchKeyword){
		return st.selectList("chall.concerthallSearch", searchKeyword);
	}
	
	public ConcerthallVO concerthallInfo(int chall_num){
		return st.selectOne("chall.concerthallInfo", chall_num);
	}
	
	
	
}
