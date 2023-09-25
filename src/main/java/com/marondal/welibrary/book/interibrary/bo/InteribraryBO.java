package com.marondal.welibrary.book.interibrary.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.welibrary.book.bo.BookBO;
import com.marondal.welibrary.book.borrow.bo.BorrowCountBO;
import com.marondal.welibrary.book.interibrary.dao.InteribraryDAO;
import com.marondal.welibrary.book.model.Book;
import com.marondal.welibrary.book.model.BookDetail;
import com.marondal.welibrary.book.model.InteribraryBook;
import com.marondal.welibrary.book.model.InteribraryBookCount;
import com.marondal.welibrary.book.model.InteribraryBookDetail;

@Service
public class InteribraryBO {

	@Autowired
	private InteribraryDAO interibraryDAO;

	@Autowired
	private BookBO bookBO;

	@Autowired
	private InteribrayCountBO interibrayCountBO;

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

	// 상호대차 권수 표시
	public List<InteribraryBookCount> getInteribraryBookNumberByUserId(int userId) {

		List<InteribraryBook> interibraryList = interibraryDAO.selectInteribraryList(userId);

		List<InteribraryBookCount> interibraryCountlList = new ArrayList<>();

		for (InteribraryBook interibrarybook : interibraryList) {

			InteribraryBookCount interibraryBookCount = new InteribraryBookCount();

			int numberCount = interibrayCountBO.getInteribraryBookCount(userId);

			interibraryBookCount.setNumberCount(numberCount);

			interibraryCountlList.add(interibraryBookCount);

		}

		return interibraryCountlList;

	}

	// 상호대차 취소
	public int deleteInteribrary(int id) {

		return interibraryDAO.deleteInteribrary(id);

	}

}
