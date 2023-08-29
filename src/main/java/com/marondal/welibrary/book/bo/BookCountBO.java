package com.marondal.welibrary.book.bo;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.welibrary.book.dao.BookDAO;
import com.marondal.welibrary.book.model.Book;
import com.marondal.welibrary.book.model.BookCount;

@Service
public class BookCountBO {

	@Autowired
	private BookDAO bookDAO;
	
	public List<BookCount> getBookNumberBytitle(String title){
		
		List<Book> bookList = bookDAO.selectBookListByTitle(title);
		
		for(Book book : bookList) {
			
			BookCount bookCount = new BookCount();
			
			
		}
		
		return null;
		
		
	}
	
}
