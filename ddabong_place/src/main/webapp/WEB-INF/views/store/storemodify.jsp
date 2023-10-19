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
  width: 70%;
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
  position: relative;
  left: 75px;
}

select {
  box-sizing: border-box;
  width: 100px;
  padding: 4px;
  font-size: 14px;
  border-radius: 6px;
  border: 1px solid #ff8c00;
  width: 30%;
  height: 30px;
}

option {
  padding: 4px;
  font-size: 14px;
  color: #000000;
  background: #ffffff;
}

.textbox{
	width: 70%;
	height: 51px;
	border: 1px solid #FF8C00;
	margin: 5px;
	padding: 10px 14px 10px 14px;
	box-sizing: border-box;
	font-size: 15px;
	border-radius: 40px;
	outline: none;
}

</style>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- 주소 api -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
<script type="text/javascript">
	function execPostCode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 도로명 조합형 주소 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				console.log(data.zonecode);
				console.log(fullRoadAddr);

				$("[name=addr1]").val(data.zonecode);
				$("[name=addr2]").val(fullRoadAddr);

				/* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
				document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
			}
		}).open();
	}

	// 도로명주소랑 상세주소를 하나로 합쳐서 데이터 전송하기 위해서 만든거
	$("#addr2, #addr3").on('input', function() {
		var addr2 = $("#addr2").val();
		var addr3 = $("#addr3").val();
		var address = addr2 + " " + addr3;

		// address 값을 hidden 필드에 할당
		$("#personaladdress").val(address);
	});
</script>

<script>
function check(){
    var f = document.store;

    var cstorename = f.storename.value;
    var vstorename = /^[~!@#$%^&*(),_+|<>?:{}a-zA-Z가-힣0-9\s]{1,9}$/;

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

    var caddr3 = f.addr3.value;
    var vaddr3 = /^[~!@#$%^&*(),_+|<>?:{}가-힣0-9\s]{1,50}$/;

    if(caddr3== "" || caddr3==" "){
        alert("매장 주소 공백은 안돼요");
        f.addr3.select();
        return false;
    }
    if(!vaddr3.test(caddr3)){
        alert("매장 주소는 숫자나 한글만 입력해주세요");
		f.addr3.select();
		return false;
    }

    var cmain_menu = f.main_menu.value;
    var vmain_menu = /^[~!@#$%^&*(),_+|<>?:{}a-zA-Z0-9가-힣\s]{1,15}$/;

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

</script>
</head>
<body>

<br>
<br>
<br>
<br>

<form action="storemodifysave" method="post" enctype="multipart/form-data" name="store">
<div class="wrap">
        <div class="storemodify">
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
              <!-- <input type="text" name="address" placeholder="매장 주소"> -->
            	<input class="textbox"
					style="width: 45%; height: 51px; background-color: #d9d9d9; display: inline;"
					placeholder="우편번호" name="addr1" id="addr1" type="text"
					readonly="readonly">
				<button type="button" class="btn btn-default" onclick="execPostCode();">
					<i class="fa fa-search"></i> 우편번호 찾기
				</button><br>
				<input class="textbox" style="background-color: #d9d9d9"
					placeholder="도로명 주소" name="addr2" id="addr2" type="text"readonly="readonly"/>
				<input class="textbox" placeholder="상세주소" name="addr3" id="addr3" type="text"/> 
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
            	<input type="file" name="image" id="file" multiple>
          	</div>
          	
          	<div class="main_menu">
            <h4>매장 대표 메뉴 이름</h4>
            <input type="text" name="main_menu" value="${store.main_menu}">
          	</div>
          	
          	<div class="main_image">
            	<h4>매장 대표 메뉴 사진</h4>
            	<input type="file" name="main_image" id="file" multiple>
          	</div>
          	
          	<div class="region_name">
            <h4>지역을 선택하세요.</h4>
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
            		<c:if test="${store.dessert.contains('푸딩')}">checked</c:if>>푸딩</label>
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