<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WE-Library 도서 리스트 화면</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<!-- 아이콘 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	
	<!-- 2024-02-16 추가내용 페이지네이션 -->
	<link rel="stylesheet" type="text/css" media="screen" href="/resources/css/tui-grid/tui-pagination.css">

</head>
<body>
	<div id="wrap" class="">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<section class="contents d-flex justify-content-center">
		
		<div class="librarylist-page">
			<div class="sub-profile bg-secondary">
				<c:import url="/WEB-INF/jsp/include/subprofile.jsp"/>
				
				<div class="sub-text">
					<h2 class="text-center text-white mt-3"><b>간략검색</b></h2>
				</div>
			</div>

		<div class="searchbox">
			<form action="/library/list/view" method="get" class=""><!-- bootstrap input group 검색 -->
                <nav class="bg-primary booksearch-nav d-flex justify-content-center align-items-center col-10">
                    <div class="text-white col-2">
                        <h5>통합검색</h5>
                    </div>
                    <div class="search d-flex justify-content-center col-9">
                    <!-- 0건일때랑 아닐때로 나눠야 함 제목 입력여부가 아니라 -->

                    <input type="text" value="" placeholder="검색어 입력" id="searchInput"class="form-control" name="title">

                     <div class="input-group-append">
                          <button type="submit" id="searchBtn" class="btn">검색</button>
                     </div>
                    </div>
                </nav>
		    	 <div class="d-flex align-items-center col-10 mt-3" style= "margin-left:83.338px;">
		    	    <h5 id ="result" class="text-primary"> </h5>
		        	<h5 class="">에 대한 검색 결과
					<c:forEach var="book" begin="0" end="0" items="${bookCountList }">
                        ${book.numberCount }건이 검색되었습니다.
                        <c:if test = "${bookCountList} == null">
                            0건이 검색되었습니다.
                        </c:if>
					</c:forEach>
					</h5>
					<!-- <div> ${book}</div>건 -->
		        </div>
		    <hr style="border: solid 1px;">
		   		<div class="mt-3 library-selectbox col-10">
		   		<label class=""><input type="checkbox" id="allCheck" class="ck-all mr-2">전체 선택</label> <br>
		   		<hr>
			   		<div class="d-flex align-items-center">
				        <label class=""><input type="checkbox" name="libraryList" value="역삼푸른솔도서관" class="ck mr-2">역삼푸른솔도서관</label>
				        <label class="ml-4"><input type="checkbox" name="libraryList" value="역삼도서관" class="ck mr-2">역삼도서관</label>
				        <label class="ml-4"><input type="checkbox" name="libraryList" value="행복한 도서관" class="ck mr-2">행복한 도서관</label>
				        <label class="ml-4"><input type="checkbox" name="libraryList" value="논현 도서관" class="ck mr-2">논현 도서관</label>
				        <label class="ml-4"><input type="checkbox" name="libraryList" value="대치 도서관" class="ck mr-2">대치 도서관</label>
			    		<div class="ml-4"><button class="btn btn-sm btn-secondary">적용하기</button></div>
			    	</div>
		    	</div>
			</form>
		</div>
		
		<div class="bookcard-list">
<<<<<<< HEAD
		
		<c:forEach var="book" items="${bookDetailList }">
			<hr>
			<div class="bookcard d-flex ">
			
				<div class="bookimg-box">
					
					<a href="/library/bookinfo/view?id=${book.id }" class="book-profile">
						<img class="profile" src="${book.imagePath }">
					</a>
				</div>	
				
				<div class="book-card-body ml-2">		
					<div class="">
						<h5>${book.title }</h5>
						<h5>${book.id }</h5>
					</div>
					<div class="text-secondary">
						저자 : ${book.author } &nbsp|&nbsp 출판사 : ${book.publisher } &nbsp|&nbsp 발행년도 : ${book.pubyear }
					</div>
					<div class="text-secondary">
					ISBN : ${book.isbn }
					</div>
					<div class="text-secondary">
						도서관 : ${book.library } &nbsp|&nbsp 부록 : ${book.appendix }
					</div>
					<div class=" book-status text-secondary d-flex justify-content-between">
						<div class="d-flex align-items-center"><!-- 대출중일때 대출불가 예약 -->
						
							<c:choose>
									<c:when test = "${book.borrow }" >
										<button class="btn btn-info btn-sm" ><i class="bi bi-bookmark-plus"></i>대출불가[대출중]</button> <div class="">예약인원 ${book.reserveCount } 명</div>
									</c:when>
									<c:when test="${book.interibrary }">
										<button class="btn btn-info btn-sm" ><i class="bi bi-bookmark-plus"></i>대출불가[상호대차중]</button> <div class="">예약인원 ${book.reserveCount } 명</div>
									</c:when>
									<c:otherwise>
										<button id ="borrowBtn"class="btn btn-info btn-sm borrowBtn" data-book-id="${book.id }"><i class="bi bi-bookmark-plus"></i>대출하기</button>
									</c:otherwise>
								</c:choose>
							
						</div>
						<div class="mr-2">	<!-- 대출가능일때 예약불가 --><!-- 상호대차중일때 상호대차불가 -->
						
							<c:choose>
								<c:when test="${book.borrow }">
									<button class="btn btn-danger btn-sm reserveBtn" data-book-id="${book.id }"><i class="bi bi-journal-arrow-down"></i>도서 예약신청</button>
								</c:when>
								<c:when test="${book.interibrary }">
									<button class="btn btn-danger btn-sm reserveBtn" data-book-id="${book.id }"><i class="bi bi-journal-arrow-down"></i>도서 예약신청</button>
								</c:when>
								<c:when test="${book.reserve }">
									<button class="btn btn-danger btn-sm" ><i class="bi bi-journal-arrow-down"></i>예약불가</button>
								</c:when>
								<c:otherwise>
									<button class="btn btn-danger btn-sm" ><i class="bi bi-journal-arrow-down"></i>예약불가</button>
								</c:otherwise>
							
							</c:choose>
							<c:choose>
								<c:when test="${book.borrow }">
									<a href="#"class="btn btn-success btn-sm interibraryAddBtn"><i class="bi bi-shuffle"></i>상호대차 신청 불가</a> 
								</c:when>
								<c:when test="${book.interibrary }">
									<a href="#"class="btn btn-success btn-sm interibraryAddBtn" ><i class="bi bi-shuffle"></i>상호대차 신청 불가</a> 
								</c:when>
								<c:otherwise>
									<a href="/library/interibrarypopup/view?id=${book.id }"class="btn btn-success btn-sm interibraryAddBtn" onclick="window.open('/library/interibrarypopup/view?id=${book.id}','new','scrollbars=yes,resizable=no width=500 height=500, left=0,top=0');return false"><i class="bi bi-shuffle"></i>상호대차 신청</a> 
								</c:otherwise>
							
							</c:choose>
							
							<button class="btn btn-primary btn-sm interestAddBtn" data-book-id="${book.id }"><i class="bi bi-download"></i>관심도서 담기</button>
						</div>
					</div>
				</div>
				
			</div>
			
			</c:forEach>
			<hr>
			
		</div>
=======
            <c:forEach var="book" items="${bookDetailList }">
                <hr>
                <div class="bookcard d-flex ">
                    <div class="bookimg-box">
                        <a href="/library/bookinfo/view?id=${book.id }" class="book-profile">
                            <img class="profile" src="${book.imagePath }">
                        </a>
                    </div>
>>>>>>> develop

                    <div class="book-card-body ml-2">
                        <div class="">
                            <h5>${book.title }</h5>
                        </div>
                        <div class="text-secondary">
                            저자 : ${book.author } &nbsp|&nbsp 출판사 : ${book.publisher } &nbsp|&nbsp 발행년도 : ${book.pubyear }
                        </div>
                        <div class="text-secondary">
                        ISBN : ${book.isbn }
                        </div>
                        <div class="text-secondary">
                            도서관 : ${book.library } &nbsp|&nbsp 부록 : ${book.appendix }
                        </div>
                        <div class=" book-status text-secondary d-flex justify-content-between">
                            <div class="d-flex align-items-center"><!-- 대출중일때 대출불가 예약 -->
                                <c:choose>
                                    <c:when test = "${book.borrow }" >
                                        <button class="btn btn-info btn-sm" ><i class="bi bi-bookmark-plus"></i>대출불가[대출중]</button> <div class="">예약인원 ${book.reserveCount } 명</div>
                                    </c:when>
                                    <c:when test="${book.interibrary }">
                                        <button class="btn btn-info btn-sm" ><i class="bi bi-bookmark-plus"></i>대출불가[상호대차중]</button> <div class="">예약인원 ${book.reserveCount } 명</div>
                                    </c:when>
                                    <c:otherwise>
                                        <button id ="borrowBtn"class="btn btn-info btn-sm borrowBtn" data-book-id="${book.id }"><i class="bi bi-bookmark-plus"></i>대출하기</button>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="mr-2">	<!-- 대출가능일때 예약불가 --><!-- 상호대차중일때 상호대차불가 -->
                                <c:choose>
                                    <c:when test="${book.borrow }">
                                        <button class="btn btn-danger btn-sm reserveBtn" data-book-id="${book.id }"><i class="bi bi-journal-arrow-down"></i>도서 예약신청</button>
                                    </c:when>
                                    <c:when test="${book.interibrary }">
                                        <button class="btn btn-danger btn-sm reserveBtn" data-book-id="${book.id }"><i class="bi bi-journal-arrow-down"></i>도서 예약신청</button>
                                    </c:when>
                                    <c:when test="${book.reserve }">
                                        <button class="btn btn-danger btn-sm" ><i class="bi bi-journal-arrow-down"></i>예약불가</button>
                                    </c:when>
                                    <c:otherwise>
                                        <button class="btn btn-danger btn-sm" ><i class="bi bi-journal-arrow-down"></i>예약불가</button>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${book.borrow }">
                                        <a href="#"class="btn btn-success btn-sm interibraryAddBtn"><i class="bi bi-shuffle"></i>상호대차 신청 불가</a>
                                    </c:when>
                                    <c:when test="${book.interibrary }">
                                        <a href="#"class="btn btn-success btn-sm interibraryAddBtn" ><i class="bi bi-shuffle"></i>상호대차 신청 불가</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="/library/interibrarypopup/view?id=${book.id }"class="btn btn-success btn-sm interibraryAddBtn" onclick="window.open('/library/interibrarypopup/view?id=${book.id}','new','scrollbars=yes,resizable=no width=500 height=500, left=0,top=0');return false"><i class="bi bi-shuffle"></i>상호대차 신청</a>
                                    </c:otherwise>
                                </c:choose>
                                <button class="btn btn-primary btn-sm interestAddBtn" data-book-id="${book.id }"><i class="bi bi-download"></i>관심도서 담기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
		    <hr>
		</div>
		</div>
		
		<!--2024-02-16 수정 내용  tui-pagination 추가 -->
		<div id="pagination" class="tui-pagination"></div>

        </div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
		<!--2024-04-04 경로 고치기 <script src="/resources/dist/w2ui/w2ui-1.5.min.js"></script>-->
        <!--2024-04-04 경로 고치기 <script src="/resources/static.css/tui-pagination.js"></script>-->
        <!-- <script src="<%= application.getContextPath() %>/resources/js/plugin/select2/dist/js/select2.min.js"></script> -->
	</div>
	
	<script>
	$(document).ready(function(){
	    // URL 파라미터를 읽어오는 함수
        const url = new URL(window.location.href); //좀더 가독성있게 코드문 고쳐보기
        const urlParams = url.searchParams;//좀더 가독성있게 코드문 고쳐보기

        // URL 파라미터에서 title 값을 읽어옴
        const title = urlParams.get('title');//좀더 가독성있게 코드문 고쳐보기
        console.log("제목 : " + title);
        if (title) { //title 값있을시에 input value값에 그값을 넣는다.
            document.getElementById('searchInput').value = title;
        }

        // URL 파라미터에서 library 값을 읽어옴
        const libraries = urlParams.getAll('libraryList');//좀더 가독성있게 코드문 고쳐보기
        console.log("도서관 : " + libraries);
        if (libraries.length > 0) {
            for(let i = 0; i < libraries.length; i++){
                const library = libraries[i];
                $("input[name='libraryList'][value='" + library + "']").prop("checked", true);
            }

            //console.log(libraries); // 확인용

            if(libraries.length == 5){// 5개일때 전체 선택때 체크
                 $("input[id='allCheck']").prop("checked", true);
            }
        }

        var chkList = $("input[name = libraryList]");

            // 체크된 갯수가 selectedValues.length 보다 작을시 전체 선택 표시 없애기
            const ckAll = document.querySelector(".ck-all");
            const ckArr = document.querySelectorAll(".ck");
            //$('input:checkbox[name="libraryList"]').length//체크박스 전체 갯수

            ckAll.addEventListener("click", () =>{
                ckArr.forEach(ck => {
                    ck.checked = ckAll.checked;
                })
            })

            ckArr.forEach(ck =>{
                ck.addEventListener("click",() =>{
                    let cnt = 0;
                    ckArr.forEach(ck =>{
                        if(ck.checked == true){
                            cnt++;
                        }
                    })

                    if(cnt == ckArr.length){
                        //ckArr.length // ('input:checkbox[name="boardTypeList"]')
                        ckAll.checked = true;
                    } else {
                        ckAll.checked = false;
                    }
                })
            })

        // 파라미터 값을 h5 태그에 넣기
        document.getElementById("result").innerText = title;
		
		 $("#searchBtn").on("click", function(event){
			//var keywords = keyword.split( );// // 검색어를 공백으로 분리하여 각 단어를 배열로 저장
			//var result = []; //검색어를 저장할 배열
	 			
	 		let search = $("#searchInput").val().trim();
	 			
	 		if(search == ""){
	 			alert("검색어를 입력하세요.");
	 			event.preventDefault(); // 폼 제출을 막음
	 		}
	 	});

         $(".reserveBtn").on("click", function(){
        	let id = $(this).data("book-id");
        	 
			var result = confirm("예약 하시겠습니까?");
        	 
        	 if(result){
				//alert(""); 아무것도 안쓰면 바로 추가성공이 뜬다.
			 } else {
				return ;
			 }
        	 
        	 //alert(id);
        	 
        	 $.ajax({
        		 type:"post"
        		 , url:"/book/reservation/create"
        		 , data:{"bookId":id}
        		 , success:function(data){
        			 if(data.result == "success"){
         	 			alert("예약 성공");
         	 			location.reload();
         	 		 } else {
         	 			alert("예약 실패");
         	 		 }
        		 }
        		 , error:function(){
        	 		 alert("예약 에러");
        	 	 }
        	 });
         });

         $(".borrowBtn").on("click", function(){
        	 let id = $(this).data("book-id");

        	 var result = confirm("대출 하시겠습니까?");
        	 
        	 if(result){
				//alert(""); 아무것도 안쓰면 바로 추가성공이 뜬다.
			 } else {
				return ;
			 }

        	 //alert(id);
        	 
        	 $.ajax({
        		 type:"post"
        		 , url:"/book/borrow/create"
        		 , data:{"bookId":id}
        	 	 , success:function(data){
        	 		 if(data.result == "success"){
        	 			alert("대출 성공");
        	 			location.reload();
        	 		 } else {
        	 			alert("대출 실패");
        	 		 }
        	 	 }
        	 	 , error:function(){
        	 		 alert("대출 에러");
        	 	 }
        	 });
         });
         
         $(".interestAddBtn").on("click", function(){
        	 let id = $(this).data("book-id");
        	 // 이것도 한번 된 책이면 두번이상 못누르게 해보기
        	 
			 var result = confirm("관심도서 추가 하시겠습니까?");
        	 
        	 if(result){
				//alert(""); 아무것도 안쓰면 바로 추가성공이 뜬다.
			 } else {
				return ;
			 }
        	 
        	 //alert(id);
        	 
        	 $.ajax({
        		 type:"post"
        		 , url:"/book/interest/create"
        		 , data :{"bookId":id}
        	 	 , success:function(data){
        	 		 if(data.result =="success"){
        	 			 alert("추가 성공");
        	 			location.reload();
        	 		 } else {
        	 			 alert("추가 실패");
        	 		 }
        	 	 }
        	 	 , error:function(){
        	 		 alert("추가 에러");
        	 	 }
        	 });
         });
	});
	</script>
</body>
</html>