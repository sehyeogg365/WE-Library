package com.marondal.welibrary.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.welibrary.user.dao.UserDAO;

@Service
public class UserBO {

	@Autowired
	
	private UserDAO userDAO;
	
	public int addUser(

			String loginId
			, String password
			, String name
			, String email	
			, String phoneNumber	
			) {
		return userDAO.insertUser(loginId, password, name, email, phoneNumber);
		
		
	}
	
}
