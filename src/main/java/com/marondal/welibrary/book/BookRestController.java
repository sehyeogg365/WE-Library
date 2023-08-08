package com.marondal.welibrary.book;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.marondal.welibrary.book.bo.BookBO;
import com.marondal.welibrary.book.borrow.bo.BorrowBO;
import com.marondal.welibrary.book.interest.bo.InterestBO;
import com.marondal.welibrary.book.wishbook.bo.WishBookBO;



@RestController
@RequestMapping("/book")
public class BookRestController {

	@Autowired
	private BookBO bookBO;
	
	@Autowired
	private WishBookBO wishBookBO;
	
	@Autowired
	private InterestBO interestBO;
	
	@Autowired
	private BorrowBO borrowBO;
	
	
	//희망도서 신청
	@PostMapping("/wishbook/create")
	public Map<String, String> wishBook(
								@RequestParam("library") String library
								, @RequestParam("title") String title
								, @RequestParam(value="file", required=false) MultipartFile file
								, @RequestParam("author") String author
								, @RequestParam("publisher") String publisher
								, @RequestParam("price") int price
								, @RequestParam("isbn") String isbn
								, @RequestParam("pubyear") int pubyear// 날짜 형식이 아니라 년도만 추출해내서 int 가 맞을듯 
								, HttpSession session
								){
		
		int userId = (Integer) session.getAttribute("userId");
		
		int count = wishBookBO.addWishbook(userId, library, title, file, author, publisher, price, isbn, pubyear);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}	
		
		return resultMap;
		
		
		
	}
	
	// 희망도서/ 도서 북테이블에 추가
	@PostMapping("/book/create")
	public Map<String, String > bookCreate(@RequestParam("library") String library
											, @RequestParam("title") String title
											, @RequestParam(value="file", required=false) MultipartFile file
											, @RequestParam("author") String author
											, @RequestParam("publisher") String publisher
											, @RequestParam("price") int price
											, @RequestParam("isbn") String isbn
											, @RequestParam("pubyear") int pubyear
											, @RequestParam("appendix") String appendix
											//, HttpSession session
											){
		
		//int userId = (Integer) session.getAttribute("userId");

		int count = wishBookBO.addWishbookIntoBook(library, title, file, author, publisher, price, isbn, pubyear, appendix);
			
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			
			resultMap.put("result", "success");
			
		} else {
			
			resultMap.put("result", "fail");
			
			
		}
		return resultMap;
		
		
		
	}
	
	// 관심도서 추가
	@PostMapping("/interest/create")
	public Map<String, String> interestCreate(@RequestParam("bookId") int bookId
											  , HttpSession session
												){
		
		int userId = (Integer) session.getAttribute("userId");
		
		int count = interestBO.addInterest(userId, bookId);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			
			resultMap.put("result", "success");
			
		} else {
			
			resultMap.put("result", "fail");
			
		}
		
		
		return resultMap;
		
		
	}
	
	// 관심도서 삭제 
	@GetMapping("/interest/delete")
	public Map<String, String> interestDelete(@RequestParam("id")int id){
		
		
		
		return null;
		
		
	}
	
	
	
	
	
}
