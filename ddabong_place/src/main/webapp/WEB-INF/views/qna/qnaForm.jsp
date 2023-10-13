<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 페이지</title>
<style>
.div-container {
	margin-top: 30px;
	display: flex;
	width: 90%;
	justify-content: space-evenly;
}

.arrow1, .arrow2, .arrow3, .arrow4 {
	cursor: pointer;
	display: flex;
	margin-top: 14px;
	margin-right: 10px;
	float: right;
	transition: transform 0.3s ease;
}

.category {
	margin-top:70px;
	width:30%;
	margin-left:40px;
	text-align: left;
}

.category a {
	line-height:40px;
	font-size:20px;
	color:#FFBE1C;
	text-decoration: none;
}
.category a:hover {
	color:#ff8c00;
}
.faq-answer1, .faq-answer2, .faq-answer3, .faq-answer4 {
	display: none;
	padding: 20px;
	background-color: #FFEBC6;
	border-bottom: 1px solid #FFBF35;
	overflow: hidden;
}

.qna {
	margin-top: 20px;
	text-align: center;
	font-size: 25px;
	width: 85%;
}

.q1 {
	padding: 15px;
	border-top: 1px solid #FFBF35;
	border-bottom: 1px solid #FFBF35;
}

.q2, .q3, .q4 {
	padding: 15px;
	border-bottom: 1px solid #FFBF35;
}

.a1, .a2, .a3, .a4 {
	font-size: 20px; 
	width : 100%;
	margin-left: 100px;
	text-align: left;
	width: 100%;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
    var answer1 = $("#answer1");
    var arrow1 = $("#arrow1");

    $("#arrow1").click(function() {
        if (answer1.is(":hidden")) {
            answer1.slideDown(500, function() {
                arrow1.css("transform", "rotate(180deg)");
            });
        } else {
            answer1.slideUp(500, function() {
                arrow1.css("transform", "rotate(0deg)");
                answer1.css("display", "none");
            });
        }
    });
    
    var answer2 = $("#answer2");
    var arrow2 = $("#arrow2");

    $("#arrow2").click(function() {
        if (answer2.is(":hidden")) {
            answer2.slideDown(500, function() {
                arrow2.css("transform", "rotate(180deg)");
            });
        } else {
            answer2.slideUp(500, function() {
                arrow2.css("transform", "rotate(0deg)");
                answer2.css("display", "none");
            });
        }
    });
    
    var answer3 = $("#answer3");
    var arrow3 = $("#arrow3");

    $("#arrow3").click(function() {
        if (answer3.is(":hidden")) {
            answer3.slideDown(500, function() {
                arrow3.css("transform", "rotate(180deg)");
            });
        } else {
            answer3.slideUp(500, function() {
                arrow3.css("transform", "rotate(0deg)");
                answer3.css("display", "none");
            });
        }
    });
    
    var answer4 = $("#answer4");
    var arrow4 = $("#arrow4");

    $("#arrow4").click(function() {
        if (answer4.is(":hidden")) {
            answer4.slideDown(500, function() {
                arrow4.css("transform", "rotate(180deg)");
            });
        } else {
            answer4.slideUp(500, function() {
                arrow4.css("transform", "rotate(0deg)");
                answer4.css("display", "none");
            });
        }
    });
});

</script>
</head>
<body>
	<br>
	<br>
	<div class="div-container">
		<div class="category">
		<h1>Q&A</h1>
			<a href="qnaform" style="color:#ff8c00;">자주하는 질문</a><br>
			<a href="storeqna">업체 Q&A</a><br>
			<a href="customerqna">손님 Q&A</a><br>
			<a href="question">1:1 문의하기</a><br>
			<c:if test="${personal.id == 'admin'}">
			<a href="reply">Q&A 답변하기</a></c:if>
		</div>

		<div class="qna">
		<h1 style="text-align: left;">자주하는 질문</h1><br>
			<div class="q1">
					<span style="float: left; margin-left: 40px; color: #FF8C00;">Q.</span>
					따봉어워드가 무엇인가요? <img id="arrow1" class="arrow1"
						src="/dda/image/arrow.png" width="15px">
			</div>

			<div id="answer1" class="faq-answer1">
				<span style="float: left; margin-left: 40px;">A.</span>

				<div class="a1">
					따봉어워드는 따봉플레이스에서 제공하는 랭킹 시스템으로, <br> 1월부터 12월까지의 따봉 수를 합산하여
					1등부터 3등까지의 업체를 보여줍니다.<br> 전년도를 기준으로 하며, 선정된 업체는 메인 페이지에 고정되는
					혜택을 얻을 수 있습니다.
				</div>

			</div>
			
			<div class="q2">
					<span style="float: left; margin-left: 40px; color: #FF8C00;">Q.</span>
					입점하고 싶은데 어떻게 해야 하나요? <img id="arrow2" class="arrow2"
						src="/dda/image/arrow.png" width="15px">
			</div>
			<div id="answer2" class="faq-answer2">
				<span style="float: left; margin-left: 40px;">A.</span>

				<div class="a2">
					따봉플레이스 입점 과정은 다음과 같습니다.<br>
					<br>
					<p style="font-size: 20px;">1. 업체 측 회원가입을 진행합니다.<br>
					2. 회원가입을 완료한 뒤 매장 등록을 진행해주세요.<br>
					3. 매장 등록이 끝나면 입점이 정상적으로 처리됩니다.<br></p>
					<br>
					이 과정을 거친 후에도 입점이 정상적으로 처리되지 않았다면<br> 
					1:1 문의하기로 문의사항을 남겨주시기 바랍니다.
				</div>

			</div>
			
			<div class="q3">
					<span style="float: left; margin-left: 40px; color: #FF8C00;">Q.</span>
					카페 예약은 어떻게 하나요?<img id="arrow3" class="arrow3"
						src="/dda/image/arrow.png" width="15px">
			</div>
			<div id="answer3" class="faq-answer3">
				<span style="float: left; margin-left: 40px;">A.</span>

				<div class="a3">
					예약을 원하시는 카페의 상세 페이지로 들어가 예약하기 버튼을 누른 뒤<br>
					예약날짜, 예약시간, 인원수를 입력합니다. 예약 사항을 모두 확인한 후<br>
					 완료 버튼을 누르면 카페 예약이 완료됩니다.
				</div>

			</div>
			
			<div class="q4">
					<span style="float: left; margin-left: 40px; color: #FF8C00;">Q.</span>
					예약한 카페의 예약 현황은 어디서 보나요? <img id="arrow4" class="arrow4"
						src="/dda/image/arrow.png" width="15px">
			</div>
			<div id="answer4" class="faq-answer4">
				<span style="float: left; margin-left: 40px;">A.</span>

				<div class="a4">
					예약 현황은 마이페이지 - 카페 예약 현황에 들어가시면<br>
					고객님의 예약 완료된 카페 목록을 확인할 수 있습니다.
				</div>

			</div>
		</div>

	</div>
</body>
</html>
