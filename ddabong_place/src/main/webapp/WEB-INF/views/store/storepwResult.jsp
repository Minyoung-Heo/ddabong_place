<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.tt {
	margin-top: 140px;
}

.btn2, .btn3 {
	width: 35%;
	height: 51px;
	font-size: 23px;
	border-radius: 40px;
	cursor: pointer; /* 마우스 커서를 포인터로 변경 */

	/* 기본 스타일 */
	background-color: gray;
	color: white;
	transition: background-color 0.3s, color 0.3s; /* 트랜지션 추가 */

	margin-top: 40px;
}

.btn2:hover, .btn3:hover {
	/* 호버 시 스타일 */
	background-color: #ff8c00;
	color: white;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${not empty list}">
			<c:forEach items="${list}" var="a">
				<h1 class="tt">${a.name }대표님의 비밀번호는</h1>
				<h1>[ ${a.pw} ]</h1>
				<h1>입니다.</h1>
				<button class="btn3" value="창 닫기" type="button"
					onclick="window.close()">창 닫기</button>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<h1>잘못된 정보입니다.</h1>
			<button class="btn3" value="다시 입력" type="button"
				onclick="window.history.back()">다시 입력</button> <br>
			<button class="btn2" value="창 닫기" type="button"
				onclick="window.close()">창 닫기</button>
		</c:otherwise>
	</c:choose>
</body>
</html>
