package com.marondal.welibrary.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.marondal.welibrary.user.bo.UserBO;
import com.marondal.welibrary.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	@PostMapping("/signup")
	public Map<String, String> signup(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, @RequestParam("name") String name
			, @RequestParam("birth") String birth			
			, @RequestParam("email") String email
			, @RequestParam("phoneNumber") String phoneNumber
			
			){

		int count = userBO.addUser(loginId, password, name, birth, email, phoneNumber);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	// 중복 아이디 확인 api(공통, get)
	@GetMapping("/is_duplicate") // 맵 String, boolean 타입으로
	public Map<String, Boolean> duplicateCheck(//Boolean 대문자로 넣기
			@RequestParam("loginId") String loginId
			){
			
		Map<String, Boolean> resultMap = new HashMap<>();
		
		boolean is_duplicate = userBO.isDuplicate(loginId);
			
			
		if(is_duplicate) {//중복될시
			resultMap.put("is_duplicate", true);
		} else { //아닐시
			resultMap.put("is_duplicate", false);
		}

		return resultMap;
	}

	// 관리자 
	@PostMapping("/adminsignup")
	public Map<String, String> adminsignup(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, @RequestParam("name") String name
			, @RequestParam("birth") String birth
			, @RequestParam("email") String email
			, @RequestParam("phoneNumber") String phoneNumber
			, @RequestParam("isAdmin") int isAdmin
			, @RequestParam("certificationNumber") String certificationNumber			
			){
		
		int count = userBO.addAdminUser(loginId, password, name, birth, email, phoneNumber, isAdmin,certificationNumber);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	
	// 로그인
	@PostMapping("/signin")
	public Map<String, String> signin(@RequestParam("loginId") String loginId
									 , @RequestParam("password") String password
									 , HttpSession session 
									 ){
		User user = userBO.getUser(loginId, password);//유저 객체 
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(user != null) {
			resultMap.put("result", "success");
			
			session.setAttribute("userId", user.getId());
			session.setAttribute("loginId", user.getLoginId());
			session.setAttribute("password", user.getPassword()); //사실상 없어도 될것같다. 
			session.setAttribute("userName", user.getName());
			session.setAttribute("isAdmin", user.getIsAdmin());//사실상 이것도 있어야 할것같다. 관리자 여부에 따라 보여지는것 안보여지는것 나눠야 함
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	// id찾기
	@GetMapping("/find_id")
	public Map<String, Object> findId(@RequestParam("loginId") String loginId//아이디 찾아야 하므로 아이디도 추가해야함
									  ,	@RequestParam("name") String name
									  , @RequestParam("birth") String birth
									  , @RequestParam("phoneNumber") String phoneNumber
									){
		
		Map<String, Object> resultMap = new HashMap<>();
		// user 객체 전달해야하므로 map 밸류타입이 Object가 들어가야함
		User user = userBO.getUserByNameBirthPhone(loginId, name, birth, phoneNumber);
		
		if(user != null) {
			resultMap.put("result", "success");//
			resultMap.put("info", user);//아이디 값 ajax로전달
		} else {
			resultMap.put("result", "fail");
		}
	
		return resultMap;
	}
	
	// pw 재발급	
	@PostMapping("/get_pw")
	public Map<String, Object> getPW(
									@RequestParam("loginId") String loginId	
									, @RequestParam("name") String name	
									, @RequestParam("birth") String birth	
									, @RequestParam("phoneNumber") String phoneNumber	
									){

		Map<String, Object> resultMap = new HashMap<>();
		
		String password = userBO.getPassword(loginId, name, birth, phoneNumber);
		
		//패스워드 변수주는건 잘했다. 그럼 패스워드 있을때 없을떄 조건문 
		
		if(password == null) {
			resultMap.put("result", "fail");
		} else {
			resultMap.put("result", "success");
			resultMap.put("info", password);//password전달
		}
		
		return resultMap;
	}

	// 회원정보 수정
	@PostMapping("/updateinfo")
	public Map<String, String> mypageUpdate(@RequestParam("name") String name
											, @RequestParam("birth") String birth
											, @RequestParam("email") String email
											, @RequestParam("phoneNumber") String phoneNumber
											, HttpSession session//이번엔 파라미터가 아닌 세션값으로 id 불러오기
											){
		
		Map<String, String> resultMap = new HashMap<>();
		
		int id = (Integer)session.getAttribute("userId");
		
		int count = userBO.updateUser(id, name, birth, email, phoneNumber);
		
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	// 비밀번호 확인
	@GetMapping("/pw_check")
	public Map<String, String> pwcheck(@RequestParam("password") String password
										, HttpSession session //이번엔 세션값이 아닌 파라미터로 해보자. 세션사용을 최소화 해야 하므로
										){
		
		Map<String, String> resultMap = new HashMap<>();
		
		int id = (Integer)session.getAttribute("userId");
		
		int count = userBO.checkPassword(id, password);
		
		if(count == 0) {//틀릴시
			resultMap.put("result", "fail");
		} else {//맞을시
			resultMap.put("result", "success");
		}
		
		return resultMap;
	}
	
	// 비밀번호 변경
	@PostMapping("/update_pw")
	public Map<String, String> updatePw(//이번엔 파라미터로 불러오자 왜냐면 세션 사용 최소화를 위해서
										// 새로 파라미터를 추가하는게 맞을듯. 인증번호때도 admin 테이블에 없는 인증번호를 불러넣었기 떄문에
										 @RequestParam("password") String password	  
										 , HttpSession session
										){
		
		Map<String, String> resultMap = new HashMap<>();
		
		int id = (Integer)session.getAttribute("userId");
		
		int count = userBO.updatePassword(id, password);
		
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}

		return resultMap;
	}
	
	// 회원 탈퇴
	@GetMapping("/withdrawl")
	public Map<String, String> withdrawl(@RequestParam("password") String password
										, HttpSession session 
										){
		
		Map<String, String> resultMap = new HashMap<>();
		
		int id = (Integer)session.getAttribute("userId");
		
		int count = userBO.deleteUser(id, password);
		
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}

}
