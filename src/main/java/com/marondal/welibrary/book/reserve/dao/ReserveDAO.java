package com.marondal.welibrary.book.reserve.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.marondal.welibrary.book.model.ReserveBook;

@Repository
public interface ReserveDAO {

	// 예약
	public int insertReserve(@Param("bookId") int bookId, @Param("userId") int userId);

	// 예약 정보 1행 조회
	public ReserveBook selectReserveBook(@Param("bookId") int bookId);

	// 예약 목록

	public List<ReserveBook> selectReserveList(@Param("userId") int userId);

	// 예약 삭제
	public int deleteReserve(@Param("id") int id);

	// 예약권수
	public int selectReserveBookCount(@Param("userId") int userId);

	// 예약 권수 표시
	public List<ReserveBook> selectReserveBookNumberByUserId(@Param("userId") int userId);

	// 예약인원수
	public int selectReserveCount(@Param("bookId") int bookId);

	// 대출상태
	public int selectBorrowByBookId(@Param("bookId") int bookId);

	// 예약 여부(본인이 예약한 책은 예약 못한다.)

	public int isReserve(@Param("userId") int userId, @Param("bookId") int bookId);

}
