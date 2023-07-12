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
			
			<div class="d-flex justify-content-center bg-info col-9">
				<div style= "text-align: center;" class="bg-warning col-8">
				
					<div class="d-flex justify-content-bewtween"><label><h5>아이디</h5></label><h5 class="ml-5">${user.loginId }</h5></div>
					<div class="d-flex "><label class="mt-4"><h5>비밀번호</h5></label ><input type="password" id="passwordInput" placeholder="비밀번호" class="form-control mt-4 ml-5 col-4"></div>
					

					<!--  <a href="#" id="pwCheckBtn" class="btn  btn-primary" data-user-id="${user.id }">비밀번호 확인</a>-->
					<button type="button" id="pwCheckBtn" class="btn btn-primary"  data-user-id = "${user.id }">비밀번호 확인 </button>
				</div>
				
			</div>
			
			</div>
		</div>
	</section>
	
	
	<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	<script>
	$(document).ready(function(){
		
		$("#pwCheckBtn").on("click", function(){
			let id = $(this).data("user-id");
			let password = $("#passwordInput").val();
			
			if(password==""){
				
				alert("비밀번호를 입력하세요.");
			}
			
			alert(password);
			
			$.ajax({
				type:"get"
				, url:"/user/pw_check"
				, data: {"password":password}
				, success:function(data){
					if(data.result == "success"){
						location.href="/user/mypage/view?id=${user.id}";
						alert("비밀번호 확인 성공");
						
					} else {
						alert("비밀번호 확인 실패");
						location.reload();
					}
				}
				, error:function(){
					alert("비밀번호 확인 오류");
					location.reload();
				}
				
			});
			
			
			
		});
		
		
	});	
	
	</script>

</body>
</html>