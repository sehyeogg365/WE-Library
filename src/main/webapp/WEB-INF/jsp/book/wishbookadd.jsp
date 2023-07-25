<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WE-Library 희망도서 신청</title>

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
		
		<div class="mybookinfo-page mt-3">
		<div class="">
			<h2 class="text-center mt-3"><b>희망도서 신청</b></h2>
		</div>
		
		
		<div class="d-flex">
		
		<c:import url="/WEB-INF/jsp/include/sidenav2.jsp"/>
		
		<div class="col-9 bg-info">
		<!-- 신청자 정보 -->
		<div class ="bg-danger"><h4><b>신청자 정보</b></h4></div>
		
		<!-- 희망도서 도서 정보 -->
		<div class ="bg-danger"><h4><b>희망도서 정보</b></h4></div>
		
		<div class="bg-primary">
		
		<table class="table">
		
		<thead>
		<tr>
			<td>신청도서관</td>
			<td>
				<select id="librarySelector" class="form-control">
					<option value="역삼푸른솔도서관">역삼푸른솔도서관</option>
					<option value="역삼도서관">역삼도서관</option>
					<option value="행복한 도서관">행복한 도서관</option>
					<option value="논현 도서관">논현 도서관</option>
					<option value="대치 도서관">대치 도서관</option>
					
				</select>
			
			</td><!-- 이것도 옵션 -->
		</tr>
		</thead>
		
		<tbody>
			<tr>
				<td>희망도서명</td>
				<td>
				  <form method="get" class="">
					<div class="search d-flex justify-content-center">
		                <input type="text" value="" placeholder="검색어를 입력하세요." class="form-control" name="title">
		                <div class="input-group-append">
		                	<button type="submit" class="btn">검색</button>
		                </div>
		            </div>
				  </form>
				</td>
			</tr>
			<tr>
				<td>저자</td>
				<td>22</td>
			</tr>
			<tr>
				<td>출판사</td>
				<td>22</td>
			</tr>
			<tr>
				<td>발행연도</td>
				<td>22</td>
			</tr>
			<tr>
				<td>ISBN</td>
				<td>22</td>
			</tr>
			<tr>
				<td>정가</td>
				<td>22</td>
			</tr>
			
			
		</tbody>
		
		
		</table>
		
		
		</div>
		
		
		
		</div>
		
		</div>
		
		
		</div>
		
		
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	
	</div>

</body>
</html>