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
			window.location.replace("personalLogin");
		}
	</script>
</body>
</html>