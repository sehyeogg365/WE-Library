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
						<h2 class="text-center text-white mt-3"><b>상호대차현황</b></h2>
					</div>
					<div class="sub-text2">
						<h5 class="text-center text-white mt-3"><b>내서재>도서이용정보>상호대차현황</b></h5>
					</div>
					
				</div>
			
				<div class="d-flex mx-5">
				
				<c:import url="/WEB-INF/jsp/include/sidenav2.jsp"/>
				
				<div class="col-9 ">
					<div class="">
						
						<div class="">
						
						<nav class="d-flex justify-content-center align-items-center col-12 mt-3">
							<ul class="nav nav-fill">
								<li class="nav-item list-nav" ><h5><a href="/book/borrowstatus/view?id=${userId }" class="nav-link text-dark font-weight-bold">&nbsp대출현황&nbsp</a></h5></li>
								<li class="nav-item list-nav" ><h5><a href="/book/reservelist/view?id=${userId }" class="nav-link text-dark font-weight-bold">&nbsp예약현황&nbsp</a></h5></li>
								<li class="nav-item list-nav" ><h5><a href="/book/borrowhistory/view?id=${userId }" class="nav-link text-dark font-weight-bold">&nbsp대출이력&nbsp</a></h5></li>
								<li class="nav-item list-nav" style="background-color: #1E90FF;"><h5><a href="/book/interibrarybooklist/view?id=${userId }" class="nav-link text-dark font-weight-bold">&nbsp상호대차&nbsp</a></h5></li>
							</ul>
						</nav>
						
						</div>
						
						
						<div class="mt-3 d-flex text-secondary">
							 상호대차 현황 : &nbsp<div class="text-primary">
							 ${interibraryBook}
							 
							 </div>건
						</div>
						
						<c:forEach var="interibrarybook" items ="${interibraryDetailList }">
						<hr>
						<div class="d-flex justify-content-between align-items-center">
							<div class="col-9">
								<div class="" style="font-size: 18px;">
									${interibrarybook.title }
									
								</div>
								<div class="text-secondary">
									ㅇ제공도서관: ${interibrarybook.library }  &nbsp| &nbsp 수령도서관 : ${interibrarybook.receivelibrary }
								</div>
								<div class="text-secondary">
									ㅇ신청일: <fmt:formatDate value="${interibrarybook.createdAt }" pattern = "yyyy.MM.dd"/>  &nbsp| &nbsp 반납예정일: <fmt:formatDate value="${interibrarybook.returnDate }" pattern = "yyyy.MM.dd"/>
								</div>
								<div class="d-flex text-secondary"><!-- 여기서도 요청된자료/ 입수된 자료/ 신청취소된자료로 구분  -->
									ㅇ상태: 
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
	<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	<script>
	//수령 = 대여목록 추가(대출), 대여를 의미하고 dto로는 borrow_book테이블에 있는지여부를 조사하여 있으며 있으면 대여중 이런식으로 글자 변경
		$(document).ready(function(){
			
			$(".addBtn").on("click", function(){
				
				let id = $(this).data("book-id");

				var result = confirm("수령 하시겠습니까?");
				
				if(result){
					//alert(""); 아무것도 안쓰면 바로 추가성공이 뜬다.
				} else {
					return ;
				}
				
				alert(id);
				
				$.ajax({
					type:"post"
		        	, url:"/book/borrow/create"
		        	, data:{"bookId":id}
		        	, success:function(data){
		        	 	if(data.result == "success"){
		        	 		alert("대출 성공");
		        	 		location.reload();
		        	 	} else {
		        	 		alert("대출 실패");
		        	 			 
		        	 	}
		        	 // 03/17이중아작스문으로 반납과 동시에 상호대차내역에 추가시키기 해보기	 
		        	 }
		        	 , error:function(){
		        	 	alert("대출 에러");
		        	 }
				});

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
					, url:"/book/interibrary/delete"
					, data :{"id":id}
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