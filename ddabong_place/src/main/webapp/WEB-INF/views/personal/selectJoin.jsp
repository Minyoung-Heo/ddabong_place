<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.box, .box2 {
	display: inline-block;
	vertical-align: bottom; /* 상단 정렬 (원하는 정렬에 따라 조절 가능) */
	border: 3px solid #ccc; /* 테두리 스타일 및 색상 설정 */
	padding: 20px; /* 박스 내부 여백 설정 */
	width: 400px; /* 박스의 너비 설정 */
	margin: 0 auto; /* 가운데 정렬 */
	font-size: 1.5em;
}

p1 {
	font-size: 1.8em;
}

p {
	color: silver;
}

.imga {
	width: 200px;
}
.box:hover {
	background-color: #FF8C00;
}
.box2:hover {
	background-color: #FF8C00;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="BZ">
		<h1>회원가입 유형을 선택해주세요.</h1>
		<br> <br> <br>

		<!-- 		사용자 유형 설정 -->
		<div class="box" onclick="location.href='personalJoin'">
			<img class="imga" alt="사용자" src="/dda/image/user.png"><br>
			<p1>회원용 회원가입</p1>
			<br> <br> <br>
			<p>일반 회원으로 회원가입을 합니다.</p>
		</div>
		<!-- 		기업 유형 설정 -->
		<div class="box2" onclick="location.href='PersonalLogin'">
			<img class="imga" alt="사용자" src="/dda/image/store.png"><br>
			<p1>업체용 회원가입</p1>
			<br> <br> <br>
			<p>매장 관리자용으로 회원가입을 합니다.</p>
		</div>
	</div>
	<a onclick="location.href='selectLogin'"><p1>이미 계정이 있으신가요 ?</p1></a>
</body>
</html>