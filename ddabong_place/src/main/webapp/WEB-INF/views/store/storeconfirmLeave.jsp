<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="width:100%; height:100%; border:0;"></div>
	<script language="javascript">
		function storeconfirmLeave() {
			var confirmflag = confirm("매장을 정말 삭제하시겠습니까?");
			if (confirmflag) {
				alert("정상적으로 매장 삭제되었습니다. 이용해주셔서 감사합니다.");
				window.location.href = "storedelete?id=${store.id}";
			} else {
				window.location.href = "/dda/";
			}
		}
		window.onload = storeconfirmLeave;
	</script>

</body>

</html>