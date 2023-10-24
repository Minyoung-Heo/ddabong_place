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

.tb{
	margin-top: 70px;
}

.nulldata
{
	margin-top: 150px;
}

.tbl-header table {
    width: 100%;
    height: 100%;
    text-align: center;
    border: 1px solid #fff;
    border-spacing: 1px;
  	
}

table td {
    padding: 10px;
    background-color: rgb(254,252,250);
    font-size: 17px;
}

table th {
    background-color: #ff8c00;
    color: #fff;
    padding: 10px;
    font-size: 17px;
}
h1{
	font-size: 50px;
	margin-top: 100px;
}

.tbl-content table {
    width: 100%;
    table-layout: fixed;
    overflow-y: scroll; /* 테이블 내부에 수직 스크롤을 나타내는 스타일을 추가합니다. */
} */

.flex-container {
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

.flex-item hr{
background : #ffddb3;
border:0;
height:1px;
}
.flex-item h3 {
font-size:30px;
margin-top: 3px;
margin-bottom:20px;
}
.flex-item {
width:100%;
font-size:25px;
}

.img-wrapper {
	margin-right: 40px;
	width: 260px;
	height: 260px;
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

.intro {
	text-align: left;
}

.btn {
	position:relative;
	float:left;
	background-color: #ffe8cc;
	outline: none;
	margin-right:15px;
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
    margin-top:10px;
    width:30%;
    margin-left:40px;
    text-align: left;
}

.category a {
    line-height:40px;
    font-size:20px;
    color:#FFBE1C;
    text-decoration: none;
}

.category a:hover {
    color:#ff8c00;
}

.cafe {
    text-align: left;
    width: 90%;
}
.region {
font-size: 15px;
color:gray;
}
.region img {
margin-right: 3px;
margin-bottom:4px;
}
.review img {
width:25px;
margin-right:5px;
margin-bottom:5px;
}
.review {
font-size: 20px;
}
</style>

<script>
$(window).on("load resize ", function() {
	  var scrollWidth = $('.tbl-content').width() - $('.tbl-content table').width();
	  $('.tbl-header').css({'padding-right':scrollWidth});
	}).resize();
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<br><br>
<h1>당신에게 딱 맞는 카페를 추천드립니다.</h1>
    <div class="div-container">
        <div class="category">
            <h1 style="margin-bottom: 11px;">카페 보러가기</h1>
            <a href="gocafe" style="color:#ff8c00;">전체 목록 보기</a><br>
            <a href="goregion?region_name=강남">지역별 카페 보기</a><br>
            <a href="godessert?dessert=케이크">디저트별 카페 보기</a><br>
        </div>

        <div class="cafe">
            <h3 style="color:gray;">퀴즈 결과</h3>
            <!-- 퀴즈 결과 시작 -->
       <div class="flex-container">
		<div class="flex-item">
			<hr>
			<c:choose>
                <c:when test="${list.size()>=1}">
                <div class="tbl-header">
                    <table border="1">
                        <tr>
                            <th>가게 이름</th>
                            <th>매장 이미지</th>
                            <th>지역</th>
                            <th>디저트</th>
                        </tr>
                    </div>
                    
                    <div class="tbl-content">
                        <c:forEach items="${list}" var="aa">
                            <tr>
                                <td>${aa.storename}</td>
                                <td><img src="/dda/image/${aa.imageList[0]}" width="300px" height="300px"></td>
                                <td>${aa.region_name}</td>
                                <td>${aa.dessert}</td>
                            </tr>
                        </c:forEach>
                   </div>
                   </table>
                </c:when>
                <c:otherwise>
                    <div class="nulldata">
                        <h1>검색 결과가 존재하지 않습니다</h1>
                    </div>
                </c:otherwise>
            </c:choose>
            </div>
	</div>   
	<br><br><br>
        </div>
    </div>

</body>

</html>