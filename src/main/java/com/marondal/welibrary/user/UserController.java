package com.marondal.welibrary.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.marondal.welibrary.user.dao.UserDAO;
import com.marondal.welibrary.user.model.User;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {

	private final UserDAO userDAO;

	@GetMapping("/signup/view")
	public String signupInput() {
		return "/user/signup";
	}

	@GetMapping("/adminsignup/view")
	public String adminsignupInput() {
		return "/user/adminsignup";
	}

	@GetMapping("/signin/view")
	public String signinInput() {
		return "/user/signin";
	}

	@GetMapping("/signout")
	public String signout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("userId");
		session.removeAttribute("loginId");
		session.removeAttribute("password");
		session.removeAttribute("userName");
		session.removeAttribute("isAdmin");

		return "redirect:/library/main/view";
	}

	@GetMapping("/find_id/view")
	public String findId() {
		return "/user/find_id";
	}

	@GetMapping("/get_pw/view")
	public String getPw() {
		return "/user/get_pw";
	}

	@GetMapping("/mypage/view")
	public String mypage(Model model, @RequestParam("id") int id) {
		// 회원정보 한행을 조회하는 기능
		User user = userDAO.selectUserInfo(id);
		model.addAttribute("user", user);
		return "/user/mypage";
	}

	@GetMapping("/pwcheck/view")
	public String pwcheck(Model model, @RequestParam("id") int id) {
		// 세션값? 모델값?
		User user = userDAO.selectUserInfo(id);
		model.addAttribute("user", user);
		return "/user/pwcheck";
	}

	@GetMapping("/update_pw/view")
	public String update_pw(Model model, @RequestParam("id") int id) {
		User user = userDAO.selectUserInfo(id);
		model.addAttribute("user", user);
		return "/user/update_pw";
	}

	@GetMapping("/withdrawl/view")
	public String withdrawl(Model model, @RequestParam("id") int id) {
		User user = userDAO.selectUserInfo(id);
		model.addAttribute("user", user);
		return "/user/withdrawl";
	}
}
