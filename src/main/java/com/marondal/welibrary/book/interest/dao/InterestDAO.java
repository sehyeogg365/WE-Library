package com.marondal.welibrary.book.interest.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface InterestDAO {
	
	//관심도서 추가
	public int insertInterest(@Param("bookId")int bookId);

	
	//관심도서 조회
	
	
	
	//관심도서 삭제 
	
}
