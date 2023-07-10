<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WE-Library 마이페이지</title>
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
		
	
		<div class="userinfo-page  bg-secondary mt-3">
		
			
			<h2 class="text-center mt-3"><b>회원정보 수정</b></h2>
			
			<div class="d-flex">
			<c:import url="/WEB-INF/jsp/include/sidenav.jsp"/>
			
			
			<div class="bg-info col-9">
			
				<div class="bg-warning col-8">
					<div class="">${user.loginId }</div>
					
					<input type="text" id="nameInput" placeholder="성명" value="${user.name }" class="form-control mt-4">
					<input type="text" id="birthInput" placeholder="생일" value="${user.birth }" class="form-control mt-4">
					<input type="text" id="emailInput" placeholder="이메일" value="${user.email }" class="form-control mt-4">
					<input type="text" id="phoneNumberInput" placeholder="휴대폰번호" value="${user.phoneNumber }" class="form-control mt-4">
					

					
				
					<button type="button" class="btn btn-primary btn-block mt-3 mb-3" id="updateBtn" data-user-id = "${user.id }">회원정보 수정 </button>
				</div>
			</div>
			
			</div>
		</div>
	</section>
	
	
	<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	<script>
	$(document).ready(function(){
		$("#updateBtn").on("click", function(){
			
			let id = $(this).data("user-id");
			let name = $("#nameInput").val();
			let birth = $("#birthInput").val();
			let email = $("#emailInput").val();
			let phoneNumber = $("#phoneNumberInput").val();
			
			
			//alert(id);
			//alert(name);
			//alert(birth);
			//alert(email);
			//alert(phoneNumber);
			
			
			$.ajax({
				type:"post"
				, url:"/user/updateinfo"
				, data: {"name":name, "birth":birth, "email" : email, "phoneNumber":phoneNumber}
				, success:function(data){
					if(data.result == "success"){
						alert("회원정보 수정 성공");
						location.reload();
					} else {
						alert("회원정보 수정 실패");
						
					}
				}
				,error:function(){
					
					alert("회원정보 수정 오류");
				}
				
				
			});
			
		});
	})
	
	
	
	</script>

</body>
</html>