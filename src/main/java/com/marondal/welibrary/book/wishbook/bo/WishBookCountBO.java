package com.marondal.welibrary.book.wishbook.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.welibrary.book.wishbook.dao.WishBookDAO;

@Service
public class WishBookCountBO {

	@Autowired
	private WishBookDAO wishBookDAO;
	
	
	//유저별 희망도서 갯수세기
	//이갯수가 희망도서 신청 리스트 내 정보는 아니니 제너레이트 할필요는 없다.
	public int getWishBookNumber(int userId) {
		
		
		return wishBookDAO.selectWishBookNumber(userId);
		
		
	}
	
	
}
