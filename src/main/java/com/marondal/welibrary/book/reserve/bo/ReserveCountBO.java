package com.marondal.welibrary.book.reserve.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.welibrary.book.reserve.dao.ReserveDAO;

@Service
public class ReserveCountBO {
	
	@Autowired
	private ReserveDAO reserveDAO;
	
	//예약권수
	
	//예약인원수
	
	//대출상태
	public boolean isBorrow(int bookId) {
		
		int count = reserveDAO.selectBorrowByBookId(bookId);
		
		if(count == 0) {
			
			return false;
		} else {
			
			return true;
		}
		
		
		
	}
}
