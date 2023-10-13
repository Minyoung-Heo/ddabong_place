<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

.qna {
    margin-top: 20px;
    text-align: center;
    font-size: 25px;
    width: 85%;
}

.question a {
    text-decoration: none;
    color:black;
}

.question th {
    border-top: 2px solid #ff8c00;
    border-bottom: 2px solid #ff8c00;
    padding:15px;
    text-align: center;
}

.question td {
    padding:15px;
    border-bottom: 2px solid #ffba66;
    text-align: center;
}

.question tr:hover {
    background-color: #ffe8cc;
}

.question .paging:hover {
    background-color: initial; 
}

.question .paging td {
    border-bottom: none;
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
            <a href="question">1:1 문의하기</a><br>
			<c:if test="${personal.id == 'admin'}">
			<a href="reply" style="color:#ff8c00;">Q&A 답변하기</a></c:if>
        </div>

        <div class="qna">
            <h1 style="text-align: left;">Q&A 답변하기</h1><br>
            <table class="question" align="center">
            <caption>
            <form action="">
            <select name="searchType">
            <option value="question_num">문의번호</option>
            <option value="title">제목</option>
            <option value="writer">작성자</option>
            </select>
            <input type="text" name="searchContent">
            <input type="submit" value="검색">
            </form>
            </caption>
            
                <tr style="background-color: #ffd199;"><th>문의 번호</th><th>문의 유형</th><th>제목</th><th>작성자</th><th>작성일자</th></tr>
                <c:forEach items="${list}" var="dto">
                    <tr>
                        <td>${dto.question_num}</td><td>${dto.questionType}</td>
                        <td><a href="goReplyInput?question_num=${dto.question_num}">
                        <c:forEach begin="1" end="${dto.indent}" step="1">
                        <img src="/dda/image/re.png" width="15px"></c:forEach>
                        ${dto.title}</a></td>
                        <td>${dto.writer}</td><td>${fn:substring(dto.question_date,0,16)}</td>
                    </tr>
                </c:forEach>
                
<tr class="paging">
   <td colspan="5" style="text-align: center;">
   
   <c:if test="${paging.startPage!=1 }">
      <a href="reply?nowPage=${paging.startPage-1 }&cntPerPage=${paging.cntPerPage}">◀</a>
   </c:if>   
   
      <c:forEach begin="${paging.startPage }" end="${paging.endPage}" var="p"> 
         <c:choose>
            <c:when test="${p == paging.nowPage }">
               <b><span style="color:#ff8c00;">${p}</span></b>
            </c:when>   
            <c:when test="${p != paging.nowPage }">
               <a href="reply?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
            </c:when>   
         </c:choose>
      </c:forEach>
     
      <c:if test="${paging.endPage != paging.lastPage}">
      <a href="reply?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}">▶</a>
   </c:if>
   
   </td>
</tr>
</table>
        </div>
    </div>
</body>
</html>
