<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>            
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WE-Library 관리자 희망도서/도서 추가 </title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap" class="">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<section class="contents d-flex justify-content-center">
		
		<div class="mybookinfo-page">
		
		<div class="sub-profile bg-secondary">
			<c:import url="/WEB-INF/jsp/include/subprofile.jsp"/>
			
			<div class="sub-text bg-info">
				<h2 class="text-center text-white mt-3"><b>관리자 희망도서/도서 추가</b></h2>
			</div>
		</div>
		
		<div class="d-flex mx-5">
		<c:import url="/WEB-INF/jsp/include/sidenav.jsp"/>
		
		<div class="col-9">
		
			<div class="">
				<div class="mt-3 d-flex text-secondary">
						희망도서 신청현황 :&nbsp<div class="text-primary"> 2 </div>건
				</div>
							
					<hr>
				<div class="">
					
					<table class="table">
					
					<thead>
					<tr class="item">
						<td><b>No.</b></td>
						<td><b>유저아이디</b></td>
						<td><b>책제목</b></td>
						<td><b>도서관</b></td>
						<td><b>사진</b></td>
						<td><b>저자</b></td>
						<td><b>가격</b></td>
						<td><b>isbn</b></td>
						<td><b>출판년도</b></td>
	
						<td><b>신청일</b></td>
						<td></td>
					</tr>
					
					</thead>
					
					<tbody>
					
					<c:forEach var="wishbook" items= "${wishbookList }" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td>${wishbook.userId }</td>
						<td><input type="text" id="titleInput" value="${wishbook.title} ${wishbook.id}" class="form-control" readonly> </td>
						<td><input type="text" id="libraryInput" value="${wishbook.library }" class="form-control" readonly></td>
						<td><input type="text" id="imageInput" value="${wishbook.imagePath }" class="form-control" readonly></td>
						<td><input type="text" id="authorInput" value="${wishbook.author }" class="form-control" readonly></td>
						<td><input type="text" id="publisherInput" value="${wishbook.publisher }" class="form-control" readonly></td>
						<td><input type="text" id="priceInput" value="${wishbook.price }" class="form-control" readonly></td>
						<td><input type="text" id="isbnInput" value="${wishbook.isbn }" class="form-control" readonly></td>
						<td><input type="text" id="pubyearInput" value="${wishbook.pubyear }" class="form-control" readonly></td>
						<td>${wishbook.createdAt }</td>
						<td><button class="addBtn btn btn-primary" data-book-id="${book.id }">추가하기</button></td>
					</tr>
				
					</c:forEach>
					
					
					</tbody>
					
					
					
					</table>
						
					
					<hr>
			
				</div>
			
			
				<div class="text-center">
					<a href="#" class="btn btn-primary	">도서 추가하기</a>
				</div>
		
		
			</div>
		
		
		</div>
		
		
		
		</div>
		
		</div>
		
		</section>
	
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	<script>
		$(document).ready(function(){
			
			$(".addBtn").on("click", function(){
				
				let id = $(this).data("book-id");
				let title = $("#titleInput").val();
				let library = $("#libraryInput").val();
				let file = $("#imageInput")[0];
				let author = $("#authorInput").val();
				let publisher = $("#publisherInput").val();
				let price = $("#priceInput").val();
				let isbn = $("#isbnInput").val();
				let pubyear =$("#pubyearInput").val();
				
			});
			
			
			
			
		});
		
	
	</script>
</body>
</html>