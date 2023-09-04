<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>                   
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
			
			<div class="sub-text">
				<h2 class="text-center text-white mt-3"><b>관리자 희망도서/도서 추가</b></h2>
			</div>
		</div>
		
		<div class="d-flex mx-5">
		<c:import url="/WEB-INF/jsp/include/sidenav.jsp"/>
		
		<div class="col-9">
		
			<div class="">
				<div class="mt-3 d-flex text-secondary">
						희망도서 신청현황 :
						<!--  
						&nbsp
						<div class="text-primary"> 
						<c:forEach var="wihsbook" begin="0" end="0" items= "${wishbookCountList }">
							${wishbook.allNumberCount }
						
						</c:forEach>
						</div>건
						-->
				</div>
							
					<hr>
				<div class="d-flex flex-wrap">
				
					
					<c:forEach var="wishbook" items= "${wishbookList }" varStatus="status">
						<hr>
						<div class="wishbookcard d-flex justify-content-between">
							<div class="">
								<div class="">
									<h5>No.${fn:length(wishbookList) - status.index}</h5>
									<h5>유저아이디${wishbook.userId }</h5>
								</div>
								
								<div class="">
									<h5>${wishbook.title }</h5>
								</div>
								<div class="text-secondary">
									저자 : ${wishbook.author } | 출판사 : ${wishbook.publisher } | ISBN : ${wishbook.isbn }
								</div>
								<div class="text-secondary">
									도서관 : ${wishbook.library }
								</div>
							</div>
							
							<div class="d-flex align-items-center pr-3">
								<button class="wishbookaddBtn btn btn-primary" onclick="window.open('/book/bookaddpopup/view?title=${wishbook.title}','new','scrollbars=yes,resizable=no width=500 height=500, left=0,top=0');return false">희망도서 추가</button>
							</div>
						
						</div>
						
						<hr>
					</c:forEach>
					
		
		
			
				</div>
			
				<!--  
				<div class="text-center">
					<a href="#" class="btn btn-primary" onclick="window.open('/book/bookaddpopup/view','new','scrollbars=yes,resizable=no width=500 height=500, left=0,top=0');return false">도서 검색하기</a>
				</div>
				-->
		
		
		
			</div>
		
		
			<div class="">
				<table class="table">
				<thead>
				<tr>
					<td class="item col-3">신청도서관</td>
					<td class="col-9">
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
						<td class="item">희망도서명</td>
						<td>
						  <form action="/book/bookaddpopup/view?title=${title }" method="get" class="">
							<div class="search d-flex justify-content-center">
				                <input type="text" value="" placeholder="검색어를 입력하세요." id="titleInput" class="form-control" name="title">
				                <div class="input-group-append">
				                	<button type="submit" id ="search" class="btn" onclick="window.open('/book/bookaddpopup/view?title=${wishbook.title}','new','scrollbars=yes,resizable=no width=500 height=500, left=0,top=0');return false">검색</button>
				                </div>
				            </div>
						  </form>
						</td>
					</tr>
					
					<tr>
						<td class="item ">사진</td>
						<td><input type="file" name="file" id="fileInput" class=""><img class="wishbookprofile" width ="40" height="40" src="${wishbook.imagePath}" ></td>
						
					</tr>
					<tr>
						<td class="item ">저자</td>
						<td><input type="text" value="" placeholder="" id="authorInput" class="form-control"></td>
					</tr>
					<tr>
						<td class="item ">출판사</td>
						<td><input type="text" value="" placeholder="" id="publisherInput" class="form-control"></td>
					</tr>
					<tr>
						<td class="item ">발행연도</td>
						<td><input type="text" value="" placeholder="" id="pubyearInput" class="form-control"></td>
					</tr>
					<tr>
						<td class="item">ISBN</td>
						<td><input type="text" value="" placeholder="" id="isbnInput" class="form-control"></td>
					</tr>
					<tr>
						<td class="item">정가</td>
						<td><input type="text" value="" placeholder="" id="priceInput" class="form-control"></td>
					</tr>
					<tr>
						<td class="item">부록 여부</td>
						<td><input type="text" value="" placeholder="" id="appendixInput" class="form-control"></td>
					</tr>
					<tr>
						<td colspan="2"class="text-center"><button id ="addBtn" class="btn btn-primary	">추가하기</button></td>
							
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
	<script>
		$(document).ready(function(){
			
			

			
			
			
			$("#addBtn").on("click", function(){
				
				
				let title = $("#titleInput").val();
				let library = $("#librarySelector").val();
				let file = $("#fileInput")[0];
				let author = $("#authorInput").val();
				let publisher = $("#publisherInput").val();
				let price = $("#priceInput").val();
				let isbn = $("#isbnInput").val();
				let pubyear =$("#pubyearInput").val();
				let appendix = $("#appendixInput").val();
				
				var result = confirm("추가 하시겠습니까?");
				
				if(appendix == ""){
					
					alert("부록물을 입력하세요.");
					return ;
				}
				
				if(result){
					//alert(""); 아무것도 안쓰면 바로 추가성공이 뜬다.
				} else {
					return ;
				}
	
				//alert(title);
				//alert(library);
				//alert(file);
				//alert(author);
				//alert(publisher);
				//alert(price);
				//alert(isbn);
				//alert(pubyear);
				//alert(appendix);
				
				var formData = new FormData();
				formData.append("title", title);
				formData.append("library", library);
				formData.append("file", file.files[0]);
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
					
					, success:function(data){
						
							
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