package com.marondal.welibrary.book.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
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
	private Integer SIZE;
	private Integer PAGE;				//현재페이지번호
	private Integer COUNTLIST;			//한 페이지에 출력될 게시물 수 (
	private Integer BEGIN;
	private Integer TOTALDATA;
}
