<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>                   
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
		
	
		<div class="userinfo-page  mt-3">
		
			<div class="">
				<h2 class="text-center mt-3"><b>비밀번호 변경</b></h2>
			</div>
			<div class="d-flex">
			<c:import url="/WEB-INF/jsp/include/sidenav.jsp"/>
			
			
			<div class="d-flex justify-content-center col-9">
			
				<div class="user-box col-8">
					<div class="text-center py-4 px-4 ">
					
						<div class="d-flex">
							<label class="mt-4 col-6">현재 비밀번호</label><input type="password" id="passwordInput" placeholder="기존 비밀번호"  class="form-control mt-4 col-6">
						</div>
						<div class="d-flex">
							<label class="mt-4 col-6">새 비밀번호</label><input type="password" id="newpasswordInput" placeholder="새 비밀번호"  class="form-control mt-4 col-6">
						</div>
						<div class="d-flex">
							<label class="mt-4 col-6">새 비밀번호 확인</label><input type="password" id="newpasswordConfirmInput" placeholder="새 비밀번호 확인" class="form-control mt-4 col-6">
						</div>
						
		
					</div>
					<div class="d-flex justify-content-center">
						<button type="button" id="updateBtn" class="btn btn-primary col-6 mt-3 mb-3"  data-user-id = "${user.id }">비밀번호 변경 </button>
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
		
		
		$("#updateBtn").on("click", function(){
			
			let id = $(this).data("user-id");
			let password = $("#passwordInput").val();
			let password2 = $("#newpasswordInput").val();// 새비밀번호를 password로 하고 기존비밀번호를 다른변수로 잡으면?
			let passwordConfirm = $("#newpasswordConfirmInput").val();
			
			if(password == ""){
				alert("기존 비밀번호를 입력해주세요.");
				return ;
			}
			
			if(password2 == ""){
				alert("새 비밀번호를 입력해주세요.");
				return ;
			}
			
			if(passwordConfirm == ""){
				alert("새 비밀번호 확인을 입력해주세요.");
				return ;
			}
			
			
			if(password2 != passwordConfirm){
				alert("새 비밀번호가 일치하지 않습니다.");
				return ;
			}
			
			alert(password);
			alert(password2);
			alert(passwordConfirm);
			
			$.ajax({
				type: "post"
				, url: "/user/update_pw"
				, data: {"id":id, "password":password}
				, success:function(data){
					if(data.result == "success"){
						alert("비밀번호 변경 성공");
						location.reload();
					} else {
						alert("비밀번호 변경 실패");
					}
					
				}
				, error:function(){
					alert("비밀번호 변경 오류");
				}
				
				
				
			});
		});
		
		
		
		
		
		
	});
	
	
	
	
	</script>

</body>
</html>