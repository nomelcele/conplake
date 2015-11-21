package or.conplake.mvc.dao;

import java.util.List;

import or.conplake.vo.ConcertVO;
import or.conplake.vo.MemberVO;
import or.conplake.vo.UserinteractionVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserinteractionDao {
	@Autowired
	private SqlSessionTemplate st;
	
	// ģ�� �߰�
	public void addFriend(UserinteractionVO uivo){
		st.insert("ui.addFriend", uivo);
	}
	
	// ģ�� ���
	public List<MemberVO> myFriends(int mem_num){
		return st.selectList("ui.myFriends", mem_num);
	}
	
	// ���� ���� ���
	public List<ConcertVO> likedConcerts(int mem_num){
		return st.selectList("ui.likedConcerts", mem_num);
	}
	
	// ���� ��Ƽ��Ʈ �߰�
	public void likeArtist(UserinteractionVO uivo){
		st.insert("ui.likeArtist", uivo);
	}
	
	// ���� ���� �߰�
	public void likeConcert(UserinteractionVO uivo){
		st.insert("ui.likeConcert", uivo);
	}
}
