<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
	<script language="javascript">
		function confirmLeaveacc() {
			var confirmflag = confirm("정말 회원 탈퇴하시겠습니까?");
			if (confirmflag) {
				 alert("정상적으로 회원 탈퇴되었습니다. 이용해주셔서 감사합니다.");
				window.location.href = "storeaccountdelete?id=${store.id}";
			} else {
				window.location.href = "/dda/";
			}
		}
		window.onload = confirmLeaveacc;
	</script>
</body>
</body>

</html>