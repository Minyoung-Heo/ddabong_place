<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.btn {
	margin-top: 20px;
	margin-right: 30px;
	background-color: #ffe8cc;
	outline: none;
}

.btn:hover {
	background-color: #ffba66;
}
</style>
<script type="text/javascript">
function cancel() {
	if(confirm("웨이팅을 취소하시겠습니까?")) {
		location.href = "cancelwaiting?store_id=${waitingDTO.store_id}&waiting_num=${waitingDTO.waiting_num}";
	}
}
</script>
</head>
<body>
<br><br><br>
<h1>지금 내 순서는 ?</h1><br>
<h1><p><span style="color:#ff8c00;">${waitingDTO.waiting_num}</span> 번</p></h1>
<br>
순서가 다가오면 가게 앞에서 기다려주세요 :)<br>
<input class="btn" type="button" value="웨이팅 현황 보러가기" 
onclick="location.href='mywaiting?customer_id=${waitingDTO.customer_id}'">
<input class="btn" type="button" value="웨이팅 취소" onclick="cancel()">
</body>
</html>