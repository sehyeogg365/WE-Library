<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WE-Library 마이페이지</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap" class="">
	<c:import url="/WEB-INF/jsp/include/header.jsp"/>
	<section class="contents d-flex justify-content-center">
		
	
		<div class="userinfo-page  bg-secondary mt-3">
		
			
			<h2 class="text-center mt-3"><b>회원정보 수정</b></h2>
			
			<div class="d-flex">
			
			<nav class="bg-success col-3">
				<ul class="nav small nav-fill flex-column bg-danger"> 
				
					<li class="nav-item"><h4>회원정보</h4></li>
					<li class="nav-item"><a href="/user/mypage/view" class="nav-link text-dark"><h4>회원정보수정</h4></a></li>
					<li class="nav-item"><a href="/user/update_pw/view" class="nav-link text-dark"><h4>비밀번호 변경</h4></a></li>
					<li class="nav-item"><a href="/user/withdrawl/view" class="nav-link text-dark"><h4>회원탈퇴</h4></a></li>
			
				</ul>
			</nav>
			
			<div class="bg-info col-9">
			
				<div class="bg-warning col-8">
					<div class="">${user.loginId }</div>
					<input type="text" id="loginIdInput" placeholder="성명" value="${user.loginId }" class="form-control mt-4">
					<input type="text" id="nameInput" placeholder="성명" value="${user.name }" class="form-control mt-4">
					<input type="text" id="phoneNumberInput" placeholder="휴대폰번호" value="${user.phoneNumber }" class="form-control mt-4">
					<input type="text" id="emailInput" placeholder="이메일" value="${user.email }" class="form-control mt-4">

					
				
					<button type="button" class="btn btn-primary btn-block mt-3 mb-3" id="updateBtn" data-user-id = "${user.id }">회원정보 수정 </button>
				</div>
			</div>
			
			</div>
		</div>
	</section>
	
	
	<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	<script>
	$(document).ready(function(){
		$("#updateBtn").on("click", function(){
			
			let id = $(this).data("user-id");
			let name = 
			let birth = 
			let email = 
			let phoneNumber =
			
			
		});
	})
	
	
	
	</script>

</body>
</html>