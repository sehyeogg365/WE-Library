package com.marondal.welibrary.library;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/library")
public class LibraryController {

	@GetMapping("/main/view")
	public String mainPage() {
		
		return "library/main";
		
	}
	
	@GetMapping("/list/view")
	public String listPage(){
		
		return "library/list";
	}
	
	
	
	
	
}
