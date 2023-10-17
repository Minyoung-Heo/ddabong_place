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

.flex-item {
	
}

.flex-item img {
	max-width: 100%;
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
	margin-top: 20px;
	margin-right: 100px;
	background-color: #ffe8cc;
	outline: none;
	margin-left: 100px;
}

.btn:hover {
	background-color: #ffba66;
}
</style>
</head>
<body>
<br><br><br>
<div class="flex-container">

		<div class="flex-item">

			<h1>웨이팅 현황</h1>
			<hr>
			<c:forEach items="${waitingList}" var="dto" varStatus="loop">

				<div class="flex-container-inner">

					<div class="img-wrapper">
						<a href="매장상세페이지로?store_id=${dto.store_id}"> <img alt=""
							src="/dda/image/${dto.image}" width="200px"></a>
					</div>

					<div class="intro">
						<h3>${loop.index + 1}. ${dto.storename}</h3>
						${dto.lineintro}
					</div>
					<input type="button" class="btn"
					 onclick="location.href='waitingdetail?store_id=${dto.store_id}&customer_id=${dto.customer_id}'" 
					 value="대기번호 확인">
				</div>
				<hr>
			</c:forEach>

		</div>

</body>
</html>