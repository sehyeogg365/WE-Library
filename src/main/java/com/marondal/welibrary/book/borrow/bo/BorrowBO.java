package com.marondal.welibrary.book.borrow.bo;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.welibrary.book.bo.BookBO;
import com.marondal.welibrary.book.borrow.dao.BorrowDAO;
import com.marondal.welibrary.book.model.Book;
import com.marondal.welibrary.book.model.BorrowBook;
import com.marondal.welibrary.book.model.BorrowBookCount;
import com.marondal.welibrary.book.model.BorrowBookDetail;

@Service
public class BorrowBO {
	
	@Autowired
	private BorrowDAO borrowDAO;
	
	@Autowired
	private BookBO bookBO;
	
	//대여
	public int addBorrow(int userId, int bookId) {
		
		return borrowDAO.insertBorrow(userId, bookId);
	}

	
	//대출 목록
	public List<BorrowBookDetail> getBorrowList(int userId){
		
		
		List<BorrowBook> borrowList = borrowDAO.selectBorrowList(userId);
		
		List<BorrowBookDetail> borrowDetailList = new ArrayList<>();
		
		for(BorrowBook borrowBook : borrowList) {
			
			Book book = bookBO.getBookById(borrowBook.getBookId());
		
			BorrowBookDetail borrowBookDetail = new BorrowBookDetail();
			
			borrowBookDetail.setId(borrowBook.getId());
			borrowBookDetail.setUserId(borrowBook.getUserId());
			borrowBookDetail.setBookId(borrowBook.getBookId());
			//borrowBookDetail.setImagePath(book.getImagePath());
			borrowBookDetail.setLibrary(book.getLibrary());
			borrowBookDetail.setTitle(book.getTitle());
			//borrowBookDetail.setIsbn(book.getIsbn());
			borrowBookDetail.setAuthor(book.getAuthor());
			//borrowBookDetail.setPubyear(book.getPubyear());
			borrowBookDetail.setPublisher(book.getPublisher());
			//borrowBookDetail.setAppendix(book.getAppendix());
			borrowBookDetail.setCreatedAt(borrowBook.getCreatedAt());
			
			borrowDetailList.add(borrowBookDetail);
		}	
		

		return borrowDetailList;
		
	
	}

		
	//반납
	public int deleteBorrow(int userId, int id) {
		
		return borrowDAO.deleteBorrow(userId, id);
	}
	
}
