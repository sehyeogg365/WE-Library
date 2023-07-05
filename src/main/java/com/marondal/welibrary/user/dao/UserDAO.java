package com.marondal.welibrary.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.marondal.welibrary.user.model.User;

@Repository
public interface UserDAO {

	public int insertUser(
			@Param("loginId") String loginId
			, @Param("password") String password
			, @Param("name") String name
			, @Param("birth") String birth
			, @Param("email") String email
			, @Param("phoneNumber") String phoneNumber
			);
	
	
	//중복확인(갯수 반환)
	public int selectCountloginId(@Param("loginId") String loginId);
	
	
	//관리자 회원가입
	public int insertAdminUser(
			@Param("loginId") String loginId
			, @Param("password") String password
			, @Param("name") String name
			, @Param("birth") String birth
			, @Param("email") String email
			, @Param("phoneNumber") String phoneNumber
			, @Param("isAdmin") int isAdmin	
			);
	
	//인증번호 일치 확인
	public int selectcertificationNumber(@Param("certificationNumber") String certificationNumber);
	
	
	//로그인
	public User selectUser(@Param("loginId") String loginId
			     		   , @Param("password") String password);	
	
	
	
}
