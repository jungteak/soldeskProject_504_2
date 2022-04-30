package movie.pro.mypage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import movie.pro.mypage.dao.MyboardDao;
import movie.pro.mypage.dto.MyboardDto;

@Service
public class MyboardService {

	@Autowired
	MyboardDao dao;
	
	public int countmyBd() {
		return dao.countmyBd();
	}//countmyBoard
	
	public List<MyboardDto> myboardList(String movbd_id/* int start,int end*/) {
		/* Map<String, Object> m = new HashMap<String, Object>(); */
		/*
		 * m.put("start", start); m.put("end", end);
		 */
		/* m.put("movbd_id", movbd_id); */
		return dao.myboardList(movbd_id);
	}//myboardList
	
}
