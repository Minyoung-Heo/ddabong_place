<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의하기</title>
<style type="text/css">
.div-container {
	margin-top: 30px;
	display: flex;
	width: 90%;
	justify-content: space-evenly;
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
.question {
margin-top: 20px;
width: 90%;
text-align: left;
font-size: 20px;
}
.question input[type='text'] {
border-radius: 30px;
}
.qna {
margin-top: 20px;
text-align: center;
font-size: 25px;
width: 85%;
}
</style>
<script>
    function updateQuestionType() {
        var userType = document.querySelector('input[name="userType"]:checked').value;
        var questionTypeSelect = document.getElementsByName("questionType")[0];
        
        // 모든 옵션 숨김
        for (var i = 0; i < questionTypeSelect.options.length; i++) {
            questionTypeSelect.options[i].style.display = 'none';
        }
        
        // 해당 userType에 따른 옵션만 표시
        var optionsToShow = document.querySelectorAll('option[data-user-type="' + userType + '"]');
        for (var i = 0; i < optionsToShow.length; i++) {
            optionsToShow[i].style.display = 'block';
        }
    }
</script>
</head>
<body>
 <br><br>
	<div class="div-container">
		<div class="category">
		<h1>Q&A</h1>
			<a href="qnaform">자주하는 질문</a><br>
			<a href="qnaform">업체 Q&A</a><br>
			<a href="qnaform">손님 Q&A</a><br>
			<a href="question" style="color:#ff8c00;">1:1 문의하기</a>
		</div>

		<div class="qna">
		<h1 style="text-align: left;">1:1 문의하기</h1><br>
			
    <form action="questionInput" method="post">
    <table class="question" align="center">
        <tr>
            <td>회원 유형</td>
            <td>
                <label><input type="radio" name="userType" value="손님" onclick="updateQuestionType()" checked> 손님 </label>
                <label><input type="radio" name="userType" value="업체" onclick="updateQuestionType()"> 업체 </label>
            </td>
        </tr>
        <tr>
            <td>문의 유형</td>
            <td>
                <select name="questionType">
                    <!-- 손님 checked일 때  -->
                    <option value="회원 정보" data-user-type="손님">회원 정보</option>
                    <option value="예약 관련" data-user-type="손님">예약 관련</option>
                    <option value="이용 불편사항" data-user-type="손님">이용 불편사항</option>
                    <option value="기타" data-user-type="손님">기타</option>
                    <!-- 업체 checked일 때  -->
                    <option value="회원 정보" data-user-type="업체" style="display:none;">회원 정보</option>
                    <option value="매장 정보" data-user-type="업체" style="display:none;">매장 정보</option>
                    <option value="입점 문의" data-user-type="업체" style="display:none;">입점 문의</option>
                    <option value="이용 불편사항" data-user-type="업체" style="display:none;">이용 불편사항</option>
                    <option value="기타" data-user-type="업체" style="display:none;">기타</option>
                </select>
            </td>
        </tr>
        <tr><td>제목</td><td><input type="text" name="title"></td></tr>
        <tr><td>작성자</td><td><input type="text" name="writer"></td></tr>
		
		<!-- 로그인 상태 가져와서 아이디 가져오기 수정 필요 -->
        <input type="hidden" name="id" value="qqqq1111">
        
        <tr><td>문의내용</td><td><textarea cols="25" rows="10" name="content"></textarea></td></tr>
        <tr><td>비밀번호</td><td><input type="text" name="pw" placeholder="숫자 4자리"></td></tr>
        <tr><td colspan="2"><input type="submit" value="입력"></td></tr>
    </table>
    </form>
	</div>
</div>
</body>
</html>
