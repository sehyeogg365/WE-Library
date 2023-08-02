package com.marondal.welibrary.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.marondal.welibrary.book.model.WishBook;
import com.marondal.welibrary.book.model.WishBookDetail;
import com.marondal.welibrary.book.wishbook.bo.WishBookBO;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private WishBookBO wishBookBO;
	
	
	//희망도서/ 도서 추가 겸 희망도서 조회창
	@GetMapping("/wishbook/add/view")
	public String wishbookInput(
								Model model
								//, @RequestParam("id") int id
								, HttpSession session
			) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		List<WishBook> wishbookList = wishBookBO.getWishBookListById(userId);
		model.addAttribute("wishbookList", wishbookList);		
		
		
		return "/admin/wishbookadd";
	}
	
	
	
	
	//희망도서/도서 추가, 공지사항 등록/수정, 행사 등록/수정
	
}
