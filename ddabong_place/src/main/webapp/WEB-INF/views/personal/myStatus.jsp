<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.box, .box2 {
	display: inline-block;
	vertical-align: bottom; /* 상단 정렬 (원하는 정렬에 따라 조절 가능) */
	border: 3px solid #ccc; /* 테두리 스타일 및 색상 설정 */
	padding: 20px; /* 박스 내부 여백 설정 */
	width: 400px; /* 박스의 너비 설정 */
	margin: 0 auto; /* 가운데 정렬 */
	font-size: 1.5em;
	cursor: pointer;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="BZ">
		<div class="box" onclick="#" id="ss1">
			<p>방문 예정</p>
			<br> <br> <br>
			<p>방문 예정인 업체 표시</p>
		</div>
		<div class="box" onclick="#" id="ss2">
			<p>방문 완료</p>
			<br> <br> <br>
			<p>방문 완료한 업체 표시</p>
		</div>
		<div class="box" onclick="#" id="ss3">
			<p>취소 및 노쇼</p>
			<br> <br> <br>
			<p>업체측 취소 및 노쇼 표시</p>
		</div>
	</div>
</body>


</html>