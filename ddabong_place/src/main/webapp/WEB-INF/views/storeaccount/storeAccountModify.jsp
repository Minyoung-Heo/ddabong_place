<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Open+Sans);
.div-container {
	margin-top: 30px;
	display: flex;
	width: 90%;
	justify-content: space-evenly;
}

.category {
	margin-top: 70px;
	width: 30%;
	margin-left: 40px;
	text-align: left;
}

.category a {
	line-height: 40px;
	font-size: 20px;
	color: #FFBE1C;
	text-decoration: none;
}

.category a:hover {
	color: #ff8c00;
}
.qna {
	margin-top: 20px;
	text-align: center;
	font-size: 15px;
	width: 85%;
	margin-right:260px;
	
}
.container2 {
	width: 460px;
	margin: auto;
	text-align: center;
}

.login_title {
	font-size: 35px;
	color: black;
	margin-bottom: 26px;
}

.textbox {
	width: 100%;
	height: 51px;
	border: 1px solid #FF8C00;
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
	background-color: #FF8C00;
	color: white;
	font-size: 23px;
	margin-top: 20px;
	border-radius: 40px;
	outline: none;
	border: none;
}

.error-message {
	color: red;
	font-size: 12px;
	margin-top: 5px;
}

.success-message {
	color: #00e600;
	font-size: 12px;
	margin-top: 5px;
}
</style>

<script type="text/javascript">
	$(function() {
		var idInputTimer;
		var passwordTimer;
		var uTimer;

		// 비밀번호 유효성 검사
		$("#personalpw").on(
				'input',
				function() {
					clearTimeout(passwordTimer);
					passwordTimer = setTimeout(function() {
						var password = $("#personalpw").val();
						var passwordErrorMessage = $("#passwordErrorMessage");

						if (/^[A-Za-z0-9]{5,16}$/.test(password)) {
							passwordErrorMessage.text("").removeClass(
									"success-message");
						} else {
							passwordErrorMessage.text(
									"✘ 비밀번호는 영어와 숫자로 5~16글자만 입력 가능합니다.")
									.removeClass("success-message").css(
											"color", "red");
						}
					}, 1000);
				});

		// 비밀번호 확인 체크 및 유효성
		$("#personalpw_confirm").on(
				'input',
				function() {
					clearTimeout(passwordTimer);
					passwordTimer = setTimeout(function() {
						var password = $("#personalpw").val();
						var confirmPassword = $("#personalpw_confirm").val();
						var passwordErrorMessage = $("#passwordErrorMessage");

						if (/^[A-Za-z0-9]{5,16}$/.test(password)) {
							if (password !== confirmPassword) {
								passwordErrorMessage.text("✘ 비밀번호를 다시 확인해주세요.")
										.removeClass("success-message").css(
												"color", "red");
							} else {
								passwordErrorMessage.text("✔ 비밀번호가 일치합니다.")
										.addClass("success-message").css(
												"color", "#00e600");
							}
						} else {
							passwordErrorMessage.text(
									"✘ 비밀번호는 영어와 숫자로 5~16글자만 입력 가능합니다.")
									.removeClass("success-message").css(
											"color", "red");
						}
					}, 1000);
				});
		// 이름 유효성 검사
		$("#personalname").on(
				'input',
				function() {
					clearTimeout(uTimer);
					uTimer = setTimeout(function() {
						var name = $("#personalname").val();
						var nameErrorMessage = $("#nameErrorMessage");

						if (/^[가-힣]+$/.test(name)) {
							nameErrorMessage.text("").removeClass(
									"success-message");
						} else {
							nameErrorMessage.text("✘ 이름은 한글로만 입력 가능합니다.")
									.removeClass("success-message").css(
											"color", "red");
						}
					}, 1000);
				});
		// 전화번호 유효성 검사
		$("#personalphone").on(
				'input',
				function() {
					clearTimeout(uTimer);
					uTimer = setTimeout(function() {
						var phone = $("#personalphone").val();
						var phoneErrorMessage = $("#phoneErrorMessage");

						if (/^\d{11}$/.test(phone)) {
							phoneErrorMessage.text("").removeClass(
									"success-message");
						} else {
							phoneErrorMessage.text("✘ 전화번호 형식이 올바르지 않습니다.")
									.removeClass("success-message").css(
											"color", "red");
						}
					}, 1000);
				});
		// 이메일 유효성 검사
		$("#personalemail")
				.on(
						'input',
						function() {
							clearTimeout(uTimer);
							uTimer = setTimeout(
									function() {
										var name = $("#personalemail").val();
										var emailErrorMessage = $("#emailErrorMessage");

										if (/^[A-Za-z0-9]+@[A-Za-z0-9]+\.[A-Za-z]+$/
												.test(name)) {
											emailErrorMessage.text("")
													.removeClass(
															"success-message");
										} else {
											emailErrorMessage
													.text(
															"✘ 이메일은 영문,숫자,특수문자(@ 또는.)로만 입력 가능합니다.")
													.removeClass(
															"success-message")
													.css("color", "red");
										}
									}, 1000);
						});

	});
</script>
<script>
	$(document).ready(function() {
		$("#loginButton").click(function() {
			alert("회원 정보가 정상적으로 수정되었습니다. 다시 로그인해주세요.");
		});
	});
</script>
<body>
<br><br>	
	<div class="div-container">
		<div class="category">
			<h1>마이페이지</h1>
			<a href="storeoutput?store_id=${store.id}">나의 매장 정보</a><br> 
			<a href="storemodifyview?store_id=${store.id}">매장 정보 수정</a><br>
			<a href="storeinput">매장 등록</a><br>
			<a href="">매장 삭제</a><br>
			<hr style="width:190px; text-align: left; margin-left:0;">			
			<a href="storeaccountinfo?id=${store.id}">나의 회원 정보</a><br>
			<a href="storeaccountmodify?id=${store.id}" style="color: #ff8c00;">회원 정보 수정</a><br>
			<a href="storeaccountleave">회원 탈퇴</a><br>
		</div>

		<div class="qna">
					<div class="container2">
			<h1 class="login_title">회원 정보 수정</h1>
			<form action="storeAccountModifySave" method="post" id="myForm">
				<br> 아이디<input type="text" id="personalid" class="textbox"
					name="storeAccountid" maxlength="20" value="${dto.id}"
					readonly="readonly">
				<div class="error-message" id="idErrorMessage"></div>

				비밀번호<input type="password" id="personalpw" class="textbox"
					placeholder="비밀번호" name="storeAccountpw" maxlength="20"> 
					비밀번호확인<input type="password"
					id="personalpw_confirm" class="textbox" placeholder="비밀번호 확인"
					maxlength="20">
				<div class="error-message" id="passwordErrorMessage"></div>

				이름<input type="text" id="personalname" class="textbox"
					placeholder="이름" name="storeAccountceo" value="${dto.ceo}">
				<div class="error-message" id="nameErrorMessage"></div>

				전화번호<input type="text" id="personalphone" name="storeAccountphone"
					class="textbox" placeholder="전화번호 -를 제외한 번호 입력. ex)010xxxxxxxx "
					value="${dto.phone}">
				<div class="error-message" id="phoneErrorMessage"></div>

				이메일<input type="text"
					id="personalemail" class="textbox" name="storeAccountemail"
					placeholder="이메일 ex)user@ddabongplace.com"
					value="${dto.email}">
				<div class="error-message" id="emailErrorMessage"></div>
				<button id="loginButton" class="btn_login" type="submit">수정
					완료</button>
				<br>
			</form>
		</div>
		</div>
	</div>
	
	
</body>
</html>
