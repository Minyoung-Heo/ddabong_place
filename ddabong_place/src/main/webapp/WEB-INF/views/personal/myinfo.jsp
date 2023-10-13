<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.qwe {
	border: 2px solid #000;
	padding: 10px;
	margin: 10px auto;
	width: 500px;
}

.btn {
	margin-top: 20px;
	margin-right: 60px;
	margin-left: 50px;
	background-color: #ffe8cc;
}

.btn2 {
	margin-top: 20px;
	margin-left: 60px;
	background-color: #ffe8cc;
}

.btn:hover, .btn2:hover {
	background-color: #ffba66;
}
</style>
</head>
<body>
	<div class="BZ">
		<h1>회원 정보</h1>
		<div class="qwe">
			<h4>아이디 : ${personal.id }</h4>
			<h4>비밀번호 : ${personal.pw }</h4>
			<h4>이름 : ${personal.name }</h4>
			<h4>닉네임 : ${personal.nickname }</h4>
			<h4>전화번호 : ${personal.phone }</h4>
			<h4>주소 : ${personal.address }</h4>
			<h4>이메일 : ${personal.email }</h4>

		</div>
	</div>
	<button class="btn" onclick="location.href='myinfoModify'">회원
		수정</button>
	<button class="btn">회원 탈퇴</button>
</body>
</html>
