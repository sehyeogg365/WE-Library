<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WE- 회원가입</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>

	<div id="wrap" class="bg-danger">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		
		
		<section class="contents d-flex justify-content-center bg-danger">
			<div class="join-box bg-secondary mt-3">
				<h2 class="text-center mt-3"><b>회원 가입</b></h2>
				<div class="d-flex">
					<input type="text" id="loginIdInput" placeholder="로그인 ID" class="form-control mt-4">
					
					<button type="button" class="btn btn-primary btn-block col-2" id="duplicateBtn">중복확인</button>
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
						 	<option value="naver.com">naver.com</option>
						 	<option value="daum.com">daum.com</option>
						 	<option value="kakao.com">kakao.com</option>
						 	<option value="gmail.com">gmail.com</option>
						 	
						 </select>
					 
					</div>
					
					
					<div class="d-flex justify-content-between">
						<select class="form-control mt-4 col-3" id="phoneNumberSelector">
						 	<option value="02">02</option>
						 	<option value="010">010</option>
						 	<option value="011">011</option>	
						 </select>
						<div class="d-flex align-items-center mt-4">-</div>
						<input type="text" id="phoneNumberInput2" placeholder="전화번호" class="form-control mt-4 ml-1 col-3">
						<div class="d-flex align-items-center mt-4">-</div>
						<input type="text" id="phoneNumberInput3" placeholder="전화번호" class="form-control mt-4 ml-1 col-3">
					</div>
					
					<button type="button" class="btn btn-primary btn-block mt-3 mb-3" id="joinBtn">회원 가입</button>
					<!-- 테스트커밋해보기444 -->
			
			</div>
		
		
		
		</section>
		
		
		
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
		
	</div>

	<script>
	
	$(document).ready(function(){
		
		var isChecked = false;
		
		var isDuplicateId = true;
		
		
		
		
		$("#duplicateBtn").on("click", function(){
			
			let id = $("#loginIdInput").val();
			
			if(id ==""){
				
				alert("아이디를 입력하세요.");
				return ;
				
			}
			
			$.ajax({
				
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
			
			if(name == ""){
				alert("이름을 확인하세요.");
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
			
			//중복 체크가 안됐을떄
			
			//중복된 아이디 일떄
			
			
			$.ajax({
				type: "post"
				, url: "/user/signup"
				, data:{"loginId":id, "password":password, "name":name, "email":email, "phoneNumber":phoneNumber}
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