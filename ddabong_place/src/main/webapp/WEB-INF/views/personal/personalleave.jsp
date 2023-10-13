<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script>
	document.addEventListener("DOMContentLoaded", function() {
		const pw = document.getElementById("personalpw");
		const btn = document.getElementById("loginButton");

		// 초기에 로그인 버튼을 비활성화
		btn.style.backgroundColor = "#CCCCCC"; // 회색 배경색
		btn.style.cursor = "not-allowed"; // 커서를 바꿔서 클릭 불가능한 상태로 만듬

		pw.addEventListener("input", toggleLoginButton);

		function toggleLoginButton() {
			if (pw.value.trim() !== "") {
				btn.style.backgroundColor = "#FF8C00"; // 입력이 있을 때 원래 색상으로 변경
				btn.style.cursor = "pointer"; // 커서를 다시 클릭 가능한 상태로 변경
				btn.removeAttribute("disabled");
			} else {
				btn.style.backgroundColor = "#CCCCCC"; // 입력이 없을 때 회색으로 유지
				btn.style.cursor = "not-allowed"; // 커서를 클릭 불가능한 상태로 유지
				btn.setAttribute("disabled", "true");
			}
		}
	});
</script>

<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Open+Sans);

a {
	color: #222;
	text-decoration: none;
}

a:hover {
	color: #2698cb;
}

/* 폰트 스타일 초기화 */
em, address {
	font-style: normal;
}
/* 블릿기호 초기화 */
ul, li, ol {
	list-style: none;
}
/* 제목 태그 초기화 */
h1, h2, h3, h4, h5, h6 {
	font-size: 13px;
	font-weight: normal;
}
/* 테두리 초기화 */
img, fieldset {
	border: 0 none;
}
/* 버튼 초기화 */
button {
	border: 0;
}
/* clearfix */
.clearfix {
	*zoom: 1;
}

.clearfix:before, .clearfix:after {
	display: block;
	content: '';
	line-height: 0;
}

.clearfix:after {
	clear: both;
}

.ir_pm {
	display: block;
	overflow: hidden;
	font-size: 0;
	line-height: 0;
	text-indent: -9999px;
} /* 의미있는 이미지의 대체 텍스트를 제공하는 경우(Phark Method) */
.ir_wa {
	display: block;
	overflow: hidden;
	position: relative;
	z-index: -1;
	width: 100%;
	height: 100%;
} /* 의미있는 이미지의 대체 텍스트로 이미지가 없어도 대체 텍스트를 보여주고자 할 때(WA IR) */
.ir_so {
	overflow: hidden;
	position: absolute;
	width: 0;
	height: 0;
	line-height: 0;
	text-indent: -9999px;
} /* 대체 텍스트가 아닌 접근성을 위한 숨김 텍스트를 제공할 때 */

/* input style */
input {
	background-image: none;
}

input[type=button], input[type=reset], input[type=text], input[type=password],
	input[type=submit], input[type=search], input[type=tel], input[type=email]
	{
	-webkit-appearance: none;
}

input[type=search]::-webkit-search-cancel-button, input[type=search]::-webkit-search-decoration
	{
	-webkit-appearance: none
}

input:checked[type=checkbox] {
	background-color: white;
	-webkit-appearance: checkbox
}
/* 셀렉트 메뉴 메인 스타일 */
.ui_select2 {
	width: 100%;
	box-sizing: border-box;
	background: #2c2f34;
	color: #fff;
	display: inline-block;
	height: 36px;
	border: 0 none;
	padding: 0 10px;
	margin: 0;
	font-family: inherit;
	font-size: inherit;
	vertical-align: middle;
	text-align: left;
	white-space: nowrap;
	background-size: 10px;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}
/* 메인 텍스트 박스 스타일1 */
.ui_input3 {
	background: #2c2f34;
	color: #fff;
	border: 0;
	width: 100%;
	height: 36px;
	padding: 0 10px;
}

body {
	font-family: 'Open Sans', sans-serif;
	background: white;
}

.container2 {
	width: 460px;
	margin: auto;
	text-align: center;
}

.login_title {
	font-size: 50px;
	color: black;
	font-weight: bold;
	margin-bottom: 30px;
	width: 100%;
}

.id, .pswd {
	width: 100%;
	height: 51px;
	border: 1px solid #FF8C00; /* 테두리 스타일 및 색상 설정 */
	margin: 5px;
	padding: 10px 14px 10px 14px;
	box-sizing: border-box;
	font-size: 15px;
	border-radius: 40px;
}

.btn_login {
	width: 100%;
	height: 51px;
	background-color: #FF8C00; /* 배경색을 하얀색으로 변경 */
	color: white; /* 글씨색을 #FF8C00으로 변경 */
	font-size: 23px;
	margin-top: 20px;
	border-radius: 40px;
}

p1 {
	margin-top: 20%;
}
</style>
<meta charset="UTF-8">
<title>회원 로그인</title>
</head>
<body>
	<div class="BZ">
		<div class="container2">
			<h1 class="login_title">회원 탈퇴</h1>
			<h4>탈퇴하시려면 비밀번호를 입력해주세요.</h4>
			<form class="login_form" action="personalleavechecking" method="post">
				<div class="pswd_area">
					<span class="pswd_input">
					<input type="hidden" name="personalid" value="${personal.id}">
					 <input type="password"
						id="personalpw" class="pswd" placeholder="비밀번호를 입력하세요 !"
						name="personalpw" maxlength="16">
					</span>
				</div>
				<button id="loginButton" class="btn_login" value="완료" type="submit"
					disabled>완료</button>
				<br>
			</form>
		</div>
	</div>
</body>
</html>
