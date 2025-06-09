package com.marondal.welibrary.book.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class WishBook {
	private int id;
	private int userId;
	private String library;
	private String title;
	private String imagePath;
	private String author;
	private String publisher;
	private int price;
	private String isbn;
	private int pubyear;
	private Date createdAt;
	private Date updatedAt;
}
