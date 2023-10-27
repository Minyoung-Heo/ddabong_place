<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
    integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"
    integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css"
    integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="/dda/images/jquery-ui.css">
  <script src="/dda/images/jquery-ui.min.js"></script>
<script>
$(function() {
	var num = 1;
	// 인원수 증가버튼
	$("#plus").click(function() {
				num = num + 1;
				$("#person").html(num);
				$("#person_num").val(num);
	});
	// 인원수 감소버튼
	$("#minus").click(function() {
		if(num > 0) { // 0 밑으로 떨어지지 않게 설정
		num = num - 1;
		$("#person").html(num);
		$("#person_num").val(num);
		}
		});
	
    $("#reservbnt").click(function(event) {
        var f = document.reserv;
        var cdate = f.reservation_date.value;
        var ctime = f.reservation_time.value;
        var cname = f.reservation_name.value;

        if (cdate === null || cdate === "") {
            alert("예약일자를 선택하세요.");
            event.preventDefault(); // submit 막음
        } else if (ctime === null || ctime === "") {
            alert("예약시간을 선택하세요.");
            event.preventDefault(); // submit 막음
        } else if (cname === null || cname === "") {
            alert("예약자명을 입력하세요.");
            event.preventDefault(); // submit 막음
        } else {
				// AJAX로 reviewcheck 메소드 호출
				 var reservation_date = $("#reservation_date").val();
				$.ajax({
					type : "POST",
					async : true,
					url : "duplicatecheck",
					data : {
						customer_id : "${personal.id}",
						reservation_date : reservation_date,
						storeidid : "${storeID}"
					},
					success : function(result) {
						if (result === "ok") {
							alert("예약이 완료되었습니다.");
							f.submit();
						} else {
							alert("당일 중복 예약할 수 없습니다.");
							 event.preventDefault();
						}
					}
				});
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
		yearSuffix : '년',
		minDate: 0
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
.datepicker {
	width: 70%;
	height: 50px;
	border-radius: 30px;
	margin-top: 10px;
	padding: 20px;
	border: 1px solid #ff8c00;
	outline: none;
}
.wait {
	margin-top: 20px;
	margin-left: 100px;
	text-align: left;
	font-size: 25px;
	width: 40%;
}

.wait input[type='text'],.wait input[type='time'] {
	width: 70%;
	height: 50px;
	border-radius: 30px;
	margin-top: 10px;
	padding: 20px;
	border: 1px solid #ff8c00;
	outline: none;
}

.btn {
	margin-top: 20px;
	margin-right: 100px;
	background-color: #ffe8cc;
	outline: none;
}

.btn:hover {
	background-color: #ffba66;
}
#flex {
	display: flex;
	align-items: center;
	justify-content: space-evenly;
	padding: 10px;
}
#flex input{
	margin:0px;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<br>
	<br>
	<br>
	<c:choose>
<c:when test="${personal!=null}">
<center>
	<br>
	<br>
	<h1>매장 예약</h1>
	<form action="reservsave" method="post" name="reserv">
	<input type="hidden" name="storeid" value="${storeID }">
			<input type="hidden" name="customer_id" value="${personal.id }">
	<table class="wait">
	<input type="hidden" name="store_id" value="${store_id}">
	<input type="hidden" name="customer_id" value="${personal.id}">
	<tr><td>예약일자</td><td><input class="datepicker" name="reservation_date" id="reservation_date" autocomplete="off"></td></tr>
	<tr><td>예약시간</td><td><input type="time" name="reservation_time"></td></tr>
	<tr><td>예약자명</td><td><input type="text" name="reservation_name"></td></tr>
	<tr><td>인원 수</td>
	<td id="flex">
	<input class="btn" type="button" value="-" id="minus">
	<div id="person">1</div> 
	<input class="btn" type="button" value="+" id="plus" style="margin-right:200px;">
	<input type="hidden" name="person_num" id="person_num">
	</td>
	</tr>
	
	<tr><td colspan="2" style="text-align: center;">
	<input class="btn" id="reservbnt" type="button" value="예약하기"></td></tr>
	</table>
	</form>
</c:when>
<c:otherwise>

<script>
alert("로그인 후 이용 가능한 서비스입니다.");
location.href = "selectLogin";
</script>

</c:otherwise>
</c:choose>
</body>
</html>
