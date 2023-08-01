package com.marondal.welibrary.wishbook.model;

import java.util.Date;

public class WishBookDetail {

	private int id;
	private int userId;
	private String library;
	private String title;
	private String author;
	private String publisher;
	private String isbn;
	private boolean isHave;//소장여부
	private int numberCount;// 갯수
	private Date createdAt;// 신청날짜	
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
	public String getLibrary() {
		return library;
	}
	public void setLibrary(String library) {
		this.library = library;
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
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public boolean isHave() {
		return isHave;
	}
	public void setHave(boolean isHave) {
		this.isHave = isHave;
	}
	public int getNumberCount() {
		return numberCount;
	}
	public void setNumberCount(int numberCount) {
		this.numberCount = numberCount;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	
	
	
	
}
