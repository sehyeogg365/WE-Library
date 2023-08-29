package com.marondal.welibrary.library;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.marondal.welibrary.book.bo.BookBO;
import com.marondal.welibrary.book.borrow.bo.BorrowBO;
import com.marondal.welibrary.book.model.Book;
import com.marondal.welibrary.book.model.BookDetail;
import com.marondal.welibrary.book.model.BorrowBook;
import com.marondal.welibrary.library.bo.LibraryBO;

@Controller
@RequestMapping("/library")
public class LibraryController {

	@Autowired
	private BookBO bookBO;
	
	@Autowired
	private BorrowBO borrowBO;
	//@Autowired
	//private LibraryBO libraryBO;
	
	
	
	@GetMapping("/main/view")
	public String mainPage() {
		
		return "library/main";
		
	}
	
	@GetMapping("/list/view")
	public String listPage(Model model
						 , @RequestParam("title") String title){
		
		List<BookDetail> bookDetailList = bookBO.getBookListByTitle(title);
		model.addAttribute("bookDetailList", bookDetailList);
		
//		Book book = bookBO.getBookById(id);
//		model.addAttribute("book", book);
		
		
		return "library/list";
	}
	
	
	@GetMapping("/bookinfo/view")
	public String infoPage(Model model
						   , @RequestParam("id") int id) {
		
		List<BookDetail> bookDetailList = bookBO.getBookListById(id);
		model.addAttribute("bookDetailList", bookDetailList);
		
		
		BorrowBook borrow = borrowBO.getBorrow(id);
		model.addAttribute("borrow", borrow);
		
		return "/library/bookinfo";
		
	}
	
	@GetMapping("/interibrarypopup/view")
	public String interibraryPopUp(Model model
			   , @RequestParam("id") int id) {
		
		
		BookDetail book = bookBO.getBookById(id);
		model.addAttribute("book", book);
		
		
		return "/library/interibrarypopup";
		
		
		
	}
	
	
}
