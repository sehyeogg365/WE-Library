<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WE-Library 도서 상세정보 화면</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<!-- 아이콘 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap" class="">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		
		<section class="contents d-flex justify-content-center">
		
		<div class="librarybookinfo-page">	
			<div class="sub-profile bg-secondary">
				<c:import url="/WEB-INF/jsp/include/subprofile.jsp"/>
				
				<div class="sub-text">
					<h2 class="text-center text-white mt-3"><b>도서 상세정보</b></h2>
				</div>
			</div>
		<c:forEach var="book" items="${bookDetailList}">	
		<div class="bookinfo-box d-flex">
			<div class="bookinfo-profile ml-3 mt-3">
				<img class="profile" src="${book.imagePath }" >
			</div>
			
			<div class="book-info-body ml-3 mt-3">
				<div class=""><b>저자사항</b> &nbsp ${book.author }지음</div>
				<div class=""><b>발행사항</b> &nbsp ${book.publisher } ${book.pubyear }</div>
				<div class=""><b>형태사항</b> &nbsp</div>
				<div class=""><b>표준부호</b> &nbsp ${book.isbn }</div>
				<div class=""><b>도서관</b> &nbsp ${book.library }</div>
				<div class=""><b>부록여부</b> &nbsp${book.appendix }</div>
				<div class=""><b>북아이디</b> ${book.id }</div>
			</div>

		</div>	
		
			<div class="info-box">
				<h5>상세정보</h5>
				<p class="text-secondary">가나다라마바사아자카타파하</p>
			</div>
			<div class="possessioninfo-box">
				<h5>소장정보</h5>
				<table class="table" border=1>
					
					<thead>
						<tr class="item">
						
							<th class="col-2 text-center">대출상태</th>
							<th class="col-3 text-center">반납예정일</th>
							<th class="col-1 text-center">부록</th>
							<th class="col-3 text-center">도서예약</th>
							<th class="col-3 text-center">상호대차</th>
						</tr>
					</thead>
					<tbody>
					
						<tr>
						
							<td class="text-center">
						
								<c:choose>
									<c:when test = "${book.borrow }" >
										<button class="btn btn-info btn-sm " ><i class="bi bi-bookmark-plus"></i>대출불가</button> 
									</c:when>
									<c:when test="${book.interibrary }">
										<button class="btn btn-info btn-sm " ><i class="bi bi-bookmark-plus"></i>대출불가</button> <div class="">예약인원 ${book.reserveCount } 명</div>
									</c:when>
									<c:otherwise>
										<button id ="borrowBtn"class="btn btn-info btn-sm borrowBtn " data-book-id="${book.id }"><i class="bi bi-bookmark-plus"></i>대출하기</button>
									</c:otherwise>
								</c:choose>
								
							</td>
							<td class="text-center">
								<fmt:formatDate value="${borrow.returnDate }" pattern ="yyyy-MM-dd"/>
							</td>
							<td class="text-center">${book.appendix }</td>
							<td class="text-center">
								<c:choose>
									<c:when test ="${book.borrow }">
										<button id="reserveBtn" class="btn btn-sm btn-danger  reserveBtn"><i class="bi bi-journal-arrow-down"></i>도서 예약신청</button>
									</c:when>
									<c:when test="${book.interibrary }">
										<button class="btn btn-danger btn-sm  reserveBtn" data-book-id="${book.id }"><i class="bi bi-journal-arrow-down"></i>도서 예약신청</button>
									</c:when>
									<c:otherwise>
										<button class="btn btn-danger btn-sm text-center" ><i class="bi bi-journal-arrow-down"></i>예약불가</button>
									</c:otherwise>
								</c:choose>
							</td>
							<td class="text-center">
								<c:choose>
									<c:when test ="${book.borrow }">
										<a href="#"class="btn btn-success btn-sm  interibraryAddBtn"><i class="bi bi-shuffle"></i>상호대차 신청 불가</a> 
									</c:when>
									<c:when test="${book.interibrary }">
										<a href="#"class="btn btn-success btn-sm  interibraryAddBtn" ><i class="bi bi-shuffle"></i>상호대차 신청 불가</a> 
									</c:when>
									
									<c:otherwise>
										<a href="/library/interibrarypopup/view?id=${book.id }"class="btn btn-success btn-sm text-center interibraryAddBtn" onclick="window.open('/library/interibrarypopup/view?id=${book.id}','new','scrollbars=yes,resizable=no width=500 height=500, left=0,top=0');return false"><i class="bi bi-shuffle"></i>상호대차 신청</a>
									</c:otherwise>
								</c:choose>

							</td>
						</tr>
						
					</tbody>
				
				</table>
				</div>
				</c:forEach>
				<div class="text-center"><button id ="interestAddBtn" class="btn btn-sm btn-primary interestAddBtn" data-book-id="${book.id }"><i class="bi bi-download"></i>관심도서 담기</button></div>
			</div>
			
	
			
			
			
			</section>
			<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
		</div>
		
	

	<script>
	$(document).ready(function(){
		
		
		$("#reserveBtn").on("click", function(){
	       	 let id = $(this).data("book-id");
			 var result = confirm("예약 하시겠습니까?");
	       	 
	       	 if(result){
					//alert(""); 아무것도 안쓰면 바로 추가성공이 뜬다.
				 } else {
					return ;
				 }
       	 
	       	 alert(id);
	       	 
	       	 $.ajax({
	       		
	       		 type:"post"
	       		 , url:"/book/reservation/create"
	       		 , data:{"bookId":id}
	       		 , success:function(data){
	       			 if(data.result == "success"){
	        	 			alert("예약 성공");
	        	 			location.reload();
	        	 		 } else {
	        	 			alert("예약 실패");
	        	 			 
	        	 		 }
	       			 
	       		 }
	       		 , error:function(){
	       	 		 alert("예약 에러");
	
	       	 	 }
	       		 
	       		 
	       	 });
	       	 
	       	 
	       	 
	      });
		
		
		
		
		
		
		$("#borrowBtn").on("click", function(){
			
			let id = $(this).data("book-id");
       	 
       	 
       		 var result = confirm("대출 하시겠습니까?");
       	 
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
       	 		 
       	 	 	}
       	 	 	, error:function(){
       	 			 alert("대출 에러");

       	 	 	}
       		 
       		});
			
			
		});
		
		$("#interestAddBtn").on("click", function(){
       	 	let id = $(this).data("book-id");
       	 //이것도 한번 된 책이면 두번이상 못누르게 해보기
       	 
			var result = confirm("관심도서 추가 하시겠습니까?");
       	 
	       	 if(result){
					//alert(""); 아무것도 안쓰면 바로 추가성공이 뜬다.
			 } else {
				return ;
			 }
       	 
       	 	alert(id);
       	 
	       	 $.ajax({
	       	
	       		 type:"post"
	       		 , url:"/book/interest/create"
	       		 , data :{"bookId":id}
	       	 	 , success:function(data){
	       	 		 if(data.result =="success"){
	       	 			 alert("추가 성공");
	       	 			location.reload();
	       	 		 } else {
	       	 			 alert("추가 실패");
	       	 		 }
	       	 	 }
	       	 	 , error:function(){
	       	 		 alert("추가 에러");
	       	 	 }
	       	 	 
	       	 });
       	 
       	 
       	 
       	 
       	 
        });
		
		
	});
	
	
	</script>
</body>
</html>