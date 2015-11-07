package or.conplake.mvc.dao;

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
	
	public List<PostVO> reviewList(int con_num){
		return st.selectList("post.reviewList", con_num);
	}
	
	public PostVO readReview(int post_num){
		return st.selectOne("post.readReview", post_num);
	}

}
