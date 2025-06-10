package com.marondal.welibrary.book.borrow.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.marondal.welibrary.book.model.BorrowBook;

@Repository
public interface BorrowDAO {
	// 대여
	public int insertBorrow(@Param("userId") int userId, @Param("bookId") int bookId);

	// 대출 1행
	public BorrowBook selectBorrow(@Param("bookId") int bookId);

	// 대출목록
	public List<BorrowBook> selectBorrowList(@Param("userId") int userId);

	// 대출도서 갯수
	public int selectBorrowBookCount(@Param("userId") int userId);

	// 대출도서 갯수 표시
	public List<BorrowBook> selectBorrowBookNumberByUserId(@Param("userId") int userId);

	// 반납
	public int deleteBorrow(@Param("id") int id);

	// 반납 연장
	public int updateBorrow(@Param("userId") int userId, @Param("id") int id);
	
	// 2024-03-17 대출 이력 추가
	public int insertBorrowHistory(@Param("userId") int userId, @Param("bookId") int bookId);

//	// 2024-03-23 대출 이력 권수
//	public int selectBorrowHistoryCount(@Param("userId") int userId);
}
