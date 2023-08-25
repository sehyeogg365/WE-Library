package com.marondal.welibrary.book.wishbook.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.marondal.welibrary.book.model.WishBook;
import com.marondal.welibrary.book.model.WishBookCount;
import com.marondal.welibrary.book.model.WishBookDetail;

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
		public List<WishBook> selectWishBookList(@Param("userId") int userId);
		
		

		// 유저별 희망도서 갯수세기 return type int 타입이 맞다.
		public WishBookCount selectWishBookNumberByuserId(@Param("userId") int userId);
		
		
		//희망도서 신청 여부 
		public int selectBookByLibraryTitle(@Param("library") String library, @Param("title")String title);
					
				
		//관리자	
		
		// 전체 희망도서 갯수세기
		public WishBookCount selectWishBookNumberById(@Param("id")int id);
		
			
				
		// 관리자 희망도서 신청 리스트 조회
		public List<WishBook> selectWishBookListById(@Param("id") int id);
		
	
		
		
		//희망도서 북테이블에 추가 
		
		public int insertWishbookIntoBook(
										  @Param("library") String libray
										  , @Param("title") String title
										  , @Param("imagePath") String imagePath
										  , @Param("author") String author
										  , @Param("publisher") String publisher
										  , @Param("price") int price
										  , @Param("isbn") String isbn
										  , @Param("pubyear") int pubyear
										  , @Param("appendix") String appendix
										  
										);
		
}
