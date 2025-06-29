package com.marondal.welibrary.book.reserve.bo;

import lombok.RequiredArgsConstructor;

import org.springframework.stereotype.Service;


import com.marondal.welibrary.book.reserve.dao.ReserveDAO;

@Service
@RequiredArgsConstructor
public class ReserveCountBO {

	private final ReserveDAO reserveDAO;

	// 예약 정보 1행 조회
//	public ReserveBook getReserveBook(int bookId) {
//		return reserveDAO.selectReserveBook(bookId);
//	}

	// 예약인원수
	public int getReserveCount(int bookId) {
		return reserveDAO.selectReserveCount(bookId);
	}

	// 대출상태
	public boolean isBorrow(int bookId) {
		int count = reserveDAO.selectBorrowByBookId(bookId);

		if (count == 1) { // 1일때 true else일떄 false 로 수정 해보기
			return true;
		} else {
			return false;
		}
	}

	// 예약 여부 (본인이 예약한건 예약 못한다)
//	public boolean isReserve(int userId, int bookId) {
//		int count = reserveDAO.isReserve(userId, bookId);
//
//		if (count == 0) {// 0일때 false else 일때 true(commit test, merge test)
//			return false;
//		} else {
//			return true;
//		}
//	}
}
