package com.marondal.welibrary.book.interibrary.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.welibrary.book.interibrary.dao.InteribraryDAO;

@Service
public class InteribraryBO {

	@Autowired
	private InteribraryDAO interibraryDAO;
	
	public int addInteribrary(int bookId, int userId, String library) {
	
		return interibraryDAO.insertInteribrary(bookId, userId, library);
		
	}
}
