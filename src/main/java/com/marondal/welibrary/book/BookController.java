package com.marondal.welibrary.book;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.marondal.welibrary.book.borrow.bo.BorrowBO;
import com.marondal.welibrary.book.interest.bo.InterestBO;
import com.marondal.welibrary.book.interibrary.bo.InteribraryBO;
import com.marondal.welibrary.book.model.BorrowBookCount;
import com.marondal.welibrary.book.model.BorrowBookDetail;
import com.marondal.welibrary.book.model.InterestBookCount;
import com.marondal.welibrary.book.model.InterestBookDetail;
import com.marondal.welibrary.book.model.InteribraryBookCount;
import com.marondal.welibrary.book.model.InteribraryBookDetail;
import com.marondal.welibrary.book.model.ReserveBookCount;
import com.marondal.welibrary.book.model.ReserveBookDetail;
import com.marondal.welibrary.book.model.WishBookCount;
import com.marondal.welibrary.book.model.WishBookDetail;
import com.marondal.welibrary.book.reserve.bo.ReserveBO;
import com.marondal.welibrary.book.wishbook.bo.WishBookBO;
import com.marondal.welibrary.user.bo.UserBO;
import com.marondal.welibrary.user.model.User;



@Controller
@RequestMapping("/book")
public class BookController {
	
	@Autowired
	private UserBO userBO;
	
	
	@Autowired
	private WishBookBO wishBookBO;
	
	@Autowired
	private InterestBO interestBO;
	

	@Autowired
	private BorrowBO borrowBO;
	
	
	@Autowired
	private ReserveBO reserveBO;
	
	@Autowired
	private InteribraryBO interibraryBO;

	
	@GetMapping("/wishbook/list/view")
	public String wishbookList(Model model
			, HttpSession session                                                                    
			) {
	
		                                                                                                                                                              
		int userId = (Integer) session.getAttribute("userId");
		

		List<WishBookDetail> wishbookList = wishBookBO.getWishBookList(userId);
		model.addAttribute("wishbookList", wishbookList);
		
		//여기서 희망도서개수 추가
		List<WishBookCount> wishbookCountList = wishBookBO.getWishBookNumberByUserId(userId);
		model.addAttribute("wishbookCountList", wishbookCountList);
		
		
		return "book/wishbooklist";
		
	}
	
	@GetMapping("/wishbook/add/view")
	public String wishbookAdd(Model model
			, @RequestParam("id") int id) {
		
		User user = userBO.getUserInfo(id); //이상하게 DAO로 해도 잘불러와지더라.
		
		model.addAttribute("user", user);

		return "book/wishbookadd";
	}
	
	@GetMapping("/interestbooklist/view")
	public String interestBookList(Model model
								, @RequestParam("id") int id
								, HttpSession session
								) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		User user = userBO.getUserInfo(id); //이상하게 DAO로 해도 잘불러와지더라.
		
		model.addAttribute("user", user);

		List<InterestBookDetail> interestDetailList = interestBO.getInterestList(userId);
		
		model.addAttribute("interestDetailList", interestDetailList);
		
		List<InterestBookCount> interestCountList = interestBO.getInterestBookNumberByUserId(userId);
		
		model.addAttribute("interestCountList", interestCountList);

		//여기서 관심도서개수 추가
		
		return "book/interestbooklist";
	}
	
	@GetMapping("/borrowstatus/view")
	public String borrowStatus(Model model
							//, @RequestParam("id") int id
							, HttpSession session) {
			
		int userId = (Integer)session.getAttribute("userId");
		
		//User user = userBO.getUserInfo(id); 
		
		//model.addAttribute("user", user);
		
		List<BorrowBookDetail> borrowDetailList = borrowBO.getBorrowList(userId);
		
		model.addAttribute("borrowDetailList", borrowDetailList);
		
		List<BorrowBookCount> borrowCountList = borrowBO.getBorrowBookNumberByUserId(userId);
		model.addAttribute("borrowCountList", borrowCountList);
		
		return "book/borrowstatus";
		
	}
	
	@GetMapping("/reservelist/view")
	public String reserveList(Model model
							//, @RequestParam("id") int id
							, HttpSession session) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		//User user = userBO.getUserInfo(id); 
		
		//model.addAttribute("user", user);
		
		List<ReserveBookDetail> reserveDetailList = reserveBO.getReserveList(userId);
		
		model.addAttribute("reserveDetailList", reserveDetailList);
		
		List<ReserveBookCount> reserveCountList = reserveBO.getReserveBookNumberByUserId(userId);
		model.addAttribute("reserveCountList", reserveCountList);
		
		return "book/reservelist";
		
		
		
	}
	
	@GetMapping("/interibrarybooklist/view")
	public String interibraryBookList(Model model
									//, @RequestParam("id") int id
									, HttpSession session) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		//User user = userBO.getUserInfo(id); //이상하게 DAO로 해도 잘불러와지더라.
		
		//model.addAttribute("user", user);
		
		List<InteribraryBookDetail> interibraryDetailList = interibraryBO.getInteribraryList(userId);
		
		model.addAttribute("interibraryDetailList", interibraryDetailList);
		//여기서 상호대차도서개수 추가
		
		List<InteribraryBookCount> interibraryCountList = interibraryBO.getInteribraryBookNumberByUserId(userId);
		model.addAttribute("interibraryCountList", interibraryCountList);
		
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
