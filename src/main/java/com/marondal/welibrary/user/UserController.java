package com.marondal.welibrary.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.marondal.welibrary.user.bo.UserBO;

@Controller
@RequestMapping("/user")
public class UserController {

//	@Autowired
//	private UserBO userBO;
	
	@GetMapping("/signup/view")
	public String signupInput() {
		
		
		return "/user/signup";
		
	}
	
	
	@GetMapping("/adminsignup/view")
	public String adminsignupInput() {
		
		
		return "/user/adminsignup";
		
	}

	
	
	
	

}
