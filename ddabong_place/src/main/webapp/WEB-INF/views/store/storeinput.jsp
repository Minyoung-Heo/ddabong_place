<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

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

input {
  width: 70%;
  height: 50px;
  border-radius: 30px;
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
  font-size: 1.5em;
  letter-spacing: 2px;
  position: relative;
  left: 0px;
}

label {
	margin-left: 15px;
	position: relative;
	left: -10px;
}

.feature, .dessert{
	font-size: 18px;
}

.feature input[type="checkbox"], .dessert input[type="checkbox"]{ 
	position:absolute;
    width:20px; 
    height:20px;
    margin:0px;
    overflow:hidden;
    clip:rect(0,0,0,0); 
    border:0;
    display: none;
}

.feature input[type="checkbox"] + label, .dessert input[type="checkbox"] + label{ 
	display:inline-block; 
    position:relative; 
    padding-left:26px; 
    cursor:pointer; 
}

.feature input[type="checkbox"] + label:before, .dessert input[type="checkbox"] + label:before{ 
	content:''; 
    position:absolute; 
    left:0; 
    top: 50%; /* 글씨를 수직 가운데로 위치시키기 위해 top을 50%로 조절 */
    transform: translateY(-50%); /* 글씨를 수직 가운데로 위치시킴 */ 
    width:18px; 
    height:18px; 
    text-align:center; 
    background:#fff; 
    border:1px solid #ccc; 
    box-sizing:border-box; 
}

/* 보여질 부분의 스타일을 추가하면 된다. */
.feature input[type="checkbox"]:checked + label:after, .dessert input[type="checkbox"]:checked + label:after{ 
	content: ''; 
    position:absolute; 
    top:3px; 
    left:0;
    top: 50%; /* 글씨를 수직 가운데로 위치시키기 위해 top을 50%로 조절 */
    transform: translateY(-50%); /* 글씨를 수직 가운데로 위치시킴 */ 
    width:18px; 
    height:18px; 
    background-color:rgb(252,113,7);
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
  background: rgb(254,163,72);
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
.flexbox {
display: flex;
}
.feature_box1,.feature_box2,.feature_box3 {
text-align: left;
margin-left: 30px;
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

	/* // 도로명주소랑 상세주소를 하나로 합쳐서 데이터 전송하기 위해서 만든거
	$("#addr2, #addr3").on('input', function() {
		var addr2 = $("#addr2").val();
		var addr3 = $("#addr3").val();
		var address = addr2 + " " + addr3;

		// address 값을 hidden 필드에 할당
		$("#personaladdress").val(address);
	}); */
</script>

<script>
function check(){
    var f = document.store;

    var cstorename = f.storename.value;
    var vstorename = /^[~!@#$%^&*().,_+|<>?:{}a-zA-Z가-힣0-9\s]{1,9}$/;

    if(cstorename== "" || cstorename==" "){
        alert("매장명을 입력해주세요.");
        f.storename.select();
        return false;
    }
    if(!vstorename.test(cstorename)){
        alert("매장명을 제대로 입력해주세요.");
		f.storename.select();
		return false;
    }

    var caddr3 = f.addr3.value;

    if(caddr3== "" || caddr3==" "){
        alert("매장 주소 공백은 안 돼요.");
        f.addr3.select();
        return false;
    }

    var cmain_menu = f.main_menu.value;
    var vmain_menu = /^[~!@#$%^&*().,_+|<>?:{}a-zA-Z0-9가-힣\s]{1,15}$/;

    if(cmain_menu== "" || cmain_menu==" "){
        alert("매장 대표 메뉴 이름 공백은 안 돼요.");
        f.main_menu.select();
        return false;
    }
    if(!vmain_menu.test(cmain_menu)){
        alert("매장 대표 메뉴 이름을 제대로 입력해주세요.");
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

//Textarea 요소 가져오기
var textarea = document.getElementById("introTextarea");

// 엔터 키 입력 감지
textarea.addEventListener("input", function () {
    // 내용에서 줄바꿈을 <br> 태그로 대체
    var formattedText = textarea.value.replace(/\n/g, "<br>");

    // 대체된 내용을 textarea에 설정
    textarea.innerHTML = formattedText;
});

</script>
</head>
<body>
<br><br>	
		<div class="div-container">
		<div class="category">
			<h1>마이페이지</h1>
			<a href="storeoutput?store_id=${store.id}">나의 매장 정보</a><br> 
			<a href="storemodifyview?store_id=${store.id}">매장 정보 수정</a><br>
			<a href="storeinput" style="color: #ff8c00;">매장 등록</a><br>
			<a href="storeleave?id=${store.id}">매장 삭제</a><br>
			<hr style="width:190px; text-align: left; margin-left:0;">			
			<a href="storeaccountinfo?id=${store.id}">나의 회원 정보</a><br>
			<a href="storeaccountmodify?id=${store.id}">회원 정보 수정</a><br>
			<a href="storeaccountleave">회원 탈퇴</a><br>
		</div>

		<div class="qna">
<form action="storeinputsave" method="post" enctype="multipart/form-data" name="store">
<div class="wrap">
        <div class="storeinput">
            <h1 style="margin-bottom: 50px;">매장 등록</h1>
            
            <div class="store_id">
                <h4>업체 아이디</h4>
                <c:choose>
                <c:when test="${storeloginstate == true}">
	        	<input type="text" name="store_id" value="${store.id}" readonly>
				</c:when>
				
				<c:otherwise>
				<script>
				alert("등록된 아이디가 없습니다.");
				location.href = "storeLogin";
				</script>
				</c:otherwise>
				</c:choose>
            </div>
            
            <div class="storename">
                <h4>매장명</h4>
                <input type="text" name="storename" placeholder="매장명">
            </div>
            
            <div class="tel">
              <h4>매장 전화번호</h4>
              <input type="text" name="tel" placeholder="매장 전화번호">
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
					placeholder="도로명 주소" name="addr2" id="addr2" type="text"readonly="readonly" />
				<input class="textbox" placeholder="상세주소" name="addr3" id="addr3" type="text" /> 
            </div>
            
            <div class="lineintro">
              <h4>매장 한줄 소개</h4>
              <textarea rows="4" cols="40" name="lineintro" placeholder="매장 소개를 적어주세요!"></textarea>
          	</div>
          	
           	<div class="intro">
            	<h4>매장 소개글</h4>
            	<textarea id="introTextarea" rows="8" cols="40" name="intro" placeholder="운영시간, 휴무일을 꼭 적어주세요!"></textarea>
          	</div>
          	
          	<div class="mae_image">
           		<h4>매장 이미지</h4>
            	<input type="file" style="outline:none;" name="image" id="file" multiple="multiple">
          	</div>
          	
          	<div class="main_menu">
            <h4>매장 대표 메뉴 이름</h4>
            <input type="text" name="main_menu" placeholder="매장 대표 메뉴 이름">
          	</div>
          	
          	<div class="main_image">
            	<h4>매장 대표 메뉴 사진</h4>
            	<input type="file" style="outline:none;" name="main_image" id="file">
          	</div>
          	
          	<div class="region_name">
            <h4>지역을 선택하세요.</h4>
            <select name="region_name">
                <option selected>선택하세요</option>
                <option value="강남">강남</option>
                <option value="성수">성수</option>
                <option value="연남">연남</option>
                <option value="을지로">을지로</option>
                <option value="잠실">잠실</option>
                <option value="혜화">혜화</option>
              </select>
          	</div>
          
          	<div class="feature">
            <h4>특징</h4>
            <div class="flexbox">
            <div class="feature_box1">
	        	<input type="checkbox" name="feature" value="주차장 O" id="feature4"><label for="feature4">주차장 O</label><br>
	        	<input type="checkbox" name="feature" value="반려견 동반 입장 O" id="feature2"><label for="feature2">반려견 동반 입장 O</label><br>
	        	<input type="checkbox" name="feature" value="노트북 사용 O" id="feature8"><label for="feature8">노트북 사용 O</label>
			</div>
				<div class="feature_box2">
	        	<input type="checkbox" name="feature" value="주차장 X" id="feature5"><label for="feature5">주차장 X</label><br>
	        	<input type="checkbox" name="feature" value="반려견 동반 입장 X" id="feature3"><label for="feature3">반려견 동반 입장 X</label><br>
	        	<input type="checkbox" name="feature" value="노트북 사용 X" id="feature9"><label for="feature9">노트북 사용 X</label>
			</div>		
			<div class="feature_box3">
            	<input type="checkbox" name="feature" value="노키즈존" id="feature1"><label for="feature1">노키즈존</label><br>
			    <input type="checkbox" name="feature" value="루프탑" id="feature6"><label for="feature6">루프탑</label><br>
	        	<input type="checkbox" name="feature" value="테라스" id="feature7"><label for="feature7">테라스</label><br>
			</div>	
			</div>	
          	</div>
          
          	<div class="dessert">
            <h4>디저트</h4>
            	<input type="checkbox" name="dessert" value="케이크" id="dessert1"><label for="dessert1">케이크</label>
            	<input type="checkbox" name="dessert" value="마들렌" id="dessert2"><label for="dessert2">마들렌</label>
            	<input type="checkbox" name="dessert" value="스콘" id="dessert3"><label for="dessert3">스콘</label>
            	<input type="checkbox" name="dessert" value="마카롱" id="dessert4"><label for="dessert4">마카롱</label><br>
            	<input type="checkbox" name="dessert" value="크로플" id="dessert5"><label for="dessert5">크로플</label>
            	<input type="checkbox" name="dessert" value="푸딩" id="dessert6"><label for="dessert6">푸딩&emsp;</label>
            	<input type="checkbox" name="dessert" value="쿠키" id="dessert7"><label for="dessert7">쿠키</label>
            	<input type="checkbox" name="dessert" value="빙수" id="dessert8"><label for="dessert8">빙수&emsp;</label>
           	</div>
          
           	<div class="submit">
                <input type="button" value="입력" onclick="check()">
           	</div>
        </div>
    </div>
</form>
		</div>
	</div>
</body>
</html>