<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서관 추가창 팝업</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.4.min.js"
	integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

</head>
<body>

	<!-- bootstrap input group 검색 -->
	<div class="search d-flex justify-content-center">
		<input id="titleInput" type="text" placeholder="도서명 또는 저자명을 입력해주세요" class="form-control col-9">
		<div class="input-group-append">
			<button id="search" type="submit" class="btn btn-primary">검색</button>
		</div>
	</div>
	
	<div class="book-card d-flex">
		<div class="">
			<p class="thumbnail"></p>
		</div>
		<div class="">
			<p class="title"></p>
			<p class="author"></p>
			<p class="publisher"></p>
			<p class="year"></p>
			<p class="isbn"></p>
			<p class="price"></p>
			<p class="button"><button class="btn interestAddBtn">희망도서 신청</button></p>
		</div>
		
		
	</div>


</body>
<script>
	$(document).ready(function() {
		
		
		$(".interestAddBtn").on("click", function(){
			
			let title = $("#titleInput").val();

			let book = JSON.parse($(this).data("book"));

			if (title == "") {

				alert("제목을 입력해주세요.");
				return;
			}
			// 부모 창의 입력 필드에 값 설정

            window.opener.document.getElementById("titleInput").value = book.title;
            window.opener.document.getElementById("authorInput").value = book.authors.join(", ");
            window.opener.document.getElementById("publisherInput").value = book.publisher;
            window.opener.document.getElementById("pubyearInput").value = book.datetime.substring(0, 4);
            window.opener.document.getElementById("isbnInput").value = book.isbn;
            window.opener.document.getElementById("priceInput").value = book.price;
            window.opener.document.querySelector(".wishbookprofile").src = book.thumbnail;

            // 팝업 창 닫기
            window.close();
			
		});

		$("#search").on("click", function() {

			let title = $("#titleInput").val();

			if (title == "") {

				alert("제목을 입력해주세요.");
				return;
			}
			
			$.ajax({
				method : "GET",//post->get
				url : "https://dapi.kakao.com/v3/search/book?target=title",// 전송주소 변경
				data : { query: $("#titleInput").val()}, // query 미움받을 용기
				headers:{Authorization: "KakaoAK 08b2336b349cf3687a2b5cc1c1c9f48e"}//헤더 정보로 api키 전달 포함 키는 REST API 키 넣기
			}).done(function(msg) {
				//alert("Data Saved: " + msg);
				console.log(msg.documents[0].title);//제목
				console.log(msg.documents[0].thumbnail);//썸네일
				console.log(msg.documents[0].isbn);//isbn
				console.log(msg.documents[0].price);//price
				console.log(msg.documents[0].publisher);//publisher
				console.log(msg.documents[0].authors);//authors
				console.log(msg.documents[0].datetime);//datetime
				console.log(msg.documents[0].button);
				
				$( ".title" ).append( "<strong>"+"제목:"+msg.documents[0].title+"</strong>" );//여기에 제목 코드를 붙여 넣는다.
				$( ".thumbnail" ).append( "<img src='"+msg.documents[0].thumbnail+"'/><br>" );//여기에 썸네일 코드를 붙여 넣는다.
				$( ".isbn" ).append( "<strong>"+"ISBN:"+msg.documents[0].isbn+"</strong><br>" );//여기에 isbn 코드를 붙여 넣는다.
				$( ".price" ).append( "<strong>"+"가격:"+msg.documents[0].price+"</strong><br>" );//여기에 가격 코드를 붙여 넣는다.
				$( ".publisher" ).append( "<strong>"+"발행사:" + msg.documents[0].publisher+"</strong><br>" );//여기에 출판사 코드를 붙여 넣는다.
				$( ".author" ).append( "<strong>"+"작가:"+msg.documents[0].authors+"</strong>" );//여기에 작가 코드를 붙여 넣는다.
				$( ".year" ).append( "<strong>"+"발행년도:"+msg.documents[0].datetime.substring(0,4)+"</strong>" );//여기에 작가 코드를 붙여 넣는다.
				//$( ".button" ).append( "<button>" +희망도서 신청+"</button>" );//여기에 작가 코드를 붙여 넣는다.
			
			});
			

		});
		

	});
</script>
</html>