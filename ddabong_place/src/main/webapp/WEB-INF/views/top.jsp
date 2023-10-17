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
	//검색창 입력값 전송부분.
	$(function() {
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
 .topnav {
top:0px;
width: 100%;
height: 80px;
background-color: white;
position: fixed;
opacity: 1;
display: flex;
padding: 5px;
z-index: 1000;
}
.topnav > .tvl > a {
font-size: 20px;
margin-top:25px;
color: #ff8c00;
}
.topnav > .tvl > a:hover {
text-decoration: none;
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
				<a href="#">${store.ceo } 대표님 어서오세요.</a>
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
        
        <div class="topnav"> 
        <img src="/dda/image/menu.png" width="35px" style="margin-left:18x; margin:15px;"> 
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
				<a href="personalpwcheck" > ${personal.nickname } 님 어서오세요.</a>
				<a href="personallogout"> 로그아웃</a>
			</c:when>

			<c:when test="${storeloginstate == true}">
				<a href="#">${store.ceo } 대표님 어서오세요.</a>
				<a href="storelogout">로그아웃</a>
			</c:when>

			<c:otherwise>
				<a style="margin-right:40px;" href="selectJoin">회원가입</a>
				<a href="selectLogin">로그인</a>
			</c:otherwise>
		</c:choose>
	</div>    
        </div>
</header>

</html>