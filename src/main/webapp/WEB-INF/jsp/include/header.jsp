<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header class="d-flex justify-content-between">
			<h1 class="d-flex align-items-center ml-2"><a href="/library/main/view" class="text-dark">WE-Library</a></h1>
			
			<nav class="d-flex align-items-center">
				<ul class="nav nav-fill">
					<li class="nav-item"><a href="#" class="nav-link text-dark font-weight-bold">자료 검색</a></li>
					<li class="nav-item"><a href="#" class="nav-link text-dark font-weight-bold">이용 안내</a></li>
					<li class="nav-item"><a href="#" class="nav-link text-dark font-weight-bold">문화행사/참여</a></li>
					<li class="nav-item"><a href="#" class="nav-link text-dark font-weight-bold">내 서재</a></li>
				</ul>
			</nav>
			
			<div class="d-flex align-items-center mr-2">
				<!-- 조건문만들기 로그인 되었을때 안되었을때 -->
				
				<c:choose>
					<c:when test = "${not empty userId}">
						<h3><a href="/user/signout" class="text-dark font-weight-bold">로그아웃</a></h3>
						<h3 class="ml-3"><a href="/user/mypage/view" class="text-dark font-weight-bold">정보수정</a></h3>
					</c:when>
					<c:otherwise>
						<h3><a href="/user/signin/view" class="text-dark font-weight-bold">로그인</a></h3>
						<h3 class="ml-3"><a href="/user/signup/view" class="text-dark font-weight-bold">회원가입</a></h3>
					</c:otherwise>
				</c:choose>
				
				
			</div>
			
		</header>
</body>
</html>