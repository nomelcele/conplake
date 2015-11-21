package or.conplake.mvc.dao;

import java.util.List;

import or.conplake.vo.CommVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommDao {
	@Autowired
	private SqlSessionTemplate st;
	
	public void writePostComm(CommVO commvo){
		st.insert("comm.writePostComm", commvo);
	}
	
	public List<CommVO> postCommList(int comm_post){
		return st.selectList("comm.postCommList", comm_post);
	}
	
	public void deleteComm(int comm_num){
		st.delete("comm.deleteComm", comm_num);
	}
}
