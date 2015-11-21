package or.conplake.mvc.service;

import or.conplake.mvc.dao.SongDao;
import or.conplake.vo.ConcertVO;
import or.conplake.vo.SongVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
@Qualifier(value="concert")
public class ConcertService {
	@Autowired
	private SongDao sdao;
	
	public void saveSetlist(ConcertVO cvo, String[] songs_title, int[] songs_order){
		sdao.initializeSetlist(cvo.getCon_num()); // 수정 내용 반영 전 테이블 초기화
		for(int i=0; i<songs_title.length; i++){
			SongVO svo = new SongVO();
			svo.setSong_artist(cvo.getCon_artist());
			svo.setSong_concert(cvo.getCon_num());
			svo.setSong_order(songs_order[i]);
			svo.setSong_title(songs_title[i]);
			sdao.addSetlist(svo);
		}
	}
}
