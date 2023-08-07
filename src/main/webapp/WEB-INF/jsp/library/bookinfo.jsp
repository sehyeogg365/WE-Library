<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WE-Library 도서 상세정보 화면</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<!-- 아이콘 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap" class="">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		
		<section class="contents d-flex justify-content-center">
		
		<div class="librarybookinfo-page">	
			<div class="sub-profile bg-secondary">
				<c:import url="/WEB-INF/jsp/include/subprofile.jsp"/>
				
				<div class="sub-text bg-info">
					<h2 class="text-center text-white mt-3"><b>도서 상세정보</b></h2>
				</div>
			</div>
			
		<div class="bookinfo-box bg-info d-flex">
			<div class="bookinfo-profile ml-3 mt-3">
				<img class="profile" src="" width=120 height=120>
			</div>
			
			<div class="book-info-body ml-3 mt-3">
				<div class=""><b>저자사항</b> &nbsp 김인규 지음</div>
				<div class=""><b>발행사항</b> &nbsp Marondal 2022</div>
				<div class=""><b>형태사항</b> &nbsp</div>
				<div class=""><b>표준부호</b> &nbsp</div>
				<div class=""><b>부록여부</b> &nbsp</div>
			
			</div>

		</div>	
		
			<div class="info-box">
				<h5>상세정보</h5>
				<p class="text-secondary">가나다라마바사아자카타파하</p>
			</div>
			<div class="possessioninfo-box">
				<h5>소장정보</h5>
				<table class="table" border=1>
					
					<thead>
						<tr class="item">
						
							<th class="col-2">대출상태</th>
							<th class="col-3">반납예정일</th>
							<th class="col-1">부록</th>
							<th class="col-3">도서예약</th>
							<th class="col-3">상호대차</th>
						</tr>
					</thead>
					<tbody>
						<tr>
						
							<td>대출중</td>
							<td>2023-08-07</td>
							<td>cd</td>
							<td><button class="btn btn-sm btn-danger reserveBtn">예약불가능</button></td>
							<td><button class="btn btn-sm btn-success interibraryAddBtn">상호대차불가능</button></td>
						</tr>
					</tbody>
				
				</table>
			</div>
			<div class=""></div>
			<div class=""></div>
			
			
			
			
		</div>
		</section>
		
		
		
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
</body>
</html>