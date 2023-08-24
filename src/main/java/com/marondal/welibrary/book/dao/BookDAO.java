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
		

	
	//대출 가능 여부 
	public int selectBorrowByBookId(@Param("bookId") int bookId);
	
	
	//예약 갯수 표시
	public int selectReserveBookId(@Param("bookId") int bookId);
	
	
	//상호대차 가능 여부
	public int selectInteribraryBookId(@Param("bookId") int bookId);
	
	
	
	
}
