package com.marondal.welibrary.book.borrow.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.welibrary.book.borrow.dao.BorrowDAO;
import com.marondal.welibrary.book.model.BorrowBookCount;

@Service
public class BorrowCountBO {

	@Autowired
	private  BorrowDAO borrowDAO;
	
	public int getBorrowBookCount(int userId) {
		
		
		return borrowDAO.selectBorrowBookCount(userId);
		
		
	}
}
