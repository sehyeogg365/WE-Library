package com.marondal.welibrary.book.model;

import java.util.Date;

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
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public String getLibrary() {
		return library;
	}
	public void setLibrary(String library) {
		this.library = library;
	}
	public String getReceivelibrary() {
		return receivelibrary;
	}
	public void setReceivelibrary(String receivelibrary) {
		this.receivelibrary = receivelibrary;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public boolean isStatus() {
		return isStatus;
	}
	public void setStatus(boolean isStatus) {
		this.isStatus = isStatus;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}
	
	
}
