<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.question {
	margin-top: 20px;
	font-size: 20px;
	width:60%;
	line-height: 40px;
}

.question table {
	margin-top: 40px;
	margin-bottom: 40px;
}

.qwe {
	border: 1px solid #ff8c00;
	border-radius: 40px;
	text-align: center;
	width: 80%;
	height: auto;
	white-space: pre-wrap;
	margin-top: 20px;
	outline: none;
}

.qwe2 {
	border: 1px solid #ff8c00;
	border-radius: 20px;
	text-align: center;
	width: 80%;
	height: auto;
	white-space: pre-wrap;
	margin-top: 20px;
	outline: none;
}

.btn {
	margin-top: 50px;
	margin-right: 60px;
	margin-left: 50px;
	background-color: #ffe8cc;
	border-radius: 40px;
}

.btn:hover {
	background-color: #ffba66;
}

.zxc {
	margin-top: 10px;
}
.div-container {
	margin-top: 30px;
	display: flex;
	width: 90%;
	justify-content: space-evenly;
}

.category {
	margin-top: 70px;
	width: 30%;
	margin-left: 40px;
	text-align: left;
}

.category a {
	line-height: 40px;
	font-size: 20px;
	color: #FFBE1C;
	text-decoration: none;
}

.category a:hover {
	color: #ff8c00;
}
.qna {
	margin-top: 20px;
	text-align: center;
	font-size: 15px;
	width: 85%;
	margin-right:230px;
	
}
</style>
<script>
	$(document).ready(function() {
		$("#goodbyeButton").click(function() {
			alert("정상적으로 회원 탈퇴되었습니다. 이용해주셔서 감사합니다.");
		});
	});
</script>
</head>
<body>
<br>
<br>

	<div class="div-container">
		<div class="category">
			<h1>마이페이지</h1>
			<a href="myinfo" style="color: #ff8c00;">내 정보</a><br> 
			<a href="myinfoModify">회원 정보 수정</a><br>
			<a href="personalleave" >회원 탈퇴</a><br>
		</div>

		<div class="qna">
			<h1>회원 정보</h1>
			<table class="question" align="center">
				<tr class="zxc">
					<th>아이디</th>
					<td><input class="qwe" type="text" readonly="readonly"
						value="${personal.id }"></td>
				</tr>
				<tr class="zxc">
					<th>비밀번호</th>
					<td><input class="qwe" type="text" readonly="readonly"
						value="${personal.pw }"></td>
				</tr>
				<tr class="zxc">
					<th>이름</th>
					<td><input class="qwe" type="text" readonly="readonly"
						value="${personal.name }"></td>
				</tr>
				<tr class="zxc">
					<th>닉네임</th>
					<td><input class="qwe" type="text" readonly="readonly"
						value="${personal.nickname }"></td>
				</tr>
				<tr class="zxc">
					<th>전화번호</th>
					<td><input class="qwe" type="text" readonly="readonly"
						value="${personal.phone }"></td>
				</tr>
				<tr class="zxc">
					<th>주소</th>
					<td><textarea class="qwe2" readonly>${personal.address }</textarea></td>
				</tr>
				<tr class="zxc">
					<th>이메일</th>
					<td><input class="qwe" type="text" readonly="readonly"
						value="${personal.email }"></td>
				</tr>
			</table>
	<button class="btn" onclick="location.href='myinfoModify'">회원
		수정</button>
	<button class="btn" onclick="location.href='personalleave'">회원
		탈퇴</button>
		</div>
	</div>
</body>
</html>
