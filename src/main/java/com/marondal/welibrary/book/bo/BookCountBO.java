package com.marondal.welibrary.book.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.welibrary.book.dao.BookDAO;

@Service
public class BookCountBO {

	@Autowired
	private BookDAO bookDAO;

//	public int getBookCount(String title) {
//
//		return bookDAO.selectBookCount(title);리스팅할때 카운트비오를 안불러오는 형태라서. 다오를 불러오는 형태라서 안해도 된다.

//
//	}

}
