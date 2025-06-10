package com.marondal.welibrary.book.interibrary.bo;

import java.util.ArrayList;
import java.util.List;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import com.marondal.welibrary.book.bo.BookBO;
import com.marondal.welibrary.book.interibrary.dao.InteribraryDAO;
import com.marondal.welibrary.book.model.BookDetail;
import com.marondal.welibrary.book.model.InteribraryBook;
import com.marondal.welibrary.book.model.InteribraryBookDetail;

@Service
@RequiredArgsConstructor
public class InteribraryBO {
	private final InteribraryDAO interibraryDAO;

	private final BookBO bookBO;

	private final InteribrayCountBO interibrayCountBO;
	//TODO 여기서 한가지 모순점도 발견했다. 상호대차 수령한 도서를 다시 반납처리하면 또다시 상호대차 수령을 할수 있고 무한 반복이 된다.
	// 수령->대출현황으로 추가 -> 반납 처리 -> 대출현황, 상호대차 목록에서 제거 -> 대출이력으로 이동 이렇게 되어야 함, 대출이력은 나중에 하더라도.
	// 상호대차 신청
	public int addInteribrary(int bookId, int userId, String receivelibrary) {
		return interibraryDAO.insertInteribrary(bookId, userId, receivelibrary);
	}

	// 상호대차 1행정보
	public InteribraryBook getInteribrary(int bookId) {
		return interibraryDAO.selectInteribrary(bookId);
	}

	// 상호대차 조회
	public List<InteribraryBookDetail> getInteribraryList(int userId) {
		List<InteribraryBook> interibraryList = interibraryDAO.selectInteribraryList(userId);

		List<InteribraryBookDetail> interibraryDetailList = new ArrayList<>();

		for (InteribraryBook interibrarybook : interibraryList) {
			BookDetail book = bookBO.getBookById(interibrarybook.getBookId());

			boolean isBorrow = interibrayCountBO.isBorrow(interibrarybook.getBookId());
			InteribraryBookDetail interibraryBookDetail = new InteribraryBookDetail();

			interibraryBookDetail.setId(interibrarybook.getId());
			interibraryBookDetail.setUserId(interibrarybook.getUserId());
			interibraryBookDetail.setBookId(interibrarybook.getBookId());
			interibraryBookDetail.setTitle(book.getTitle());
			interibraryBookDetail.setLibrary(book.getLibrary());// 제공도서관
			interibraryBookDetail.setReceivelibrary(interibrarybook.getReceivelibrary());// 수령도서관
			interibraryBookDetail.setCreatedAt(interibrarybook.getCreatedAt());// 수령일
			interibraryBookDetail.setReturnDate(interibrarybook.getReturnDate());// 반납예정일
			interibraryBookDetail.setStatus(isBorrow);

			interibraryDetailList.add(interibraryBookDetail);
		}

		return interibraryDetailList;
	}


	// 상호대차 취소
	public int deleteInteribrary(int id) {
		return interibraryDAO.deleteInteribrary(id);
	}
}
