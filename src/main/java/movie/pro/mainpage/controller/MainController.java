package movie.pro.mainpage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	@GetMapping("/mainpage")
	public String main() {
		return "/mainpage/mainpage";
	}
	
	@GetMapping("/test")
	public String test() {
		return "mainpage/test";
	}
	
	@GetMapping("/login")
	public String loginForm() {
		return "login/login";
	}
	
	@GetMapping("/joinForm")
	public String joinFrom() {
		return"/join/joinForm";
	}

}
