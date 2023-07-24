<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="side-nav col-3">
				<ul class="nav flex-column mt-4 "> 
				
					<li class="nav-item first-nav"><h4 class="text-center text-white font-weight-bold mt-2">도서이용정보</h4><hr></li>
					<li class="nav-item"><h5 class="font-weight-bold"><a href="#" class="nav-link text-dark">관심자료 목록</a></h5><hr></li>
					<li class="nav-item"><h5 class="font-weight-bold"><a href="/book/wishbook/list/view?id=${userId }" class="nav-link text-dark">희망도서 신청조회</a></h5><hr></li>
					<li class="nav-item"><h5 class="font-weight-bold"><a href="#" class="nav-link text-dark">문화행사 신청조회</a></h5><hr></li>				
				
				</ul>
				
				
				
				</nav>

	<script>
	$(document).ready(function(){
		
		$(function(){
			
			$("li").click(function(){
				
				$("li").removeClass()
				
				
			});
			
		});
		
		
	});
	</script>
</body>
</html>