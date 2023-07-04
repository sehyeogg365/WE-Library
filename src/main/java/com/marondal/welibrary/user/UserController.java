package com.marondal.welibrary.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/user")
public class UserController {


	
	@GetMapping("/signup/view")
	public String signupInput() {
		
		return "/user/signup";
		
	}
	
	
	@GetMapping("/adminsignup/view")
	public String adminsignupInput() {
		
		return "/user/adminsignup";
		
	}

	@GetMapping("/signin/view")
	public String signinInput() {
		
		return "/user/signin";
		
	}
	
	@GetMapping("/signout")
	public String signout(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.removeAttribute("userId");
		session.removeAttribute("loginId");
		session.removeAttribute("password");
		session.removeAttribute("userName");
		session.removeAttribute("isAdmin");
		
		return "redirect:/library/main/view";
		
		
	}
	
	@GetMapping("/find_id/view")
	public String findId() {
		
		return "/user/find_id";
			
	}
	
	@GetMapping("/get_pw/view")
	public String getPw() {
		
		return "/user/get_pw";
		
	}
	@GetMapping("/mypage/view")
	public String mypage(Model model, @RequestParam("id") int id) {
		
		return "/user/mypage";
		
	}
	

	
	
	
	

}
