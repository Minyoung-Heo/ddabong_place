<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
.btn {
    margin-top: 20px;
    margin-right: 60px;
    background-color: #ffe8cc;
}

.btn:hover {
    background-color:#ffba66;
}
</style>
</head>
<body>
 <br><br>
	<div class="div-container">
		<div class="category">
		<h1>Q&A</h1>
			<a href="qnaform">자주하는 질문</a><br>
			<a href="storeqna">업체 Q&A</a><br>
			<a href="customerqna">손님 Q&A</a><br>
			<a href="question" style="color:#ff8c00;">1:1 문의하기</a><br>
			<c:if test="${personal.id == 'admin'}">
			<a href="reply">Q&A 답변하기</a></c:if>
		</div>

		<div class="qna">
		<h1 style="text-align: left;">1:1 문의하기</h1><br>
    <table class="question" align="center">
        <tr>
            <td>문의 유형</td>
            <td>${dto.questionType}</td>
        </tr>
        <tr><td>제목</td><td>${dto.title}</td></tr>
        <tr><td>작성자</td><td>${dto.writer}</td></tr>
        <tr><td>작성일자</td><td>${fn:substring(dto.question_date,0,16)}</td></tr>
        <tr><td>문의내용</td><td>${dto.content}</textarea></td></tr>
    </table>
     <input class="btn" type="button" value="목록" onclick="window.history.back()">
	</div>
</div>
</body>
</html>
