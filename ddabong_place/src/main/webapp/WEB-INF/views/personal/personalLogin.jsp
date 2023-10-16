<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script>
	document.addEventListener("DOMContentLoaded", function() {
		const pi = document.getElementById("personalid");
		const pw = document.getElementById("personalpw");
		const btn = document.getElementById("loginButton");

		// 초기에 로그인 버튼을 비활성화
		btn.style.backgroundColor = "#CCCCCC"; // 회색 배경색
		btn.style.cursor = "not-allowed"; // 커서를 바꿔서 클릭 불가능한 상태로 만듬

		pi.addEventListener("input", toggleLoginButton);
		pw.addEventListener("input", toggleLoginButton);

		function toggleLoginButton() {
			if (pi.value.trim() !== "" && pw.value.trim() !== "") {
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
	outline: none;
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

.snslogin {
	margin-top: 50px;
	position: relative; /* 요소를 상대적 위치로 설정 */
	display: inline-block;
}

.snslogin::before, .snslogin::after {
	content: "";
	display: block;
	width: 100%;
	border-top: 1px solid #000; /* 상단 가로 실선 스타일 및 두께 설정 */
	position: absolute;
	top: 50%;
}

.snslogin::before {
	right: 100%; /* 왼쪽 가로 실선 위치 조절 */
	margin-right: 5px; /* 왼쪽 간격 조절 */
}

.snslogin::after {
	left: 100%; /* 오른쪽 가로 실선 위치 조절 */
	margin-left: 5px; /* 오른쪽 간격 조절 */
}
</style>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
	charset="utf-8"></script>
<script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId({
		clientId : "aXkj6_wya1onatcykcxa",
		// 본인의 Client ID로 수정, 띄어쓰기는 사용하지 마세요.
		callbackUrl : "http://localhost:8421/dda/",
		// 본인의 callBack url로 수정하세요.
		isPopup : false,
		loginButton : {
			color : "white",
			type : 3,
			height : 60
		}
	// 네이버 로그인버튼 디자인 설정. 한번 바꿔보세요:D
	});
	naverLogin.init();
</script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>회원 로그인</title>
</head>
<body>
	<div class="BZ">
		<div class="container2">
			<h1 class="login_title">회원 로그인</h1>
			<form class="login_form" action="personallogincheck" method="post">
				<div class="id_area">
					<span class="id_input"> <input type="text" id="personalid"
						class="id" placeholder="아이디를 입력하세요 !" name="personalid"
						maxlength="20">
					</span>
				</div>
				<div class="pswd_area">
					<span class="pswd_input"> <input type="password"
						id="personalpw" class="pswd" placeholder="비밀번호를 입력하세요 !"
						name="personalpw" maxlength="16">
					</span>
				</div>
				<button id="loginButton" class="btn_login" value="로그인" type="submit"
					disabled>로그인</button>
				<br>
			</form>
		</div>
	</div>
	<a onclick="location.href='personalFind'"
		style="text-decoration: none; cursor: pointer;"> <p1>아이디 또는
		비밀번호를 잊어버리셨나요 ?</p1></a> <br>
	<h3 class="snslogin">SNS 아이디로 로그인하기</h3>
	<div id="naver_id_login"></div>
	<script type="text/javascript">
		var naver_id_login = new naver_id_login("aXkj6_wya1onatcykcxa",
				"http://localhost:8421/dda/");
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("white", 2, 40);
		naver_id_login.setDomain("http://localhost:8421/");
		naver_id_login.setState(state);
		naver_id_login.setPopup();
		naver_id_login.init_naver_id_login();
	</script>
</body>
</html>
