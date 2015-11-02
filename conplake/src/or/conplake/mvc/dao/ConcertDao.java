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
		// ���� ������ �߰�
		st.insert("con.addConcert", cvo);
	}
	
	public boolean checkConcert(int con_num){
		if(st.selectOne("con.checkConcert", con_num) == null){
			// �ߺ��� �����Ͱ� �ƴϸ�
			return true; 
		} else {
			// �ߺ��� �������̸�
			return false;
		}	
	}
	
	public List<ConcertVO> concertList(){
		// ���� ��� �ҷ�����(���� �������� ��� ����)
		return st.selectList("con.concertList");
	}
	
	public ConcertVO concertInfo(int con_num){
		return st.selectOne("con.concertInfo", con_num);
	}

}
