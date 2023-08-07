package com.marondal.welibrary.book.bo;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.marondal.welibrary.book.dao.BookDAO;
import com.marondal.welibrary.book.model.Book;


@Service
public class BookBO {
	
	
	@Autowired
	private BookDAO bookDAO;
	
	//책목록 조회
	public List<Book> getBookListByTitle(String title){
		
		
		return bookDAO.selectBookListByTitle(title);
		
		
	}
	
	
	//책 1행정보 조회
	public Book getBook(int id) {
				
		return null;

	}
	
	//관심도서
	
	//대출
	//반납
	//예약
	
	//상호대차
	
	
	
	
}