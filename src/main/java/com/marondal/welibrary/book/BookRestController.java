package com.marondal.welibrary.book;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.marondal.welibrary.book.borrow.bo.BorrowBO;
import com.marondal.welibrary.book.interest.bo.InterestBO;
import com.marondal.welibrary.book.interibrary.bo.InteribraryBO;
import com.marondal.welibrary.book.reserve.bo.ReserveBO;
import com.marondal.welibrary.book.wishbook.bo.WishBookBO;



@RestController
@RequestMapping("/book")
public class BookRestController {

	@Autowired
	private WishBookBO wishBookBO;
	
	@Autowired
	private InterestBO interestBO;
	
	@Autowired
	private BorrowBO borrowBO;
	
	@Autowired
	private ReserveBO reserveBO;

	@Autowired
	private InteribraryBO interibraryBO;
	
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
											
											){

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
	public Map<String, String> interestDelete(@RequestParam("id")int id
											  ){

		int count = interestBO.deleteInterest(id);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 0) {
			
			resultMap.put("result", "fail");
			
		} else {
			
			resultMap.put("result", "success");
			
		}
		
		return resultMap;

	}
	
	//대여
	@PostMapping("/borrow/create")
	public Map<String, String> borrowCreate(@RequestParam("bookId") int bookId								
											, HttpSession session
											//,@RequestParam("returnDate") Date returnDate
											){
		
		int userId = (Integer) session.getAttribute("userId");
		
		int count = borrowBO.addBorrow(userId, bookId);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			
			resultMap.put("result", "success");
			
		} else {
			
			resultMap.put("result", "fail");
			
		}

		return resultMap;

	}
	
	//반납
	@GetMapping("/borrow/delete")
	public Map<String, String> borrowDelete(@RequestParam("id") int id
											){

		int count = borrowBO.deleteBorrow(id);
		

		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			
			resultMap.put("result", "success");
			
		} else {
			
			resultMap.put("result", "fail");
			
		}

		return resultMap;
		
	}	
	//반납 연장
	@PostMapping("/borrow/update")
	public Map<String, String> borrowUpdate(@RequestParam("id") int id
											, HttpSession session){

		int userId = (Integer) session.getAttribute("userId");
		
		int count = borrowBO.updateBorrow(userId, id);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			
			resultMap.put("result", "success");
			
		} else {
			
			resultMap.put("result", "fail");
			
		}
		
		return resultMap;

	}

	//예약
	@PostMapping("/reservation/create")
	public Map<String, String> reservationCreate(@RequestParam("bookId") int bookId
												, HttpSession session){
		
		int userId = (Integer) session.getAttribute("userId");
		
		
		int count = reserveBO.addReserve(bookId, userId);
		

		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			
			resultMap.put("result", "success");
			
		} else {
			
			resultMap.put("result", "fail");
			
		}
		
		return resultMap;

	}
	
	
	//예약 취소 
	@GetMapping("/reservation/delete")
	public Map<String, String> reservationDelete(@RequestParam("id") int id
												){
		
		int count = reserveBO.deleteReserve(id);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			
			resultMap.put("result", "success");
			
		} else {
			
			resultMap.put("result", "fail");
			
		}

		return resultMap;

	}
	
	//상호대차
	@PostMapping("/interibrary/create")
	public Map<String, String> interibraryAdd(@RequestParam("bookId") int bookId
											  , @RequestParam("receivelibrary") String receivelibrary	
											  , HttpSession session){
		
		int userId = (Integer) session.getAttribute("userId");
		
		int count = interibraryBO.addInteribrary(bookId, userId, receivelibrary);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			
			resultMap.put("result", "success");
			
		} else {
			
			resultMap.put("result", "fail");
			
		}
		
		return resultMap;

	}

	//상호대차 취소
	@GetMapping("/interibrary/delete")
	public Map<String, String> interibraryDelete(@RequestParam("id") int id){

		int count = interibraryBO.deleteInteribrary(id);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			
			resultMap.put("result", "success");
			
		} else {
			
			resultMap.put("result", "fail");
			
		}
			
		return resultMap;
		
	}

	//2024-03-17 대출이력 추가
	@PostMapping("borrowhistory/create")
	public Map<String, String>borrowhistoryAdd(@RequestParam("bookId") int bookId
											   , HttpSession session){

		Map<String, String> resultMap = new HashMap<>();
		
		int userId = (Integer) session.getAttribute("userId");
		
		int count = borrowBO.addBorrowHistory(bookId, userId);

		if(count == 1) {
			
			resultMap.put("result", "success");
			
		} else {
			
			resultMap.put("result", "fail");
			
		}
		
		return resultMap;
		
	}
	
}
