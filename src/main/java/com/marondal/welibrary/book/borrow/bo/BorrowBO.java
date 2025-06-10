package com.marondal.welibrary.book.borrow.bo;

import java.util.ArrayList;
import java.util.List;

import com.marondal.welibrary.book.interibrary.dao.InteribraryDAO;
import com.marondal.welibrary.book.model.InteribraryBook;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import com.marondal.welibrary.book.bo.BookBO;
import com.marondal.welibrary.book.borrow.dao.BorrowDAO;
import com.marondal.welibrary.book.model.BookDetail;
import com.marondal.welibrary.book.model.BorrowBook;
import com.marondal.welibrary.book.model.BorrowBookDetail;

import static java.rmi.server.LogStream.log;

@Service
@Slf4j
@RequiredArgsConstructor
public class BorrowBO {
	private final BorrowDAO borrowDAO;

	private final BookBO bookBO;

	private final InteribraryDAO interibraryDAO;

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
			borrowBookDetail.setLibrary(book.getLibrary());
			borrowBookDetail.setTitle(book.getTitle());
			borrowBookDetail.setAuthor(book.getAuthor());
			borrowBookDetail.setPublisher(book.getPublisher());
			borrowBookDetail.setCreatedAt(borrowBook.getCreatedAt());
			borrowBookDetail.setReturnDate(borrowBook.getReturnDate());

			borrowDetailList.add(borrowBookDetail);
		}
		return borrowDetailList;
	}

	// 반납
	public int deleteBorrow(int id) {// 여기서 상호대차 도서 목록에 있을시 상호대차 목록서 제거
		// 1. 대출 정보 가져오기 (bookId 포함)
		BorrowBook borrowBookInfo = borrowDAO.selectById(id); // 큰 딜레마가 있다. 반납하는거는 대출ID 대출 1행 불러오는것은 bookId다. 그럼 다오메서드를 하나 더 파기
		InteribraryBook interibraryBook = interibraryDAO.selectInteribrary(borrowBookInfo.getBookId());// 상호대차 1행 조회

		// 2. 이 bookId가 상호대차 테이블에 있는지 확인 + 해당 유저가 상호대차 중인지?
		if(interibraryBook != null){
			log("interibraryBook" + interibraryBook);
			interibraryDAO.deleteInteribrary(interibraryBook.getId());// 3. 있으면 '상호대차 완료' 상태로 업데이트 or 삭제
		}
		return borrowDAO.deleteBorrow(id);// 정상적으로 반납 처리
	}

	// 반납 연장
	public int updateBorrow(int userId, int id) {
		return borrowDAO.updateBorrow(userId, id);
	}
	
	// 2024-03-17 대출 이력 추가
	public int addBorrowHistory(int userId, int bookId) {
		return borrowDAO.insertBorrowHistory(userId, bookId);
	}
}
