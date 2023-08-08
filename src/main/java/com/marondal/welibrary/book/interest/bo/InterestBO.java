package com.marondal.welibrary.book.interest.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.welibrary.book.interest.dao.InterestDAO;

@Service
public class InterestBO {
	
	@Autowired
	private InterestDAO interestDAO;

	//관심도서 추가
	public int addInterest(int bookId) {
		
		return interestDAO.insertInterest(bookId);
		
		
	}
	
	//관심도서 조회
	
	
	
	//관심도서 삭제 
	
	
	
	
}
