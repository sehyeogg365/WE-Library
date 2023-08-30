package com.marondal.welibrary.book.wishbook.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.welibrary.book.model.WishBook;
import com.marondal.welibrary.book.model.WishBookCount;
import com.marondal.welibrary.book.wishbook.dao.WishBookDAO;

@Service
public class WishBookCountBO {

	@Autowired
	private WishBookDAO wishBookDAO;
	
	//희망도서 추가 여부 
	//우선 Book 테이블에 추가됐는지 안됐는지 여부 확인 아마 도서관명, 책이름으로 할듯
	
	public boolean isWishAdd(String library, String title) {
		
		int count = wishBookDAO.selectBookByLibraryTitle(library, title);
		
		if (count == 0) {
			
			return false;
			
		} else {
			
			return true;
			
		}
	}
	
	//유저별 희망도서 갯수세기
	//이갯수가 희망도서 신청 리스트 내 정보는 아니니 제너레이트 할필요는 없다.
	public int getWishBookCount(int userId) {
		
		
		return wishBookDAO.selectWishBookCount(userId);
		
		
	}
	
	//전체 희망도서 갯수세기(관리자)
	public int getWishBookNumberById(int id) {
		
		return wishBookDAO.selectWishBookNumberById(id);
		
		
	}
	
	
}
