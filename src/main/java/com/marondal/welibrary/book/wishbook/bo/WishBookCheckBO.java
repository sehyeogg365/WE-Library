package com.marondal.welibrary.book.wishbook.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.welibrary.book.wishbook.dao.WishBookDAO;

@Service
public class WishBookCheckBO {
	
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
			
}
