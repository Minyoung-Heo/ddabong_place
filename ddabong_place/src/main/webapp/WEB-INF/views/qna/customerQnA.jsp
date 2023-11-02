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

.btn {
    margin-top: 20px;
    float: right;
    margin-right: 60px;
    background-color: #ffe8cc;
}

.btn:hover {
    background-color:#ffba66;
}
.searchbtn {
    background-color: #ffe8cc;
   	border:0;
   	padding-right:10px;
   	padding-left:10px;
   	padding-top:7px;
   	padding-bottom:7px;
   	border-radius: 5px;
   	font-size: 16px;
   	color:black;
   	margin:3px;
   	
}

.searchbtn:hover {
    background-color:#ffba66;
}
.question .paging:hover {
    background-color: initial; 
}

.question .paging td {
    border-bottom: none;
}
</style>

<script type="text/javascript">
    function insertPw(pw, num) {
        var password = prompt("비밀번호를 입력하세요.");
        if (password == pw) {
			location.href = "qnadetail?question_num="+num;            
        } else {
        	alert("비밀번호가 올바르지 않습니다!");
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
            <a href="customerqna" style="color:#ff8c00;">손님 Q&A</a><br>
            <a href="question">1:1 문의하기</a><br>
			<c:if test="${personal.id == 'admin'}">
			<a href="reply">Q&A 답변하기</a></c:if>
        </div>

        <div class="qna">
            <h1 style="text-align: left;">손님 Q&A</h1><br>
            <table class="question" align="center">
            <caption>
            <form action="customerSearch">
            <select name="searchType" style="margin-right:3px;">
            <option value="groups">문의번호</option>
            <option value="title">제목</option>
            <option value="writer">작성자</option>
            </select>
            <input type="text" name="searchContent">
            <input type="submit" class="searchbtn" value="검색">
            </form>
            </caption>
            
                <tr style="background-color: #ffd199;">
                <th>문의 번호</th><th>문의 유형</th>
                <th width="38%">제목</th><th>작성자</th><th>작성일자</th></tr>
                <c:forEach items="${list}" var="dto">
                    <tr>
                        <td>${dto.question_num}</td><td>${dto.questionType}</td>
                        <c:choose>
                        <c:when test="${fn:contains(dto.title, '[공지사항]')}">
                        <td><a href="qnadetail?question_num=${dto.question_num}">${dto.title}</a></td>
                        </c:when>
                        <c:otherwise>
                        <td><a href="javascript:void(0);" onclick="insertPw(${dto.pw},${dto.question_num})">
                        <c:forEach begin="1" end="${dto.indent}" step="1">
						<img src="/dda/image/re.png" width="15px"></c:forEach>
                        ${dto.title}</a></td>
                        </c:otherwise>
                        </c:choose>
                        <td>${dto.writer}</td><td>${fn:substring(dto.question_date,0,16)}</td>
                    </tr>
                </c:forEach>
                
<tr class="paging">
   <td colspan="5" style="text-align: center;">
   
   <c:if test="${paging.startPage!=1 }">
      <a href="customerqna?nowPage=${paging.startPage-1 }&cntPerPage=${paging.cntPerPage}">◀</a>
   </c:if>   
   
      <c:forEach begin="${paging.startPage }" end="${paging.endPage}" var="p"> 
         <c:choose>
            <c:when test="${p == paging.nowPage }">
               <b><span style="color:#ff8c00;">${p}</span></b>
            </c:when>   
            <c:when test="${p != paging.nowPage }">
               <a href="customerqna?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
            </c:when>   
         </c:choose>
      </c:forEach>
     
      <c:if test="${paging.endPage != paging.lastPage}">
      <a href="customerqna?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}">▶</a>
   </c:if>
   
   </td>
</tr>
</table>
            <input class="btn" type="button" value="1:1 문의하러 가기" onclick="location.href='question'">
        </div>
    </div>
</body>
</html>
