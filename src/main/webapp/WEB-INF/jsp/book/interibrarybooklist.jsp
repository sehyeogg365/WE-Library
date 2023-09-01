<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WE-Library 상호대차 리스트</title>
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
						<h2 class="text-center text-white mt-3"><b>상호대차 현황</b></h2>
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
							 상호대차 현황 : &nbsp<div class="text-primary">
							 <c:forEach var="interibrarybook" begin="0" end="0" items="${interibraryCountList }">
							 
							 	${interibrarybook.numberCount }
							 
							 </c:forEach>
							 
							 </div>건
						</div>
						
						<c:forEach var="interibrarybook" items ="${interibraryDetailList }">
						<hr>
						<div class="d-flex justify-content-between align-items-center">
						<div class="col-9">
							<div class="">
								<h5>${interibrarybook.title }</h5>
								<h5>상호대차아이디${interibrarybook.id }</h5>
								<h5>북아이디${interibrarybook.bookId }</h5>
							</div>
							<div class="">
								제공도서관: ${interibrarybook.library } | 수령도서관 : ${interibrarybook.receivelibrary }
							</div>
							<div class="">
								신청일: <fmt:formatDate value="${interibrarybook.createdAt }" pattern = "yyyy-MM-dd"/>| 반납예정일: <fmt:formatDate value="${interibrarybook.returnDate }" pattern = "yyyy-MM-dd"/>
							</div>
							<div class="d-flex"><!-- 여기서도 요청된자료/ 입수된 자료/ 신청취소된자료로 구분  -->
								상태: 
								<c:choose>
									<c:when test="${interibrarybook.status }">
										<p class="text-primary">수령완료</p>
									</c:when>
									<c:otherwise>
										<p class="text-primary">요청된 자료</p>
									</c:otherwise>
								</c:choose>
								
							</div>
						</div>
						<div class="">
							
							<button id="interibraryaddBtn" class="btn btn-primary btn-sm addBtn my-3" data-book-id="${interibrary.bookId }">상호대차 수령</button>
							<button id="interibrarydeleteBtn" class="btn btn-primary btn-sm deleteBtn my-3" data-interibrary-id="${interibrary.id }">취소</button>
						
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
	//수령 = 대여목록 추가(대출), 대여를 의미하고 dto로는 borrow_book테이블에 있는지여부를 조사하여 있으며 있으면 대여중 이런식으로 글자 변경
		$(document).ready(function(){
			
			
			$(".addBtn").on("click", function(){
				
				let bookId = $(this).data("book-id");
				
				alert(bookId);
				
				
				
			});
			
			
			
			$(".deleteBtn").on("click", function(){
				
				let id = $(this).data("interibrary-id");
				
				
				var result = confirm("상호대차 취소 하시겠습니까?");
				
				if(result){
					//alert(""); 아무것도 안쓰면 바로 추가성공이 뜬다.
				} else {
					return ;
				}
				
				alert(id);
				
				
				$.ajax({
					type:"get"
					, url: "/book/interibrary/delete"
					, data:{"id":id}
					, success:function(data){
						if(data.result == "success"){
							alert("상호대차 취소 성공");
							location.reload();
						} else {
							alert("상호대차 취소 실패");
							
						}
						
					}
					,error:function(){
						alert("상호대차 취소 에러");
					}
					
					
					
				});
				
				
				
				
			});
			
		});
		
	
	</script>
</body>
</html>