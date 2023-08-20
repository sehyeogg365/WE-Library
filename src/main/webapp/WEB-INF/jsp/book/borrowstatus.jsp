<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
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
			
			<div class="mybookinfo-page">
				<div class="sub-profile bg-secondary">
					<div class="img-box">
						<img class="profile" width="1000px" height="200px" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FlAG5Z%2Fbtsnhr3rPGd%2FKeJ2kZ3AGgbzql1R1aDdr1%2Fimg.jpg" alt="메인로고 사진">
					</div>
					<div class="sub-text4 bg-info">
						<h2 class="text-center text-white mt-3"><b>대출 현황</b></h2>
					</div>
					
				</div>
				
				<div class="d-flex mx-5">
				
				<c:import url="/WEB-INF/jsp/include/sidenav2.jsp"/>
				
				<div class="col-9 ">
					<div class="">
						
						<div class="">
						
						<nav class="d-flex justify-content-center align-items-center col-12">
							<ul class="nav nav-fill">
								<li class="nav-item"><h5><a href="/book/borrowstatus/view?id=${userId }" class="nav-link text-dark font-weight-bold">대출현황</a></h5></li>
								<li class="nav-item"><h5><a href="/book/reservelist/view?id=${userId }" class="nav-link text-dark font-weight-bold">예약현황</a></h5></li>
								<li class="nav-item"><h5><a href="#" class="nav-link text-dark font-weight-bold">대출이력</a></h5></li>
								<li class="nav-item"><h5><a href="/book/interibrarybooklist/view?id=${userId }" class="nav-link text-dark font-weight-bold">상호대차</a></h5></li>
							</ul>
						</nav>
						
						</div>
						
						
						<div class="mt-3 d-flex ">
							 대출현황 : &nbsp<div class="text-primary">3</div>건
						</div>
						<c:forEach var="borrow" items="${borrowDetailList }">	
						<hr>
						<div class="d-flex justify-content-between ">
						<div class="col-9">
							<div class="">
								<h5>${borrow.title }</h5>
							</div>
							<div class="">
								도서관 : ${borrow.library }
							</div>
							<div class="">
								상태 : 반납 | 대출일 : <fmt:formatDate value ="${borrow.createdAt }" pattern ="yyyy-MM-dd"/> | 반납예정일 : ${borrow.createdAt }
							</div>
						</div>
						
						<div class="">
							<button id="borrowdeleteBtn" class="btn btn-primary btn-sm deleteBtn my-3" data-book-id="${borrow.id }">반납하기</button>
						</div>
						</div>
						
						</c:forEach>
						
						<hr>
					
					</div><br>
					
				
					
					
				</div>
				
					
					<hr>
				</div>
			
			</div>
		
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	
	<script>
		$(document).ready(function(){
			
			$(".deleteBtn").on("click", function(){
				
				let id = $(this).data("book-id");
				
				alert(id);
				
				$.ajax({
					
					type:"get"
					, url:"/book/borrow/delete"
					, data :{"id":id}
					, success:function(data){
						if(data.result== "success"){
							alert("반납 성공");
							location.reload();
						} else {
							alert("반납 실패");
						}
						
					}
					,error:function(){
						alert("반납 에러");
					}
				});
				
				
				
				
			});
			
			
		});
		
	
	
	</script>

</body>
</html>