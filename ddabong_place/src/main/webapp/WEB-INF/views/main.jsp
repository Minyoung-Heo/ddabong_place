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
			autoplaySpeed : 2000
		});
	});
</script>
<style type="text/css">
.slick-prev {
	left: 750px;
	z-index: 1;
}

.slick-next {
	right: 750px;
	z-index: 1;
}

.slide_div img {
	margin: auto;
}

.slide_div_wrap {
	padding: 15px 0 15px 0;
	margin-bottom: 50px;
	margin-top: 20px;
}

.award-container {
	margin-top: 30px;
	display: flex;
	width: 100%;
	justify-content: space-evenly;
}

.award-img-wrapper {
	width: 300px;
	height: 300px;
	position: relative;
}

.award-img-wrapper img{
	border-radius: 10px;
	position: absolute;
	top: 0;
	left: 0;
	transform: translate(50, 50);
	width: 100%;
	height: 100%;
	object-fit: cover;
}
.medal {
	margin-top: 20px;
	width: 3vw;
}

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
	width: 120px;
	height: 120px;
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
<div class="award-container">
		<c:forEach items="${awardList}" var="awardDDA" varStatus="loop">
		<div>
			<div class="award-img-wrapper">
				<a href="매장상세페이지로?store_id=${awardDDA.store_id}"> <img alt=""
					src="/dda/image/${awardDDA.image}"></a>
					</div> 
					
					<img class="medal" src="/dda/image/${loop.index + 1}위.png" alt="${loop.index + 1}위">
				<h3>${awardDDA.storeName}</h3>
				</div>
		</c:forEach>
		
</div>


	<div class="flex-container">

		<div class="flex-item">

			<h1>예약 <span style="color:#FF4500;">HOT</span>  랭킹</h1>
			<hr>
			<c:forEach items="${hotList}" var="rank" varStatus="loop">

				<div class="flex-container-inner">

					<div class="img-wrapper">
						<a href="매장상세페이지로?store_id=${rank.store_id}"> <img alt=""
							src="/dda/image/${rank.image}" width="100px"></a>
					</div>

					<div class="intro">
						<h3>${loop.index + 1}. ${rank.storeName}</h3>
						${rank.lineIntro}
					</div>

				</div>
				<hr>
			</c:forEach>

		</div>



		<div class="flex-item">
			<a href="quiz"><h1>Quiz</h1></a>
		</div>

	</div>


<div class="test">
    <a href="storeinput">테스트 이동</a>
</div>
	
<br><br><br>

</body>
</html>
