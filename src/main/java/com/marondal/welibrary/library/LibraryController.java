package com.marondal.welibrary.library;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.marondal.welibrary.book.bo.BookBO;
import com.marondal.welibrary.library.bo.LibraryBO;

@Controller
@RequestMapping("/library")
public class LibraryController {

	@Autowired
	private BookBO bookBO;
	
	//@Autowired
	//private LibraryBO libraryBO;
	
	
	
	@GetMapping("/main/view")
	public String mainPage() {
		
		return "library/main";
		
	}
	
	@GetMapping("/list/view")
	public String listPage(Model model
						 , @RequestParam("title") String title){
		
		
		
		return "library/list";
	}
	
	
	@GetMapping("/bookinfo/view")
	public String infoPage(Model model) {
		
		
		return "/library/bookinfo";
		
	}
	
	
}
