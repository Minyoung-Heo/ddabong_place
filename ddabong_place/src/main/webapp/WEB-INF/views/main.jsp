<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<meta charset="UTF-8">
<script type="text/javascript">
	$(document).ready(function() {
		$('.slide_div').slick(
				{
					dots: true,
					autoplay : true,
					autoplaySpeed: 3000
				}		
		);
	});
</script>
<style type="text/css">
.slick-prev{
	left: 500px;
    z-index: 1;
}
.slick-next{
	right: 500px;
    z-index: 1;
}
.slide_div img{
	margin: auto;
}
.slide_div_wrap{
	padding: 15px 0 15px 0;
    background: #e6e9f6;
}
.image_wrap img{
	max-width: 80%;
    height: auto;
    display: block;
	margin: auto;    
}
</style>
</head>
<body>
	<h1>이달의 따봉왕</h1>
	<div class="slide_div_wrap">
		<div class="slide_div">
			<c:forEach items="${rankList}" var="monthDDA">
				<div>
					<a href="매장상세페이지로?store_id=${monthDDA.store_id}"><img alt=""
						src="/dda/image/${monthDDA.image}" width="400px"></a>
				</div>
			</c:forEach>
		</div>
	</div>
	
	
</body>
</html>
