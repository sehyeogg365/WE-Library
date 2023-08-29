package com.marondal.welibrary.book.bo;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.welibrary.book.dao.BookDAO;

@Service
public class BookCountBO {

	@Autowired
	private BookDAO bookDAO;
	
	public int getBookCount(String title) {
		
	
		return bookDAO.selectBookCount(title);
	
		
	}
	
}
