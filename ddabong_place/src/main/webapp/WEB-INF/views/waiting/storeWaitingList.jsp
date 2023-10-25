<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
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

.question {
	width: 100%;
	text-align: left;
	font-size: 20px;
}

.qna {
	margin-top: 20px;
	text-align: center;
	font-size: 25px;
	width: 85%;
}

.question a {
	text-decoration: none;
	color: black;
}

.question th {
	border-top: 2px solid #ff8c00;
	border-bottom: 2px solid #ff8c00;
	padding: 15px;
	text-align: center;
}

.question td {
	padding: 15px;
	border-bottom: 2px solid #ffba66;
	text-align: center;
}

.question tr:hover {
	background-color: #ffe8cc;
}

.btn {
	background-color: #ffe8cc;
}

.btn:hover {
	background-color: #ffba66;
}
</style>

<script type="text/javascript">
	function insertPw(pw, num) {
		var password = prompt("비밀번호를 입력하세요.");
		if (password == pw) {
			location.href = "qnadetail?question_num=" + num;
		} else {
			alert("비밀번호가 올바르지 않습니다!");
		}
	}
</script>

</head>
<body>
	<br>
	<br>
	<div class="div-container">
		<div class="category">
			<h1>예약 / 웨이팅 관리</h1>
			<a href="storeStatus?store_id=${store.id}">예약 현황</a><br> <a
				href="waitinglist?store_id=${store.id}" style="color: #ff8c00;">웨이팅
				리스트</a><br>

		</div>

		<div class="qna">
			<c:forEach items="${waitingList}" var="dto">
				<h1 style="text-align: left;">웨이팅 리스트</h1>
				<br>
				<table class="question" align="center">
					<tr style="background-color: #ffd199;">
						<th>이름</th>
						<th>전화번호</th>
						<th>인원수</th>
						<th>대기번호</th>
						<th>대기자 호출</th>
					</tr>
					<tr>
						<td>${dto.name}</td>
						<td>${dto.phone}</td>
						<td>${dto.person_num}</td>
						<td><c:choose>
								<c:when test="${dto.waiting_num==0}">
                        호출 완료
                        </c:when>
								<c:otherwise>
                        ${dto.waiting_num}
                        </c:otherwise>
							</c:choose></td>

						<td><c:if test="${dto.waiting_num!=0}">
								<input class="btn" type="button" value="호출"
									onclick="location.href='call?store_id=${store.id}&waiting_num=${dto.waiting_num}'">
							</c:if></td>
					</tr>
				</table>
			</c:forEach>

		</div>
	</div>
</body>
</html>
