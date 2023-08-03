<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>                 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WE-Library 관리자 희망도서/도서 추가 </title>
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
		
		<div class="mybookinfo-page">
		
		<div class="sub-profile bg-secondary">
			<c:import url="/WEB-INF/jsp/include/subprofile.jsp"/>
			
			<div class="sub-text bg-info">
				<h2 class="text-center text-white mt-3"><b>관리자 희망도서/도서 추가</b></h2>
			</div>
		</div>
		
		<div class="d-flex mx-5">
		<c:import url="/WEB-INF/jsp/include/sidenav.jsp"/>
		
		<div class="col-9">
		
			<div class="">
				<div class="mt-3 d-flex text-secondary">
						희망도서 신청현황 :&nbsp<div class="text-primary"> 2 </div>건
				</div>
							
					<hr>
				<div class="bg-warning d-flex flex-wrap">
				
					
					<c:forEach var="wishbook" items= "${wishbookList }" varStatus="status">
						<div class="wishbookcard bg-info">
							<div class="">No.${status.count}</div>
							<div class="">유저아이디${wishbook.userId }</div>
							<div class=""><img class="wishbookprofile" width ="40" height="40" src="${wishbook.imagePath}" value="${wishbook.imagePath}"><input type="file" name="file" id="fileInput" class="" readonly></div>
							<div class=""><label>책제목</label><input type="text" id="titleInput" value="${wishbook.title}" class="form-control" readonly> </div>
							<div class=""><label>도서관</label><input type="text" id="libraryInput" value="${wishbook.library }" class="form-control" readonly></div>
							<div class=""><label>사진</label><input type="text" id="imageInput" value="${wishbook.imagePath }" class="form-control" readonly></div>
							<div class=""><label>저자</label><input type="text" id="authorInput" value="${wishbook.author }" class="form-control" readonly></div>
							<div class=""><label>출판사</label><input type="text" id="publisherInput" value="${wishbook.publisher }" class="form-control" readonly></div>
							<div class=""><label>가격</label><input type="text" id="priceInput" value="${wishbook.price }" class="form-control" readonly></div>
							<div class=""><label>isbn</label><input type="text" id="isbnInput" value="${wishbook.isbn }" class="form-control" readonly></div>
							<div class=""><label>출판년도</label><input type="text" id="pubyearInput" value="${wishbook.pubyear }" class="form-control" readonly></div>
							<div class=""><label>부록여부</label><input type="text" id="appendixInput" value="" class="form-control"></div>
							
							<div class="">신청일<fmt:formatDate value="${wishbook.createdAt }" pattern="yyyy년 MM월 dd일"/></div>
							<div class="text-center"><button class="addBtn btn btn-primary">추가하기</button></div>
						</div>
				
					</c:forEach>
					
		
		
			
				</div>
			
			
				<div class="text-center">
					<a href="#" class="btn btn-primary	">도서 추가하기</a>
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
			
			$(".addBtn").on("click", function(){
				
				let id = $(this).data("book-id");
				let title = $("#titleInput").val();
				let library = $("#libraryInput").val();
				let file = $("#fileInput")[0];
				let author = $("#authorInput").val();
				let publisher = $("#publisherInput").val();
				let price = $("#priceInput").val();
				let isbn = $("#isbnInput").val();
				let pubyear =$("#pubyearInput").val();
				let appendix = $("#appendixInput").val();
				
				if(appendix == ""){
					
					alert("부록물을 입력하세요.");
					return ;
				}
				
				//alert(id);
				alert(title);
				alert(library);
				alert(file);
				alert(author);
				alert(publisher);
				alert(price);
				alert(isbn);
				alert(pubyear);
				alert(appendix);
				
				var formData = new FormData();
				formData.append("title", title);
				formData.append("library", library);
				formData.append("file", file);
				formData.append("author", author);
				formData.append("publisher", publisher);
				formData.append("price", price);
				formData.append("isbn", isbn);
				formData.append("pubyear", pubyear);
				formData.append("appendix", appendix);
				
				
				$.ajax({
					
					type:"post"
					, url :"/book/book/create"
					, data:formData////파일이 포함되어있는경우 일반적인 형태:{}로는 전달안된다고 함. 위의 formData.append("file", file.files[0]);이 전달안되서.
					, enctype :"multipart/form-data"
					, processData:false// 파일 업로드 필수(근데 여기선 필수로 하면안됨)
					, contentType:false
					
					,success:function(data){
						if(data.result ==  "success"){
							alert("추가 성공");
							location.reload();
						} else {
							
							alert("추가 실패");
						}
					}
					,error:function(){
						
						alert("추가 에러");
					}
					
					
				});
				
				
				
			});
			
			
			
			
		});
		
	
	</script>
</body>
</html>