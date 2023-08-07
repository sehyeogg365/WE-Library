package com.marondal.welibrary.book.model;

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
	
	private boolean isBorrow;//대출여부
	private int reserveCount;//예약 인원
	private boolean isInteribrary;// 상호대차 여부
	//관심도서 여부

}
