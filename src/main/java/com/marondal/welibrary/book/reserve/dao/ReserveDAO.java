package com.marondal.welibrary.book.reserve.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.marondal.welibrary.book.model.ReserveBook;

@Repository
public interface ReserveDAO {

	//예약 
	public int insertReserve(@Param("bookId") int bookId
							, @Param("userId") int userId);
	
	//예약 목록 
	
	public List<ReserveBook> selectReserveList(@Param("userId") int userId);
	
}
