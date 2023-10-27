<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
font-family: SF Pro KR, SF Pro Display, SF Pro Icons, AOS Icons, Apple Gothic,
	HY Gulim, MalgunGothic, HY Dotum, Lexi Gulim, Helvetica Neue, Helvetica,
	Arial, sans-serif ; .layerPopup img {
	margin-bottom: 20px;
}

.layerPopup:before {
	display: block;
	content: "";
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, .5);
	z-index: 9000
}

.layerPopup .layerBox {
	z-index: 10000;
	position: fixed;
	left: 70%;
	top: 50%;
	transform: translate(-50%, -50%);
	padding: 30px;
	background: #fff;
	border-radius: 6px;
}

.layerPopup .layerBox .title {
	margin-bottom: 10px;
	padding-bottom: 10px;
	font-weight: 600;
	border-bottom: 1px solid #d9d9d9;
}

.layerPopup .layerBox .btnTodayHide {
	font-size: 14px;
	font-weight: 600;
	color: black;
	float: left;
	text-decoration: none;
	width: 150px;
	height: 30px;
	line-height: 30px;
	border: black solid 1px;
	text-align: center;
	text-decoration: none;
}

.layerPopup div {
	display: inline;
}

.layerPopup form {
	margin-top: 5px;
	font-size: 16px;
	font-weight: 600;
	weight: 100%;
	height: 30px;
	line-height: 30px
}

.layerPopup #close {
	font-size: 16px;
	font-weight: 600;
	width: 40px;
	height: 30px;
	color: black;
	float: right;
	line-height: 30px;
	text-align: center;
	text-decoration: underline;
}

.layerPopup a {
	text-decoration: none;
	color: black;
	width: 50px;
	height: 40px;
}

.divpop {
	position: absolute;
	z-index: 999;
	top: 50px;
	left: 50px;
	width: 350px;
	height: 500px;
	border: 1px solid black;
	background-color: yellow;
	display: none;
}
</style>
<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
<script type="text/javascript">
    // 쿠키 설정 함수
    function setCookie(name, value, expiredays) {
        var today = new Date();
        today.setDate(today.getDate() + expiredays);
        var cookieString = name + "=" + encodeURIComponent(value) + "; expires=" + today.toUTCString() + "; path=/";
        document.cookie = cookieString;
    }

    // 쿠키 가져오기 함수
    function getCookie(name) {
        var cookies = document.cookie.split("; ");
        for (var i = 0; i < cookies.length; i++) {
            var cookie = cookies[i].split("=");
            if (cookie[0] === name) {
                return decodeURIComponent(cookie[1]);
            }
        }
        return null;
    }

    // 닫기 버튼 클릭시
    function closePopup() {
        var checkbox = document.getElementById('chkbox');
        if (checkbox.checked) {
            setCookie('popupClosed', 'true', 1); // 1일 동안 쿠키 유지
        }
        $('#layer_popup').hide();
    }

    $(document).ready(function() {
        var popupClosed = getCookie('popupClosed');
        if (!popupClosed) {
            $('#layer_popup').show();
        }
    });
</script>
</head>
<body>
    <div class="layerPopup" id="layer_popup" style="display: none;">
        <div class="layerBox">
            <h4 class="title">따봉플레이스 리뷰 이벤트</h4>
            <div class="cont">
                <p>
                    <a href="quiz">
                        <img src="/dda/image/quizLogo.png" style="width: 400px; height: 600px;" alt="event page">
                    </a>
                </p>
            </div>
            <form name="pop_form">
                <div class="divpop" id="divpop">
                    <input type="checkbox" name="chkbox" id="chkbox" value="Y">
                    오늘 하루 동안 보지 않기 <a href="javascript:closePopup();"><B>[닫기]</B></a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>