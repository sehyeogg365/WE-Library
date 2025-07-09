package com.marondal.welibrary.book.reserve.bo;

import java.util.ArrayList;
import java.util.List;

import com.marondal.welibrary.book.interibrary.bo.InteribraryBO;
import com.marondal.welibrary.book.model.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import com.marondal.welibrary.book.bo.BookBO;
import com.marondal.welibrary.book.borrow.bo.BorrowBO;
import com.marondal.welibrary.book.reserve.dao.ReserveDAO;
import org.springframework.transaction.annotation.Transactional;

import static java.rmi.server.LogStream.log;

@Service
@Slf4j
@RequiredArgsConstructor
public class ReserveBO {

	private final ReserveDAO reserveDAO;
	private final BookBO bookBO;
	private final BorrowBO borrowBO;
	private final ReserveCountBO reserveCountBO;
	private final InteribraryBO interibraryBO;
	//TODO 대출목록및 대출 기록 페이지 날짜 검색 도서명 검색 추가
	// JUnit, TDD추가 해보기 등등

	@Transactional
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

			// borrowbook과 대출 도서 반납일자 낫널일때
			// interibrarybook과 상호대차 도서 반납일자 낫널일때
			// 그외에는 널 셋팅
			if(borrowbook != null && borrowbook.getReturnDate() != null){ // 이 부분 셋하는걸 잘못함 borrowbook.get으로 수정하기
				log("borrowbook" + borrowbook);
				reserveBookDetail.setReturnDate(borrowbook.getReturnDate());
			} else if(interibraryBook != null && interibraryBook.getReturnDate() != null){
				log("interibraryBook" + interibraryBook);
				reserveBookDetail.setReturnDate(interibraryBook.getReturnDate());
			} else {
				reserveBookDetail.setReturnDate(null);
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
