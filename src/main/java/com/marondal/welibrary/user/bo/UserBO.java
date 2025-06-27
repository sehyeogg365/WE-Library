package com.marondal.welibrary.user.bo;

import java.util.Random;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import com.marondal.welibrary.common.EncryptService;
import com.marondal.welibrary.user.dao.UserDAO;
import com.marondal.welibrary.user.model.User;

@Service
@RequiredArgsConstructor
public class UserBO {

	private final UserDAO userDAO;
	
	public int addUser(
			String loginId
			, String password
			, String name
			, String birth
			, String email	
			, String phoneNumber	
			) {
		String encryptPassword = EncryptService.md5(password);
		// 인증번호가 일치하는지 여부 확인 bo 서만 수행하면 된다
		// 일치하면 회원가입 진행
		return userDAO.insertUser(loginId, encryptPassword, name, birth, email, phoneNumber);
	}
	
	// 중복확인(boolean)
	
	public boolean isDuplicate(String loginId) {
		// 중복아이디 갯수가 0일때와 아닐떄 생각해서 결과값 다르게
		
		int count = userDAO.selectCountloginId(loginId);
		
		if(count == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	// 관리자 회원가입
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
		// 인증번호 일치 하는지 여부 
		
		int count = userDAO.selectcertificationNumber(certificationNumber);
		
		String encryptPassword = EncryptService.md5(password);
		
		if(count == 1) { // 일치할때
			return userDAO.insertAdminUser(loginId, encryptPassword, name, birth, email, phoneNumber, isAdmin);//추가하라
		} else {
			return 0;// 아무것도 하지마라
		}
	}
	
	// 로그인
	public User getUser(String loginId
						, String password) {
		// 똑같은 방식의 암호화
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
		// 임시비밀번호 생성 알고리즘
		
		// 문자 배열
		char[] arr= {'0', '1', '2', '3', '4', '5','6','7','8','9'
					,'!', '@', '#', '$','%','^'
					,'a','b','c','d','e','f','g','h'
					};

		// 랜덤함수 선언
		Random rand = new Random();

		// 저장할 배열
		char[] pw= new char[10]; 

		// 전역변수
		String password = "";
		
		// 셔플이 아닌 뽑는 반복문을 해야한다. pw 배열 길이동안, 길이수만큼 랜덤하게 뽑기
		for(int i = 0; i < pw.length; i++) {
			pw[i] = arr[rand.nextInt(24)];//임의의 원소 뽑은 후 저장. arr배열 인덱스 24개중에서 pw배열 길이 수만큼 임의로 뽑는다.
		}
		
		// 조합 반복문 이거를 하나의 변수에 합치기
		for(int i = 0; i < pw.length; i++) {// 길이만큼 패스워드 붙여넣는다.
			password  +=  pw[i];
		}
		// 비밀번호 암호화되서 저장 해야함 안그러면 로그인 안됨
		String ecryptPassword = EncryptService.md5(password);
		
		// 카운트 변수(update 횟수)
		int count = userDAO.updatePasswordByIdNameBirthPhone(loginId, ecryptPassword, name, birth, phoneNumber);
		
		// 카운트 변수가 1일때 셔플 조합한 비번 전달하기
		if(count == 1) {
			return password;
		} else {
			return null;
		}
	}
	
	// 회원정보 수정 리턴타입 생각해보기
	public int updateUser( int id		
						   , String name
						   , String birth
						   , String email
						   , String phoneNumber) {
		return userDAO.updateUser(id, name, birth, email, phoneNumber);
	}
	
	
	// 회원정보 1행 조회 리턴타입 생각해보기
	public User getUserInfo(int id) {
		return userDAO.selectUserInfo(id);
	}
	
	// 비밀번호 확인
	public int checkPassword(int id, String password) {
		String ecryptPassword = EncryptService.md5(password);
		return userDAO.selectPassword(id, ecryptPassword);
	}
	
	
	// 비밀번호 변경
	public int updatePassword(int id, String password) {
		// 비밀번호가 일치하면 비밀번호를 입력한 뉴 패스워드로 바꿔준다.
		// 비밀번호 확인 + 회원정보 수정  -> 이건 나중에.
		// 아마 여기서 비밀번호 확인이라는걸 추가해줘야 한다. if문 써서 count == 1일때 변경한다 이런식으로
			String ecryptPassword = EncryptService.md5(password);
			return userDAO.updatePassword(id, ecryptPassword);
	}

	// 회원 탈퇴
//	public int deleteUser(int id, String password) {
//		int count = userDAO.selectPassword(id, password);
//
//		String encryptPassword = EncryptService.md5(password);
//
//		if(count == 1) {
//			return userDAO.selectPassword(id, encryptPassword);
//		} else {
//			return 0;
//		}
//	}

}
