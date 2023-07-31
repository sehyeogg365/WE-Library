package com.marondal.welibrary.book.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.marondal.welibrary.book.dao.BookDAO;
import com.marondal.welibrary.book.model.WishBook;

@Service
public class BookBO {
	//대출현황, 대출이력, 반납, 예약현황, 예약 취소, 희망도서 신청 등등

	@Autowired
	private BookDAO bookDAO;

	//희망도서 신청
	
	public int addWishbook( int userId
						   , String library
						   , String title   
						   , MultipartFile file 
						   , String author   
						   , String publisher   
						   , int price   
						   , String isbn   
						   , Date pubdate
						   ) {
		//파일매니저 서비스 추가하기
		//String imagePath = FileManagerService.saveFile(userId, file);
		
		
		return bookDAO.insertWishBook(userId, library, title, title, author, publisher, price, isbn, pubdate);		

	}
	
	//희망도서 리스트(사용자가 신청한 리스트)
	
	public List<WishBook> getWishBookList(int userId, int id){
			

		return bookDAO.selectWishBookList(userId, id);
		
	}
	
	
}