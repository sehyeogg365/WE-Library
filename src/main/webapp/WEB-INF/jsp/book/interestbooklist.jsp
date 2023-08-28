<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WE-Library 관심도서 리스트</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<!-- 아이콘 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	
</head>
<style>
	.clear{clear:both} 
	li.on{background-color:blue}

</style>
<body>
	<div id="wrap" class="">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<section class="contents d-flex justify-content-center">
		
		<div class="mybookinfo-page">
		
		<div class="sub-profile bg-secondary">
			

			<c:import url="/WEB-INF/jsp/include/subprofile.jsp"/>
			
			<div class="sub-text">
				<h2 class="text-center text-white mt-3"><b>관심도서 조회</b></h2>
			</div>
		</div>
		
		<div class="d-flex mx-5">
		<c:import url="/WEB-INF/jsp/include/sidenav2.jsp"/>
		
		<div class="col-9 ">
		
			<div class="">
				<div class="mt-3 d-flex text-secondary">
						관심도서 신청 :&nbsp<div class="text-primary"> 1 </div>건
				</div>
					
					
					<!-- hr 부터 div 까지 반복문 -->
					<c:forEach var="interestbook" items="${interestDetailList }">
					<hr>
					
					<div class="">
							
						
							<div class="">
								<h5>${interestbook.title }</h5>
							</div>
							<div class="text-secondary">
								저자 : ${interestbook.author } | 출판사 : ${interestbook.publisher } | ISBN : ${interestbook.isbn }
							</div>
							<div class="text-secondary">
								도서관 : ${interestbook.library } | 추가날짜 : <fmt:formatDate value="${interestbook.createdAt }" pattern="yyyy-MM-dd"/>
							</div>
							<div class="text-secondary">
								<button class="btn btn-danger btn-sm deleteBtn" data-interest-id="${interestbook.id }"><i class="bi bi-x-circle"></i>관심도서 삭제</button>
							</div>
					</div>
					
					</c:forEach>
					<hr>
			</div>
		
			
		
		</div>
		
		
		</div>
		
		
		</div>
		
		</section>
	
	
	
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	<script>
		$(document).ready(function(){
			
			$(function(){
				
				$("li").click(function(){
					
					$("li").removeClass()
						$(this).addClass("on");
					
				});
				
			});
			
			$(".deleteBtn").on("click", function(){
				
				let id = $(this).data("interest-id");
				
				var result = confirm("삭제 하시겠습니까?");
				
				if(result){
					//alert(""); 아무것도 안쓰면 바로 추가성공이 뜬다.
				} else {
					return ;
				}
				
				
				alert(id);
				$.ajax({
					
					type:"get"
					, url:"/book/interest/delete"
					, data:{"id":id}
					, success:function(data){
						if(data.result == "success"){
							alert("삭제 성공");
							location.reload();
							
						} else {
							alert("삭제 실패")
						}
					}
					, error:function(){
						alert("삭제 에러");
					}
					
					
				});
				
				
				
			});
			
			
		});
	
	
	</script>



</body>
</html>