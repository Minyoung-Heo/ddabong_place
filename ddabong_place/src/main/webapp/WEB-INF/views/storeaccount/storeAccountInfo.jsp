<%@page import="com.ezen.dda.store.StoreDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
<meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>
<body>
<br><br>	
	<div class="div-container">
		<div class="category">
			<h1>마이페이지</h1>
			<a href="storeoutput?store_id=${store.id}">나의 매장 정보</a><br> 
			<a href="storemodifyview?store_id=${store.id}">매장 정보 수정</a><br>
			<a href="storeinput">매장 등록</a><br>
			<a href="storeleave?id=${store.id}">매장 삭제</a><br>
			<hr style="width:190px; text-align: left; margin-left:0;">			
			<a href="storeaccountinfo?id=${store.id}" style="color: #ff8c00;">나의 회원 정보</a><br>
			<a href="storeaccountmodify?id=${store.id}">회원 정보 수정</a><br>
			<a href="storeaccountleave">회원 탈퇴</a><br>
		</div>
		
		<div class="qna">
			<h1>회원 정보</h1>
			<table class="question" align="center">
				<tr class="zxc">
					<th>아이디</th>
					<td><input class="qwe" type="text" readonly="readonly"
						value="${dto.id}"></td>
				</tr>
				<tr class="zxc">
					<th>비밀번호</th>
					<td><input class="qwe" type="text" readonly="readonly"
						value="${dto.pw}"></td>
				</tr>
				<tr class="zxc">
					<th>이름</th>
					<td><input class="qwe" type="text" readonly="readonly"
						value="${dto.ceo}"></td>
				</tr>
				<tr class="zxc">
					<th>전화번호</th>
					<td><input class="qwe" type="text" readonly="readonly"
						value="${dto.phone}"></td>
				</tr>
				<tr class="zxc">
					<th>이메일</th>
					<td><input class="qwe" type="text" readonly="readonly"
						value="${dto.email}"></td>
				</tr>
			</table>
	<button class="btn" onclick="location.href='storeaccountmodify?id=${store.id}'">회원 수정</button>
	<button class="btn" onclick="storeaccountleave'">회원 탈퇴</button>
		</div>
		</div>
</body>
</html>