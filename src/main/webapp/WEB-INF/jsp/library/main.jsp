<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WE-Library 메인화면</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<!-- 아이콘 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap" class="bg-secondary">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<section class="contents bg-success">
			
			<div class="main-page">
				<h2 class="text-center mt-3"><b>메인페이지</b></h2>
				
				<nav class="main-nav bg-primary d-flex justify-content-center align-items-center">
				<div class="">
					통합검색
				</div>
				
				<form action="#" method="get" class="col-9"><!-- bootstrap input group 검색 -->
					<div class="search d-flex justify-content-center col-12">
		                <input type="text" value="" placeholder="도서명 또는 저자명을 입력해주세요"class="form-control">
		                <div class="input-group-append">
		                	<button type="submit" class="btn">검색</button>
		                </div>
		            </div>
		         </form>
		         </nav>   
				
				<section class="d-flex justify-content-center bg-primary">
					
					
					<article class="main-contents bg-warning col-4">
						<div class="">메인 컨텐츠</div>
						
						<div class="main-login-box bg-info col-12">

							<div class="bg-secondary ">
							<c:choose>
							
							
								<c:when test = "${not empty userId }">
									<div class="mt-3 ml-3"><h3>${userName} 님 환영합니다!</h3>  </div>
									<div class="text-center">
									<a href="/user/signout" class="btn btn-primary col-11">로그아웃</a>
									</div>
									<hr>
									<div class="d-flex justify-content-between mt-3">
										<a href="#" class="btn btn-primary ml-2 col-5">내서재</a>
										<a href="/user/mypage/view" class="btn btn-primary mr-2 col-5">정보수정</a>
									</div>
								
								</c:when>
								<c:otherwise>
								
									<div class=""><h4>로그인</h4></div>
									<div class="d-flex justify-content-center">
										<div class="">
											<input type="text" id="loginIdInput" placeholder="로그인 ID" class="form-control mt-4">
											<input type="password" id="passwordInput" placeholder="비밀번호" class="form-control mt-4">
										</div>
										<div class="mt-1 ml-1">
											<button type="button" id="loginBtn" class= "loginbtn btn btn-primary mt-3" style="">로그인</button>
										</div>	
									
									</div>
									<div class="d-flex justify-content-center mt-3">
										<div class=""><a href="/user/signup/view" class="text-dark">회원가입</a> |</div>
										<div class="ml-2"><a href="/user/find_id/view" class="text-dark">아이디 찾기</a> |</div>
										<div class="ml-2"><a href="/user/get_pw/view" class="text-dark">비밀번호 재발급</a></div>
									</div>	
								</c:otherwise>
							</c:choose>
							</div>
							
							
						</div>
						
						
						
						<div class="bg-success mt-3">
							<div class=""><h4>내 서재</h4></div>
							<div class="d-flex justify-content-between flex-wrap">
								
								<div class="">대출조회/반납연기</div>
								<div class="ml-5">예약취소/조회</div>
								
								<div class="">상호대차신청조회</div>
						
								<div class="ml-5">희망도서신청조회</div>
								<div class="">관심도서목록</div>
							</div>
						</div>
						
						
					</article>
					<article class="sub-contents bg-danger col-4">
						<div class="">서브 컨텐츠</div>
						<div class="d-flex">
							<div class=""><a class="btn btn-primary">공지사항</a></div>
							<div class="ml-2"><a class="btn btn-primary">행사안내</a></div>
						</div>
						<hr>	
			
						<div class="bg-primary">
							<div class=""><a href="#" class="text-dark">[역삼푸른솔 도서관]분신물폐기 안내</a>  2023.07.03</div>
							<div class=""><a href="#" class="text-dark">[역삼푸른솔 도서관] 7월 휴관일 안내</a>  2023.07.03</div>
							<div class=""><a href="#" class="text-dark">[역삼푸른솔 도서관][신착도서]</a> 6월 2023.06.29</div>
							<div class=""><a href="#" class="text-dark"></a></div>
							<div class=""><a href="#" class="text-dark"></a></div>
						
						</div>
						
						
					</article>
					<article class="sub-contents2 bg-info col-4">
						<div class="">서브 컨텐츠2</div>
					</article>
					
				
				</section>
				
				
			</div>
		
		
		</section>
		
		
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	<style>
		.loginbtn{
			width:110px;
			height:110px;
		}
	</style>
	<script>
	$(document).ready(function(){
		
		$("#loginBtn").on("click", function(){
			let id = $("#loginIdInput").val();
			let password = $("#passwordInput").val();
	
			if(id == ""){
				alert("아이디를 입력하세요.");
				return;
				
			}
			
			if(password == ""){
				alert("비밀번호를 입력하세요.");
				return;	
			}
			
			//alert(id);
			//alert(password);
			
			$.ajax({
				type:"post"
				, url: "/user/signin"
				, data: {"loginId": id, "password":password}
				, success:function(data){
					if(data.result == "success"){
						location.href="/library/main/view";
						alert("로그인 성공");
					} else {
						alert("아이디/비밀번호가 일치하지 않습니다.");
					}
				}
			,error:function(){
				alert("로그인 에러");
			}
				
				
			
			
		});
		
		
		
		
		});
		
		
		
	});
	
	
	</script>
	
</body>
</html>