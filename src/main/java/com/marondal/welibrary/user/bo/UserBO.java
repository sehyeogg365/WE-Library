package com.marondal.welibrary.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.welibrary.user.dao.UserDAO;

@Service
public class UserBO {
	
//	@Autowired
//	private UserDAO userDAO;
//그렇담 여기 위에 autowired만지우니 다 정상적으로 되는데 그럼 위에게 문제라는건데???	
	//회원가입
	public int addUser(String loginId
					   , String password
					   , String name
					   , String email
					   , String phoneNumber   
					   ) {
		
		
		return userDAO.insertUser(loginId, password, name, email, phoneNumber);
		
	}
	
	
	//관리자 회원가입
	
	
	
	

}
