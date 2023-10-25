<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function cancelReserv(reservation_num) {
		if (confirm("예약을 정말 취소하시겠습니까?")) {
			location.href = "storeReservationDelete?reservation_num="
					+ reservation_num + "&store_id=${store_id}";
		}
	}
</script>
<style type="text/css">
.maint1 {
	border: 1px solid #FF8C00;
	border-radius: 40px !important;
	width: 500px;
	margin-top: 5%;
}

.cname {
	font-size: 3em;
	margin-bottom: 20px;
	margin-left: 40px;
}

.cdate {
	color: red;
}

.timg {
	width: 260px;
	height: 260px;
	margin-left: 20px;
	overflow: hidden;
}

.timg img {
	max-width: 100%;
	max-height: 100%;
}

.cont {
	width: 350px;
	height: 150px;
	margin-left: 50px;
	padding: 0;
}

.cont th {
	margin: 0;
	padding: 0;
}

.btn2 {
	background-color: #ffe8cc;
	border: 0;
}

.btn2:hover {
	background-color: #ffba66;
}

#map-container {
	text-align: center;
}

#map {
	width: 500px;
	height: 400px;
	display: none;
	margin: 20px auto;
	margin-top: 20px;
}

.horizontal-line {
	border-top: 1px solid #FF8C00;
	margin: 0 auto;
	margin-top: 20px;
	margin-bottom: 50px;
	width: 40%;
}

.div-container {
	margin-top: 40px;
	display: flex;
	width: 90%;
	justify-content: space-evenly;
}

.category {
	margin-top: 60px;
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

.asd {
	text-align: center;
}

.side-map {
	margin-top: 150px;
}

.img-wrapper {
	margin: 25px;
	margin-right: 15px;
	width: 230px;
	height: 230px;
	position: relative;
}

.img-wrapper img {
	border-radius: 10px;
	position: absolute;
	top: 0;
	left: 0;
	transform: translate(50, 50);
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.question {
	width: 100%;
	text-align: left;
	font-size: 20px;
}

.qweqwe {
	display: inline-block;
	color: gray;
	transition: color 0.3s;
	text-decoration: none;
	text-align: left;
	margin-right: 50px;
	text-decoration: none !important;
}

.qweqwe:hover {
	color: #ff8c00;
	text-decoration: none !important;
}

.qweqwe2 {
	display: inline-block;
	color: gray;
	transition: color 0.3s;
	text-decoration: none !important;
	text-align: right;
}

.qweqwe2:hover {
	color: #ff8c00;
	text-decoration: none !important;
}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br>
	<br>
	<div class="div-container">
		<div class="category">
			<h1>예약 / 웨이팅 관리</h1>
			<a href="storeStatus?store_id=${store.id}" style="color: #ff8c00;">예약
				리스트</a><br> 
				<a
				href="waitinglist?store_id=${store.id}">웨이팅 리스트</a>
		</div>
		<div class="qna">

			<h1 style="text-align: left;">예약 리스트</h1>
			<br>
			<div style="text-align: left;">
				<a href="" class="qweqwe"><h3>예정 예약현황</h3></a> <a href=""
					class="qweqwe2"><h3>지난 예약현황</h3></a>
			</div>
			<table class="question" align="center" style="margin-top: 25px;">
				<tr style="background-color: #ffd199;">
					<th>예약 번호</th>
					<th>예약자명</th>
					<th>예약날짜</th>
					<th>예약시간</th>
					<th>인원수</th>
					<th>전화번호</th>
					<th>예약 취소</th>
				</tr>
				<c:forEach items="${ReservationList}" var="dto">
					<tr>
						<td>${dto.reservation_num }</td>
						<td>${dto.reservation_name}</td>
						<c:set var="date" value="${dto.reservation_date}" />
						<td>${fn:substring(date,0,10)}</td>
						<td>${dto.reservation_time}</td>
						<td>${dto.person_num}</td>
						<td>${dto.tel}</td>
						<td><input type="button" value="예약 취소" class="btn2"
							onclick="cancelReserv(${dto.reservation_num})"></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>
