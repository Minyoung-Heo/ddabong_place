<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function submitForm() {
		document.getElementById("quizForm").submit();
	}
</script>

<style type="text/css">

.quiztitle {
	color: black;
  	font-size: 50px;
  	margin-top: 1em;
}

.kid, .pet, .parking, .notebook{
	margin-top: 5em;
}

.rooftop, .terrace{
	margin-top: 3em;
}

.quizment input[type=radio]{
    display: none;
}

.quizment input[type=radio]+label{
    display: inline-block;
    cursor: pointer;
    height: 24px;
    width: 7%;
    height: 40px;
    border: 1px solid #ff8c00;
    border-radius: 30px;
    line-height: 37px;
    text-align: center;
    font-weight:bold;
    font-size: 20px;
}

.quizment input[type=radio]+label{
    background-color: #fff;
    color: #333;
}

.quizment input[type=radio]:checked+label{
    background-color: rgb(252,113,7);
    color: #fff;
}

.quizment input[type=radio]+label:hover {
  background: rgb(254,163,72);
  color: #fff;
  }

.rooftop, .terrace{
	font-size: 25px;
}

label {
	margin-left: 15px;
	position: relative;
	top: 30px;
	left: -10px;
}
.rooftop input[type="checkbox"], .terrace input[type="checkbox"]{ 
	position:absolute;
    width:20px; 
    height:20px;
    margin:0px;
    overflow:hidden;
    clip:rect(0,0,0,0); 
    border:0;
    display: none;
}

.rooftop input[type="checkbox"] + label, .terrace input[type="checkbox"] + label{ 
	display:inline-block; 
    position:relative; 
    padding-left:26px; 
    cursor:pointer; 
}
.rooftop input[type="checkbox"] + label:before, .terrace input[type="checkbox"] + label:before{ 
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
.rooftop input[type="checkbox"]:checked + label:after, .terrace input[type="checkbox"]:checked + label:after{ 
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

.quizbtn input{
	margin-top: 4em;
	width: 15%;
  	height: 60px;
  	border: 0;
  	outline: none;
  	border-radius: 40px;
  	background: linear-gradient(to left, rgb(255, 77, 46), rgb(255, 155, 47));
  	color: white;
  	font-size: 1.2em;
  	letter-spacing: 2px;
  	position: relative;
  	left: 0px;
  	font-size: 25px;
}

</style>

</head>
<body>
	<br>
	<br>
	<div class="quiztitle">당신의 카페에 투표해주세요!🍵</div>
	<div class="quizment">
		<form action="recommend" method="post" id="quizForm">
			
			<div class="kid">
			<h1>아이와 함께 방문하시나요?</h1>
			<input type="radio" name="kid" value="키즈존" id="kid1"><label for="kid1"> 네 </label>
			<input type="radio" name="kid" value="노키즈존" id="kid2"><label for="kid2"> 아니요 </label>
			</div>
			
			<div class="pet">
			<h1>반려견과 함께이신가요?</h1>
			<input type="radio" name="pet" value="반려견 동반 입장 O" id="pet1"><label for="pet1"> 네 </label>
			<input type="radio" name="pet" value="반려견 동반 입장 X" id="pet2"><label for="pet2"> 아니요 </label>
			</div>
			
			<div class="parking">
			<h1>주차장이 필요하신가요?</h1>
			<input type="radio" name="parking" value="주차장 O" id="parking1"><label for="parking1"> 네 </label>
		 	<input type="radio" name="parking" value="주차장 X" id="parking2"><label for="parking2"> 아니요 </label>
			</div>
			
			<div class="rooftop">
			<h1>루프탑을 원하시나요?</h1>
			<input type="checkbox" name="rooftop" value="루프탑" id="rooftop1"><label for="rooftop1"> 루프탑이 필요해요. </label>
			</div>
			
			<div class="terrace">
			<h1>테라스가 필요하신가요?</h1>
			<input type="checkbox" name="terrace" value="테라스" id="terrace1"><label for="terrace1"> 테라스가 필요해요. </label>
			</div>
			
			<div class="notebook">
			<h1>노트북을 사용하실 예정인가요?</h1>
			<input type="radio" name="notebook" value="노트북 사용 O" id="notebook1"><label for="notebook1"> 네 </label>
			<input type="radio" name="notebook" value="노트북 사용 X" id="notebook2"><label for="notebook2"> 아니요 </label>
			</div>
			
			<div class="quizbtn">
			<input type="button" id="quizbtn" onclick="submitForm()" value="추천 카페로 이동">
			</div>
		</form>
	</div>
</body>
</html>