package com.marondal.welibrary.book.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class BorrowBookDetail {
	private int id;
	private int userId;
	private int bookId;
	private String library;
	private String title;
	private String author;
	private String publisher;
	private boolean isUpdate;//반납연장 여부 
	private Date createdAt;
	private Date returnDate;
}
