package or.conplake.mvc.dao;

import java.util.List;

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
	
	public boolean idCheck(String mem_id){
		String id = st.selectOne("mem.idCheck", mem_id);
		if(id==null){ // 중복된 아이디가 아닌 경우
			return false; 
		} else {
			return true;
		}
	}
	
	public void modifyInfo(MemberVO mvo){
		// 회원 정보 수정
		st.update("mem.modifyInfo", mvo);
	}
	
	public MemberVO myProfile(int mem_num){
		return st.selectOne("mem.myProfile", mem_num);
	}

	public MemberVO confirmIdMail(MemberVO mvo) {
		return st.selectOne("mem.confirmIdMail", mvo);
	}

	public void changePwd(MemberVO mvo) {
		st.update("mem.changePwd", mvo);
	}
	
	public int findMemnum(String mem_id){
		return st.selectOne("mem.findMemnum", mem_id);
	}

}
