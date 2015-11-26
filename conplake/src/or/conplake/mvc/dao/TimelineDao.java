package or.conplake.mvc.dao;

import java.util.List;

import or.conplake.vo.TimelineVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TimelineDao {
	@Autowired
	private SqlSessionTemplate st;
	
	public void writeTimeline(TimelineVO tlvo){
		// 타임라인 글 작성
		st.insert("tl.writeTimeline", tlvo);
	}
	
	public List<TimelineVO> readTimeline(int tl_concert){
		return st.selectList("tl.readTimeline", tl_concert);
	}
}
