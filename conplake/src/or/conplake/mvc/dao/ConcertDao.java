package or.conplake.mvc.dao;

import java.util.List;

import javax.swing.text.html.ListView;

import or.conplake.vo.ConcertVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ConcertDao {
	@Autowired
	private SqlSessionTemplate st;
	
	public void addConcert(ConcertVO cvo){
		// 공연 데이터 추가
		st.insert("con.addConcert", cvo);
	}
	
	public boolean checkConcert(int con_num){
		if(st.selectOne("con.checkConcert", con_num) == null){
			// 중복된 데이터가 아니면
			return true; 
		} else {
			// 중복된 데이터이면
			return false;
		}	
	}
	
	public List<ConcertVO> concertList(){
		// 공연 목록 불러오기(현재 진행중인 모든 공연)
		return st.selectList("con.concertList");
	}
	
	public ConcertVO concertInfo(int con_num){
		return st.selectOne("con.concertInfo", con_num);
	}

}
