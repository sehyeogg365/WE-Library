package com.marondal.welibrary.book.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.marondal.welibrary.book.model.Book;

@Repository
public interface BookDAO {
	
	
	
	//책목록 조회
	public List<Book> selectBookListByTitle(@Param("title") String title);
	
	
	//책 1행정보 조회(상세정보)
	public Book selectBookById(@Param("id")int id);
		
	//관심도서
	
	//대출
	
	//반납
	
	
	//예약
	
	
	
	//상호대차
	
	
	
	
	
}
