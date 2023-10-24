<%@page import="com.ezen.dda.store.StoreDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.wrap{
	width: 100%;
    align-items: center;
    justify-content: center;
    display: flex;
    position: relative;
    left: 30px;
}

.store_id, .storename, .tel, .address, .lineintro, .intro, .mae_image, .main_menu, .main_image, .region_name, .feature, .dessert, .submit{
  margin-top: 30px;
  width: 100%;
}

.input_store {
  width: 110%;
  height: 50px;
  border-radius: 30px;
  padding: 0px 20px;
  border: 1px solid #ff8c00; /*인풋 부분 테두리 색*/
  outline: none;
  position: relative;
  left: -16px;
}

.submit a {
	width: 38%;
    display: inline-block;
    padding: 10px 20px;
    background: linear-gradient(to left, rgb(255, 77, 46), rgb(255, 155, 47));
    color: #fff;
    text-decoration: none;
    font-size: 1.2em;
    border-radius: 40px;
    margin-left: 5px;
    }

.feature input[type="checkbox"], .dessert input[type="checkbox"] {
  width: 18px; /* 원하는 너비 값으로 조절하세요 */
  height: 18px; /* 원하는 높이 값으로 조절하세요 */
  vertical-align: bottom; /* 체크박스 위치 조정 */
}

.lineintro textarea, .intro textarea {
  border: none;
  outline: none;
}

.mae_image input, .main_image input {
  border: none;
  outline: none;
}

.mae_image img, .main_image img{
	width: 50px;
	transition: width 0.3s ease;
}

.mae_image img:hover, .main_image img:hover{
	width: 300px;
}

select {
  box-sizing: border-box;
  width: 100px;
  padding: 4px;
  font-size: 14px;
  border-radius: 6px;
  width: 45%;
  height: 30px;
}

option {
  padding: 4px;
  font-size: 14px;
  color: #000000;
  background: #ffffff;
}

.btn2, .btn3 {
	width: 35%;
	height: 51px;
	font-size: 23px;
	border-radius: 40px;
	cursor: pointer; /* 마우스 커서를 포인터로 변경 */

	/* 기본 스타일 */
	background-color: gray;
	color: white;
	transition: background-color 0.3s, color 0.3s; /* 트랜지션 추가 */

	margin-top: 40px;
}

.address2, .feature2 {
	border: 1px solid #ff8c00;
	border-radius: 20px;
	text-align: center;
	width: 80%;
	height: auto;
	white-space: pre-wrap;
	margin-top: 20px;
	outline: none;
}
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
	width: 100%;
	margin-right:230px;
	
}
</style>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>
<body>
<br><br>	
	<div class="div-container">
		<div class="category">
			<h1>마이페이지</h1>
			<a href="storeoutput?store_id=${store.id}" style="color: #ff8c00;">나의 매장 정보</a><br> 
			<a href="storemodifyview?store_id=${store.id}">매장 정보 수정</a><br>
			<a href="storeinput">매장 등록</a><br>
			<a href="storeleave?id=${store.id}">매장 삭제</a><br>
			<hr style="width:190px; text-align: left; margin-left:0;">			
			<a href="storeaccountinfo?id=${store.id}">나의 회원 정보</a><br>
			<a href="storeaccountmodify?id=${store.id}">회원 정보 수정</a><br>
			<a href="storeaccountleave">회원 탈퇴</a><br>
		</div>

		<div class="qna">
		<form action="storemodifyview" method="post">
		<div class="wrap">
			<c:forEach items="${list}" var="store">
        <div class="storeinput">
            <h1 style="margin-bottom: 50px;">나의 매장 정보</h1>
           
            <div class="store_id">
                <h4>업체 아이디</h4>
                <input class="input_store" value="${store.store_id}" readonly>
            </div>
            
            <div class="storename">
                <h4>매장명</h4>
                <input class="input_store" value="${store.storename}" readonly>
            </div>
            
            <div class="tel">
              <h4>매장 전화번호</h4>
              <input class="input_store" value="${store.tel}" readonly>
            </div>
            
            <div class="address">
              <h4>매장 주소</h4>
              <textarea class="address2" readonly>${store.address}</textarea>
            </div>
            
            <div class="lineintro">
              <h4>매장 한줄 소개</h4>
              <textarea rows="8" cols="40" readonly>${store.lineintro}</textarea>
           </div>
           
           <div class="intro">
              <h4>매장 소개글</h4>
              <textarea rows="8" cols="40" readonly>${store.intro}</textarea>
           </div>
          
          <div class="mae_image">
            <h4>매장 이미지</h4>
            <c:forEach items="${fn:split(store.image, ' ')}" var="image" varStatus="loopStatus">
        		<c:if test="${loopStatus.index % 5 == 0}">
            	<br /> <!-- 매 5개의 이미지마다 줄바꿈 -->
        		</c:if>
        		<img src="image/${image}" width="100px">
    		</c:forEach>
          </div>
          
          <div class="main_menu">
            <h4>매장 대표 메뉴 이름</h4>
            <input class="input_store" value="${store.main_menu}" readonly>
          </div>
          
          <div class="main_image">
            <h4>매장 대표 메뉴 사진</h4>
            <c:forEach items="${fn:split(store.main_image, ' ')}" var="main_image">
    			<td><img src="image/${main_image}"></td>
			</c:forEach>
          </div>
          
          <div class="region_name">
            <h4>지역</h4>
            <input class="input_store" value="${store.region_name}" readonly>
          </div>
          
          <div class="feature">
            <h4>특징</h4>
            <textarea class="feature2" readonly>${store.feature}</textarea>
          </div>
          
          <div class="dessert">
            <h4>디저트</h4>
            <input class="input_store" value="${store.dessert}" readonly>
          </div>
            <div class="submit">
            <a href="storemodifyview?store_id=${store.id}">수정하기</a>
            <a href="storeleave?id=${store.store_id}">삭제하기</a>
            </div>
			</c:forEach>
        </div></div>
</form>
    </div>
		</div>
</body>
</html>