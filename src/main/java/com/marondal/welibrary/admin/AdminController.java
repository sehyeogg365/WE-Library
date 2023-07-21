package com.marondal.welibrary.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@GetMapping("/wishbook/add/view")
	public String wishbookInput() {
		
		return "/admin/wishbookadd";
	}
	
}
