package com.marondal.welibrary.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.welibrary.common.EncryptService;
import com.marondal.welibrary.user.dao.UserDAO;
import com.marondal.welibrary.user.model.User;

@Service
public class UserBO {

	@Autowired
	
	private UserDAO userDAO;
	
	public int addUser(

			String loginId
			, String password
			, String name
			, String birth
			, String email	
			, String phoneNumber	
			) {
	
		String encryptPassword = EncryptService.md5(password);
		
		//인증번호가 일치하는지 여부 확인 bo 서만 수행하면 된다고 하심
		//일치하면 회원가입 진행 
		
		return userDAO.insertUser(loginId, encryptPassword, name, birth, email, phoneNumber);
		
		
	}
	
	//중복확인(boolean)
	
	public boolean isDuplicate(String loginId) {
		
		//중복아이디 갯수가 0일때와 아닐떄 생각해서 결과값 다르게
		
		int count = userDAO.selectCountloginId(loginId);
		
		if(count == 0) {
			return false;
		} else {
			return true;
		}
			
		
	}
	
	
	//관리자 회원가입
	public int addAdminUser(

			String loginId
			, String password
			, String name
			, String birth
			, String email	
			, String phoneNumber
			, int isAdmin
			, String certificationNumber
			
			) {
		
		//인증번호 일치 하는지 여부 
		
		int count = userDAO.selectcertificationNumber(certificationNumber);
		
		String encryptPassword = EncryptService.md5(password);
		
		if(count == 1) { //일치할때 
			
			return userDAO.insertAdminUser(loginId, encryptPassword, name, birth, email, phoneNumber, isAdmin);//추가하라
			
		} else {
			
			return 0;// 아무것도 하지마라
		}
		
		
	}
	
	
	//로그인
	public User getUser(String loginId
						, String password) {
		//똑같은 방식의 암호화
		String ecryptPassword = EncryptService.md5(password);
		
		return userDAO.selectUser(loginId, ecryptPassword);
		
		
	}
	
	
	// id찾기 타입: 모델
	public User getUserByNameBirthPhone(String loginId
										, String name
										, String birth
										, String phoneNumber) {
		
		return userDAO.selectUserByNameBirthPhone(loginId, name, birth, phoneNumber);
		
		
	}
	
	
	// pw 재발급 타입: 생각해보자면 리턴타입 user일 필요가없음. 그냥 비번 조회 필요없이 update해서 비번 전달하면 되서
	public String getPassword(String loginId
							  , String name
							  , String birth
							  , String phoneNumber
						     ) {
		//임시비밀번호 생성 알고리즘
		
		// 문자 배열
		
		//랜덤함수 선언
		
		//셔플 반복문 
		
		// 조합 반복문 
		
		//카운트 변수
		
		//카운트 변수가 1일때 셔플 조합한 비번 전달하기
		
		
		
		return null;
		
		
	}
	
	
	// 회원 탈퇴
	
	
	
	
}
