<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.flex-container {
	margin-top: 30px;
	display: flex;
	width: 100%;
	justify-content: space-evenly;
}

.flex-container-inner {
	display: flex;
}

.flex-item img {
	max-width: 100%;
}
.flex-item hr {
	background: #ffddb3;
	border: 0;
	height: 1px;
}

.img-wrapper {
	margin-right: 30px;
	width: 200px;
	height: 200px;
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

.flex-item h3 {
	margin-top: 30px;
}

.intro {
	text-align: left;
}

.btn {
	position: relative;
	float: right;
	background-color: #ffe8cc;
	outline: none;
}

.btn:hover {
	background-color: #ffba66;
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
	text-align: left;
	font-size: 15px;
	width: 85%;
	margin-right: 230px;
}
</style>
</head>
<body>
	<br>
	<br>

	<div class="div-container">
		<div class="category">
			<h1>예약 / 웨이팅</h1>
			<a href="myStatus?customer_id=${personal.id}">예약 현황</a><br> <a
				href="mywaiting?customer_id=${personal.id}" style="color: #ff8c00;">웨이팅
				현황</a><br>
		</div>

		<div class="qna">
			<div class="flex-container">
				<div class="flex-item">
					<h1>웨이팅 현황</h1>
					<hr>
					<c:forEach items="${waitingList}" var="dto" varStatus="loop">

						<div class="flex-container-inner">

							<div class="img-wrapper">
								<a href="detailview?store_id=${dto.store_id}"> <img alt=""
									src="/dda/image/${dto.image}" width="200px"></a>
							</div>

							<div class="intro" style="width: 380px;">
								<h3>${loop.index + 1}.${dto.storename}</h3>
								${dto.lineintro} <br> <br> <br> <br> <br>
								<c:forEach items="${totalList}" var="tot">
									<c:if test="${tot.store_id == dto.store_id}">
						현재 대기 인원 : <span style="color: #ff8c00;">${tot.totalwaiting}</span> 명
						</c:if>
								</c:forEach>
							</div>
							<input type="button" class="btn"
								onclick="location.href='waitingdetail?store_id=${dto.store_id}&customer_id=${dto.customer_id}'"
								value="대기번호 확인">
						</div>
						<hr>
					</c:forEach>

				</div>
			</div>
		</div>
	</div>

</body>
</html>