package com.marondal.welibrary.book.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.marondal.welibrary.book.model.Book;
import com.marondal.welibrary.book.model.BookDetail;

@Repository
public interface BookDAO {
	
	
	
	//책목록 조회
	public List<Book> selectBookListByTitle(@Param("title") String title);
	
	
	//책 1행정보(상세정보)
	public List<Book> selectBookListById(@Param("id")int id);
	
	//책 1행정보 조회(상호대차 팝업창)
	public BookDetail selectBookById(@Param("id")int id);
	
	//public Page<> boardList();
	
	//책 갯수 세기
	public int selectBookCount(@Param("title") String title);
	
	//책 갯수 표시
	public List<Book> selectBookNumberByTitle(@Param("title") String title);

	
}
