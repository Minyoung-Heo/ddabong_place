<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
var yn = confirm("아이디 또는 비밀번호를 확인해주세요.");
if(yn == true){
	window.location='personalLogin';
	
}
else{
	window.location='main';
}
</script>
</body>
</html>