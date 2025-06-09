package com.marondal.welibrary.book.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BorrowBookCount {
	private int id;
	private int userId;
	private int numberCount;
}
