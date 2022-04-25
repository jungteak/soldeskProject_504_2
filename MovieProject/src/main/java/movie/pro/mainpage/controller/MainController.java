package movie.pro.mainpage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	@GetMapping("/mainpage")
	public String main() {
		return "/mainpage/mainpage";
	}//main
	
	@GetMapping("/login")
	public String loginForm() {
		return "login/login";
	}//loginFrom
	
	@GetMapping("/joinForm")
	public String joinFrom() {
		return"/join/joinForm";
	}//joinForm
	
	@GetMapping("/test")
		public String test() {
			return "mainpage/test";
		}
	
	@GetMapping("/test1")
	public String test1() {
		return "mainpage/test1";
	}
	

}
