package com.marondal.welibrary.book.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;
@Getter
@Setter
public class ReserveBookDetail {
	private int id;
	private int userId;
	private int bookId;
	private String library;
	private String title;
	private String author;
	private String publisher;
	private Date createdAt;
	private Date returnDate;//반납예정일도 추가
	private boolean isStatus;//대출상태
	private int reserveCount;//예약 인원수
}
