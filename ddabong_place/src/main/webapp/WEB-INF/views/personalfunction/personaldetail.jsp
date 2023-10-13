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
						<td style="text-align: left;"><h3>&emsp; ${regi.storename}</h3>
							&emsp;&emsp; ${regi.region_name} | ${regi.tel }</td>
					</tr>
					<tr>
						<td> <h4>우리 매장의 대표메뉴</h4> <br> ${regi.main_image} <br> ${regi.main_menu}
						</td>
					</tr>
				</table>
			</div>
		</c:forEach>
	</c:forEach>
	<c:forEach items="${reviewlist}" var="rev">
		<div class="detailtable">
			<table width="100%" height="100%" align="center">
				<tr>
					<td><img src="image/${rev.image}" width="200px" height="200px">
					</td>
				</tr>
			</table>
		</div>
	</c:forEach>
</body>
</html>
