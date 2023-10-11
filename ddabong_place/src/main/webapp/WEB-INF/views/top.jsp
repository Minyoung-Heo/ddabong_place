<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
//검색창 입력값 전송부분.
$(function() {
	$("#searchbtn").click(function() {
		var searchValue = $("#searchValue").val();
		$.ajax({
			type : "post",
			async : true,
			url: "/search", //홈컨트롤러 search메소드 실행
			data : {
				"searchValue" : searchValue //검색 입력값 저장
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

<meta charset="UTF-8">
</head>

<header>
     <a href="main"><img class="header2" src="/dda/image/DDAlogo.png" width="450px"></a>
        <div class="login">
            <a href="">회원가입</a> <a href="">로그인</a>
        </div>
        <form action="search" method="post">
        <div class="search">
            <input class="in2" type="text" placeholder="검색어 입력" name="searchValue" id="searchValue">
            <button id="searchbtn" >
        	</button>
        </div>
        </form>
</header>
</html>