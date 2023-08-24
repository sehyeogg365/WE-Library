<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상호대차 신청 팝업창</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<!-- 아이콘 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	
</head>
<body>
	<div class="">
		<div class="">${book.library }</div>
		<div class="">${book.title }</div>
		<div class="">부록:${book.appendix }</div>
	</div>
	
	<!-- 클릭한 도서관 이외의 도서관이 나와야 함 -->
	<c:choose>
		<c:when test ="${book.library eq '역삼푸른솔도서관' }">
			<select id="librarySelector" class="form-control">
				<option value="역삼도서관">역삼도서관</option>
				<option value="행복한 도서관">행복한 도서관</option>
				<option value="논현 도서관">논현 도서관</option>
				<option value="대치 도서관">대치 도서관</option>
					
			</select>
		</c:when>
		<c:when test ="${book.library eq '역삼도서관' }">
			<select id="librarySelector" class="form-control">
				<option value="역삼푸른솔도서관">역삼푸른솔도서관</option>
				<option value="행복한 도서관">행복한 도서관</option>
				<option value="논현 도서관">논현 도서관</option>
				<option value="대치 도서관">대치 도서관</option>
					
			</select>
		</c:when>
		<c:when test ="${book.library eq '행복한 도서관' }">
			<select id="librarySelector" class="form-control">
				<option value="역삼푸른솔도서관">역삼푸른솔도서관</option>
				<option value="역삼도서관">역삼도서관</option>
				<option value="논현 도서관">논현 도서관</option>
				<option value="대치 도서관">대치 도서관</option>
					
			</select>
		</c:when>
		<c:when test ="${book.library eq '논현 도서관' }">
			<select id="librarySelector" class="form-control">
				<option value="역삼푸른솔도서관">역삼푸른솔도서관</option>
				<option value="역삼도서관">역삼도서관</option>
				<option value="행복한 도서관">행복한 도서관</option>
				<option value="대치 도서관">대치 도서관</option>
					
			</select>
		</c:when>
		<c:when test ="${book.library eq '대치 도서관' }">
			<select id="librarySelector" class="form-control">
				<option value="역삼푸른솔도서관">역삼푸른솔도서관</option>
				<option value="역삼도서관">역삼도서관</option>
				<option value="행복한 도서관">행복한 도서관</option>
				<option value="논현 도서관">논현 도서관</option>
		
					
			</select>
		</c:when>
		<c:otherwise>
			<select id="librarySelector" class="form-control">
				<option value="역삼푸른솔도서관">역삼푸른솔도서관</option>
				<option value="역삼도서관">역삼도서관</option>
				<option value="행복한 도서관">행복한 도서관</option>
				<option value="논현 도서관">논현 도서관</option>
				<option value="대치 도서관">대치 도서관</option>
					
			</select>
		</c:otherwise>
	
	</c:choose>
	
	
	
	<button id= "interibraryAddBtn" class="btn btn-success btn-sm interibraryAddBtn" data-book-id="${book.id }"><i class="bi bi-shuffle"></i>상호대차 신청</button> 
	<a href="/library/list/view?title=${book.title }" class="btn btn-danger btn-sm">취소</a> 
	
	
	
	<script>
	$(document).ready(function(){
		
		
		$("#interibraryAddBtn").on("click", function(){
       	 let id = $(this).data("book-id");
       	 let library = $("#librarySelector").val();
       	 
       	 alert(id);
       	 alert(library);
       	 
       	 $.ajax({
       		
       		 type:"post"
       		 , url:"/book/interibrary/create"
       		 , data : {"bookId" :id, "library":library}
       	 	 , success:function(data){
       	 		 if(data.result == "success"){
       	 			 
       	 			 alert("상호대차 성공");
       	 			 history.back();
       	 			 //location.href="/library/list/view";
       	 			 
       	 		 } else {
       	 			 
       	 			alert("상호대차 오류");
       	 			
       	 		 }
       	 	 }
       	 	 , error:function(){
       	 		 alert("상호대차 에러");

       	 	 }
       		 
       	 });
       	 
       	 
        });
		
		
	});
	
	</script>
</body>
</html>