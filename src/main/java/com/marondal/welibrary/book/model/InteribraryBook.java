package com.marondal.welibrary.book.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;
@Getter
@Setter
public class InteribraryBook {
	private int id;
	private int userId;
	private int bookId;
	private String receivelibrary;
	private Date createdAt;
	private Date returnDate;
	private Date updatedAt;
}
