package com.marondal.welibrary.book.interibrary.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.welibrary.book.interibrary.dao.InteribraryDAO;

@Service
public class InteribrayCountBO {
	
	@Autowired
	private InteribraryDAO interibraryDAO;
	//상호대차 권수
	
	//대출 상태
	public boolean isBorrow(int bookId) {
		
		int count = interibraryDAO.selectBorrowByBookId(bookId);
		
		if(count == 1) {
			
			return true;
			
		} else {
			
			return false;
			
		}
	
	}
	//상호대차 여부
	public boolean isInteribrary(int bookId) {
		
		int count = interibraryDAO.selectInteribraryByBookId(bookId);
		
		
		if(count == 1) {
			
			return true;
			
		} else {
			
			
			return false;
			
		}
		

		
		
		
	}
	
	
}
