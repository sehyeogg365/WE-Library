package com.marondal.welibrary.book;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.marondal.welibrary.book.model.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.marondal.welibrary.book.borrow.bo.BorrowBO;
import com.marondal.welibrary.book.interest.bo.InterestBO;
import com.marondal.welibrary.book.interibrary.bo.InteribraryBO;
import com.marondal.welibrary.book.reserve.bo.ReserveBO;
import com.marondal.welibrary.book.wishbook.bo.WishBookBO;
import com.marondal.welibrary.user.bo.UserBO;
import com.marondal.welibrary.user.model.User;

@Controller
@RequiredArgsConstructor
@RequestMapping("/book")
public class BookController {
	private final UserBO userBO;

	private final WishBookBO wishBookBO;

	private final InterestBO interestBO;

	private final  BorrowBO borrowBO;

	private final ReserveBO reserveBO;

	private final InteribraryBO interibraryBO;

	@GetMapping("/wishbook/list/view")
	public String wishbookList(Model model
						      , HttpSession session
							  ) {
		int userId = (Integer) session.getAttribute("userId");

		List<WishBookDetail> wishbookList = wishBookBO.getWishBookList(userId);
		model.addAttribute("wishbookList", wishbookList);

		Integer wishbookCount = wishbookList.size();
		model.addAttribute("wishBook", wishbookCount);
		
		return "book/wishbooklist";
	}
	
	@GetMapping("/wishbook/add/view")
	public String wishbookAdd(Model model
			, @RequestParam("id") int id) {
		User user = userBO.getUserInfo(id); // 이상하게 DAO로 해도 잘불러와지더라.
		model.addAttribute("user", user);
		return "book/wishbookadd";
	}
	
	@GetMapping("/interestbooklist/view")
	public String interestBookList(Model model
								, HttpSession session
								) {
		int userId = (Integer)session.getAttribute("userId");

//		PagingDTO pagingDTO = null;
//		if (dto.getTotalData() == 0) {
//			dto.setTotalData(0);
//		}

		User user = userBO.getUserInfo(userId); // 이상하게 DAO로 해도 잘불러와지더라.
		model.addAttribute("user", user);

		List<InterestBookDetail> interestDetailList = interestBO.getInterestList(userId);
		model.addAttribute("interestDetailList", interestDetailList);

		Integer interestBookCount = interestDetailList.size();
		model.addAttribute("interestBook", interestBookCount);

		return "book/interestbooklist";
	}
	
	@GetMapping("/borrowstatus/view")
	public String borrowStatus(Model model
							, HttpSession session) {
		int userId = (Integer)session.getAttribute("userId");
		
		List<BorrowBookDetail> borrowDetailList = borrowBO.getBorrowList(userId);
		model.addAttribute("borrowDetailList", borrowDetailList);

		Integer borrowBookCount = borrowDetailList.size();
		model.addAttribute("borrowBook", borrowBookCount);
		
		return "book/borrowstatus";
	}
	
	@GetMapping("/reservelist/view")
	public String reserveList(Model model
							, HttpSession session) {
		int userId = (Integer)session.getAttribute("userId");
		
		List<ReserveBookDetail> reserveDetailList = reserveBO.getReserveList(userId);
		model.addAttribute("reserveDetailList", reserveDetailList);

		Integer reserveBookCount = reserveDetailList.size();
		model.addAttribute("reserveBook", reserveBookCount);

		return "book/reservelist";
	}
	
	@GetMapping("/interibrarybooklist/view")
	public String interibraryBookList(Model model
									, HttpSession session) {
		int userId = (Integer)session.getAttribute("userId");
		
		List<InteribraryBookDetail> interibraryDetailList = interibraryBO.getInteribraryList(userId);
		model.addAttribute("interibraryDetailList", interibraryDetailList);

		// 여기서 상호대차도서개수 추가
		Integer interibraryBookCount = interibraryDetailList.size();
		model.addAttribute("interibraryBook", interibraryBookCount);
		
		return "book/interibrarybooklist";
	}

	@GetMapping("/bookaddpopup/view")
	public String bookAddPopUp(Model model
							   , @RequestParam("title") String title
							   ) {
		return "book/bookaddpopup";
	}

	@GetMapping("/borrowhistory/view")
	public String borrowHistory(Model model
								, HttpSession session) {
		int userId = (Integer)session.getAttribute("userId");

		return "book/borrowhistory";
	}

}
