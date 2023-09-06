<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WE-Library 메인화면</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<!-- 아이콘 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	
	<!-- 데이트 픽커 -->
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	
</head>
<body>
	<div id="wrap" class="">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<section class="contents d-flex justify-content-center">
			
			<div class="main-page ">
			<div class="main-profile">
				<div class="img-box">
					<img class="profile" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FlAG5Z%2Fbtsnhr3rPGd%2FKeJ2kZ3AGgbzql1R1aDdr1%2Fimg.jpg" alt="메인로고 사진">
				</div>
				
				<div class="main-text">
					<h3 class="text-center text-white"><b>책과 함께 꿈꾸는 도서관</b></h3><br>
					<h1 class="text-center text-white"><b>WE-Library</b></h1>
				</div>
			</div>	
				<nav class="main-nav d-flex justify-content-center align-items-center col-12">
				<div class="text-white">
					<h5>통합검색</h5>
				</div>
				
				<form action="/library/list/view" method="get" class="col-9"><!-- bootstrap input group 검색 -->
					<div class="search d-flex justify-content-center">
		                <input type="text" value="" placeholder="도서명 또는 저자명을 입력해주세요" id ="searchInput" class="form-control" name="title">
		                <div class="input-group-append">
		                	<button type="submit" id="searchBtn" class="btn">검색</button>
		                </div>
		            </div>
		         </form>
		         </nav>   
				
				<section class="main-section d-flex justify-content-center">
					
					
					<article class="main-contents  col-4">
						<div class=""></div>
						
						<div class="main-login-box col-12">

							<div class=" main-login-box-contents">
							<c:choose>

								<c:when test = "${not empty userId }">
									<div class="mt-3 ml-3"><h3 class="pt-3">${userName} 님 환영합니다!</h3>  </div>
									<div class="text-center">
									<a href="/user/signout" class="btn btn-primary my-3 col-11">로그아웃</a>
									</div>
									<hr>
									<div class="d-flex justify-content-between mt-3">
										<a href="/book/borrowstatus/view?id=${userId }" class="btn btn-light ml-2 col-5">내서재</a>
										<a href="/user/pwcheck/view?id=${userId }" class="btn btn-light mr-2 col-5">정보수정</a>
									</div>
								
								</c:when>
								<c:otherwise>
								
									<div class="mt-3 ml-3"><h4 class="pt-3">로그인</h4></div>
									<div class="d-flex justify-content-center">
										<div class="">
											<input type="text" id="loginIdInput" placeholder="로그인 ID" class="form-control mt-3">
											<input type="password" id="passwordInput" placeholder="비밀번호" class="form-control mt-3">
										</div>
										<div class="ml-1">
											<button type="button" id="loginBtn" class= "loginbtn btn btn-primary mt-2" style="">로그인</button>
										</div>	
									
									</div>
									<div class="d-flex justify-content-center mt-3">
										<div class=""><a href="/user/signup/view" class="text-dark">회원가입</a> |</div>
										<div class="ml-2"><a href="/user/find_id/view" class="text-dark">아이디 찾기</a> |</div>
										<div class="ml-2"><a href="/user/get_pw/view" class="text-dark">비밀번호 재발급</a></div>
									</div>	
								</c:otherwise>
							</c:choose>
							</div>
							
							
						</div>
						
						
						
						<div class="mybook mt-3">
							<div class="d-flex justify-content-between mt-2">
								<div class="pt-3 pl-3"><h4 class="text-white">내 서재</h4></div>
								<div class="pt-3 pr-3">
									<a href="/book/borrowstatus/view?id=${userId }"><i class="bi bi-plus-lg text-white " style="font-size :20px;"></i></a>
								</div>
							</div>
							<div class="d-flex justify-content-between flex-wrap">
								
								<div class="mt-3 pl-3"><a href="/book/borrowstatus/view?id=${userId }" class="text-white">대출조회/반납연기</a></div>
								<div class="ml-5 mt-3 pr-3"><a href="/book/reservelist/view?id=${userId }" class="text-white">예약취소/조회</a></div>
								
								<div class="mt-3 pl-3 text-white"><a href="/book/interibrarybooklist/view?id=${userId }" class="text-white">상호대차신청조회</a></div>
						
								<div class="ml-5 mt-3 pr-3"><a href="/book/wishbook/list/view?id=${userId }" class="text-white">희망도서신청조회</a></div>
								<div class="pl-3 py-3"><a href="/book/interestbooklist/view?id=${userId }" class="text-white">관심도서목록</a></div>
							</div>
						</div>
						
						
					</article>
					<article class="sub-contents col-4">
						<div class=""></div>
						<div class="d-flex justify-content-between mt-3 ">
							<div class="d-flex ">
								<div class=""><a href="#"class="btn btn-light">공지사항</a></div>
								<div class="ml-2"><a href="#" class="btn btn-light">행사안내</a></div>
							</div>
							<div class="">
								<a href="#"><i class="bi bi-plus-lg" style="font-size :20px;"></i></a>
							</div>
							
							
						</div>
						<hr>	
			
						<div class="announce-box"><!-- 21글자가 넘으면 자르담에 뒤에 ... -->
							<div class="d-flex">
							<i class="bi bi-book" style="font-size :20px;"></i>
							<a href="#" class="text-dark"><h5>[역삼푸른솔 도서관]8월 휴관일 안내</h5></a>  
							
							</div>
							<div class="ml-4">2023.07.03</div>
							<hr class="dotted">
							<div class=""><a href="#" class="text-dark">[역삼푸른솔 도서관]분신물폐기 안내</a>  2023.07.03</div>
							<div class=""><a href="#" class="text-dark">[역삼푸른솔 도서관] 7월 휴관일 안내</a>  2023.07.03</div>
							<div class=""><a href="#" class="text-dark">[역삼푸른솔 도서관][신착도서]dddd..</a> 2023.06.29</div>
							<div class=""><a href="#" class="text-dark"></a></div>
							<div class=""><a href="#" class="text-dark"></a></div>
						
						</div>
						
						
					</article>
					<article class="sub-contents2 col-4">
						<div class="table_box bg-white mt-3">
						<div class="">
						<h1>2023 / 09</h1>
						
   						 </div>
						
							<table class="table">
							<thead>
								<tr>
									 <th>일</th>
				                     <th>월</th>
				                     <th>화</th>
				                     <th>수</th>
				                     <th>목</th>
				                     <th>금</th>
				                     <th>토</th>
								</tr>
							</thead>
							<tbody>
								<tr>
				                    <td></td>
				                    <td></td>
				                    <td></td>
				                    <td></td>
				                    <td></td>
				                    <td>1</td>
				                    <td>2</td>
				                </tr>
				                <tr>
				                    <td class="text-danger">3</td>
				                    <td><i class="bi bi-circle-fill text-info"></i>4</td>
				                    <td>5</td>
				                    <td>6</td>
				                    <td>7</td>
				                    <td>8</td>
				                    <td>9</td>
				                </tr>
				                <tr>
				                    <td class="text-danger">10</td>
				                    <td><i class="bi bi-circle-fill text-info"></i>11</td>
				                    <td>12</td>
				                    <td>13</td>
				                    <td>14</td>
				                    <td>15</td>
				                    <td>16</td>
				                </tr>
				                <tr>
				                    <td class="text-danger">17</td>
				                    <td><i class="bi bi-circle-fill text-info"></i>18</td>
				                    <td>19</td>
				                    <td>20</td>
				                   	<td>21</td>
				                    <td>22</td>
				                    <td>23</td>
				                </tr>
				                <tr>
				                    <td class="text-danger">24</td>
				                    <td><i class="bi bi-circle-fill text-info"></i>25</td>
				                    <td>26</td>
				                    <td>27</td>
				                    <td>28</td>
				                    <td>29</td>
				                    <td>30</td>
				                  
				                </tr>
							
							</tbody>
							
							</table>
						
							<div class="d-flex">
								<div class="">
									행사일 <i class="bi bi-square-fill text-warning"></i>
								</div>
								<div class="">
									휴관일 <i class="bi bi-circle-fill text-info"></i>
								</div>
								
							
							</div>
						
						</div>
					</article>
					
				
				</section>
				<section class="sub-section d-flex">
					
					<div class="tab">
					  <button class="tablinks" onclick="openCity(event, 'London')">London</button>
					  <button class="tablinks" onclick="openCity(event, 'Paris')">Paris</button>
					  <button class="tablinks" onclick="openCity(event, 'Tokyo')">Tokyo</button>
					</div>
					
					<div id="London" class="tabcontent">
					  <h3>London</h3>
					  <p>London is the capital city of England.</p>
					</div>
					
					<div id="Paris" class="tabcontent">
					  <h3>Paris</h3>
					  <p>Paris is the capital of France.</p> 
					</div>
					
					<div id="Tokyo" class="tabcontent">
					  <h3>Tokyo</h3>
					  <p>Tokyo is the capital of Japan.</p>
					</div>
					
					
				</section>
				
			</div>
		
		
		</section>
		
		
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	<style>
		.loginbtn{
			width:110px;
			height:110px;
		}
	</style>
	<script>
	$(document).ready(function(){
		
		
		function openCity(evt, cityName) {
			  var i, tabcontent, tablinks;
			  tabcontent = document.getElementsByClassName("tabcontent");
			  for (i = 0; i < tabcontent.length; i++) {
			    tabcontent[i].style.display = "none";
			  }
			  tablinks = document.getElementsByClassName("tablinks");
			  for (i = 0; i < tablinks.length; i++) {
			    tablinks[i].className = tablinks[i].className.replace(" active", "");
			  }
			  document.getElementById(cityName).style.display = "block";
			  evt.currentTarget.className += " active";
			}
		
		 $("#dateOption").datepicker({
			 
			 dateFormat:"yy년 mm월 dd일",
			 
		 });
		 
		 
		
		
		$("#searchBtn").on("click", function(){
			
			//var keywords = search.split(" ");// // 검색어를 공백으로 분리하여 각 단어를 배열로 저장
			 
			//var result = []; //검색어를 저장할 배열
		
			//var data = [];
			
			
			let search = $("#searchInput").val();
			
			if(search == ""){
				alert("검색어를 입력하세요.");
				location.reload();
				return ;
			}
			
			
			
			
			
		});
		
		$("#loginBtn").on("click", function(){
			let id = $("#loginIdInput").val();
			let password = $("#passwordInput").val();
	
			if(id == ""){
				alert("아이디를 입력하세요.");
				return;
				
			}
			
			if(password == ""){
				alert("비밀번호를 입력하세요.");
				return;	
			}
			
			//alert(id);
			//alert(password);
			
			$.ajax({
				type:"post"
				, url: "/user/signin"
				, data: {"loginId": id, "password":password}
				, success:function(data){
					if(data.result == "success"){
						location.href="/library/main/view";
						alert("로그인 성공");
					} else {
						alert("아이디/비밀번호가 일치하지 않습니다.");
					}
				}
				,error:function(){
					alert("로그인 에러");
				}
			
			});
		
		
		
		
		});
		
		
		
	});
	
	
	</script>
	
</body>
</html>