<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- 폰트 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
	
</head>
<body>
	<style>
		*{
			font-family: 'Nanum Gothic', sans-serif;
		}
	</style>
<header class="d-flex justify-content-between">
			<div class="logo col-3 bg-info">
			<a href="/library/main/view" class="d-flex align-items-center">
				<img class="logo" width="70" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FyTyqh%2Fbtsmr38jxKt%2F7KUKXtcBSx5PHpT1BNPI20%2Fimg.png" alt="로고">
			</a>
			</div>
			
			<nav class="d-flex justify-content-center align-items-center col-6 bg-danger">
				<ul class="nav nav-fill">
					<li class="nav-item"><h5><a href="/library/list/view?title" class="nav-link text-dark font-weight-bold">자료 검색 &nbsp</a></h5></li>
					<li class="nav-item"><h5><a href="#" class="nav-link text-dark font-weight-bold">이용 안내&nbsp</a></h5></li>
					<li class="nav-item"><h5><a href="#" class="nav-link text-dark font-weight-bold">문화행사/참여&nbsp</a></h5></li>
					<li class="nav-item"><h5><a href="/book/borrowstatus/view?id=${userId }" class="nav-link text-dark font-weight-bold">내 서재</a></h5></li>
				</ul>
			</nav>
			
			<div class="d-flex justify-content-center align-items-center col-3 bg-success">
				<!-- 조건문만들기 로그인 되었을때 안되었을때 -->
				
				<c:choose>
					<c:when test = "${not empty userId}">
						<h4 class="ml-3"><a href="/user/signout" class="text-dark font-weight-bold">로그아웃</a></h4>
						<h4 class="ml-3"><a href="/user/pwcheck/view?id=${userId }" class="text-dark font-weight-bold">정보수정</a></h4>
					</c:when>
					<c:otherwise>
						<h4 class="ml-3"><a href="/user/signin/view" class="text-dark font-weight-bold">로그인</a></h4>
						<h4 class="ml-3"><a href="/user/signup/view" class="text-dark font-weight-bold">회원가입</a></h4>
					</c:otherwise>
				</c:choose>
				
				
			</div>
			
		</header>
</body>
</html>