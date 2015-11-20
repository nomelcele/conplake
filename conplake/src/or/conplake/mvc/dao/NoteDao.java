package or.conplake.mvc.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import or.conplake.vo.NoteVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoteDao {
	@Autowired
	private SqlSessionTemplate st;
	
	// 쪽지 작성
	public void writeNote(NoteVO nvo){
		st.insert("note.writeNote", nvo);
	}
	
	// 받은 쪽지함
	public List<NoteVO> inbox(int mem_num){
		return st.selectList("note.inbox", mem_num);
	}
	
	// 쪽지 읽기
	public NoteVO readNote(int note_num){
		return st.selectOne("note.readNote", note_num);
	}
	
	// 삭제
	
	// 보낸 쪽지함
	public List<NoteVO> sent(int mem_num){
		return st.selectList("note.sent", mem_num);
	}
}
