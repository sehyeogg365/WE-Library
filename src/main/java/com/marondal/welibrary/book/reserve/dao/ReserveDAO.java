package com.marondal.welibrary.book.reserve.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ReserveDAO {

	//예약 
	public int insertReserve(@Param("bookId")int bookId, @Param("userId") int userId);
	
	
	
}
