package com.marondal.welibrary.book.reserve.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.welibrary.book.model.ReserveBook;
import com.marondal.welibrary.book.reserve.dao.ReserveDAO;

@Service
public class ReserveCountBO {

	@Autowired
	private ReserveDAO reserveDAO;

	// 예약 정보 1행 조회
	public ReserveBook getReserveBook(int bookId) {

		return reserveDAO.selectReserveBook(bookId);
	}

	// 예약권수
	public int getReserveBookCount(int userId) {

		return reserveDAO.selectReserveBookCount(userId);

	}

	// 예약인원수
	public int getReserveCount(int bookId) {

		return reserveDAO.selectReserveCount(bookId);

	}

	// 대출상태
	public boolean isBorrow(int bookId) {

		int count = reserveDAO.selectBorrowByBookId(bookId);

		if (count == 1) {//이거를 1 true else false 로 바꿔보기

			return true;
		} else {

			return false;
		}
	}

	// 예약 여부 (본인이 예약한건 예약 못한다)
	public boolean isReserve(int userId, int bookId) {

		int count = reserveDAO.isReserve(userId, bookId);

		if (count == 0) {//0일때 예약 안한거 else일떄 예약한거

			return false;
		} else {

			return true;
		}

	}

}
