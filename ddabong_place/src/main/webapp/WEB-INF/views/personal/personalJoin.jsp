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
		// 각 입력 필드의 타이머 변수를 개별적으로 설정
		var idInputTimer;
		var passwordTimer;
		var nameTimer;
		var nicknameTimer;
		var phoneTimer;
		var emailTimer;

		// 아이디 입력란의 유효성 검사 및 중복 체크
		$("#personalid")
				.on(
						'input',
						function() {
							clearTimeout(idInputTimer);
							idInputTimer = setTimeout(
									function() {
										var id = $("#personalid").val();
										var idErrorMessage = $("#idErrorMessage");

										if (/^[A-Za-z0-9]+$/.test(id)) {
											// 아이디 형식이 올바른 경우
											$
													.ajax({
														type : "post",
														async : true,
														url : "idcheck",
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
																				"success-message").css("color", "green");;
															} else {
																// 사용 중인 아이디
																idErrorMessage
																		.text(
																				"✘ 사용 중인 아이디입니다.")
																		.removeClass(
																				"success-message").css("color", "red");;
															}
														},
														error : function(result) {
															// 오류 발생 시
															idErrorMessage
																	.text(
																			"✘ 다시 입력해주세요.")
																	.removeClass(
																			"success-message").css("color", "red");;
														}
													});
										} else {
											// 아이디 형식이 올바르지 않은 경우
											idErrorMessage
													.text(
															"✘ 아이디는 영어와 숫자로만 입력 가능합니다.")
													.removeClass(
															"success-message")
													.css("color", "red");
										}
									}, 1000);
						});

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
		$("#personalname").on(
				'input',
				function() {
					clearTimeout(nameTimer);
					nameTimer = setTimeout(function() {
						var name = $("#personalname").val();
						var nameErrorMessage = $("#nameErrorMessage");

						if (/^[가-힣]+$/.test(name)) {
							nameErrorMessage.text("사용 가능한 이름입니다.").removeClass(
									"success-message").css(
											"color", "green");
						} else {
							nameErrorMessage.text("✘ 이름은 한글로만 입력 가능합니다.")
									.removeClass("success-message").css(
											"color", "red");
						}
					}, 1000);
				});

		// 닉네임 유효성 검사
		$("#personalnickname").on(
				'input',
				function() {
					clearTimeout(nicknameTimer);
					nicknameTimer = setTimeout(function() {
						var nickname = $("#personalnickname").val();
						var nicknameErrorMessage = $("#nicknameErrorMessage");

						if (/^[A-Za-z가-힣0-9]+$/.test(nickname)) {
							nicknameErrorMessage.text("사용 가능한 닉네임입니다.").removeClass(
									"success-message").css(
											"color", "green");
						} else {
							nicknameErrorMessage.text(
									"✘ 닉네임은 한글, 영어, 숫자로만 입력 가능합니다.")
									.removeClass("success-message").css(
											"color", "red");
						}
					}, 1000);
				});

		// 전화번호 유효성 검사
		$("#personalphone").on(
				'input',
				function() {
					clearTimeout(phoneTimer);
					phoneTimer = setTimeout(function() {
						var phone = $("#personalphone").val();
						var phoneErrorMessage = $("#phoneErrorMessage");

						if (/^[\d-]+$/.test(phone)) {
							phoneErrorMessage.text("사용 가능한 전화번호입니다.").removeClass(
									"success-message").css(
											"color", "green");
						} else {
							phoneErrorMessage.text("✘ 전화번호 형식이 올바르지 않습니다.")
									.removeClass("success-message").css(
											"color", "red");
						}
					}, 1000);
				});

		// 이메일 유효성 검사
		$("#personalemail").on(
				'input',
				function() {
					clearTimeout(emailTimer);
					emailTimer = setTimeout(function() {
						var email = $("#personalemail").val();
						var emailErrorMessage = $("#emailErrorMessage");

						if (/^[A-Za-z0-9]+@[A-Za-z0-9]+\.[A-Za-z]+$/
								.test(email)) {
							emailErrorMessage.text("사용 가능한 이메일입니다.").removeClass(
									"success-message").css(
											"color", "green");
						} else {
							emailErrorMessage.text("✘ 이메일 형식이 올바르지 않습니다.")
									.removeClass("success-message").css(
											"color", "red");
						}
					}, 1000);
				});

	});
</script>

<!-- 주소 api -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
	function execPostCode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 도로명 조합형 주소 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				console.log(data.zonecode);
				console.log(fullRoadAddr);

				$("[name=addr1]").val(data.zonecode);
				$("[name=addr2]").val(fullRoadAddr);

			}
		}).open();
	}
</script>
</head>
<body>
	<div class="BZ">
		<div class="container2">
			<h1 class="login_title">회원 가입</h1>
			<form action="personalsave" method="post" id="myForm">
				<br> 아이디<input type="text" id="personalid" class="textbox"
					placeholder="아이디" name="personalid" maxlength="20">
				<div class="error-message" id="idErrorMessage"></div>

				비밀번호<input type="password" id="personalpw" class="textbox"
					placeholder="비밀번호" name="personalpw" maxlength="20"> 비밀번호확인<input
					type="password" id="personalpw_confirm" class="textbox"
					placeholder="비밀번호 확인" maxlength="20">
				<div class="error-message" id="passwordErrorMessage"></div>

				이름<input type="text" id="personalname" class="textbox"
					placeholder="이름" name="personalname">
				<div class="error-message" id="nameErrorMessage"></div>

				닉네임<input type="text" id="personalnickname" class="textbox"
					placeholder="닉네임" name="personalnickname">
				<div class="error-message" id="nicknameErrorMessage"></div>

				전화번호<input type="text" id="personalphone" name="personalphone"
					class="textbox" placeholder="전화번호를 입력해주세요. ">
				<div class="error-message" id="phoneErrorMessage"></div>

				주소<br> <input class="textbox"
					style="width: 70%; height: 50%; background-color: #d9d9d9; display: inline; margin-right: 18px;"
					placeholder="우편번호" name="addr1" id="addr1" type="text"
					readonly="readonly">
				<button type="button" class="btn btn-default"
					onclick="execPostCode();">
					<i class="fa fa-search"></i> 우편번호 찾기
				</button>
				<input class="textbox" style="background-color: #d9d9d9"
					placeholder="도로명 주소" name="addr2" id="addr2" type="text"
					readonly="readonly" /> <input class="textbox" placeholder="상세주소"
					name="addr3" id="addr3" type="text" /> 이메일<input type="text"
					id="personalemail" class="textbox" name="personalemail"
					placeholder="이메일 ex)user@ddabongplace.com">
				<div class="error-message" id="emailErrorMessage"></div>
				<button id="loginButton" class="btn_login" type="submit">회원가입</button>
				<br>
			</form>
		</div>
	</div>
</body>
</html>
