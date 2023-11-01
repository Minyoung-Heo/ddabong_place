<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>회원 가입</title>

<!-- jQuery 라이브러리 로드 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Open+Sans);

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

		// 아이디 입력란의 유효성 검사 및 중복 체크
		$("#storeid")
				.on(
						'input',
						function() {
							clearTimeout(idInputTimer);
							idInputTimer = setTimeout(
									function() {
										var id = $("#storeid").val();
										var idErrorMessage = $("#idErrorMessage");

										if (/^[0-9]+$/.test(id)) {
											// 아이디 형식이 올바른 경우
											$
													.ajax({
														type : "post",
														async : true,
														url : "storeidcheck",
														data : {
															"id" : id
														},
														success : function(
																result) {
															if (result == "ok") {
																// 사용 가능한 아이디
																idErrorMessage
																		.text(
																				"✔ 사용 가능한 아이디입니다.")
																		.addClass(
																				"success-message").css(
																						"color", "green");
															} else {
																// 사용 중인 아이디
																idErrorMessage
																		.text(
																				"✘ 사용 중인 아이디입니다.")
																		.removeClass(
																				"success-message").css(
																						"color", "red");
															}
														},
														error : function(result) {
															// 오류 발생 시
															idErrorMessage
																	.text(
																			"✘ 관리자에게 문의해주세요.")
																	.removeClass(
																			"success-message").css(
																					"color", "red");
														}
													});
										} else {
											// 아이디 형식이 올바르지 않은 경우
											idErrorMessage
													.text(
															"✘ 아이디는 사업자번호로써 숫자로만 입력 가능합니다.")
													.removeClass(
															"success-message")
													.css("color", "red");
										}
									}, 1000);
						});

		// 비밀번호 유효성 검사
		$("#storepw").on(
				'input',
				function() {
					clearTimeout(passwordTimer);
					passwordTimer = setTimeout(function() {
						var password = $("#storepw").val();
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
		$("#storepw_confirm").on(
				'input',
				function() {
					clearTimeout(passwordTimer);
					passwordTimer = setTimeout(function() {
						var password = $("#storepw").val();
						var confirmPassword = $("#storepw_confirm").val();
						var passwordErrorMessage = $("#passwordErrorMessage");

						if (/^[A-Za-z0-9]{5,16}$/.test(password)) {
							if (password !== confirmPassword) {
								passwordErrorMessage.text("✘ 비밀번호를 다시 확인해주세요.")
										.removeClass("success-message").css(
												"color", "red");
							} else {
								passwordErrorMessage.text("✔ 비밀번호가 일치합니다.")
										.addClass("success-message").css(
												"color", "green");
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
		$("#storename").on(
				'input',
				function() {
					clearTimeout(uTimer);
					uTimer = setTimeout(function() {
						var name = $("#storename").val();
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
		$("#storephone").on(
				'input',
				function() {
					clearTimeout(uTimer);
					uTimer = setTimeout(function() {
						var phone = $("#storephone").val();
						var phoneErrorMessage = $("#phoneErrorMessage");

						if (/^[\d-]+$/.test(phone)) {
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
		$("#storeemail")
				.on(
						'input',
						function() {
							clearTimeout(uTimer);
							uTimer = setTimeout(
									function() {
										var name = $("#storeemail").val();
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

</head>
<body>
	<div class="BZ">
		<div class="container2">
			<h1 class="login_title">업체 관리자 가입</h1>
			<form action="storesave" method="post" id="myForm">
				사업자 등록 번호<input type="text" id="storeid" class="textbox"
					placeholder="-를 제외한 번호(10자리) 입력해주세요. ex)0123456789 " name="storeid"
					maxlength="20">
				<div class="error-message" id="idErrorMessage"></div>

				비밀번호<input type="password" id="storepw" class="textbox"
					placeholder="비밀번호" name="storepw" maxlength="20"> 비밀번호확인<input
					type="password" id="storepw_confirm" class="textbox"
					placeholder="비밀번호 확인" maxlength="20">
				<div class="error-message" id="passwordErrorMessage"></div>

				대표자명<input type="text" id="storename" class="textbox"
					placeholder="대표자명" name="storename">
				<div class="error-message" id="nameErrorMessage"></div>

				전화번호<input type="text" id="storephone" name="storephone"
					class="textbox" placeholder="전화번호를 입력해주세요. ">
				<div class="error-message" id="phoneErrorMessage"></div>


				이메일<input type="text" id="storeemail" class="textbox"
					placeholder="이메일 ex)user@ddabongplace.com" name="storeemail">
				<div class="error-message" id="emailErrorMessage"></div>

				<button id="loginButton" class="btn_login" type="submit">회원가입</button>
				<br>
			</form>
		</div>
	</div>
</body>
</html>
