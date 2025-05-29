package com.marondal.welibrary.book.interest.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.welibrary.book.bo.BookBO;
import com.marondal.welibrary.book.interest.dao.InterestDAO;
import com.marondal.welibrary.book.model.BookDetail;
import com.marondal.welibrary.book.model.InterestBook;
import com.marondal.welibrary.book.model.InterestBookDetail;

@Service
public class InterestBO {

	@Autowired
	private InterestDAO interestDAO;

	@Autowired
	private BookBO bookBO;

	@Autowired
	private InterestCountBO interestCountBO;

	// 관심도서 추가
	public int addInterest(int userId, int bookId) {
		return interestDAO.insertInterest(userId, bookId);
	}

	// 관심도서 조회 (dto)
	public List<InterestBookDetail> getInterestList(int userId) {
		List<InterestBook> interestList = interestDAO.selectInterestList(userId);

		List<InterestBookDetail> interestDetailList = new ArrayList<>();

		for (InterestBook interestbook : interestList) {
			BookDetail book = bookBO.getBookById(interestbook.getBookId());

			InterestBookDetail interestbookDetail = new InterestBookDetail();

			interestbookDetail.setId(interestbook.getId());
			interestbookDetail.setUserId(interestbook.getUserId());
			interestbookDetail.setBookId(interestbook.getBookId());
			interestbookDetail.setImagePath(book.getImagePath());
			interestbookDetail.setLibrary(book.getLibrary());
			interestbookDetail.setTitle(book.getTitle());
			interestbookDetail.setIsbn(book.getIsbn());
			interestbookDetail.setAuthor(book.getAuthor());
			interestbookDetail.setPubyear(book.getPubyear());
			interestbookDetail.setPublisher(book.getPublisher());
			interestbookDetail.setAppendix(book.getAppendix());
			interestbookDetail.setCreatedAt(interestbook.getCreatedAt());

			interestDetailList.add(interestbookDetail);
		}

		return interestDetailList;
	}

	// 관심도서 삭제
	public int deleteInterest(int id) {
		return interestDAO.deleteInterest(id);
	}

}
