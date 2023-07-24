<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WE-Library 대출현황</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<!-- 아이콘 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap" class="">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<section class="contents d-flex justify-content-center">
			
			<div class="mybookinfo-page mt-3">
				<div class="">
				<h2 class="text-center mt-3"><b>대출 현황</b></h2>
				</div>
				
				<div class="d-flex">
				<nav class="side-nav col-3">
				<ul class="nav flex-column mt-4 "> 
				
					<li class="nav-item first-nav"><h4 class="text-center text-white font-weight-bold mt-2">도서이용정보</h4><hr></li>
					<li class="nav-item"><h5 class="font-weight-bold"><a href="#" class="nav-link text-dark">관심자료 목록</a></h5><hr></li>
					<li class="nav-item"><h5 class="font-weight-bold"><a href="#" class="nav-link text-dark">희망도서 신청조회</a></h5><hr></li>
					<li class="nav-item"><h5 class="font-weight-bold"><a href="#" class="nav-link text-dark">문화행사 신청조회</a></h5><hr></li>				
				
				</ul>
				
				</nav>
				
				</div>
			
			</div>
		
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	
	<script>
		
	
	
	</script>

</body>
</html>