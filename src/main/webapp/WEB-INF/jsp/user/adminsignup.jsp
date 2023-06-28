<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WE- 관리자 회원가입</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap" class="">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		
		<section class="contents d-flex justify-content-center ">
			<div class="join-box  mt-3">
				<h2 class="text-center mt-3"><b>관리자 회원 가입</b></h2>
				<div class="d-flex">
					<input type="text" id="loginIdInput" placeholder="로그인 ID" class="form-control mt-4 col-9">
					
					<button type="button" class="btn btn-primary btn-block col-3" id="duplicateBtn">중복확인</button>
				</div>	
					<div id = "duplicated" class="small text-danger d-none">아이디가 중복됩니다.</div>
					<div id = "nonDuplicated" class="small text-info d-none">사용할수 있는 아이디 입니다.</div>
				
					<input type="password" id="passwordInput" placeholder="비밀번호" class="form-control mt-4">
					<input type="password" id="passwordConfirmInput" placeholder="비밀번호 확인" class="form-control mt-4">
					
					<input type="text" id="nameInput" placeholder="이름" class="form-control mt-4">
					
					<div class="d-flex align-items-center">
						<input type="text" id="emailIdInput" placeholder="이메일" class="form-control mt-4 col-5">
						
						 <div class="mt-4 col-1">@</div>
						 <select class="form-control mt-4 col-6" id="emailSelctor">
						 	<option value="@naver.com">naver.com</option>
						 	<option value="@daum.com">daum.com</option>
						 	<option value="@kakao.com">kakao.com</option>
						 	<option value="@gmail.com">gmail.com</option>
						 	
						 </select>
					 
					</div>
					
					
					<div class="d-flex justify-content-between">
						<select class="form-control mt-4 col-3" id="phoneNumberSelector">
						 	<option value="02">02</option>
						 	<option value="010">010</option>
						 	<option value="011">011</option>	
						 </select>
						<div class="d-flex align-items-center">-</div>
						<input type="text" id="phoneNumberInput2" placeholder="전화번호" class="form-control mt-4 ml-1 col-3">
						<div class="d-flex align-items-center">-</div>
						<input type="text" id="phoneNumberInput3" placeholder="전화번호" class="form-control mt-4 ml-1 col-3">
					</div>
					<input type="text" id="isAdminInput" placeholder="관리자여부" class="form-control mt-4">
					<input type="text" id="certificationInput" placeholder="인증번호" class="form-control mt-4">
					<!-- 북마크 명 바꾸고 커밋해보기 -->
					<button type="button" class="btn btn-primary btn-block mt-3 mb-3" id="joinBtn">회원 가입</button>
			
			
			</div>
		
		
		
		</section>
		
		
		
		
	
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	
	<script>
	
	$(document).ready(function(){
		
		var isChecked = false;
		
		var isDuplicateId = true;
		
		$("#loginIdInput").on("input", function(){
			 //중복 관련된 상태 초기화
			 isChecked = false;
			 isDuplicateId = true;
			 
			 $("#duplicated").addClass("d-none");
			 $("#nonDuplicated").addClass("d-none");
			//다시 지우면 중복확인 상태가 초기화
		});
		
		
		$("#duplicateBtn").on("click", function(){
			
			let id = $("#loginIdInput").val();
			
			if(id ==""){
				
				alert("아이디를 입력하세요.");
				return ;
				
			}
			
			$.ajax({
				type:"get"
				, url:"/user/is_duplicate"
				, data: {"loginId":id}
				, success:function(data){
					isChecked = true; //체크여부 여기선 지역변수로 무조건 트루
					isDuplicateId = data.is_duplicate;//중복된 아이디 여부 여기선 중복된게 디폴트 값 
					
					if(data.is_duplicate){//중복될시
						$("#duplicated").removeClass("d-none");//리무브 할클래스
						$("#nonDuplicated").addClass("d-none");//add할 클래스
					} else {//아닐시
						$("#nonDuplicated").removeClass("d-none");//리무브 할클래스
						$("#duplicated").addClass("d-none");//add할 클래스
					}
					
				}
				, error:function(){
					alert("중복확인 에러");
				}
				
			});
			
			
		});
			
		
		
		
		
		$("#joinBtn").on("click", function(){
			
			let id = $("#loginIdInput").val();
			let password = $("#passwordInput").val();
			let passwordConfirm = $("passwordConfirmInput").val();
			let name = $("#nameInput").val();
			let emailId = $("#emailIdInput").val();
			let emailDomain = $("#emailSelctor").val();
			let email = emailId + emailDomain;
			
			let phoneNumber1 = $("#phoneNumberSelector").val();
			let phoneNumber2 = $("#phoneNumberInput2").val();
			let phoneNumber3 = $("#phoneNumberInput3").val();
			let phoneNumber = phoneNumber1 + phoneNumber2 + phoneNumber3;
			
			let isAdmin = $("#isAdminInput").val();
			
			let certificationNumber = $("#certificationInput").val();
			
			if(id == ""){
				alert("아이디를 입력하세요.");
				return ;	
			}
			if(password == ""){
				alert("비밀번호를 입력하세요.");
				return ;	
			}
			if(passwordConfirm == ""){
				alert("비밀번호를 확인하세요.");
				return ;	
			}
			if(password != passwordConfirm){
				alert("비밀번호가 일치하지 않습니다.");
				return ;
			}
			if(emailId == ""){
				alert("이메일을 입력하세요.");
				return ;	
			}
			if(emailDomain == ""){
				alert("이메일도메인을 입력하세요.");
				return ;	
			}
			if(phoneNumber1 == ""){
				alert("핸드폰 번호를 입력하세요.");
				return ;	
			}
			if(phoneNumber2 == ""){
				alert("핸드폰 번호를 입력하세요.");
				return ;	
			}
			if(phoneNumber3 == ""){
				alert("핸드폰 번호를 입력하세요.");
				return ;	
			}

			if(isAdmin == ""){
				alert("관리자 여부를 비력하세요");
				return ;
			}
			
			if(certificationNumber == ""){
				alert("인증 번호를 입력하세요.");
				return ;
			}
			
			//중복 체크가 안됐을떄
			if(!isChecked) {
				alert("중복체크를 진행해주세요.");
				return ;
			}
			//중복된 아이디 일떄
			if(isDuplicateId) {
				alert("아이디가 중복됩니다.");
				return ;
			}
			
			alert(id);
			alert(password);
			alert(name);
			alert(email);
			alert(phoneNumber);
			alert(isAdmin);
			alert(certificationNumber);
			
			
			$.ajax({
				type: "post"
				, url: "/user/adminsignup"
				, data:{"loginId":id, "password":password, "name":name, "email":email, "phoneNumber":phoneNumber, "isAdmin":isAdmin, "certificationNumber":certificationNumber}
				, success:function(data){
					if(data.result == "success"){
						alert("회원가입 성공");
						location.href = "/user/signin/view";
					} else{
						alert("회원가입 실패");
					}
				}
				,error:function(){
					alert("회원가입 오류");
				}
				
			});
			
			
			
			
			
		});
		
	});
	
	
	</script>

</body>
</html>