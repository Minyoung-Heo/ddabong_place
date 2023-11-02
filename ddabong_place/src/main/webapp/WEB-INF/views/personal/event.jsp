<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.box {
	position: relative;
	margin-left: 30px;
	border-radius: 20px;
	border-color: #e6e6e6;
	padding: 20px;
	font-size: 15px;
	float: left;
}

.btn1 {
	right: 100px;
	top: 84px;
	width: 100px;
	height: 100px;
	text-align: center;
	background-color: #ffe8cc;
	border: none;
	border-radius: 15px;
	margin-left: 30px;
	float: right;
}

.btn1:hover {
	background-color: #ffba66;
}

.horizontal-line {
	border-top: 1px solid #FF8C00;
	margin: 0 auto;
	margin-top: 50px;
	margin-bottom: 50px;
	width: 40%;
}

.eventcontent {
	border: 1px solid #FF8C00;
	border-collapse: collapse;
	border-radius: 25px;
	border-style: hidden;
	box-shadow: 0 0 0 1px #FF8C00;
	font-size: 1.5em;
	width: 800px;
	height: 150px;
	margin-top: 30px;
	border-radius: 7px;
	border-style: hidden;
	box-shadow: 0 0 0 1px #666;
	border-style: hidden;
	box-shadow: 0 0 0 1px #FF8C00;
	border-collapse: collapse;
	border-radius: 25px;
	border-style: hidden;
	box-shadow: 0 0 0 1px #FF8C00;
}

.deletec {
	color: gray;
	font-size: small;
	float: right;
	margin-top: 10px;
	margin-right: 10px;
}

.modifyc {
	color: gray;
	font-size: small;
	float: right;
	margin-top: 10px;
	
}

.modifyc:hover {
	color: blue;
	 cursor:pointer;
}

.deletec:hover {
	color: red;
	 cursor:pointer;
}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<img alt="mainLogo3" src="/dda/image/mainLogo3.png">
	<h1>수험생들에게 응원이 되는 메세지를 남겨주세요 !</h1>
	<c:choose>
		<c:when test="${personalloginstate == true}">
			<form action="eventsave" method="post" accept-charset="UTF-8">
				<table style="margin-top: 50px;" align="center">
					<tr>
						<th><input type="hidden" name="nickname"
							value="${personal.nickname }"></th>
						<th><textarea class="box" rows="3" cols="70" name="content"></textarea></th>
						<th><input class="btn1" type="submit" value="등록하기"></th>
					</tr>
				</table>
			</form>
		</c:when>
			<c:otherwise>
			<h5>( 응원의 메세지 이벤트는 로그인하셔야 참여 가능한 이벤트입니다. )</h5>
					</c:otherwise>
	</c:choose>
	<div class="horizontal-line"></div>
	<c:forEach items="${Eventlist}" var="qq">
		<table align="center" class="eventcontent">

			<caption>
				<span style="color: #FF8C00;">${qq.nickname}님</span>
				<c:choose>
					<c:when test="${qq.nickname == personal.nickname}">
						<span class="modifyc">↺ 수정</span>
						<span class="deletec"
							onclick="location.href='deletecontent?nickname=${qq.nickname}'">✘
							삭제</span>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</caption>
			<tr>
				<td>${qq.content}</td>
			</tr>
		</table>
	</c:forEach>

</body>
</html>