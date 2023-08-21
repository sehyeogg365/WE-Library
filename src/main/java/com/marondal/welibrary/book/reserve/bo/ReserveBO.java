package com.marondal.welibrary.book.reserve.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.welibrary.book.reserve.dao.ReserveDAO;

@Service
public class ReserveBO {

	@Autowired
	private ReserveDAO reserveDAO;
	
	//예약
	public int addReserve(int bookId, int userId) {
		
		
		
		return reserveDAO.insertReserve(bookId, userId);
		
		
	}
	
	
}
