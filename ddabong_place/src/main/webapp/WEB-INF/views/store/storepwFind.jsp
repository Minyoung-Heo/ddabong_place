<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.textbox {
	width: 70%;
	height: 51px;
	border: 1px solid #FF8C00;
	margin: 5px;
	padding: 10px 14px 10px 14px;
	box-sizing: border-box;
	font-size: 15px;
	border-radius: 40px;
	outline: none;
}

.btn_login {
	width: 35%;
	height: 51px;
	background-color: #FF8C00; /* 배경색을 하얀색으로 변경 */
	color: white; /* 글씨색을 #FF8C00으로 변경 */
	font-size: 19px;
	margin-top: 40px;
	border-radius: 40px;
	cursor: pointer; /* 마우스 커서를 포인터로 변경 */
	/* 기본 스타일 */
	background-color: gray;
	color: white;
	transition: background-color 0.3s, color 0.3s; /* 트랜지션 추가 */
	border:0px;
	margin-top: 25px;
}

.btn_login:hover {
	/* 호버 시 스타일 */
	background-color: #ff8c00;
	color: white;
}
input:-webkit-autofill { -webkit-box-shadow: 0 0 0 30px #fff inset ; -webkit-text-fill-color: #000; }
input:-webkit-autofill, input:-webkit-autofill:hover, input:-webkit-autofill:focus,
 input:-webkit-autofill:active 
{ transition: background-color 5000s ease-in-out 0s; }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>비밀번호 찾기</h1>
	<br>
	<form action="storepwResult" method="post">
		<h4>대표자명을 입력하세요</h4>
		<input type="text" class="textbox" name="ceo" placeholder="대표자명">
		<h4>아이디를 입력하세요</h4>
		<input type="text" class="textbox" name="id" placeholder="아이디">
		<button class="btn_login" value="비밀번호 찾기 결과" type="submit">비밀번호
			찾기 결과</button>
	</form>
</body>
</html>