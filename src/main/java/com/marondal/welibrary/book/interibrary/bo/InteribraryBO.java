package com.marondal.welibrary.book.interibrary.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.welibrary.book.bo.BookBO;
import com.marondal.welibrary.book.interibrary.dao.InteribraryDAO;
import com.marondal.welibrary.book.model.Book;
import com.marondal.welibrary.book.model.InteribraryBook;
import com.marondal.welibrary.book.model.InteribraryBookDetail;

@Service
public class InteribraryBO {

	@Autowired
	private InteribraryDAO interibraryDAO;
	
	@Autowired
	private BookBO bookBO;
	
	//상호대차 신청
	public int addInteribrary(int bookId, int userId, String receivelibrary) {
	
		return interibraryDAO.insertInteribrary(bookId, userId, receivelibrary);
		
	}
	
	//상호대차 조회
	public List<InteribraryBookDetail> getInteribraryList(int userId){
		
		List<InteribraryBook> interibraryList = interibraryDAO.selectInteribraryList(userId);
		
		List<InteribraryBookDetail> interibraryDetailList = new ArrayList<>();
		
		for(InteribraryBook interibraryBook: interibraryList) {
			
			Book book = bookBO.getBookById(interibraryBook.getBookId());
			
			InteribraryBookDetail interibraryBookDetail = new InteribraryBookDetail();
			
			interibraryBookDetail.setId(interibraryBook.getId());
			interibraryBookDetail.setUserId(userId);
			interibraryBookDetail.setBookId(interibraryBook.getBookId());
			interibraryBookDetail.setTitle(book.getTitle());
			
			interibraryBookDetail.setLibrary(book.getLibrary());// 제공도서관
			interibraryBookDetail.setReceivelibrary(interibraryBook.getReceivelibrary());//수령도서관
			
			interibraryBookDetail.setCreatedAt(interibraryBook.getCreatedAt());
			interibraryBookDetail.setReturnDate(interibraryBook.getReturnDate());
			
			interibraryDetailList.add(interibraryBookDetail);
		}
		
		
		
		
		return interibraryDetailList;
		
	}
	
	
	
	//상호대차 취소
	
	
}
