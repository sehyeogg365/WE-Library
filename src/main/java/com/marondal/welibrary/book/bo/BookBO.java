package com.marondal.welibrary.book.bo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.marondal.welibrary.book.dao.BookDAO;
import com.marondal.welibrary.book.model.WishBook;
import com.marondal.welibrary.book.model.WishBookDetail;
import com.marondal.welibrary.user.bo.UserBO;

@Service
public class BookBO {
	
	
	@Autowired
	private BookDAO bookDAO;
	
	//책목록 조회
	
	//책 1행정보 조회
	
	//대출
	//반납
	//예약
	//관심도서
	//상호대차
	
	
	
	
}