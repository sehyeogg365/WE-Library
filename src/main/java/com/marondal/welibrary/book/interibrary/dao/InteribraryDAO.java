package com.marondal.welibrary.book.interibrary.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface InteribraryDAO {

	
	public int insertInteribrary(@Param("bookId") int bookId, @Param("userId") int userId, @Param("library") String library);
	
	
}
