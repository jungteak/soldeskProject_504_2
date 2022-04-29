package movie.pro.mypage.controller;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import movie.pro.mypage.dto.MyboardDto;
import movie.pro.mypage.service.MyboardService;



@Controller
public class MyboardController {

	@Autowired
	MyboardService service;
	
	@RequestMapping("/mypage/list")
	public String list(@RequestParam(name="p",defaultValue="1") int page, Model m) {
		
		int count = service.countmyBd();
		//글이 있는지 체크
		
		if(count>0) {
			int perPage = 10; // 한 페이지에서 보일 글의 갯수 고정값으로 가려면 final
			int startRow = (page-1) * perPage +1; 
			//로우넘은 1부터 시작하기때문! List를 통채로 사용할 경우는 0부터 시작하기 때문에 +1 안해도 됨!
			int endRow = page*perPage; 
			//마찬가지로 list를 통으로 가져워서 사용할 경우 -1해줘야함( 0부터 시작하기때문! )
			List<MyboardDto> myboardList = service.myboardList(startRow, endRow);			
			m.addAttribute("list", myboardList);
			
			int pageNum = 1;
			int totalPages = count /perPage + (count % perPage > 0 ? 1 : 0); //전체 페이지 수 
			//나머지가 있다면 한페이지 추가
			
			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum - 1;
			if(end > totalPages) {
				end = totalPages;
			}
			m.addAttribute("begin", begin);
			m.addAttribute("end",end);
			m.addAttribute("pageNum", pageNum);
			m.addAttribute("totalPages", totalPages);
		}
		m.addAttribute("nowPage",page);
		m.addAttribute("count", count);
		return "mypage/myboardList";

	}
	
}
