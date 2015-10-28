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
	
	public int login(MemberVO mvo){		
		Integer res = st.selectOne("mem.login", mvo);
		
		if(res == null){ 
			// 입력한 아이디/비밀번호가 회원 정보와 일치하지 않을 경우(로그인 실패)
			return 0;
		} else {
			// 로그인 성공
			return res;
		}
		
	}
}
