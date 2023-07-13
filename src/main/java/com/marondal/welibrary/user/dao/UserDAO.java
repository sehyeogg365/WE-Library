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
	
	
	//id 찾기
	public User selectUserByNameBirthPhone(@Param("loginId") String loginId
											, @Param("name") String name
											, @Param("birth") String birth
											, @Param("phoneNumber") String phoneNumber);
	
	
	//pw 재발급 여기선 String 이 아닌 int 여야함 update 횟수를 전달해야 해서
	public int updatePasswordByIdNameBirthPhone(@Param("loginId") String loginId						
												, @Param("password") String password
												, @Param("name") String name
												, @Param("birth") String birth
												, @Param("phoneNumber") String phoneNumber);

	
	//회원정보 수정
	public int updateUser( @Param("id") int id
						  ,	@Param("name") String name
						  , @Param("birth") String birth
						  , @Param("email") String email
						  , @Param("phoneNumber") String phoneNumber
						  );
	
	
	//회원정보 한행 조회
	
	public User selectUserInfo(@Param("id") int id);
	
	//비밀번호 확인
	
	public int selectPassword(@Param("id") int id, @Param("password") String password);
	
	//비밀번호 변경
	
	public int updatePassword(@Param("id") int id, @Param("password") String password);
	
	//회원 탈퇴
	public int deleteUser(@Param("id") int id, @Param("password") String password);
	
}
