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
		var alertMessage = "${alertMessage}";
		if (alertMessage) {
			alert(alertMessage);
			console.log("이전페이지로 고고싱");
			window.history.back();
		}
	</script>
</body>
</html>