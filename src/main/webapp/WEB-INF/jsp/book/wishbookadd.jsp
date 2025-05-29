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
		<div class="mybookinfo-page">
            <div class="sub-profile">
                <c:import url="/WEB-INF/jsp/include/subprofile.jsp"/>
                <div class="sub-text">
                    <h2 class="text-center text-white mt-3"><b>희망도서 신청</b></h2>
                </div>
            </div>
            <div class="d-flex mx-5">
            <c:import url="/WEB-INF/jsp/include/sidenav2.jsp"/>

            <div class="col-9">
            <!-- 신청자 정보 -->
                <div class ="mt-4"><h4><b>신청자 정보</b></h4></div>
                <div class="">
                    <table class="table">
                        <thead>
                            <tr>
                                <td></td>
                                <td></td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="item col-3">신청자명</td>
                                <td class="col-9">${user.name }</td>
                            </tr>
                            <tr>
                                <td class="item">휴대폰 번호</td>
                                <td>${user.phoneNumber }</td>
                            </tr>
                            <tr>
                                <td class="item">이메일</td>
                                <td>${user.email }</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

            <!-- 희망도서 도서 정보 -->
            <div class ="mt-4"><h4><b>희망도서 정보</b></h4></div>
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
                                  <form method="get" action="/book/bookaddpopup/view"  class="popup-form" >
                                    <div class="search d-flex justify-content-center">
                                        <input type="text" value="" placeholder="검색어를 입력하세요." id="titleInput" class="form-control" name="title">
                                        <div class="input-group-append">
                                            <button id="search" type="submit" class="btn" onclick="window.open('/book/bookaddpopup/view?title=','new','scrollbars=yes,resizable=no width=500 height=500, left=0,top=0');return false">검색</button>
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
                        </tbody>
                    </table>
                </div>
                <div class="text-center">
                    <button id="addBtn" class="btn btn-primary my-3" data-user-id="${wishbook.userId }">신청하기</button>
                </div>
            </div>
            </div>
            </section>

            <c:import url="/WEB-INF/jsp/include/footer.jsp"/>

		</div><!-- wrap 위치 수정 -->
    </div>
	<script>
	$(document).ready(function(){

		function openPopup() {
            // 입력창에서 제목 값을 가져옴
            var title = document.getElementById('titleInput').value;

            // URL을 동적으로 생성
            var url = '/book/bookaddpopup/view?title=' + encodeURIComponent(title);

            // 새 창 열기
            window.open(url, 'new', 'scrollbars=yes,resizable=no,width=500,height=500,left=0,top=0');

            // 폼 제출을 막음
            return false;
        }

		$("#search").on("click", function(){
			let title = $("#titleInput").val();

			if(title == ""){
				return;
			}
		});

		$("#addBtn").on("click", function(){
			let id = $(this).data("user-id");
			let library = $("#librarySelector").val();
			let file = $("#fileInput")[0];
			let title = $("#titleInput").val();
			let author = $("#authorInput").val();
			let publisher = $("#publisherInput").val();
			let pubyear = $("#pubyearInput").val();
			let isbn = $("#isbnInput").val();
			let price =  $("#priceInput").val();

			if(library == ""){
				alert("도서관을 선택하세요.");
				return;
			}
			
			if(title == ""){
				alert("제목을 입력하세요.");
				return;
			}

			if(author == ""){
				alert("저자를 입력하세요.");
				return;
			}
			
			if(publisher == ""){
				alert("출판사를 입력하세요.");
				return;
			}
			
			if(pubyear == ""){
				alert("발행년도를 입력하세요.");
				return;
			}
			
			if(isbn == ""){
				alert("ISBN를 입력하세요.");
				return;
			}
			
			if(price == ""){
				alert("정가를 입력하세요.");
				return;
			}
			
			var result = confirm("신청 하시겠습니까?");
			
			if(result){
				
			} else {
				return ;
			}
			
			//alert(library);
			//alert(title);
			//alert(file);
			//alert(author);
			//alert(publisher);
			//alert(pubyear);
			//alert(isbn);
			//alert(price);
			
			var formData = new FormData();
			
			formData.append("id", id);//여기도 로그인id 그냥 id 로 수정
			formData.append("library", library);			
			formData.append("title", title);			
			formData.append("file", file.files[0]);
			formData.append("author", author);
			formData.append("publisher", publisher);
			formData.append("pubyear", pubyear);
			formData.append("isbn", isbn);
			formData.append("price", price);

			$.ajax({
				type:"post"
				, url: "/book/wishbook/create"
				, data:formData//파일이 포함되어있는경우 일반적인 형태:{}로는 전달안된다고 함. 위의 formData.append("file", file.files[0]);이 전달안되서.
				, enctype :"multipart/form-data"
				, processData:false// 파일 업로드 필수(근데 여기선 필수로 하면안됨)
				, contentType:false// 파일 업로드 필수
				, success:function(data){
					if(data.result == "success"){
						location.reload();
						alert("추가 성공");
					} else {
						alert("추가 실패");
					}
				}
				, error:function(){
					alert("추가 오류");
				}
			});
		});
	});
	</script>
	
</body>
</html>