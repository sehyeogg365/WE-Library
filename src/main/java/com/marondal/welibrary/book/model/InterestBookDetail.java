package com.marondal.welibrary.book.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class InterestBookDetail {
	private int id;
	private int userId;
	private int bookId;
	private String library;
	private String title;
	private String imagePath;
	private String author;
	private String publisher;
	private String isbn;
	private int pubyear;
	private String appendix;
	private Date createdAt;

	private int currPage;//현재페이지
	private int totalPage;//총페이지
	private int firstPage;//첫페이지
	private int lastPage;//마지막페이지
	private int totalData;//전체 게시물 수
}
