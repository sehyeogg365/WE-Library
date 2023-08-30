<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WE-Library 희망도서 리스트</title>
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
			

			<c:import url="/WEB-INF/jsp/include/subprofile.jsp"/>
			
			<div class="sub-text">
				<h2 class="text-center text-white mt-3"><b>희망도서 신청 조회</b></h2>
			</div>
		</div>
		
		<div class="d-flex mx-5">
		<c:import url="/WEB-INF/jsp/include/sidenav2.jsp"/>
		
		<div class="col-9 ">
		
			<div class="">
				<div class="mt-3 d-flex text-secondary">
						희망도서 신청 :&nbsp<div class="text-primary"> 
											<c:forEach var="wishbook" items="${wishbookCountList }">
												${wishbook.numberCount }
											</c:forEach>
										</div>건
				</div>
						<!-- 신청여부 조사 북테이블에있을시 소장중 없을시 신청중 -->
						<c:forEach var="wishbook" items="${wishbookList }">	
						<hr>
						
						<div class="">
							
						
							<div class="">
								<h5>${wishbook.title }</h5>
							</div>
							<div class="text-secondary">
								저자 : ${wishbook.author } | 출판사 : ${wishbook.publisher } | ISBN : ${wishbook.isbn }
							</div>
							
							<div class="text-secondary">
								도서관 : ${wishbook.library } | 신청일 : <fmt:formatDate value ="${wishbook.createdAt }" pattern ="yyyy-MM-dd"/>
							</div>
							
							<div class="text-secondary d-flex">
								상태 : <c:choose>
										<c:when test = "${wishbook.add }">
											<p>소장중</p>
										</c:when>
										<c:otherwise>
											<p>신청중</p>
										</c:otherwise>
									  </c:choose>
							</div>
						</div>
						
					</c:forEach>
					<hr>
			</div>
		
			
		
			<div class="text-center">
				<a href="/book/wishbook/add/view?id=${userId }" class="btn btn-primary	">희망도서 신청하기</a>
			</div>
		</div>
		
		</div>
		</div>
		
		</section>
		
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	
	</div>
</body>
</html>