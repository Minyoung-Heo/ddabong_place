<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.wait {
	margin-top: 20px;
	margin-left: 100px;
	text-align: left;
	font-size: 25px;
	width: 40%;
}

.wait input[type='text'] {
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function(){
	$("#waitingcheck").click(function(event){
		var f = document.gowait;
		var cname = f.name.value;
		var vname = /^[가-힣]{1,}$/;
		if(!vname.test(cname)){
			alert("이름을 한글로 입력해주세요.");
			f.name.select();
			return false;
		}
		
		var cphone = f.phone.value;
		var vphone = /^[\d-]{11,}$/;
		if(!vphone.test(cphone)){
			alert("전화번호를 입력해주세요.");
			f.phone.select();
			return false;
		}
		$.ajax({
			type : "post",
			url : "waitingcheck",
			async : true,
			data : {
				store_id : "${store_id}", 
				customer_id : "${personal.id}"
				},
			success : function(result) {
				if(result == "no"){
					alert("이미 대기 중인 가게입니다.");
				} else {
					if(confirm("웨이팅을 등록하시겠습니까?")) {
						f.submit();
					}
				}
			},
			error : function() {
				alert("error");
			}
		});
	});
});
</script>
<script type="text/javascript">
$(function() {
	var num = 1;
	$("#person_num").val(num);
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
});
</script>
</head>
<body>
<c:choose>
<c:when test="${personal!=null}">
<center>
	<br>
	<br>
	<br><br><br>
	<h1>웨이팅 등록</h1>
	<form action="waitingSave" method="post" name="gowait">
	<table class="wait">
	<input type="hidden" name="store_id" value="${store_id}">
	<input type="hidden" name="customer_id" value="${personal.id}">
	<tr><td>이름</td><td><input type="text" name="name"></td></tr>
	<tr><td>전화번호</td><td><input type="text" name="phone"></td></tr>
	<tr><td>인원 수</td>
	<td id="flex">
	<input class="btn" type="button" value="-" id="minus">
	<div id="person">1</div> 
	<input class="btn" type="button" value="+" id="plus" style="margin-right:200px;">
	<input type="hidden" name="person_num" id="person_num">
	</td>
	</tr>
	
	<tr><td colspan="2" style="text-align: center;">
	<input class="btn" id="waitingcheck" type="button" value="웨이팅 걸기"></td></tr>
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
