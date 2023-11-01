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
.question, .questionRe {
margin-top: 20px;
width: 90%;
text-align: left;
font-size: 20px;
}
.questionRe {
margin-top: 50px;
}
.qna {
margin-top: 20px;
text-align: center;
font-size: 25px;
width: 85%;
}
.questionRe input[type='text'] {
width: 70%;
  height: 50px;
  border-radius: 30px;
  margin-top: 10px;
  margin-left:50px;
  padding: 20px;
  border: 1px solid #ff8c00;
  outline: none;
}
.questionRe textarea {
	  border-radius: 30px;
  margin-top: 30px;
  padding: 20px;
  border: 1px solid #ff8c00;
  outline: none;
    margin-left:50px;
}

.btn {
    margin-top: 20px;
    margin-right: 10px;
    background-color: #ffe8cc;
}

.btn:hover {
    background-color:#ffba66;
}
.question {
line-height:50px;
margin-bottom: 50px;
}
.question th, .question td {
border-top: 2px solid #ffba66;
border-bottom:2px solid #ffba66;
padding: 15px;
}
.question  th {
background-color: #ffd199;
font-weight: normal;
border-right: 2px solid #ffba66;
}
</style>
<script type="text/javascript">
function replySubmit(){
	if(confirm("글을 등록하시겠습니까?")) {
		document.reply.submit();
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
			<a href="storeqna">업체 Q&A</a><br>
			<a href="customerqna">손님 Q&A</a><br>
			<a href="question">1:1 문의하기</a><br>
			<c:if test="${personal.id == 'admin'}">
			<a href="reply" style="color:#ff8c00;">Q&A 답변하기</a></c:if>
		</div>

		<div class="qna">
		<h1 style="text-align: left;">Q&A 답변하기</h1><br>
    <table class="question" align="center">
        <tr>
            <th>문의 유형</th>
            <td>${dto.questionType}</td>
        </tr>
        <tr><th>제목</th><td>${dto.title}</td></tr>
        <tr><th>작성자</th><td>${dto.writer}</td></tr>
        <tr><th>작성일자</th><td>${fn:substring(dto.question_date,0,16)}</td></tr>
        <tr><th>문의내용</th><td>${dto.content}</textarea></td></tr>
    </table>
    <hr>
     <form action="replyInputSave" method="post" name="reply">
    <table class="questionRe" align="center">
    		<input type="hidden" name="userType" value="${dto.userType}">
    		<input type="hidden" name="questionType" value="답변">
	        <input type="hidden" name="id" value="${personal.id}">
	        <input type="hidden" name="writer" value="${personal.name}">
     	   <input type="hidden" name="pw" value="${dto.pw}">
     	   <input type="hidden" name="groups" value="${dto.groups}">
     	   <input type="hidden" name="step" value="${dto.step}">
     	   <input type="hidden" name="indent" value="${dto.indent}">
        <tr><td>제목</td><td><input type="text" name="title" value="re : ${dto.title}"></td></tr>
        <tr><td>답변</td><td><textarea cols="60" rows="10" name="content">안녕하세요? 따봉플레이스입니다.</textarea></td></tr>
        <tr><td colspan="2" style="text-align: center;"><input class="btn" type="button" value="등록" onclick="replySubmit()">
        <input style="margin-right:100px;" class="btn" type="button" value="목록" onclick="window.history.back()"></td></tr>
    </table>
    </form>
	</div>
</div>
</body>
</html>
