package com.marondal.welibrary.book;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.marondal.welibrary.book.bo.BookBO;
import com.marondal.welibrary.book.borrow.bo.BorrowBO;
import com.marondal.welibrary.book.borrow.bo.BorrowCountBO;
import com.marondal.welibrary.book.dao.BookDAO;
import com.marondal.welibrary.book.interest.bo.InterestBO;
import com.marondal.welibrary.book.interest.bo.InterestCountBO;
import com.marondal.welibrary.book.interibrary.bo.InteribraryBO;
import com.marondal.welibrary.book.model.Book;
import com.marondal.welibrary.book.model.BorrowBookCount;
import com.marondal.welibrary.book.model.BorrowBookDetail;
import com.marondal.welibrary.book.model.InterestBookCount;
import com.marondal.welibrary.book.model.InterestBookDetail;
import com.marondal.welibrary.book.model.InteribraryBookDetail;
import com.marondal.welibrary.book.model.ReserveBookCount;
import com.marondal.welibrary.book.model.ReserveBookDetail;
import com.marondal.welibrary.book.model.WishBook;
import com.marondal.welibrary.book.model.WishBookCount;
import com.marondal.welibrary.book.model.WishBookDetail;
import com.marondal.welibrary.book.reserve.bo.ReserveBO;
import com.marondal.welibrary.book.wishbook.bo.WishBookBO;
import com.marondal.welibrary.book.wishbook.bo.WishBookCountBO;
import com.marondal.welibrary.user.bo.UserBO;
import com.marondal.welibrary.user.dao.UserDAO;
import com.marondal.welibrary.user.model.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@Controller
@RequestMapping("/book")
public class BookController {
	
	@Autowired
	private UserBO userBO;
	
	
	@Autowired
	private WishBookBO wishBookBO;
	
	@Autowired
	private WishBookCountBO wishBookCountBO;
	
	@Autowired
	private InterestBO interestBO;
	
	@Autowired
	private InterestCountBO interestCountBO;
	
	@Autowired
	private BorrowBO borrowBO;
	
	@Autowired
	private BorrowCountBO borrowCountBO;
	
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
		
		//여기서 관심도서개수 추가
		WishBookCount wishbookcount = wishBookCountBO.getWishBookNumberByuserId(userId);
		model.addAttribute("wishbookcount", wishbookcount);
		
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
		//InterestBookCount interestbookcount = interestCountBO.getInterestBookNumberByuserId(userId);
		//model.addAttribute("interestbookcount", interestbookcount);
		//여기서 관심도서개수 추가
		
		return "book/interestbooklist";
	}
	
	@GetMapping("/borrowstatus/view")
	public String borrowStatus(Model model
							, @RequestParam("id") int id
							, HttpSession session) {
			
		int userId = (Integer)session.getAttribute("userId");
		
		User user = userBO.getUserInfo(id); 
		
		model.addAttribute("user", user);
		
		List<BorrowBookDetail> borrowDetailList = borrowBO.getBorrowList(userId);
		
		model.addAttribute("borrowDetailList", borrowDetailList);
		
		List<BorrowBookCount> borrowCountList = borrowBO.getBorrowBookNumberByUserId(userId);
		model.addAttribute("borrowCountList", borrowCountList);
		
		return "book/borrowstatus";
		
	}
	
	@GetMapping("/reservelist/view")
	public String reserveList(Model model
							, @RequestParam("id") int id
							, HttpSession session) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		User user = userBO.getUserInfo(id); 
		
		model.addAttribute("user", user);
		
		List<ReserveBookDetail> reserveDetailList = reserveBO.getReserveList(userId);
		
		model.addAttribute("reserveDetailList", reserveDetailList);
		
		List<ReserveBookCount> reserveCountList = reserveBO.getReserveBookNumberByUserId(userId);
		model.addAttribute("reserveCountList", reserveCountList);
		
		return "book/reservelist";
		
		
		
	}
	
	@GetMapping("/interibrarybooklist/view")
	public String interibraryBookList(Model model
									, @RequestParam("id") int id
									, HttpSession session) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		User user = userBO.getUserInfo(id); //이상하게 DAO로 해도 잘불러와지더라.
		
		model.addAttribute("user", user);
		
		List<InteribraryBookDetail> interibraryDetailList = interibraryBO.getInteribraryList(userId);
		
		model.addAttribute("interibraryDetailList", interibraryDetailList);
		//여기서 상호대차도서개수 추가
		
		return "book/interibrarybooklist";
	}
	
	
	
	
	@GetMapping("/bookaddpopup/view")
	public String bookAddPopUp(Model model
							   , @RequestParam("title") String title
							   ) {

		
		
		return "book/bookaddpopup";
		
	}
	
	
}
