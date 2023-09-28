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

<<<<<<< HEAD
		if (count == 1) {//이거를 1 true else false 로 바꿔보기
=======
		if (count == 1) { // 1일때 true else일떄 false 로 수정 해보기
>>>>>>> develop

			return true;
		} else {

			return false;
		}
	}

	// 예약 여부 (본인이 예약한건 예약 못한다)
	public boolean isReserve(int userId, int bookId) {

		int count = reserveDAO.isReserve(userId, bookId);

<<<<<<< HEAD
		if (count == 0) {//0일때 예약 안한거 else일떄 예약한거
=======
		if (count == 0) {//0일때 false else 일때 true
>>>>>>> develop

			return false;
		} else {

			return true;
		}

	}

}
