<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script type="text/javascript">
	$(document).ready(function() {
		$('.slide_div').slick({
			  infinite: true,
			  slidesToShow: 3,
			  slidesToScroll: 3
			});
	});
	
</script>
<style type="text/css">
.slick-prev {
	left: 160px;
	z-index: 1;
	background-color: red;
}

.slick-next {
	right: 160px;
	z-index: 1;
	background-color: red;
}
.slide_div img {
	margin: auto;
}

.slide_div_wrap {
	padding: 15px 0 15px 0;
	background: #e6e9f6;
	height: 500px;
}

.image_wrap img {
	max-width: 85%;
	height: auto;
	display: block;
	margin: auto;
}
.tb{
margin-top: 50px;
}
.nulldata
{
margin-top: 150px;
}
h1 {
	text-align: center;
}
h3{
text-align: left;
}
table {
border-style:solid;
	border-width: 10px;
	border-color:black;
	background-color: #FF8C00;
}
tr{
border-style:solid;
	border-width: 6px;
	border-color:black;
	background-color: #FF8C00;
}
td{
border-style:solid;
	border-width: 6px;
	border-color:black;
	background-color: #FF8C00;
}

</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br>
	<br>
	<h1>"${searchValue }"를 검색하신 결과입니다</h1>
	<br>
	<h3>상호명 검색결과</h3> 
<!-- 	상호명 검색결과 시작 -->
	<div class="slide_div_wrap">
		<div class="slide_div">
			<c:choose>
				<c:when test="${storelist.size()>=1 }">
					<c:forEach items="${ storelist}" var="aa">
						<a href="detailview?store_id=${aa.store_id }">
						<div class="tb">
							<table border="1" align="center" heigt="500px" width="600px">
								<tr>
									<td><img src="/dda/image/${ aa.image}" width="300px"
										height="300px"></td>
								</tr>
								<tr>
									<td>${aa.storename }</td>
									<td>${aa.region_name }</td>
									<td>${aa.dessert }</td>
								</tr>
							</table>
						</div></a>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div class="nulldata">
					<h1>검색 결과가 존재하지 않습니다</h1>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<br>
<!-- 	상호명 검색 결과 끝 , 지역별 검색결과 출력 시작 -->
	<h3>지역별 검색결과</h3>
	<div class="slide_div_wrap">
		<div class="slide_div">
			<c:choose>
				<c:when test="${regionlist.size()>=1 }">
					<c:forEach items="${ regionlist}" var="bb">
						<div class="tb">
							<table border="1" align="center" heigt="500px" width="600px">
								<tr>
									<td><img src="/dda/image/${ bb.image}" width="300px"
										height="300px"></td>
								</tr>
								<tr>
									<td>${bb.storename }</td>
									<td>${bb.region_name }</td>
									<td>${bb.dessert }</td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div class="nulldata">
					<h1>검색 결과가 존재하지 않습니다</h1>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>


</body>
</html>