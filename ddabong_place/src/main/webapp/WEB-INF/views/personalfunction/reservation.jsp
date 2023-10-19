<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"
	integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css"
	integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script>
$(function() {
    $(".reservbtn").click(function(event) {
        var f = document.reserv;
        var cdate = f.reservation_date.value;
        var ctime = f.reservation_time.value;
        var cperson = f.person_num.value;
        var vperson = /^[0-9]$/;
        var nickname = "${personal.nickname}";

        if (cdate === null || cdate === "") {
            alert("일자를 선택하세요.");
            event.preventDefault(); // submit 막음
        } else if (ctime === null || ctime === "") {
            alert("예약시간을 선택하세요.");
            event.preventDefault(); // submit 막음
        } else if (cperson === null || cperson === "") {
            alert("예약인원을 입력하세요.");
            event.preventDefault(); // submit 막음
            
        }else if (!vperson.test(cperson)) {
            alert("숫자 한 자리로만 입력하세요.");
            event.preventDefault(); // submit 막음
        } else if (nickname === null || nickname.trim() === "") {
            alert("로그인이 필요합니다.");
            event.preventDefault(); // submit 막음
        }
    });
});






// 데이트 픽커
	$.datepicker.setDefaults({
		dateFormat : 'yy-mm-dd',
		prevText : '이전 달',
		nextText : '다음 달',
		monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
				'10월', '11월', '12월' ],
		monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
				'9월', '10월', '11월', '12월' ],
		dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
		showMonthAfterYear : true,
		yearSuffix : '년'
	});
	$(function() {
		$('.datepicker').datepicker();
	})
</script>
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

.table-bottom {
	padding-bottom: 14px;
}
.reservbtn {
	width: 250px;
	height: 100px;
	border-radius: 14px;
	border: 1px solid #b3b3b3;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<br>
	<br>
	<br>

	<div class="detailtable">
		<form action="reservsave" method="post" name="reserv">
			<input type="hidden" name="storeid" value="${storeID }">
			<input type="hidden" name="customer_id" value="${personal.id }">
			<table width="100%">
				<tr>
					<td class="center-td" style="padding: 10px; text-align: left;"><h3>${storename }
							매장 예약하기</h3></td>
				</tr>
				<tr>
					<td><h4>예약일자</h4> <input class="datepicker" name="reservation_date"></td>
				</tr>
				<tr>
					<td><h4>예약시간</h4> <input type="time" name="reservation_time"></td>
				</tr>
				<tr>
					<td class="table-bottom"><h4>예약인원</h4> <input type="number" name="person_num"></td>
				</tr>
				<tr>
					<td class="table-bottom">
						<button class="reservbtn" type="submit">
							<h1>예약하기</h1>
						</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
