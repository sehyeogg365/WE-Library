package com.marondal.welibrary.book.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class WishBookCount {
	private int id;
	private int userId;
	private int numberCount;//사용자별 권수
	//전체 권수
}
