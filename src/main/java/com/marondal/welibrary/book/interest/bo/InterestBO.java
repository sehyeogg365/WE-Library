package com.marondal.welibrary.book.interest.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.welibrary.book.interest.dao.InterestDAO;
import com.marondal.welibrary.book.model.InterestBook;

@Service
public class InterestBO {
	
	@Autowired
	private InterestDAO interestDAO;

	//관심도서 추가
	public int addInterest(int userId, int bookId) {
		
		return interestDAO.insertInterest(userId, bookId);
		
		
	}
	
	//관심도서 조회
	public List<InterestBook> getInterestList(int userId){
		
		
		return interestDAO.selectInterestList(userId);
		
		
	}
	
	
	//관심도서 삭제 
	
	
	
	
}
