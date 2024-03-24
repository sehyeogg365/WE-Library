<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WE-Library 대출현황</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<!-- 아이콘 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap" class="">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<section class="contents d-flex justify-content-center">
			
			<div class="mybookinfo-page">
				<div class="sub-profile bg-secondary">
					<div class="img-box">
						<img class="profile" width="1000px" height="200px" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FlAG5Z%2Fbtsnhr3rPGd%2FKeJ2kZ3AGgbzql1R1aDdr1%2Fimg.jpg" alt="메인로고 사진">
					</div>
					<div class="sub-text">
						<h2 class="text-center text-white mt-3"><b>대출현황</b></h2>
										
					</div>
					<div class="sub-text2">
						<h5 class="text-center text-white mt-3"><b>내서재>도서이용정보>대출현황</b></h5>
					</div>
				</div>
				
				<div class="d-flex mx-5">
				
				<c:import url="/WEB-INF/jsp/include/sidenav2.jsp"/>
				
				<div class="col-9 ">
					<div class="">
						
						<div class="">
						
						<nav class="d-flex justify-content-center align-items-center col-12 mt-3">
							<ul class="nav nav-fill">
								<li class="nav-item list-nav" style="background-color: #1E90FF;"><h5><a href="/book/borrowstatus/view?id=${userId }" class="nav-link text-dark font-weight-bold">&nbsp대출현황&nbsp</a></h5></li>
								<li class="nav-item list-nav"><h5><a href="/book/reservelist/view?id=${userId }" class="nav-link text-dark font-weight-bold">&nbsp예약현황&nbsp</a></h5></li>
								<li class="nav-item list-nav"><h5><a href="/book/borrowhistory/view?id=${userId }" class="nav-link text-dark font-weight-bold">&nbsp대출이력&nbsp</a></h5></li>
								<li class="nav-item list-nav"><h5><a href="/book/interibrarybooklist/view?id=${userId }" class="nav-link text-dark font-weight-bold">&nbsp상호대차&nbsp</a></h5></li>
							</ul>
						</nav>
						
						</div>
						
						
						<div class="mt-3 d-flex text-secondary">
							 대출현황 : &nbsp<div class="text-primary">
							 					
							 					<c:forEach var="borrow" begin="0" end="0" items="${borrowCountList }">
							 					
							 						${borrow.numberCount }
							 					</c:forEach>
							 
							 				</div>건
						</div><!-- 여기서도  반납연장 1회 누를시 반납연장불가로 바뀜, 상태는:반납연기 연체되면 연체로 나오게해야함-->
						<c:forEach var="borrow" items="${borrowDetailList }">	<!-- 한번 반납연장을 했을때 반납 연장 못하게 -->
						<hr>
						<div class="d-flex justify-content-between align-items-center">
						<div class="col-9">
							<div class="" style="font-size: 18px;">
								${borrow.title }
							</div>
							<div class="d-flex align-items-center text-secondary">
								ㅇ도서관 : ${borrow.library }
							</div>
							<div class="d-flex text-secondary"><!-- ${borrowDate.time +(1000*60*60*24*14)} 여기서 String->Date 변환 한번 해야함(parse) -->
						
								
								ㅇ상태 : <c:choose>
										<c:when test ="${returnDate - borrowDate >= 21}">
											<div class="" id="returnExtensionBtn">반납연장</div>
											
										</c:when>
										<c:otherwise>
											<div class="text-primary">대출중</div>
										</c:otherwise>
									 </c:choose> 
								
								&nbsp | &nbsp 대출일 : <fmt:formatDate value="${borrow.createdAt}" pattern ="yyyy.MM.dd"/>&nbsp |&nbsp 반납예정일 : <fmt:formatDate value="${borrow.returnDate}" pattern ="yyyy.MM.dd"/>
							</div>
						</div>
						
						<div class="">
							<button id="borrowdeleteBtn" class="btn btn-danger btn-sm deleteBtn my-3" data-book-id="${borrow.id }">반납하기</button>
							
							<!-- 반납예정일과 대출일이 3주이상 차이날시  반납연장불가버튼 그외에 반납연장 버튼 이렇게 해보기-->
							<!-- formatDate Date -> String -->
							<!-- parseDate String -> Date -->
							 
							<c:choose>
								<c:when test="${returnDate - borrowDate >= 21}">
									<button class="btn btn-primary btn-sm">반납연장불가</button>
								</c:when>
								<c:otherwise>
								 
								   
									<button id="rtnExtBtn" class="btn btn-primary btn-sm updateBtn my-3" data-book-id="${borrow.id }">반납연장</button>					
									<div class="d-none" id="rtnCannotBeExtd">반납연장 불가</div>
							
								</c:otherwise>
							</c:choose>
							
						</div>
						</div>
						
						</c:forEach>
						
						<hr>
					
					</div><br>
					
				
					
					
				</div>
				
					
					<hr>
				</div>
			
			</div>
		
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	
	<script>
		$(document).ready(function(){
			
			$(".updateBtn").on("click", function(){
				
				let id = $(this).data("book-id");
				
				//alert(id);
				var result = confirm("반납연장 하시겠습니까?");
				
				if(result){
					//alert(""); 아무것도 안쓰면 바로 추가성공이 뜬다.
				} else {
					return ;
				}
				$.ajax({
					
					type:"post"
					, url:"/book/borrow/update"
					, data :{"id":id}
					, success:function(data){
						if(data.result == "success"){
							alert("반납 연장 성공");
							
							//2024-03-24 d-none로 반납연장버튼 숨기기, 반납연장 불가 문구 나타내기 그냥 한번 눌렸을때 되게 해야 함.
							//$("#rtnExtBtn").addClass("d-none");
							//$("#rtnCannotBeExtd").removeClass("d-none");
							
							location.reload();
						} else {
							alert("반납 연장 실패");
						}
						
					}
					, error:function(){
						
						alert("반납 연장 에러");
					}
					
				});
				
			});
			
			
			$(".deleteBtn").on("click", function(){
				
				let id = $(this).data("book-id");
				
				var result = confirm("반납 하시겠습니까?");
				
				if(result){
					//alert(""); 아무것도 안쓰면 바로 추가성공이 뜬다.
				} else {
					return ;
				}
	
				//alert(id);
				
				$.ajax({
					
					type:"get"
					, url:"/book/borrow/delete"
					, data :{"id":id}
					, success:function(data){
						if(data.result== "success"){
							alert("반납 성공");
							location.reload();
							
							// 2024-03-17 이중아작스문으로 반납과 동시에 대출이력리스트에 추가시키기 해보기
							$.ajax({
								
								type:"post"
								, url
							})
							
						} else {
							alert("반납 실패");
						}
						
					}
					,error:function(){
						alert("반납 에러");
					}
				});
				
				
				
				
			});
			
			
		});
		
	
	
	</script>

</body>
</html>