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
	
	private boolean isBorrow;//대출여부 대출가능/ 대출불가
	private int reserveCount;//예약 인원 예약인원/예약불가
	private boolean isInteribrary;// 상호대차 여부 아예 안뜨거나 아님 상호대차중 이렇게 표시 


}
