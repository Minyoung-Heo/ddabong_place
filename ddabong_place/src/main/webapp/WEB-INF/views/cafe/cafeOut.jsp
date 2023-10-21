<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
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

<script type="text/javascript">
    function insertPw(pw, num) {
        var password = prompt("비밀번호를 입력하세요.");
        if (password == pw) {
			location.href = "qnadetail?question_num="+num;            
        } else {
        	alert("비밀번호가 올바르지 않습니다!");
        }
    }
    $(function () {
        var region = "${region}";
        if (region === "강남") {
            $('.btn[value="강남"]').css('background-color', '#ffba66');
        }
        if (region === "성수") {
            $('.btn[value="성수"]').css('background-color', '#ffba66');
        }
        if (region === "연남") {
            $('.btn[value="연남"]').css('background-color', '#ffba66');
        }
        if (region === "을지로") {
            $('.btn[value="을지로"]').css('background-color', '#ffba66');
        }
        if (region === "잠실") {
            $('.btn[value="잠실"]').css('background-color', '#ffba66');
        }
        if (region === "혜화") {
            $('.btn[value="혜화"]').css('background-color', '#ffba66');
        }
    });
</script>

</head>
<body>
    <br><br>
    <div class="div-container">
        <div class="category">
            <h1>카페 보러가기</h1>
            <c:choose>
            <c:when test="${region != null}">
            <a href="gocafe">전체 목록 보기</a><br>
            <a href="goregion?region_name=강남" style="color:#ff8c00;">지역별 카페 보기</a><br>
            <a href="">디저트별 카페 보기</a>
            </c:when>
            <c:otherwise>
            <a href="gocafe" style="color:#ff8c00;">전체 목록 보기</a><br>
            <a href="goregion?region_name=강남">지역별 카페 보기</a><br>
            <a href="">디저트별 카페 보기</a><br>
            </c:otherwise>
            </c:choose>
        </div>

        <div class="cafe">
            <h1 style="text-align: left;">카페 리스트</h1><br>
			<c:if test="${region != null}">
             <input class="btn" type="button" value="강남" onclick="location.href='goregion?region_name=강남'" >
             <input class="btn" type="button" value="성수" onclick="location.href='goregion?region_name=성수'">
             <input class="btn" type="button" value="연남" onclick="location.href='goregion?region_name=연남'">
             <input class="btn" type="button" value="을지로" onclick="location.href='goregion?region_name=을지로'">
             <input class="btn" type="button" value="잠실" onclick="location.href='goregion?region_name=잠실'">
             <input class="btn" type="button" value="혜화" onclick="location.href='goregion?region_name=혜화'">
            </c:if>
       <div class="flex-container">
		<div class="flex-item">
			<hr>
			<c:forEach items="${cafeList}" var="dto">

				<div class="flex-container-inner">

					<div class="img-wrapper">
						<a href="detailview?store_id=${dto.store_id}"> <img alt=""
							src="/dda/image/${dto.image}" width="200px"></a>
					</div>

					<div class="intro" style="width:60%;">
					<span class="region"><img src="/dda/image/pin.png" width="21px">${dto.region_name}<br></span>
						<h3>${dto.storename}</h3>
						${dto.lineintro}
						<br><br><br>
						<c:forEach items="${reviewList}" var="re">
						<c:if test="${dto.store_id == re.store_id}">
						<span class="review">
						<img src="/dda/image/star.png">
						${re.star_score} (${re.review_count})</span> 
						</c:if>
						</c:forEach>
					</div>
				</div>
				<hr>
			</c:forEach>

		</div>
	</div>   
            
        </div>
    </div>
</body>
</html>
