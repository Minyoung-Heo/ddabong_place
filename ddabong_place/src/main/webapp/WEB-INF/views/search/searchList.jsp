<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script type="text/javascript">
$(document).ready(function() {
    $('.slide_div').slick(
          {
             dots: true,
             autoplay : true,
             autoplaySpeed: 2500
          }      
    );
 });

</script>
<style type="text/css">
.slick-prev{
   left: 160px;
    z-index: 1;
}
.slick-next{
   right: 160px;
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
   max-width: 85%;
    height: auto;
    display: block;
   margin: auto;    
}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br><br>
   <h1>이달의 따봉왕</h1><br>
   <h3>상호명 검색결과</h3>
   <div class="slide_div_wrap">
      <div class="slide_div">
            <div>
           		<table border="1" align="center" heigt="500px" width="600px">
				<tr>
					<c:forEach items="${ storelist}" var="aa">
						<td>${aa.storename }</td>
						<td>${aa.region_code }</td>
						<td>${aa.dessert }</td>
					</c:forEach>
				</tr>
			</table>
            </div>
      </div>
   </div>
   <br>
      <h3>지역별 검색결과</h3>
   <div class="slide_div_wrap">
      <div class="slide_div">
            <div>
        	<table border="1" align="center" heigt="500px" width="600px">
				<tr>
					<c:forEach items="${ regionlist}" var="bb">
						<td>${bb.storename }</td>
						<td>${bb.region_code }</td>
						<td>${bb.dessert }</td>
					</c:forEach>
				</tr>
			</table>
            </div>
      </div>
   </div>
 

</body>
</html>