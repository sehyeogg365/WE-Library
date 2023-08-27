<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WE-Library 예약 리스트</title>
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
			
					<c:import url="/WEB-INF/jsp/include/subprofile.jsp"/>
					
					<div class="sub-text">
						<h2 class="text-center text-white mt-3"><b>예약 현황</b></h2>
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
							 예약현황 : &nbsp<div class="text-primary">3</div>건
						</div>
						
						<c:forEach var="reserve" items="${reserveDetailList }">	
						<hr>
						<div class="d-flex justify-content-between align-items-center">
						<div class="col-9">
							<div class="">
								<h5>${reserve.title }</h5>
							</div>
							<div class="">
								도서관 : ${reserve.library }
							</div>
							<div class=""><!-- <fmt:parseDate var="parseBorrow" value ="${formatBorrow }" pattern ="yyyy-MM-dd"/><fmt:parseNumber var="parseReturn" value="${parseBorrow.time + 60*60*24*1000*14}"/> <c:set var="fourteenDayAfter" value=""/> -->
								 예약일 : <fmt:formatDate value ="${reserve.createdAt }" pattern ="yyyy-MM-dd"/> 
							</div>
							<div class="">
								대출상태 : 대출중 | 반납예정일 : <fmt:formatDate value="${reserve.returnDate }" pattern ="yyyy-MM-dd"/> | 예약순번 : 번쨰(명 예약중)
							</div>
						</div>
						
						<div class="">
							<button id="reservedeleteBtn" class="btn btn-primary btn-sm deleteBtn my-3" data-reserve-id="${reserve.id }">예약취소</button>
						
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
	
	
	</div>
	<script>
		$(document).ready(function(){
			
			
			$(".deleteBtn").on("click", function(){
				
				
				let id = $(this).data("reserve-id");
				var result = confirm("취소 하시겠습니까?");
				
				if(result){
					//alert(""); 아무것도 안쓰면 바로 추가성공이 뜬다.
				} else {
					return ;
				}
				//alert(id);
				
				$.ajax({
					
					type:"get"
					, url:"/book/reservation/delete"
					, data: {"id":id}
					, success:function(data){
						if(data.result == "success"){
							alert("예약취소 성공");
							location.reload();
						} else {
							alert("예약취소 실패");
							
						}
						
					}
					,error:function(){
						alert("예약취소 에러");
					}
					
					
					
				});
				
				
			});
			
			
			
			
			
			
		});
		
	
	
	</script>



</body>
</html>