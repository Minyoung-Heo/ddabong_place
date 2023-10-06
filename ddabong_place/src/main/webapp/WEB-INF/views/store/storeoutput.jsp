<%@page import="com.ezen.dda.store.StoreDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

h2 {
  color: #ff8c00;
  font-size: 2em;
}

.wrap{
	width: 100%;
    align-items: center;
    justify-content: center;
    display: flex;
    position: relative;
    left: 50px;
}

.store_id, .storename, .tel, .address, .lineintro .intro, .mae_image, .main_menu, .main_image, .region_name, .feature, .dessert, .submit{
  margin-top: 30px;
  width: 90%;
 
}

input {
  width: 100%;
  height: 50px;
  border-radius: 30px;
  margin-top: 10px;
  padding: 0px 20px;
  border: 1px solid lightgray; /*인풋 부분 테두리 색*/
  outline: none;
}

.submit input {
  width: 40%;
  height: 50px;
  border: 0;
  outline: none;
  border-radius: 40px;
  background: linear-gradient(to left, rgb(255, 77, 46), rgb(255, 155, 47));
  color: white;
  font-size: 1.2em;
  letter-spacing: 2px;
  position: relative;
  left: 100px;
}

.feature input[type="checkbox"], .dessert input[type="checkbox"] {
  width: 18px; /* 원하는 너비 값으로 조절하세요 */
  height: 18px; /* 원하는 높이 값으로 조절하세요 */
  vertical-align: bottom;
}

.lineintro textarea, .intro textarea {
  border: none;
  outline: none;
}

.lineintro textarea::placeholder, .intro textarea::placeholder {
  text-decoration: underline;
  color: #000000; /* 밑줄 색상 설정, 원하는 색상으로 변경하세요 */
  font-size: 18px;
}

.mae_image, .main_image {
  position: relative;
  display: inline-block;
}

input[type=file]::file-selector-button {
  width: 150px;
  height: 30px;
  background: #fff;
  border: 1px solid rgb(77,77,77);
  border-radius: 10px;
  cursor: pointer;
  position: relative;
  left: -5px;
}
input[type=file]::file-selector-button:hover {
    background: rgb(77,77,77);
    color: #fff;
  }

.mae_image input, .main_image input {
  border: none;
  outline: none;
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

</style>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>
<body>

<br>
<br>
<br>
<br>

<div class="wrap">
        <div class="storeinput">
            <h2>매장 등록 입력창</h2>
            
            <c:forEach items="${list}" var="store">
            
            <div class="store_id">
                <h4>업체 아이디</h4>
                <input value="${store.store_id}" readonly>
            </div>
            
            <div class="storename">
                <h4>매장명</h4>
                <input value="${store.storename}" readonly>
            </div>
            
            <div class="tel">
              <h4>매장 전화번호</h4>
              <input value="${store.tel}" readonly>
            </div>
            
            <div class="address">
              <h4>매장 주소</h4>
              <input value="${store.address}" readonly>
            </div>
            
            <div class="lineintro">
              <h4>매장 한줄 소개</h4>
              <textarea rows="8" cols="40" name="lineintro" readonly >${store.lineintro}</textarea>
           </div>
           
           <div class="intro">
              <h4>매장 소개글</h4>
              <textarea rows="8" cols="40" readonly>${store.intro}</textarea>
           </div>
          
          <div class="mae_image">
            <h4>매장 이미지</h4>
            <td><img alt="매장 이미지" src="image/${store.image}" width="400px"></td>
          </div>
          
          <div class="main_menu">
            <h4>매장 대표 메뉴 이름</h4>
            <input value="${store.main_menu}" readonly>
          </div>
          
          <div class="main_image">
            <h4>매장 대표 메뉴 사진</h4>
            <input value="${store.main_image}" readonly>
          </div>
          
          <div class="region_name">
            <h4>지역 코드</h4>
            <input value="${store.region_name}" readonly>
          </div>
          
          <div class="feature">
            <h4>특징</h4>
              <input value="${store.feature}" readonly>
          </div>
          
          <div class="dessert">
            <h4>디저트</h4>
            <input value="${store.dessert}" readonly>
          </div>
          
            <div class="submit">
                <input type="button" value="입력" onclick="check()">
            </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>