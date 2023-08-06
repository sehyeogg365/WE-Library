<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서관 추가창 팝업</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
</head>
<body>

	<!-- bootstrap input group 검색 -->
		<div class="search d-flex justify-content-center">
		   <input id="titleInput" type="text" value="${wishbook.title }" placeholder="도서명 또는 저자명을 입력해주세요" class="form-control col-9" name="title">
		      <div class="input-group-append">
		      	<button id="search" type="submit" class="btn btn-primary">검색</button>
		     </div>
		</div>			

			



</body>
<script>
	$(document).ready(function(){
		
		$("#search").on("click", function(){
			
			let title = $("#titleInput").val();
			
			
			if(title == ""){
				
				alert("제목을 입력해주세요.");
				return;
			}
			
			$.ajax({
				
				method:"GET"
				, url:""
				, data:{}
				
				
			});
			
			
		});
		
		
		
	});
	

</script>
</html>