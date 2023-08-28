package com.marondal.welibrary.book.reserve.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.marondal.welibrary.book.model.ReserveBook;
import com.marondal.welibrary.book.model.ReserveBookCount;

@Repository
public interface ReserveDAO {

	//예약 
	public int insertReserve(@Param("bookId") int bookId
							, @Param("userId") int userId);
	
	//예약 목록 
	
	public List<ReserveBook> selectReserveList(@Param("userId") int userId);
	
	
	//예약 삭제 
	public int deleteReserve(@Param("id") int id
							, @Param("userId") int userId);


	//예약권수
	public ReserveBookCount selectReserveBookCount(@Param("userId") int userId);
	
	
	//예약인원수
	public int selectReserveCount(@Param("bookId") int bookId);
	
	//대출상태
	public int selectBorrowByBookId(@Param("bookId") int bookId);
	
	//예약 여부
	
	public int isReserve(@Param("userId") int userId, @Param("id") int id);
	
}
