package com.marondal.welibrary.book.wishbook.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.marondal.welibrary.book.model.WishBook;

@Repository
public interface WishBookDAO {

	//희망도서 신청
	
		public int insertWishBook(@Param("userId") int userId
								  , @Param("library") String libray
								  , @Param("title") String title
								  , @Param("imagePath") String imagePath
								  , @Param("author") String author
								  , @Param("publisher") String publisher
								  , @Param("price") int price
								  , @Param("isbn") String isbn
								  , @Param("pubyear") int pubyear
								  );
		
		//희망도서 리스트
		public List<WishBook> selectWishBookList(@Param("userId") int userId, @Param("id") int id);
		
		
		
		//희망도서 신청 여부 
			
}
