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
	<nav class="bg-success col-3">
			<ul class="nav small nav-fill flex-column bg-danger"> 
				
				<li class="nav-item"><h4>회원정보</h4></li>
				<li class="nav-item"><a href="/user/mypage/view?id=${userId}" class="nav-link text-dark"><h4>회원정보수정</h4></a></li>
				<li class="nav-item"><a href="/user/update_pw/view" class="nav-link text-dark"><h4>비밀번호 변경</h4></a></li>
				<li class="nav-item"><a href="/user/withdrawl/view" class="nav-link text-dark"><h4>회원탈퇴</h4></a></li>
			
			</ul>
	</nav>

</body>
</html>