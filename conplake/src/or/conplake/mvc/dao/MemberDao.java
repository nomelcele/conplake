package or.conplake.mvc.dao;

import or.conplake.vo.MemberVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {
	@Autowired
	private SqlSessionTemplate st;
	
	public void joinMember(MemberVO mvo){
		st.insert("mem.joinMember", mvo);
	}
	
	public MemberVO login(MemberVO mvo){		
		MemberVO memInfo = st.selectOne("mem.login", mvo);
		
		if(memInfo == null){
			return null;
		} else {
			return memInfo;
		}
		
	}
}
