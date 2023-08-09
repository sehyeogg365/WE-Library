package com.marondal.welibrary.book.interest.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.marondal.welibrary.book.model.InterestBook;

@Repository
public interface InterestDAO {
	
	//관심도서 추가
	public int insertInterest(@Param("userId") int userId, @Param("bookId")int bookId);

	
	//관심도서 조회
	public List<InterestBook> selectInterestList(@Param("userId")int userId);
	
	//관심도서 갯수
	
	
	//관심도서 삭제 
	public int deleteInterest(@Param("id") int id);
}
