package movie.pro.member.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import movie.pro.member.dto.MemberDto;
import movie.pro.member.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService service;
	
	@GetMapping("/insertMember")
	public String joinForm() {
		
		return "join/joinForm";
		
	}//joinForm
	
	@PostMapping("/insertMember")
	public String joinMember(@ModelAttribute("dto") @Valid MemberDto dto,BindingResult result,Model m) {
		
		if(result.hasErrors()) {
			
			m.addAttribute("dto",dto);
			
			return "join/joinForm";
		}
		
		service.insertMember(dto);
		return "redirect:/joinSuccess";
	}//insertMember
	
	@GetMapping("/joinSuccess")
	public String joinSuccess() {
		return "join/joinSuccess";
	}//joinSuccess
	
	@GetMapping("/idCheck")
	@ResponseBody
	public String idCheck(String mem_id) {
		MemberDto checkid = service.findById(mem_id);
		String chk = "";
		if(checkid != null) {
			chk = checkid.getMem_id();
		}
		return chk;
	}//idCheck
	
	@GetMapping("/findId")
	public String findId() {
		return "join/findId";
	}//findId
	
	@PostMapping("findId")
	public String findIdList(String mem_name,String mem_email,Model m) {
		
		List<String> idList = service.idList(mem_name, mem_email);
		m.addAttribute("idList",idList);
		
		return "join/findIdList";
	}//findIdList
	
	@GetMapping("/nameCheck")
	@ResponseBody
	public int nameCheck(String mem_name,String mem_email) {

		int i = service.findId(mem_name,mem_email);
		
		return i;
		
	}//nameCheck
	
	@GetMapping("/findPw")
	public String findPw() {
		return "join/findPw";
	}//findPw
	
	@PostMapping("/findPw")
	public String updatePwForm(String mem_name,String mem_email,String mem_id,Model m) {
		
		m.addAttribute("mem_name",mem_name);
		m.addAttribute("mem_email",mem_email);
		m.addAttribute("mem_id",mem_id);
		
		return "join/updatePw";
	}//updatePwForm
	
	@PostMapping("/updatePw")
	public String updatePw(String mem_name,String mem_email,String mem_id,String mem_pw,Model m) {
		
		service.updatePw(mem_name, mem_email, mem_id, mem_pw);
		
		return "redirect:/login";
	}//updatePw
	
	
	@GetMapping("/pwCheck")
	@ResponseBody
	public int pwCheck(String mem_name,String mem_email,String mem_id) {

		int i = service.findPw(mem_name,mem_email,mem_id);
		
		return i;
		
	}//pwCheck
	
	
	
}
