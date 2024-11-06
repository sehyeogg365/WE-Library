package com.marondal.welibrary.book.reserve.bo;

import java.util.ArrayList;
import java.util.List;

import com.marondal.welibrary.book.interibrary.bo.InteribraryBO;
import com.marondal.welibrary.book.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.welibrary.book.bo.BookBO;
import com.marondal.welibrary.book.borrow.bo.BorrowBO;
import com.marondal.welibrary.book.reserve.dao.ReserveDAO;

@Service
public class ReserveBO {

	@Autowired
	private ReserveDAO reserveDAO;

	@Autowired
	private BookBO bookBO;

	@Autowired
	private BorrowBO borrowBO;

	@Autowired
	private ReserveCountBO reserveCountBO;

	@Autowired
	private InteribraryBO interibraryBO;

	// 예약
	public int addReserve(int bookId, int userId) {

		return reserveDAO.insertReserve(bookId, userId);
	}

	// 예약 조회
	public List<ReserveBookDetail> getReserveList(int userId) {

		List<ReserveBook> reserveList = reserveDAO.selectReserveList(userId);

		List<ReserveBookDetail> reserveDetailList = new ArrayList<>();

		for (ReserveBook reserveBook : reserveList) {

			BookDetail book = bookBO.getBookById(reserveBook.getBookId());

			BorrowBook borrowbook = borrowBO.getBorrow(book.getId());// 여기가 널일때 상호대차의 리턴데이트를 불러온다 이렇게 되어야 함
			InteribraryBook interibraryBook = interibraryBO.getInteribrary(book.getId());

			// 대출상태
			boolean isBorrow = reserveCountBO.isBorrow(book.getId());// 상태

			int reserveCount = reserveCountBO.getReserveCount(book.getId());

			ReserveBookDetail reserveBookDetail = new ReserveBookDetail();

			reserveBookDetail.setId(reserveBook.getId());
			reserveBookDetail.setBookId(reserveBook.getBookId());
			reserveBookDetail.setLibrary(book.getLibrary());
			reserveBookDetail.setTitle(book.getTitle());
			reserveBookDetail.setAuthor(book.getAuthor());
			reserveBookDetail.setPublisher(book.getPublisher());
			reserveBookDetail.setCreatedAt(reserveBook.getCreatedAt());// 반납예정일도 추가하기
			if(borrowbook == null){
				reserveBookDetail.setReturnDate(interibraryBook.getReturnDate());
			} else {
				reserveBookDetail.setReturnDate(borrowbook.getReturnDate());// 반납예정일 대출중 도서는 대출테이블의 리턴데이트 상호대차중 도서는 상호대차테이블의 리턴데이트
			}
			// 대출상태, 예약순번/예약인원수도 필요함
			reserveBookDetail.setStatus(isBorrow);// 대출상태
			reserveBookDetail.setReserveCount(reserveCount);// 예약 인원수

			reserveDetailList.add(reserveBookDetail);
		}

		return reserveDetailList;
	}

	// 예약 취소
	public int deleteReserve(int id) {

		return reserveDAO.deleteReserve(id);
	}

}
