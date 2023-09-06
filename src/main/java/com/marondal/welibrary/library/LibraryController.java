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
import com.marondal.welibrary.book.model.BookCount;
import com.marondal.welibrary.book.model.BookDetail;
import com.marondal.welibrary.book.model.BorrowBook;

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
		
		List<BookCount> bookCountList = bookBO.getBookNumberBytitle(title);
		model.addAttribute("bookCountList", bookCountList);
		
		
		
		return "library/list";
	}
	
	
	@GetMapping("/bookinfo/view")
	public String infoPage(Model model
						   , @RequestParam("id") int id) {
		
		List<BookDetail> bookDetailList = bookBO.getBookListById(id);
		model.addAttribute("bookDetailList", bookDetailList);
		
		
		BorrowBook borrow = borrowBO.getBorrow(id);
		model.addAttribute("borrow", borrow);
		
		//상호대차 1행조회를쓰면서 상호대차 반납예정일도 불러와야한다. 조건문 대출중일때 대출반납예정일 상호대차중일때 상호대차 반납예정일
		
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
