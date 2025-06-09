package com.marondal.welibrary.book.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class WishBookDetail {//희망도서 리스트 카드 한장에 들어가는 정보

	private int id;
	private int userId;
	private String library;
	private String title;
	private String name;
	private String email;//이름, 이메일 추가 
	private String author;
	private String publisher;
	private int price;
	private String isbn;
	private int pubyear;
	private boolean isAdd;// 신청여부(사용자)
	private Date createdAt;// 신청날짜
}
