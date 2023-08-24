package com.marondal.welibrary.book.bo;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.marondal.welibrary.book.dao.BookDAO;
import com.marondal.welibrary.book.model.Book;


@Service
public class BookBO {
	
	
	@Autowired
	private BookDAO bookDAO;
	
	//책목록 조회(dto로 바꾸기)
	public List<Book> getBookListByTitle(String title){
		
		
		return bookDAO.selectBookListByTitle(title);
		
		
	}
	
	
	//책 1행정보 조회
	public Book getBookById(int id) {
				
		return bookDAO.selectBookById(id);

	}
	
	//이전의 충모투어에선 딥스체크비오를 만들어서 진행했는데 그건 로징비오와 딥스비오가 서로서로 참조하는 현상이있어서 그랬던거고 이번엔 따로 북스체크비오를 안만들어도될듯.
	//대출 가능 여부
	public boolean isBorrow(int bookId) {
		
		int count = bookDAO.selectBorrowByBookId(bookId);
		
		
		if(count == 0) {
			return true;
		} else {
			return false;
		}
		
	}
	
	//예약 갯수 표시
	
	//상호대차 가능 여부
	
	
	
	
	
}