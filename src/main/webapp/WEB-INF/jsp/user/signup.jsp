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
		<header class="bg-success d-flex justify-content-between">
			<h1 class="d-flex align-items-center">WE-Library</h1>
			
			<nav class="d-flex align-items-center">
				<ul class="nav nav-fill">
					<li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">자료 검색</a></li>
					<li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">이용 안내</a></li>
					<li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">문화행사/참여</a></li>
					<li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">내 서재</a></li>
				</ul>
			</nav>
			
			<div class="d-flex align-items-center">
				<h3><a href="#" class="text-white font-weight-bold">로그인</a></h3>
				<h3 class="ml-3"><a href="#" class="text-white font-weight-bold">회원가입</a></h3>
				<h3></h3>
			</div>
			
		</header>
		
		<section class="contents d-flex justify-content-center bg-danger">
			<div class="join-box bg-secondary mt-3">
				<h1 class="text-center mt-3">회원 가입</h1>
				<div class="d-flex">
					<input type="text" id="loginIdInput" placeholder="로그인 ID" class="form-control mt-4">
					
					<button type="button" class="btn btn-primary btn-block" id="duplicateBtn">중복확인</button>
				</div>	
					<input type="password" id="passwordInput" placeholder="비밀번호" class="form-control mt-4">
					<input type="password" id="passwordConfirmInput" placeholder="비밀번호 확인" class="form-control mt-4">
					
					<input type="text" id="nameInput" placeholder="이름" class="form-control mt-4">
					
					<div class="d-flex align-items-center">
						<input type="text" id="emailInput" placeholder="이메일" class="form-control mt-4 col-5">
						
						 <div class="mt-4 col-1">@</div>
						 <select class="form-control mt-4 col-5" id="emailSelctor">
						 	<option value="">naver.com</option>
						 	<option value="">daum.com</option>
						 	<option value="">kakao.com</option>
						 	<option value="">gmail.com</option>
						 	
						 </select>
					 
					</div>
					
					
					<div class="d-flex justify-content-between">
						<input type="text" id="phoneNumberInput1" placeholder="전화번호" class="form-control mt-4 col-3">
						<div class="d-flex align-items-center">-</div>
						<input type="text" id="phoneNumberInput2" placeholder="전화번호" class="form-control mt-4 ml-1 col-3">
						<div class="d-flex align-items-center">-</div>
						<input type="text" id="phoneNumberInput3" placeholder="전화번호" class="form-control mt-4 ml-1 col-3">
					</div>
					
					<button type="button" class="btn btn-primary btn-block mt-3 mb-3" id="joinBtn">회원 가입</button>
					<!-- 테스트커밋해보기 -->
			
			</div>
		
		
		
		</section>
		
		
		
		
	
		<footer class="bg-primary mt-3">
		
		
		</footer>
	</div>





</body>
</html>