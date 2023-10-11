<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

h1 {
  color: black;
  font-size: 2em;
  position: relative;
  font-size: 50px;
}

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

input {
  width: 89.5%;
  height: 50px;
  border-radius: 30px;
  margin-top: 10px;
  padding: 0px 20px;
  border: 1px solid #ff8c00; /*인풋 부분 테두리 색*/
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
  left: 0px;
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

.lineintro textarea::placeholder, .intro textarea::placeholder {
  text-decoration: underline;
  color: #000000; /* 밑줄 색상 설정, 원하는 색상으로 변경하세요 */
  font-size: 18px;
}

input[type=file]::file-selector-button {
  width: 150px;
  height: 30px;
  background: #fff;
  border: 1px solid #ff8c00;
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
  border: 1px solid #ff8c00;
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


<script>
function check(){
    var f = document.store;

    var cstore_id = f.store_id.value;
    var vstore_id = /^[a-zA-Z0-9]{4,10}$/;

    if(cstore_id== "" || cstore_id==" "){
        alert("업체 아이디 공백은 안돼요");
        f.store_id.select();
        return false;
    }
    if(!vstore_id.test(cstore_id)){
        alert("업체 아이디는 숫자나 영어를 입력해주세요");
		f.store_id.select();
		return false;
    }

    var cstorename = f.storename.value;
    var vstorename = /^[a-zA-Z가-힣0-9\s]{1,9}$/;

    if(cstorename== "" || cstorename==" "){
        alert("매장명 공백은 안돼요");
        f.storename.select();
        return false;
    }
    if(!vstorename.test(cstorename)){
        alert("매장명을 제대로 입력해주세요");
		f.storename.select();
		return false;
    }

    var caddress = f.address.value;
    var vaddress = /^[가-힣0-9\s]{1,50}$/;

    if(caddress== "" || caddress==" "){
        alert("매장 주소 공백은 안돼요");
        f.address.select();
        return false;
    }
    if(!vaddress.test(caddress)){
        alert("매장 주소는 숫자나 한글만 입력해주세요");
		f.address.select();
		return false;
    }

    var cmain_menu = f.main_menu.value;
    var vmain_menu = /^[a-zA-Z0-9가-힣\s]{1,15}$/;

    if(cmain_menu== "" || cmain_menu==" "){
        alert("매장 대표 메뉴 이름 공백은 안돼요");
        f.main_menu.select();
        return false;
    }
    if(!vmain_menu.test(cmain_menu)){
        alert("매장 대표 메뉴 이름을 제대로 입력해주세요");
		f.main_menu.select();
		return false;
    }
 
    var feature = document.getElementsByName("feature");
    var count1 = 0;

    for (var i = 0; i < feature.length; i++) {
			if (feature[i].checked == true) {
				count1 += 1;
			}
		}

    if (count1 < 1) {
			alert("특징 체크박스를 선택해주세요.");
            f.feature.select();
			return false;
		}

    var dessert = document.getElementsByName("dessert");
    var count2 = 0;

    for (var i = 0; i < dessert.length; i++) {
			if (dessert[i].checked == true) {
				count2 += 1;
			}
		}

    if (count2 < 1) {
			alert("디저트 체크박스를 선택해주세요.");
            f.dessert.select();
			return false;
		}

    f.submit();
}

// 로그인한 사용자의 store_id를 가져와서 store_id 입력 필드에 자동으로 설정
document.addEventListener("DOMContentLoaded", function () {
    // 서버에서 로그인한 사용자의 store_id를 가져오는 로직을 구현해야 함
    // 여기에서는 간단히 하드코딩으로 설정
    var loggedInStoreId = store_id; // 예: 로그인한 사용자의 store_id

    // store_id 입력 필드를 가져옴
    var storeIdInput = document.querySelector("input[name='store_id']");

    // store_id 입력 필드에 로그인한 사용자의 store_id를 설정
    storeIdInput.value = loggedInStoreId;
});

//파일 선택 필드를 가져옴
var imageInput = document.getElementById("image");
var mainImageInput = document.getElementById("main_image");

// 파일이 선택되면 발생하는 이벤트 처리
imageInput.addEventListener("change", function () {
    var selectedFiles = imageInput.files;
    // 선택한 파일들을 처리하는 코드를 작성
    for (var i = 0; i < selectedFiles.length; i++) {
        var file = selectedFiles[i];
        // 각 파일에 대한 작업을 수행 (예: 업로드 또는 미리보기)
    }
});

mainImageInput.addEventListener("change", function () {
    var selectedFiles = mainImageInput.files;
    // 선택한 파일들을 처리하는 코드를 작성
    for (var i = 0; i < selectedFiles.length; i++) {
        var file = selectedFiles[i];
        // 각 파일에 대한 작업을 수행 (예: 업로드 또는 미리보기)
    }
});


</script>
</head>
<body>

<br>
<br>
<br>
<br>

<form action="storemodifysave" method="post" enctype="multipart/form-data" name="store">
<div class="wrap">
        <div class="storeinput">
            <h1>매장 등록 수정</h1>
            
            <c:forEach items="${list}" var="store">
            <div class="store_id">
                <h4>업체 아이디</h4>
                <input type="text" name="store_id" value="${store.store_id}" readonly>
            </div>
            
            <div class="storename">
                <h4>매장명</h4>
                <input type="text" name="storename" value="${store.storename}">
            </div>
            
            <div class="tel">
              <h4>매장 전화번호</h4>
              <input type="text" name="tel" value="${store.tel}">
            </div>
            
            <div class="address">
              <h4>매장 주소</h4>
              <input type="text" name="address" value="${store.address}">
            </div>
            
            <div class="lineintro">
              <h4>매장 한줄 소개</h4>
              <textarea rows="4" cols="40" name="lineintro">${store.lineintro}</textarea>
          	</div>
          	
           	<div class="intro">
            	<h4>매장 소개글</h4>
            	<textarea rows="8" cols="40" name="intro">${store.intro}</textarea>
          	</div>
          	
          	<div class="mae_image">
           		<h4>매장 이미지</h4>
            	<input type="file" name="image" id="file" accept="image/*" multiple>
          	</div>
          	
          	<div class="main_menu">
            <h4>매장 대표 메뉴 이름</h4>
            <input type="text" name="main_menu" value="${store.main_menu}">
          	</div>
          	
          	<div class="main_image">
            	<h4>매장 대표 메뉴 사진</h4>
            	<input type="file" name="main_image" id="file" accept="image/*" multiple>
          	</div>
          	
          	<div class="region_name">
            <h4>지역 코드</h4>
            <select name="region_name">
                <option value="강남" <c:if test="${store.region_name == '강남'}">selected</c:if>>강남</option>
        		<option value="성수" <c:if test="${store.region_name == '성수'}">selected</c:if>>성수</option>
        		<option value="연남" <c:if test="${store.region_name == '연남'}">selected</c:if>>연남</option>
        		<option value="을지로" <c:if test="${store.region_name == '을지로'}">selected</c:if>>을지로</option>
        		<option value="잠실" <c:if test="${store.region_name == '잠실'}">selected</c:if>>잠실</option>
        		<option value="혜화" <c:if test="${store.region_name == '혜화'}">selected</c:if>>혜화</option>
              </select>
          	</div>
          
          	<div class="feature">
            <h4>특징</h4>
            	<label><input type="checkbox" name="feature" value="노키즈존"
            		<c:if test="${store.feature.contains('노키즈존')}">checked</c:if>>노키즈존</label>
	        	<label><input type="checkbox" name="feature" value="반려견 동반 입장 O"
	        		<c:if test="${store.feature.contains('반려견 동반 입장 O')}">checked</c:if>>반려견 동반 입장 O</label>
	        	<label><input type="checkbox" name="feature" value="반려견 동반 입장 X"
	        		<c:if test="${store.feature.contains('반려견 동반 입장 X')}">checked</c:if>>반려견 동반 입장 X</label><br>
	        	<label><input type="checkbox" name="feature" value="주차장 O"
	        		<c:if test="${store.feature.contains('주차장 O')}">checked</c:if>>주차장 O</label>
	        	<label><input type="checkbox" name="feature" value="주차장 X"
	        		<c:if test="${store.feature.contains('주차장 X')}">checked</c:if>>주차장 X</label>
	        	<label><input type="checkbox" name="feature" value="루프탑"
	        		<c:if test="${store.feature.contains('루프탑')}">checked</c:if>>루프탑</label><br>
	        	<label><input type="checkbox" name="feature" value="테라스"
	        		<c:if test="${store.feature.contains('테라스')}">checked</c:if>>테라스</label>
	        	<label><input type="checkbox" name="feature" value="노트북 사용 O"
	        		<c:if test="${store.feature.contains('노트북 사용 O')}">checked</c:if>>노트북 사용 O</label>
	        	<label><input type="checkbox" name="feature" value="노트북 사용 X"
	        		<c:if test="${store.feature.contains('노트북 사용 X')}">checked</c:if>>노트북 사용 X</label>
          	</div>
          
          	<div class="dessert">
            <h4>디저트</h4>
            	<label><input type="checkbox" name="dessert" value="케이크"
            		<c:if test="${store.dessert.contains('케이크')}">checked</c:if>>케이크</label>
            	<label><input type="checkbox" name="dessert" value="마들렌"
            		<c:if test="${store.dessert.contains('마들렌')}">checked</c:if>>마들렌</label>
            	<label><input type="checkbox" name="dessert" value="스콘"
            		<c:if test="${store.dessert.contains('스콘')}">checked</c:if>>스콘</label>
            	<label><input type="checkbox" name="dessert" value="마카롱"
            		<c:if test="${store.dessert.contains('마카롱')}">checked</c:if>>마카롱</label><br>
            	<label><input type="checkbox" name="dessert" value="크로플"
            		<c:if test="${store.dessert.contains('크로플')}">checked</c:if>>크로플</label>
            	<label><input type="checkbox" name="dessert" value="휘낭시에"
            		<c:if test="${store.dessert.contains('휘낭시에')}">checked</c:if>>휘낭시에</label>
            	<label><input type="checkbox" name="dessert" value="쿠키"
            		<c:if test="${store.dessert.contains('쿠키')}">checked</c:if>>쿠키</label>
            	<label><input type="checkbox" name="dessert" value="빙수"
            		<c:if test="${store.dessert.contains('빙수')}">checked</c:if>>빙수</label>
           	</div>
           	</c:forEach>
          
           	<div class="submit">
                <input type="button" value="수정 완료" onclick="check()">
           	</div>
        </div>
    </div>
</form>

</body>
</html>