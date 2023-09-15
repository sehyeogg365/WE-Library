<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WE-Library 비밀번호 재발급</title>
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
	<div class="getpw-box mt-3">
		<h2 class="text-center mt-3"><b>비밀번호 재발급</b></h2>
		<input type="text" id="loginIdInput" placeholder="아이디" class="form-control mt-4">
		<input type="text" id="nameInput" placeholder="이름" class="form-control mt-4">
		<input type="text" id="birthInput" placeholder="생년월일 8자리" class="form-control mt-4">	
		<input type="text" id="phoneNumberInput" placeholder="휴대폰 번호 -없이 입력" class="form-control mt-4">
		<button type="button" id="getPwBtn" class="btn btn-primary btn-block mt-3 mb-3" data-user-password = "${user.password }" >비밀번호 재발급</button>
		<div class="d-flex justify-content-between">
			<a href="/user/find_id/view">아이디 찾기</a>
			<a href="/user/get_pw/view">비밀번호 재발급</a>
		</div>
	</div>											<!-- 굳이 pw 재발급 버튼에 모델값 넣어야하나?아이디 찾기는 모델의 id값을 불러와야 해서 그랬다지만 -->
	
	</section>
	<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	<script>
		$(document).ready(function(){
			
			$("#getPwBtn").on("click", function(){
				
				let id = $("#loginIdInput").val();
				let password = $(this).data("user-password");
				let name = $("#nameInput").val();
				let birth = $("#birthInput").val();
				let phoneNumber = $("#phoneNumberInput").val();
				
				if(id == ""){
					alert("아이디를 입력하세요.");
					return ;
				}
				if(name == ""){
					alert("이름을 입력하세요.");
					return ;
				}
				if(birth == ""){
					alert("생일을 입력하세요.");
					return ;
				}
				if(birth.length < 8){
					alert("생일을 확인하세요.");
					return ;
				}
				if(phoneNumber == ""){
					alert("전화번호를 입력하세요.");
					return ;
				}
				
				$.ajax({
					
					type:"post"
					, url:"/user/get_pw"
					, data:{"loginId":id, "name":name, "birth":birth, "phoneNumber":phoneNumber}
					, success:function(data){
						
						if(data.result == "success"){
							location.reload();
							alert("비밀번호는" + data.info);
						} else {
							
							alert("비밀번호 재발급 실패");
						}
						
					}
					, error:function(){
						alert("비밀번호 재발급 오류");
					}
					
					
				});
				
				
				
				
				
				
			});
			
			
		});
			
		
	
	</script>
</body>
</html>