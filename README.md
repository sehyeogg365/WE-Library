# WE-Library
두번째 프로젝트

## 📖목차
  * [개발환경](#개발환경) <br>
  * [Skills](#Skills)<br>
  * [ERD](#ERD)<br>
  * [만든계기](#만든계기)<br>
  * [화면구성](#화면구성)<br>
  * [핵심기능](#핵심기능)<br>
    * [희망도서 신청](#희망도서-신청)
    * [희망도서 추가](#희망도서-추가)
    * [체크박스 검색](#체크박스-검색)
    * [대출&반납](#대출반납)
    * [반납연장](#반납연장)
    * [예약&취소](#예약취소)
    * [상호대차 신청&취소](#상호대차신청취소)

## 개발환경
<div class="d-flex">
 <img src="https://img.shields.io/badge/Spring-6DB33F?style=flat-square&logo=Spring&logoColor=white"/>
 <img src="https://img.shields.io/badge/MySQL-4479A1?style=flat-square&logo=MySQL&logoColor=white"/>
 <img src="https://img.shields.io/badge/Sourcetree-0052CC?style=flat-square&logo=Sourcetree&logoColor=white"/>
 <img src="https://img.shields.io/badge/Intellij IDEA-000000?style=flat-square&logo=Intellij IDEA&logoColor=white"/> 
</div>

 ## Skills💪
 JAVA
 <img src="https://img.shields.io/badge/JAVA-4479A1?style=flat-square&logo=JAVA&logoColor=white"/>
  
 HTML5  
<img src="https://img.shields.io/badge/HTML5-E34F26?style=flat-square&logo=HTML5&logoColor=white"/>
 
 CSS3
 <img src="https://img.shields.io/badge/CSS3-1572B6?style=flat-square&logo=CSS3&logoColor=white"/>
  
JAVASCRIPT 
<img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat-square&logo=JavaScript&logoColor=white"/>
  
  
JQuery
<img src="https://img.shields.io/badge/jQuery-0769AD?style=flat-square&logo=jQuery&logoColor=white"/>
  
  
MY SQL
<img src="https://img.shields.io/badge/MySQL-4479A1?style=flat-square&logo=MySQL&logoColor=white"/>
  
Jsp Servlet
<img src="https://img.shields.io/badge/JSP Servlet-232F3E?style=flat-square&logo=JSP Servlet&logoColor=white"/>
  
  
Spring Boot
<img src="https://img.shields.io/badge/Spring Boot-6DB33F?style=flat-square&logo=Spring Boot&logoColor=white"/>
  
Bootstrap
<img src="https://img.shields.io/badge/Bootstrap-7952B3?style=flat-square&logo=Bootstrap&logoColor=white"/>

Git Hub
<img src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=GitHub&logoColor=white"/>
  
AWS
<img src="https://img.shields.io/badge/aws-232F3E?style=flat-square&logo=amazonwebservices&logoColor=white"/>

Gradle
<img src="https://img.shields.io/badge/Gradle-02303A?style=flat-square&logo=Gradle&logoColor=white"/>

백엔드
* Java 11
* SpringBoot 3.4.0

프론트엔드
* Html5/css3
* Javascript
* Bootstrap 5

빌드 툴
* Gradle

데이터베이스
* MySQL

인프라
* AWS EC2

라이브러리
* 네이버 지도 api 

<a href="https://www.miricanvas.com/v/12dnr9i">포트폴리오</a><br>
<a href="https://docs.google.com/spreadsheets/d/1xFP0xoNL0dEIKLUXPe7yj9DetWB0BLAEIzzqgqNE1dI/edit?gid=0#gid=0">설계서</a>

## ERD
<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FC5Gq3%2FbtsKYzI86aE%2Fj01RadikOUJrSUJkefVpiK%2Fimg.png"/>

## 만든계기
도서관 홈페이지에 대한 실제 서비스를 알아보고 싶었고, 이 기능들을 구현할 때 어떻게 구현되는지에 대한 호기심이 생겼으며, 코딩에 대한 강력한 열정이 있었습니다.

## 화면구성
| 회원가입 | 로그인화면 | 메인페이지 | 희망도서추가화면 |
| ----------------------- | ----------------------- | ----------------------- | ----------------------- |
|<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fb8HyDL%2FbtsKX3efQmZ%2FOqymD0c1GRuHNpwMMw6Ke0%2Fimg.png" width="200px" height="200px"/>| <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcLWbOf%2FbtsKYxMDC7F%2F2kmbaLVO7qYaG2a7VVtfkk%2Fimg.png" width="200px" height="200px"/>| <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fb8hGCT%2FbtsKZAV6OfQ%2F8wO4eDJN4Wdq52e6yImIZ0%2Fimg.png" width="200px" height="200px"/>  | <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FeAye7Q%2FbtsKX7HEHyC%2F9Zq04cOGKEfqV3LgE5Htkk%2Fimg.png" width="200px" height="200px"/> |

| 카카오api | 희망도서리스트 | 도서리스트 | 상세정보창 |
| ----------------------- | ----------------------- | ----------------------- | ----------------------- |
|<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcRwwCG%2FbtsK0mv23nz%2FFuZ2X9WFc7xOyr1sDu92G1%2Fimg.png" width="200px" height="200px"/>| <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdRruXX%2FbtsKYxZ9mqX%2FEUIONYbJ9xw9AiHZKs4YEK%2Fimg.png" width="200px" height="200px"/>| <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FTwCC3%2FbtsKZCl4FT1%2FcbPwQKF1kS3UjgYsD9wBhk%2Fimg.png" width="200px" height="200px"/>  | <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FC5WcS%2FbtsKY17J8ui%2FIjemhKT0lD4rCrcQy6mUdk%2Fimg.png" width="200px" heighth="200px"/> |

| 아이디/비번찾기 | 비밀번호 확인 | 마이페이지 | 비밀번호 변경 |
| ----------------------- | ----------------------- | ----------------------- | ----------------------- |
|<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FQUPIA%2FbtsKZuohSyF%2FpxEfugyRUGQJ1CiXHZYt4k%2Fimg.png" width="200px" height="200px"/>| <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FWpuIQ%2FbtsKZc82oXT%2FE3k19E6lxjNcZQeMwpt3Pk%2Fimg.png" width="200px" height="200px"/>| <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fb63SGy%2FbtsKX6BWFk9%2FzNUxgEtDfI9UDr7OT3m7H0%2Fimg.png" width="200px" height="200px"/>  | <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbE4CWN%2FbtsKYFcNbd5%2FjSfw1LwKJ6Bp6S8hpINSP0%2Fimg.png" width="200px" heighth="200px"/> |

| 대출목록 | 예약목록 | 관심도서목록 | 상호대차목록 |
| ----------------------- | ----------------------- | ----------------------- | ----------------------- |
|<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fbz5KP4%2FbtsKYzKqaqV%2FYOcoU5rFkdb6gS6KLSK6e1%2Fimg.png" width="200px" height="200px"/>| <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbxO51F%2FbtsKY1GIoJr%2FmpJSFfxJ1odRT3FYKt7NU0%2Fimg.png" width="200px" height="200px"/>| <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2F1aFye%2FbtsKYrMA8Xs%2Fi8sHUwbE747cP3KvYSfL01%2Fimg.png" width="200px" height="200px"/>  | <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fw50qu%2FbtsKYBarDCC%2FvKks8KlXFpkER7NMeKuJO1%2Fimg.png" width="200px" heighth="200px"/> |


## 핵심기능⭐

### 희망도서 신청
희망도서를 신청하기 위해서 우선 로그인이 필요하며, 로그인하지 않을 시, 접속 자체가 안된다.

이미지 파일이 필수며, 유효성 검사에서 추가시켰다.

이미지 파일, 도서관, 도서명, 제목, 작가, 출판사, 가격, isbn, 출판일을 입력해야만 한다.

우선적으로 사용자 id는 누가 도서를 신청했는지 알 필요 있어서 컬럼에fk로 추가했다.

그리고 비즈니스 로직을 관리하는 클래스에서 파일을 저장시키게 하는 파일매니저 서비스 메서드를 사용해서
파일명이 중복이 안되게끔 아이디 값을 넣어서 저장을 시켰다.

### 희망도서 추가
사용자 페이지에서 신청한 모든 희망도서리스트를 조회할 수 있다.

해당 희망도서가 추가가 됐는지 여부 또한 확인이 가능하다.

밑에 빈칸의 값들 도서관, 제목, 이미지, 작가, 출판사, 가격, isbn, 출판년도, 부록 여부를 입력하면
추가가 된다.

그리고 비즈니스 로직을 관리하는 클래스에서 파일을 저장시키게 하는 파일매니저 서비스 메서드를 사용한다. 파일명이 중복이 안되게끔 가격 값을 넣어서 저장을 시켰다.

api 서 추가된 행의 개수 결과가 1이냐 아니냐에 따라 result라는 키로 success fail 형태 값으로 전달한다. 제이슨 문자열로 리스폰스를 통해서


### 체크박스 검색
도서 검색 리스트에서 체크박스를 선택하여 도서관들을 선택할 수 있습니다.

전체 선택 시 모든 체크박스가 선택되며, 하나라도 체크박스가 선택 안되었을 시에 

전체 체크박스가 자동으로 지워집니다.

체크박스로 도서관 명을 선택한 후 검색 버튼을 눌렀을 시 본인이 조회하고자 하는 도서관의 책을 볼 수 있습니다.


<h3 id="대출반납">대출&반납</h3>
도서 리스트에서 대출 버튼을 누르거나 상세 정보 창에서 버튼을 누르면 해당 도서가 대출 목록에 추가가 된다.

해당 도서가 대출 중이거나 상호대차 중일 때는 대출이 불가능하다.

대출은 해당 도서의 책 id를 파라미터로 받아왔다.

하나의 대출 목록의 카드 한 장에 있는 반납 버튼을 누르면

해당 도서가 대출 목록에서 삭제가 되는 기능이다.

논현 도서관의 모두의 파이썬 도서의 반납 버튼을 누르니 해당 도서가 목록에서 삭제되는 모습이다.

대출도서 id 값을 파라미터로 잡은 후 해당하는 id의 대출도서를 삭제한다.


### 반납연장
하나의 대출 목록의 카드 한 장에 있는 반납 연장 버튼을 누르면
해당 도서의 반납 예정일이 1주일 연장되는 기능이다.
모두의 파이썬 도서의 반납 연장 버튼을 눌렀다.
해당 도서의 반납 연장 일이 1주 연장되는 모습이다.

대출도서 id 값을 파라미터로 잡은 후 해당하는 id의 대출도서의 반납일을 연장한다.
한번 반납 연장이 되면, 반납 연장 불가 버튼이 뜨게 해 반납 연장을 못 하게 하며,
상태 문구 또한 대출 중->반납연장 됨 으로 바뀌게 했다.
더 나아가,  오늘날짜가 반납예정일 을 지났으면, 반납연체라는 문구가 뜬다.


<h3 id="예약취소">예약&취소</h3>
도서 리스트에서 예약 버튼을 누르거나 상세 정보 창에서 버튼을 누르면
해당 도서가 예약 목록에 추가가 된다.
해당 도서가 대출 중이거나 상호대차 중일 때만 예약이 가능하다.
예약은 해당 도서의 책 id를 파라미터로 받아왔다.
도서 리스트에서 예약 버튼을 누르거나 상세 정보 창에서 버튼을 누르면 해당 도서가 예약 목록에 추가가 된다.
해당 도서가 대출 중이거나 상호대차 중일 때만 예약이 가능하다.
예약 목록 조회는 예약 id 내림차순으로 최근에 예약한 순서대로 조회할 수 있게 구현을 했다.

하나의 예약 목록의 카드 한 장에 있는 예약 취소 버튼을 누르면
해당 도서가 예약 목록에서 삭제가 되는 기능이다.
모두의 c언어 도서의 예약 취소 버튼을 눌렀다.
해당 도서가 목록에서 삭제되는 모습이다.
예약 도서 id 값을 파라미터로 잡은 후 해당하는 id의 예약 도서를 삭제한다.

<h3 id="상호대차신청취소">상호대차신청&취소</h3>
상호대차 리스트에서  상호대차 도서 카드 버튼 내의 수령 버튼을 누르면 수령 여부를 묻는다.
확인 버튼을 누르면 수령이 되면서 대출 목록에 추가가 된다. 
수령받은  상호대차 도서에는 상태가 요청된 자료에서 수령 완료로 바뀐다.
그리고 수령/ 취소 버튼 대신에 취소불가 버튼이 뜨게 된다. 
대출 목록에도 상호대차 수령받은 도서가 추가가 된다. 상호대차 날짜가 아닌 수령한 날짜가 대출 날짜가 된다. 

상호대차 리스트에서  상호대차 도서 카드 버튼 내의 취소 버튼을 누르면 취소 여부를 묻는다.
확인 버튼을 누르면 취소가 되면서 상호대차 목록에 삭제가 된다. 
아직 수령받지 않은 도서만 취소가 가능하다.








