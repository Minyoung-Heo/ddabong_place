<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(window).on('scroll', function() {
		      scrollF();
		    });

		    function scrollF() {
		      if ($(window).scrollTop() > 100) {
		        document.getElementById('topnav').style.top = '0';
		      } else {
		        document.getElementById('topnav').style.top = '-200px';
		        $(".menu_div").css("display", "none");
		        
		      }
		    }
		    
		    $(".menu_icon").click(function() {
		    	$(".menu_div").toggle();
		    });
		
	//검색창 입력값 전송부분.
		$("#searchbtn").click(function() {
			var searchValue = $("#searchValue").val();
			$.ajax({
				type : "post",
				async : true,
				url : "/search", //홈컨트롤러 search메소드 실행
				data : {
					"searchValue" : searchValue
				//검색 입력값 저장
				},
				success : function(response) {
					if (response === "success") {
						window.location.href = "/searchlist.jsp"; //성공시 searchlist.jsp로 이동
					} else {
						alert("검색 실패");
					}
				}

			});
		});
	});
	
</script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
            charset="utf-8"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    
<meta charset="UTF-8">
<style type="text/css">
#topnav {
top:-200px;
width: 100%;
height: 80px;
background-color: white;
position: fixed;
opacity: 1;
display: flex;
padding: 5px;
z-index: 1000;
transition: top 0.2s;
}
#topnav > .tvl > a {
font-size: 20px;
margin-top:25px;
color: #ff8c00;
}
#topnav > .tvl > a:hover {
text-decoration: none;
}
.menu_icon {
cursor:pointer;
}
.menu_div {
margin-left:15px;
  background-color:#ff8c00;
  position: fixed;
  border-radius: 19px;
  display:none;
  top: 100px;
  left: 0;
  height: auto;
  width: auto;
  overflow-y: auto;
  font-size: 35px;
  z-index: 1000;
  padding:40px;
  border:3.3px solid #ff8c00;
}
.menu_div > a {
margin-top: 20px;
color:white;
text-decoration: none;
}
.menu_div a:hover {
color:#ffe8cc;
}

.menu_div::before {
  border-color: #ff8c00 transparent; 
  border-style: solid;
  border-width: 0 15px 22px 15.5px;
  content: '';
  display: block;
  left: 40px;
  position: fixed;
  top: 87px;
  width: 0;
  z-index: 1100;
}
</style>
</head>

<header>
	<a href="main"><img class="header2" src="/dda/image/DDAlogo.png"
		width="450px"></a>
	<div class="login">
		<c:choose>
			<c:when test="${personalloginstate == true}">
				<a href="personalpwcheck"> ${personal.nickname } 님 어서오세요.</a>
				<a href="personallogout"> 로그아웃</a>
			</c:when>

			<c:when test="${storeloginstate == true}">
				<a href="storepwcheck">${store.ceo } 대표님 어서오세요.</a>
				<a href="storelogout">로그아웃</a>
			</c:when>

			<c:otherwise>
				<a href="selectJoin">회원가입</a>
				<a href="selectLogin">로그인</a>
			</c:otherwise>
		</c:choose>
	</div>
	 <form action="search" method="post">
        <div class="search">
            <input class="in2" type="text" placeholder="검색어 입력" name="searchValue" id="searchValue">
      <button id="searchbtn"></button>
        </div>
        </form>
        
        <div id="topnav"> 
        <img class="menu_icon" src="/dda/image/menu.png" width="35px" style="margin-left:30px; margin:15px;"> 
        <a style="margin-top:10px;" href="main"><img src="/dda/image/DDAlogo.png" width="200px"></a>
        
        <form action="search" method="post">
        <div class="search" style="margin-top:5px; margin-left:20px; width:300px;">
            <input class="in2" type="text" placeholder="검색어 입력" name="searchValue" id="searchValue">
      <button id="searchbtn" style="margin-right:10px;"></button>
        </div>
        </form>
        
		    <div class="tvl" style="display:flex; width:500px;">
		<c:choose>
			<c:when test="${personalloginstate == true}">
				<a href="personalpwcheck" style="margin-right: 20px;">마이페이지</a>
				<a href="personallogout"> 로그아웃</a>
			</c:when>

			<c:when test="${storeloginstate == true}">
				<a href="storeoutput?store_id=${store.id}" style="margin-right: 20px;">마이페이지</a>
				<a href="storelogout">로그아웃</a>
			</c:when>

			<c:otherwise>
				<a style="margin-right:40px;" href="selectJoin">회원가입</a>
				<a href="selectLogin">로그인</a>
			</c:otherwise>
		</c:choose>
  
        	</div>  
        </div>
        
      <c:choose>
			<c:when test="${personalloginstate == true}">
      <p class="menu_div">
				<a href="personalpwcheck" >마이페이지</a><br>
				<a href="gocafe">카페 보러가기</a><br>
      <a href="">즐겨찾기</a><br>
      <a href="myStatus?customer_id=${personal.id}">예약 현황</a><br>
      <a href="mywaiting?customer_id=${personal.id}">웨이팅 현황</a><br>
      <a href="qnaform">Q&A</a><br>
				<a href="personallogout"> 로그아웃</a>
     </p>
			</c:when>

			<c:when test="${storeloginstate == true}">
			 <p class="menu_div">
				<a href="storeoutput?store_id=${store.id}">마이페이지</a><br>
				<a href="storeinput?store_id=${store.id}">매장 등록</a><br>
      <a href="storemodifyview?store_id=${store.id}">매장 정보 수정</a><br>
      <a href="storestatus">예약 현황</a><br>
      <a href="waitinglist?store_id=${store.id}">웨이팅 리스트</a><br>
            <a href="gocafe">카페 보러가기</a><br>
            <a href="qnaform">Q&A</a><br>
				<a href="storelogout">로그아웃</a><br>
		</p>
			</c:when>

			<c:otherwise>
			 <p class="menu_div">
				<a href="selectJoin">회원가입</a><br>
				<a href="selectLogin">로그인</a><br>
				<a href="gocafe">카페 보러가기</a><br>
      <a href="qnaform">Q&A</a><br></p>
			</c:otherwise>
		</c:choose>
</header>
</html>