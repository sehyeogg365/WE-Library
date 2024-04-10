package com.marondal.welibrary.book.model;

import java.util.Date;

public class BookDetail {//책카드 한장에 들어가는 정보
	
	private int id;
	private String library;
	private String title;
	private String imagePath;
	private String author;
	private String publisher;
	private int price;
	private String isbn;
	private int pubyear;
	private String appendix;
	private boolean isBorrow;//대출여부 대출가능/ 대출불가 대출중 일때 대출불가 상호대차불가 예약가능 대출중 아닐때 대출 가능 상호대차가능 예약불가
	private int reserveCount;//예약 인원 예약인원/예약불가
	private boolean isInteribrary;// 상호대차 여부 아예 안뜨거나 아님 상호대차중 이렇게 표시 
	private Date returnDate;//대출한 사람반납일
	private boolean isReserve;//본인이 이책을 예약했는지

	//2024-04-10페이지네이션 관련 변수들 추가
	/*
	private Integer SIZE;
	private Integer PAGE;				//현재페이지번호
	private Integer COUNTLIST;			//한 페이지에 출력될 게시물 수 (
	private Integer BEGIN;
	private Integer TOTALDATA;
	* */
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public int getPubyear() {
		return pubyear;
	}
	public void setPubyear(int pubyear) {
		this.pubyear = pubyear;
	}
	public String getAppendix() {
		return appendix;
	}
	public void setAppendix(String appendix) {
		this.appendix = appendix;
	}
	public boolean isBorrow() {
		return isBorrow;
	}
	public void setBorrow(boolean isBorrow) {
		this.isBorrow = isBorrow;
	}
	public int getReserveCount() {
		return reserveCount;
	}
	public void setReserveCount(int reserveCount) {
		this.reserveCount = reserveCount;
	}
	public boolean isInteribrary() {
		return isInteribrary;
	}
	public void setInteribrary(boolean isInteribrary) {
		this.isInteribrary = isInteribrary;
	}
	public Date getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}
	public boolean isReserve() {
		return isReserve;
	}
	public void setReserve(boolean isReserve) {
		this.isReserve = isReserve;
	}
	
	
	
	

	
}
