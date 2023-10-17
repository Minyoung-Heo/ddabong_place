<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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

.reviewsubmit {
	position: relative;
	right: 25px;
	top: 60px;
}

.center-td {
	text-align: center;
	vertical-align: top;
}

.table-bottom {
	padding-bottom: 14px;
}

.reservbtn {
	width: 250px;
	height: 100px;
	border-radius: 14px;
	border: 1px solid #b3b3b3;
}
.reviewfile{
position: relative;
left: 270px;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<br>
	<br>
	<br>

	<c:forEach items="${registrationlist}" var="regi" varStatus="loop">
		<c:forEach items="${ddabonglist}" var="dda">
			<div class="detailtable">
				<table width="100%">
					<tr>
						<td class="center-td" style="padding: 10px;"><img
							src="image/${regi.imageList[0]}" width="840px" height="500px"></td>
					</tr>
					<tr>

						<td style="text-align: center; padding: 50px, 50px, 50px, 50px;"><c:forEach
								items="${regi.imageList}" var="img" varStatus="loop">
								<c:if test="${loop.index >= 1 && loop.index < 7}">
									<img src="image/${img}" width="120px" height="120px">
								</c:if>
							</c:forEach></td>

					</tr>
					<tr>
						<td style="text-align: left;"><h3>&emsp;
								${regi.storename}</h3> &emsp;&emsp; ${regi.region_name} | ${regi.tel }
							&emsp;&emsp;&emsp;&emsp;${regi.address}</td>
					</tr>

					<tr>
						<td><br>
							<h3>우리 매장의 대표메뉴</h3> <br> <img
							src="image/${regi.main_image}" width="150px" height="150px">
							<br>
							<h4>${regi.main_menu}</h4> <br></td>
					</tr>
					<tr>
						<td class="table-bottom"><form action="reserv" method="POST">
								<input type="hidden" name="storename" value="${regi.storename}">
								<input type="hidden" name="storeID" value="${regi.store_id}">
								<button class="reservbtn" type="submit">
									<h1>예약하기</h1>
								</button>
							</form></td>
					</tr>
				</table>
			</div>
		</c:forEach>
	</c:forEach>
	<div class="detailtable">
					<form action="review" method="post">
		<table width="100%" height="100%">
			<tr>
				<td>
					<h2 style="text-align: left;">&emsp;리뷰 작성하기</h2><br>
					리뷰할 사진을 모두 선택해 주세요.
					<input class="reviewfile" name="reviewfile" type="file" multiple="multiple">
					 <textarea rows="5"
						cols="80" name="reviewcontent"></textarea>
				</td>
				<td><input class="reviewsubmit" type="submit"
					style="width: 100px; height: 100px;" value="작성하기"></td>
			</tr>
		</table>
		</form>
	</div>
<c:forEach items="${reviewlist}" var="rev">
    <c:set var="uid" value="${rev.id}"/>
    <c:set var="length" value="${fn:length(uid)}"/>
    <c:set var="replaceid" value="${fn:substring(uid, 3, length)}"/>
    <c:set var="id" value="${fn:substring(uid, 0, 3)}${replaceid.replaceAll('.', '*')}"/>
    <div class="detailtable">
        <table width="100%" height="100%" align="center">
            <tr style="text-align: left;">
                <td><br>&emsp;&emsp;${rev.nickname}(${id})</td>
            </tr>
            <tr>
            <td></td>
            </tr>
        </table>
    </div>
</c:forEach>

</body>
</html>
