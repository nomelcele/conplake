package or.conplake.mvc.dao;

import java.util.List;

import or.conplake.vo.MemberVO;
import or.conplake.vo.UserinteractionVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserinteractionDao {
	@Autowired
	private SqlSessionTemplate st;
	
	// 模备 眠啊
	public void addFriend(UserinteractionVO uivo){
		st.insert("ui.addFriend", uivo);
	}
	
	// 模备 格废
	public List<MemberVO> friendsList(int mem_num){
		return st.selectList("ui.friendsList", mem_num);
	}
}
