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
		
	
		<div class="userinfo-page">
		<div class="sub-profile bg-secondary">
			<c:import url="/WEB-INF/jsp/include/subprofile.jsp"/>
		
			<div class="sub-text bg-info">
				<h2 class="text-center text-white mt-3"><b>회원정보 수정</b></h2>
			</div>
		</div>	
			
			<div class="d-flex">
			<c:import url="/WEB-INF/jsp/include/sidenav.jsp"/>
			
			
			<div class="d-flex justify-content-center col-9">
			
				<div class="user-box col-8">
					<div class="mt-4">${user.loginId }</div>
					
					<input type="text" id="nameInput" placeholder="성명" value="${user.name }" class="form-control mt-4">
					
					<div class="d-flex align-items-center">
						<label></label>
						<input type="text" id="yearInput" value="${fn:substring(user.birth,0,4) }" class="form-control mt-4 col-3"> 	
						<div class="mt-4 col-1">년</div>
						<select class="form-control mt-4 col-3" id="monthSelector">
							<option value="${fn:substring(user.birth,4,6) }">${fn:substring(user.birth,4,6) }</option>
						 	<option value="01">1</option>
						 	<option value="02">2</option>
						 	<option value="03">3</option>
						 	<option value="04">4</option>
						 	<option value="05">5</option>
						 	<option value="06">6</option>
						 	<option value="07">7</option>
						 	<option value="08">8</option>
						 	<option value="09">9</option>
						 	<option value="09">9</option>
						 	<option value="10">10</option>
						 	<option value="11">11</option>
						 	<option value="12">12</option>
						 	
						 </select>
						 <div class="mt-4 col-1">월</div>
						<select class="form-control mt-4 col-3" id="daySelector">
							<option value="${fn:substring(user.birth,6,8) }">${fn:substring(user.birth,6,8) }</option>
						 	<option value="01">1</option>
						 	<option value="02">2</option>
						 	<option value="03">3</option>
						 	<option value="04">4</option>
						 	<option value="05">5</option>
						 	<option value="06">6</option>
						 	<option value="07">7</option>
						 	<option value="08">8</option>
						 	<option value="09">9</option>
						 	<option value="09">9</option>
						 	<option value="10">10</option>
						 	<option value="11">11</option>
						 	<option value="12">12</option>
						 	<option value="13">13</option>
						 	<option value="14">14</option>
						 	<option value="15">15</option>
						 	<option value="16">16</option>
						 	<option value="17">17</option>
						 	<option value="18">18</option>
						 	<option value="19">19</option>
						 	<option value="20">20</option>
						 	<option value="21">21</option>
						 	<option value="22">22</option>
						 	<option value="23">23</option>
						 	<option value="24">24</option>
						 	<option value="25">25</option>
						 	<option value="26">26</option>
						 	<option value="27">27</option>
						 	<option value="28">28</option>
						 	<option value="29">29</option>
						 	<option value="30">30</option>
						 	<option value="31">31</option>
						 	
						 </select>
						<div class="mt-4 col-1">일</div>
					</div>
					<div class="d-flex align-items-center">
						<input type="text" id="emailIdInput" value="${fn:split(user.email, "@")[0]}" class="form-control mt-4 col-5">
						
						 <div class="mt-4 col-1">@</div>
						 <select class="form-control mt-4 col-6" id="emailSelctor">
						 
						 	<option value="@${fn:split(user.email, "@")[1]}">${fn:split(user.email, "@")[1]}</option>
						 	<option value="@naver.com">naver.com</option>
						 	<option value="@daum.com">daum.com</option>
						 	<option value="@kakao.com">kakao.com</option>
						 	<option value="@gmail.com">gmail.com</option>
						 	<!-- 시간날때 해보기 <option value = "selfInput">직접입력</option>-->
						 </select>
					 
					</div>
					<div class="d-flex justify-content-between bg-info ">
					
					<c:choose>
						<c:when test="${fn:startsWith(user.phoneNumber, '02') }">
							<select class="form-control mt-4 col-3" id="phoneNumberSelector">
						 	<option value="${fn:substring(user.phoneNumber,0,2) }">${fn:substring(user.phoneNumber,0,2) }</option>
						 	<option value="02">02</option>
						 	<option value="010">010</option>
						 	<option value="011">011</option>	
						 </select>
						<div class="d-flex align-items-center mt-4">-</div>
						<input type="text" id="phoneNumberInput2"  value="${fn:substring(user.phoneNumber,2,6) }" class="form-control mt-4 ml-1 col-3">
						<div class="d-flex align-items-center mt-4">-</div>
						<input type="text" id="phoneNumberInput3" value="${fn:substring(user.phoneNumber,6,10) }" class="form-control mt-4 ml-1 col-3">
						</c:when>
						<c:otherwise>
							<select class="form-control mt-4 col-3" id="phoneNumberSelector">
						 	<option value="${fn:substring(user.phoneNumber,0,3) }">${fn:substring(user.phoneNumber,0,3) }</option>
						 	<option value="02">02</option>
						 	<option value="010">010</option>
						 	<option value="011">011</option>	
						 </select>
						<div class="d-flex align-items-center mt-4">-</div>
						<input type="text" id="phoneNumberInput2"  value="${fn:substring(user.phoneNumber,3,7) }" class="form-control mt-4 ml-1 col-3">
						<div class="d-flex align-items-center mt-4">-</div>
						<input type="text" id="phoneNumberInput3" value="${fn:substring(user.phoneNumber,7,11) }" class="form-control mt-4 ml-1 col-3">
						</c:otherwise>
					</c:choose>
						
					</div>

					
				
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
			
			let year = $("#yearInput").val(); 
			let month = $("#monthSelector").val(); 
			let day = $("#daySelector").val(); 
			let birth = year + month + day;
			
			let emailId = $("#emailIdInput").val();
			let emailDomain = $("#emailSelctor").val();
			let email = emailId + emailDomain;
			
			let phoneNumber1 = $("#phoneNumberSelector").val();
			let phoneNumber2 = $("#phoneNumberInput2").val();
			let phoneNumber3 = $("#phoneNumberInput3").val();
			let phoneNumber = phoneNumber1 + phoneNumber2 + phoneNumber3;
			//폰번호에대한 유효성검사도 필요한듯 각요소 별 네글자 초과시.
			
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