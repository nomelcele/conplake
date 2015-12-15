package or.conplake.mvc.dao;

import java.util.HashMap;
import java.util.List;

import or.conplake.vo.PostVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PostDao {
	@Autowired
	private SqlSessionTemplate st;
	
	public void writeReview(PostVO pvo){
		st.insert("post.writeReview", pvo);
	}
	
	public List<PostVO> reviewList(HashMap<String, String> map){
		return st.selectList("post.reviewList", map);
	}
	
	public PostVO readReview(int post_num){
		return st.selectOne("post.readReview", post_num);
	}
	
	public List<PostVO> myReviews(int mem_num){
		return st.selectList("post.myReviews", mem_num);
	}
	
	public List<PostVO> concerthallReviews(int chall_num){
		return st.selectList("post.concerthallReviews", chall_num);
	}

	public void deleteReview(int post_num){
		st.delete("post.deleteReview", post_num);
	}
	
	public void writeLetsgo(PostVO pvo){
		st.insert("post.writeLetsgo", pvo);
	}
	
	public List<PostVO> letsgoList(int post_concert){
		return st.selectList("post.letsgoList", post_concert);
	}
	
	public PostVO readLetsgo(int post_num){
		return st.selectOne("post.readLetsgo", post_num);
	}
	
	public void increaseHit(PostVO pvo){
		st.update("post.increaseHit", pvo);
	}
}
