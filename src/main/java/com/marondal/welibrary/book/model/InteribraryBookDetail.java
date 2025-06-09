package com.marondal.welibrary.book.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;
@Getter
@Setter
public class InteribraryBookDetail {
	private int id;
	private int userId;
	private int bookId;
	private String library;//제공도서관
	private String receivelibrary;
	private String title;
	private String author;
	private boolean isStatus;//상태
	private String publisher;
	private Date createdAt;
	private Date returnDate;
}
