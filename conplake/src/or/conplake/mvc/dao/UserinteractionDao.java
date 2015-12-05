package or.conplake.mvc.dao;

import java.util.List;

import or.conplake.vo.ArtistVO;
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
	
	// 친구 추가
	public void addFriend(UserinteractionVO uivo){
		st.insert("ui.addFriend", uivo);
	}
	
	// 친구 목록
	public List<MemberVO> myFriends(int mem_num){
		return st.selectList("ui.myFriends", mem_num);
	}
	
	// 친구 삭제
	public void deleteFriend(UserinteractionVO uivo){
		st.delete("ui.deleteFriend", uivo);
	}
	
	// 관심 아티스트 목록
	public List<ArtistVO> likedArtists(int mem_num){
		return st.selectList("ui.likedArtists", mem_num);
	}
	
	// 관심 공연 목록
	public List<ConcertVO> likedConcerts(int mem_num){
		return st.selectList("ui.likedConcerts", mem_num);
	}
	
	// 관심 아티스트 추가
	public void likeArtist(UserinteractionVO uivo){
		st.insert("ui.likeArtist", uivo);
	}
	
	// 관심 공연 추가
	public void likeConcert(UserinteractionVO uivo){
		st.insert("ui.likeConcert", uivo);
	}
	
	// 관심 공연 여부 확인
	public String isLikedConcert(UserinteractionVO uivo){
		if(st.selectOne("ui.isLikedConcert", uivo) != null){
			// 이미 관심 공연으로 지정한 공연일 경우
			return "y";
		} else {
			return "n";
		}
	}

	public void unlikeConcert(UserinteractionVO uivo) {
		st.delete("ui.unlikeConcert", uivo);
	}

	public void unlikeArtist(UserinteractionVO uivo) {
		st.delete("ui.unlikeArtist", uivo);
	}

	// 관심 아티스트 여부 확인
	public String isLikedArtist(UserinteractionVO uivo) {
		if(st.selectOne("ui.isLikedArtist", uivo) != null){
			// 이미 관심 공연으로 지정한 공연일 경우
			return "y";
		} else {
			return "n";
		}
	}
	
	// 친구 여부 확인
	public String isFriend(UserinteractionVO uivo){
		if(st.selectOne("ui.isFriend", uivo) != null){
			// 친구로 등록된 유저일 경우
			return "y";
		} else {
			return "n";
		}
	}
}
