<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<img alt="mainLogo3" src="/dda/image/mainLogo3.png">
	<h1>수험생들에게 응원이 되는 메세지를 남겨주세요 !</h1>
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
	<div class="horizontal-line"></div>
</body>
</html>