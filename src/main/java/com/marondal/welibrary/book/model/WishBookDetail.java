package com.marondal.welibrary.book.model;

import java.util.Date;

public class WishBookDetail {//희망도서 리스트 카드 한장에 들어가는 정보

	private int id;
	private int userId;
	private String name;
	private String email;//이름, 이메일 추가 
	private String library;
	private String title;
	private String author;
	private String publisher;
	private String isbn;
	private boolean isHave;//소장여부
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

		
	
	
	
}
