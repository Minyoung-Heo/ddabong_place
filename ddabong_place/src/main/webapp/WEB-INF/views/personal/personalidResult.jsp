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

.btn3 {
	width: 35%;
	height: 51px;
	background-color: gray; /* 배경색을 하얀색으로 변경 */
	color: white; /* 글씨색을 #FF8C00으로 변경 */
	font-size: 23px;
	margin-top: 140px;
	border-radius: 40px;
}
</style>
<!-- 창닫는거 -->
<script>
	function closeWindow() {
		window.close();
	}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${list}" var="a">
		<h1 class="tt">고객님의 아이디는 </h1><h1>[ ${a.id } ]</h1><h1> 입니다.</h1>
		<button class="btn3" value="창 닫기" type="button"
			onclick="closeWindow()">창 닫기</button>
	</c:forEach>
</body>
</html>