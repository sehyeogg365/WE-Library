package com.marondal.welibrary.book.borrow.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.welibrary.book.borrow.dao.BorrowDAO;
import com.marondal.welibrary.book.model.BorrowBookCount;

@Service
public class BorrowCountBO {

	@Autowired
	private  BorrowDAO borrowDAO;
	
//	public int getBorrowBookCount(int userId) {
//		
//		
//		return borrowDAO.selectBorrowBookCount(userId);리스팅할때 카운트비오를 안불러오는 형태라서. 다오를 불러오는 형태라서 안해도 된다.

//
//	}
}
