<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- id찾기 -->
<script>
	function openPersonalIdFindPopup() {
		// personalidFind.jsp 페이지 URL을 지정합니다. 필요한 경우 수정하세요.
		var personalIdFindURL = 'personalidFind';

		// 팝업을 열기 위한 윈도우의 크기와 위치를 설정합니다.
		var width = 600;
		var height = 400;
		var left = (window.innerWidth - width) / 2;
		var top = (window.innerHeight - height) / 2;

		// 팝업을 열기 위한 윈도우 속성들을 설정합니다.
		var popupOptions = 'width=' + width + ',height=' + height + ',left='
				+ left + ',top=' + top;

		// personalidFind.jsp 페이지를 팝업으로 엽니다.
		window.open(personalIdFindURL, 'personalIdFindPopup', popupOptions);

	}
</script>
<!-- pw찾기 -->
<script>
	function openPersonalPwFindPopup() {
		// personalidFind.jsp 페이지 URL을 지정합니다. 필요한 경우 수정하세요.
		var personalPwFindURL = 'personalpwFind';

		// 팝업을 열기 위한 윈도우의 크기와 위치를 설정합니다.
		var width = 600;
		var height = 400;
		var left = (window.innerWidth - width) / 2;
		var top = (window.innerHeight - height) / 2;

		// 팝업을 열기 위한 윈도우 속성들을 설정합니다.
		var popupOptions = 'width=' + width + ',height=' + height + ',left='
				+ left + ',top=' + top;

		// personalidFind.jsp 페이지를 팝업으로 엽니다.
		window.open(personalPwFindURL, 'personalpwFindPopup', popupOptions);
	}
</script>
<style type="text/css">
.btn3 {
	width: 100%;
	height: 51px;
	color: white; /* 글씨색을 #FF8C00으로 변경 */
	font-size: 19px;
	margin-top: 20px;
	border-radius: 40px;
	cursor: pointer; /* 마우스 커서를 포인터로 변경 */
	/* 기본 스타일 */
	background-color: #ffc680;
	color: white;
	transition: background-color 0.3s, color 0.3s; /* 트랜지션 추가 */
	margin-top: 40px;
}

.btn2 {
	width: 50%;
	height: 51px;
	color: white; /* 글씨색을 #FF8C00으로 변경 */
	font-size: 14px;
	margin-top: 170px;
	width: 50%;
	border-radius: 40px;
	cursor: pointer; /* 마우스 커서를 포인터로 변경 */
	/* 기본 스타일 */
	background-color: #ffc680;
	color: white;
	transition: background-color 0.3s, color 0.3s; /* 트랜지션 추가 */
	margin-top: 40px;
}

.btn2:hover, .btn3:hover {
	/* 호버 시 스타일 */
	background-color: #ff8c00;
	color: white;
}

.container2 {
	width: 400px;
	margin: auto;
	text-align: center;
}
</style>
<meta charset="UTF-8">
<title>회원 로그인</title>
</head>
<body>
	<div class="BZ">
		<h1 class="login_title">잃어버린 ID와 PW 찾기</h1>

		<div class="container2">
			<input class="btn3" value="이름과 이메일로 아이디 찾기 &#x1F50E;" type="button"
				onclick="openPersonalIdFindPopup()"> <input class="btn3"
				value="이름과 아이디로 비밀번호 찾기 &#x1F50E;" type="button"
				onclick="openPersonalPwFindPopup()"> <input class="btn2"
				value="로그인하기 🔑 " type="button"
				onclick="location.href='personalLogin'">
		</div>
	</div>
</body>
</html>