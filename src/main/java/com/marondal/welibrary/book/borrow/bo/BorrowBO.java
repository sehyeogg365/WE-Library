package com.marondal.welibrary.book.borrow.bo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.welibrary.book.bo.BookBO;
import com.marondal.welibrary.book.borrow.dao.BorrowDAO;
import com.marondal.welibrary.book.model.Book;
import com.marondal.welibrary.book.model.BookDetail;
import com.marondal.welibrary.book.model.BorrowBook;
import com.marondal.welibrary.book.model.BorrowBookCount;
import com.marondal.welibrary.book.model.BorrowBookDetail;

@Service
public class BorrowBO {

	@Autowired
	private BorrowDAO borrowDAO;

	@Autowired
	private BookBO bookBO;

	@Autowired
	private BorrowCountBO borrowCountBO;

	// 대여
	public int addBorrow(int userId, int bookId) {

		return borrowDAO.insertBorrow(userId, bookId);
	}

	// 대출 1행정보
	public BorrowBook getBorrow(int bookId) {

		return borrowDAO.selectBorrow(bookId);

	}

	// 대출 목록
	public List<BorrowBookDetail> getBorrowList(int userId) {

		List<BorrowBook> borrowList = borrowDAO.selectBorrowList(userId);

		List<BorrowBookDetail> borrowDetailList = new ArrayList<>();

		for (BorrowBook borrowBook : borrowList) {

			BookDetail book = bookBO.getBookById(borrowBook.getBookId());

			BorrowBookDetail borrowBookDetail = new BorrowBookDetail();

			borrowBookDetail.setId(borrowBook.getId());
			borrowBookDetail.setUserId(borrowBook.getUserId());
			borrowBookDetail.setBookId(borrowBook.getBookId());
			// borrowBookDetail.setImagePath(book.getImagePath());
			borrowBookDetail.setLibrary(book.getLibrary());
			borrowBookDetail.setTitle(book.getTitle());
			// borrowBookDetail.setIsbn(book.getIsbn());
			borrowBookDetail.setAuthor(book.getAuthor());
			// borrowBookDetail.setPubyear(book.getPubyear());
			borrowBookDetail.setPublisher(book.getPublisher());
			// borrowBookDetail.setAppendix(book.getAppendix());
			borrowBookDetail.setCreatedAt(borrowBook.getCreatedAt());
			borrowBookDetail.setReturnDate(borrowBook.getReturnDate());

			borrowDetailList.add(borrowBookDetail);
		}

		return borrowDetailList;

	}


	// 반납
	public int deleteBorrow(int id) {

		return borrowDAO.deleteBorrow(id);
	}

	// 반납 연장
	public int updateBorrow(int userId, int id) {

		return borrowDAO.updateBorrow(userId, id);

	}
	
	//2024-03-17 대출 이력 추가
	public int addBorrowHistory(int userId, int bookId) {
		
		return borrowDAO.insertBorrowHistory(userId, bookId);

	}
	
	//대출 이력 권수
	public List<Integer> borrowHistoryNumber(int userId){
		
		return null;
		
	}

}
