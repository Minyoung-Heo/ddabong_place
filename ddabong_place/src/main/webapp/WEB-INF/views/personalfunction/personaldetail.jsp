<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.detailtable {
	width: 860px;
	margin: 0 auto;
	border: 1px solid #b3b3b3;
	border-radius: 20px;
	border-left-color: #e6e6e6;
	border-right-color: #e6e6e6;
}

.center-td {
	text-align: center;
	vertical-align: top;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<br>
	<br>
	<br>

	<c:forEach items="${registrationlist}" var="regi">
		<c:forEach items="${ddabonglist}" var="dda">
			<div class="detailtable">
				<table width="100%">
					<tr>
						<td class="center-td" style="padding: 10px;"><img
							src="image/${regi.image}" width="840px" height="500px"></td>
					</tr>
					<tr>
						<td style="text-align: left;"><h3>&emsp;
								${regi.storename}</h3> &emsp;&emsp; ${regi.region_name} | ${regi.tel }</td>
					</tr>
					<tr>
						<td>
							<h4>우리 매장의 대표메뉴</h4> <br> ${regi.main_image} <br>
							${regi.main_menu}
						</td>
					</tr>
				</table>
			</div>
			<h1><a href="waitingInput?store_id=${regi.store_id}">웨이팅</a></h1>
		</c:forEach>
	</c:forEach>
	<div class="detailtable">
		<table width="100%" height="100%">
			<tr>
				<td>
					<h2 style="text-align: left;">&emsp;리뷰 작성하기</h2> <textarea rows="5"
						cols="80"></textarea>
				</td>
				<td><input type="submit"
					style="width: 100px; height: 100px;" value="작성하기"></td>
			</tr>
		</table>
	</div>
	<c:forEach items="${reviewlist}" var="rev">
		<div class="detailtable">
			<table width="100%" height="100%" align="center">
				<tr>
					<td style="vertical-align: center;text-align: center;"><img src="image/${rev.image}" width="200px" height="200px">
					</td>
				</tr>
			</table>
		</div>
	</c:forEach>
</body>
</html>
