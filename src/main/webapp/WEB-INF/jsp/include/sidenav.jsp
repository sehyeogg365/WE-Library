<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<style>
	
	</style>
<body>

	<nav class="side-nav col-3">
	<!-- 관리자여부에 따라 다르게 보이는 사이드 내비바 -->
		

			
			<c:choose>
			
			<c:when test= "${isAdmin == 1 }">
	
			<ul class="nav flex-column mt-4 "> 
				
				<li class="nav-item first-nav"><h4 class="text-center text-white font-weight-bold mt-2">회원정보</h4><hr></li>
				<li class="nav-item"><h5 class="font-weight-bold"><a href="/user/pwcheck/view?id=${userId}" class="nav-link text-dark">회원정보수정</a></h5><hr></li>
				<li class="nav-item"><h5 class="font-weight-bold"><a href="/user/update_pw/view?id=${userId}" class="nav-link text-dark">비밀번호 변경</a></h5><hr></li>
				<li class="nav-item"><h5 class="font-weight-bold"><a href="/user/withdrawl/view?id=${userId}" class="nav-link text-dark">회원탈퇴</a></h5><hr></li>
				<li class="nav-item"><h5 class="font-weight-bold"><a href="/admin/wishbook/list/view" class="nav-link text-dark">희망도서 추가</a></h5><hr></li>
				<li class="nav-item"><h5 class="font-weight-bold"><a href="#" class="nav-link text-dark">공지사항 추가/수정</a></h5><hr></li>
				<li class="nav-item"><h5 class="font-weight-bold"><a href="#" class="nav-link text-dark">행사 추가/수정</a></h5></li>
			
			</ul>
			</c:when>
			
			<c:otherwise>
			<ul class="nav flex-column mt-4 "> 
				
				<li class="nav-item first-nav"><h4 class="text-center text-white font-weight-bold mt-2">회원정보</h4><hr></li>
				<li class="nav-item"><h5 class="font-weight-bold"><a href="/user/pwcheck/view?id=${userId}" class="nav-link text-dark">회원정보수정</a></h5><hr></li>
				<li class="nav-item"><h5 class="font-weight-bold"><a href="/user/update_pw/view?id=${userId}" class="nav-link text-dark">비밀번호 변경</a></h5><hr></li>
				<li class="nav-item"><h5 class="font-weight-bold"><a href="/user/withdrawl/view?id=${userId}" class="nav-link text-dark">회원탈퇴</a></h5></li>
			</ul>
			
			
			</c:otherwise>
			
			
			</c:choose>
		
			
	</nav>
	
	
	<script>
	$(document).ready(function(){
		
		$(function(){
			
			$("li").click(function(){
				
				$("li").removeClass()
				
				
			});
			
		});
		
		
	});
	
	
	
	</script>
</body>
	
</html>