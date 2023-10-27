<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style type="text/css">
.nulldata
{
	margin-top: 150px;
}

table {
	margin: 0;
	width: 100%;
	border-collapse: collapse; /* 테이블 간격 제거 */
}

td {
    padding: 10px;
    border-color: #fff;
    background-color: rgb(254,252,250);
    font-size: 17px;
}

th {
    background-color: #ff8c00;
    border-color: #fff;
    color: #fff;
    padding: 10px;
    font-size: 17px;
    position: sticky;
    top: -0.5px;
    z-index: 1;
}

.tscroll{
	overflow-y: scroll;
	max-height: 600px;
}

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
overflow-y: auto;
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
    margin-top:70px;
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
    margin-top: 30px;
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
.img-wrapper {
	width: 300px;
	height: 300px;
	position: relative;
}

.img-wrapper img {
	border-radius: 10px;
	/* position: absolute; */
	top: 0;
	left: 0;
	/* transform: translate(50, 50); */
	width: 100%;
	height: 100%;
	object-fit: cover;
	text-align: center;
	margin: auto;
}

</style>

<meta charset="UTF-8">
</head>
<body>
<br><br>
    <div class="div-container">
        <!-- <div class="category">
            <h1 style="margin-bottom: 10px;">카페 보러가기</h1>
            <a href="gocafe" style="color:#ff8c00;">전체 목록 보기</a><br>
            <a href="goregion?region_name=강남">지역별 카페 보기</a><br>
            <a href="godessert?dessert=케이크">디저트별 카페 보기</a><br>
        </div> -->

        <div class="cafe">
        <h1>당신의 즐겨찾기</h1>
            <!-- <h3 style="color:gray;">즐겨찾기 결과</h3> -->
            <!-- 즐겨찾기 결과 시작 -->
       <div class="flex-container">
		<div class="flex-item">
			<hr>
			<div class="tscroll">
			<table border="1">
			<c:choose>
                <c:when test="${list.size()>=1}">
                    <thead>
                        <tr>
                            <th>손님 아이디</th>
                            <th>가게 이름</th>
                        </tr>
                        </thead>
                    
                    <tbody>
                        <c:forEach items="${list}" var="aa">
                            <tr>
                                <td>${aa.customer_id}</td>
                                <td>
                        		<div class="img-wrapper">
								<a href="detailview?store_id=${aa.store_id}">
								${aa.store_id}
								</a>
								</div></td>
                           	</tr>
                        </c:forEach>
                    </tbody>
                </c:when>
                <c:otherwise>
                    <div class="nulldata">
                        <h1>검색 결과가 존재하지 않습니다.</h1>
                    </div>
                </c:otherwise>
            </c:choose>
            </table>
            </div>
            </div>
		</div>
	<br><br><br>
        </div>
    </div>
</body>
</html>