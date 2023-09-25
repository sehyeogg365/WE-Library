package com.marondal.welibrary.book.interibrary.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.marondal.welibrary.book.model.InteribraryBook;

@Repository
public interface InteribraryDAO {

	// 상호대차 신청
	public int insertInteribrary(@Param("bookId") int bookId, @Param("userId") int userId,
			@Param("receivelibrary") String receivelibrary);

	// 상호대차 1행정보
	public InteribraryBook selectInteribrary(@Param("bookId") int bookId);

	// 상호대차 조회
	public List<InteribraryBook> selectInteribraryList(@Param("userId") int userId);

	// 상호대차 권수
	public int selectInteribraryBookCount(@Param("userId") int userId);

	// 상호대차 권수 표시
	public List<InteribraryBook> selectInteribrayBookNumberByUserId(@Param("userId") int userId);

	// 대출 상태
	public int selectBorrowByBookId(@Param("bookId") int bookId);

	// 상호대차 여부
	public int selectInteribraryByBookId(@Param("bookId") int bookId);

	// 상호대차 취소
	public int deleteInteribrary(@Param("id") int id);

}
