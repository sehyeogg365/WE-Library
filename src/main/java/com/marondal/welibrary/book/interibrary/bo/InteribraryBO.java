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
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class InteribraryBO {

	private final InteribraryDAO interibraryDAO;
	private final BookBO bookBO;
	private final InteribrayCountBO interibrayCountBO;

	// 상호대차 신청
	@Transactional
	public int addInteribrary(int bookId, int userId, String receivelibrary) {
		return interibraryDAO.insertInteribrary(bookId, userId, receivelibrary);
	}

	// 상호대차 1행정보
	public InteribraryBook getInteribrary(int bookId) {
		return interibraryDAO.selectInteribrary(bookId);
	}

	// 상호대차 조회
	public List<InteribraryBookDetail> getInteribraryList(int userId) {
		List<InteribraryBook> interibraryList = interibraryDAO.selectInteribraryList(userId);// 신청내역 (InteribraryBook) 조회

		List<InteribraryBookDetail> interibraryDetailList = new ArrayList<>();

		for (InteribraryBook interibrarybook : interibraryList) {
			BookDetail book = bookBO.getBookById(interibrarybook.getBookId());// 각 책마다 → 상세정보 조회 + 대출여부 확인

			boolean isBorrow = interibrayCountBO.isBorrow(interibrarybook.getBookId());
			InteribraryBookDetail interibraryBookDetail = new InteribraryBookDetail();// InteribraryBookDetail 객체로 포장

			interibraryBookDetail.setId(interibrarybook.getId());
			interibraryBookDetail.setUserId(interibrarybook.getUserId());
			interibraryBookDetail.setBookId(interibrarybook.getBookId());
			interibraryBookDetail.setTitle(book.getTitle());
			interibraryBookDetail.setLibrary(book.getLibrary());// 제공도서관
			interibraryBookDetail.setReceivelibrary(interibrarybook.getReceivelibrary());// 수령도서관
			interibraryBookDetail.setCreatedAt(interibrarybook.getCreatedAt());// 수령일
			interibraryBookDetail.setReturnDate(interibrarybook.getReturnDate());// 반납예정일
			interibraryBookDetail.setStatus(isBorrow);

			interibraryDetailList.add(interibraryBookDetail);// 결과 리스트에 담기
		}

		return interibraryDetailList;// 리스트 반환
	}


	// 상호대차 취소
	public int deleteInteribrary(int id) {
		return interibraryDAO.deleteInteribrary(id);
	}
}
