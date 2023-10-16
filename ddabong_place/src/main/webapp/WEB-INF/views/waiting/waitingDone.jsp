<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br><br>
<h1>${waitingDTO.name} 님, 웨이팅 등록이 완료되었습니다.</h1><br>
내 순서는 ?<br>
<h1><p><span style="color:#ff8c00;">${waitingDTO.waiting_num}</span> 번</p></h1>
<br>
순서가 다가오면 가게 앞에서 기다려주세요 :)
</body>
</html>