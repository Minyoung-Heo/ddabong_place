<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<meta charset="UTF-8">
<script type="text/javascript">
	$(document).ready(function() {
		$('.slide_div').slick({
			dots : true,
			autoplay : true,
			autoplaySpeed : 3000
		});
	});
</script>
<style type="text/css">
.slick-prev {
	left: 500px;
	z-index: 1;
}

.slick-next {
	right: 500px;
	z-index: 1;
}

.slide_div img {
	margin: auto;
}

.slide_div_wrap {
	padding: 15px 0 15px 0;
	background: #e6e9f6;
	margin-bottom: 50px;
	margin-top: 20px;
}

.image_wrap img {
	max-width: 80%;
	height: auto;
	display: block;
	margin: auto;
}

.award_div {
	overflow: hidden; /* 오버플로우 숨김 */
}

.award_div div {
	margin-top: 20px;
	float: left;
	width: 33.33%; /* 3개의 이미지를 가로로 나란히 정렬 */
	box-sizing: border-box; /* 패딩, 보더가 너비에 포함되도록 함 */
	padding: 10px;
}

.award_div img {
	max-width: 100%;
	height: auto;
	display: block;
	margin: auto;
	margin-bottom: 20px;
}

.medal {
	width: 3vw;
}
</style>
</head>
<body>
	<h1>이달의 따봉왕</h1>
	<div class="slide_div_wrap">
		<div class="slide_div">
			<c:forEach items="${rankList}" var="monthDDA" varStatus="loop">
				<div>
					<h2>${loop.index + 1}등</h2>
					<a href="매장상세페이지로?store_id=${monthDDA.store_id}"><img alt=""
						src="/dda/image/${monthDDA.image}" width="400px"></a>
					<h3>${monthDDA.storeName}</h3>
				</div>
			</c:forEach>
		</div>
	</div>

	<h1>따봉 어워드</h1>
	<div class="award_div">
		<c:forEach items="${awardList}" var="awardDDA" varStatus="loop">
			<div>
				<a href="매장상세페이지로?store_id=${awardDDA.store_id}">
				<img alt="" src="/dda/image/${awardDDA.image}" width="400px"></a> 
				<img class="medal" src="/dda/image/${loop.index + 1}위.png" alt="${loop.index + 1}위">
				<h3>${awardDDA.storeName}</h3>
			</div>
		</c:forEach>
	</div>
</body>
</html>
