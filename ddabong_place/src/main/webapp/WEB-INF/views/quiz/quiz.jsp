<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.quiz{
margin-top: 8em;
}
.quiztitle{
font: bold;
font-size: 55px;
margin-top: 2em;
}
</style>
</head>
<body>
<br><br>
<div class="quiztitle">당신에게 딱 맞는 카페를 추천드립니다.</div>
<div class="quiz">
<form action="recommend" method="post">
<label>
<h1>아이와 함께 방문하시나요?</h1><br>
    <input type="radio" name="kid" value="키즈존"> 아이가 있어요
    <input type="radio" name="kid" value="노키즈존"> 조용한 곳을 원해요
</label><br><br><br>
<label>
<h1>반려견과 함께이신가요?</h1><br>
    <input type="radio" name="pet" value="반려견 동반 입장 O"> 댕댕이와 함께에요
    <input type="radio" name="pet" value="반려견 동반 입장 X"> 나도 갖고싶다 고양이
</label><br><br><br>
<label>
<h1>주차장이 필요하신가요?</h1><br>
    <input type="radio" name="parking" value="주차장 O"> 주차장이 필요해요
    <input type="radio" name="parking" value="주차장 X"> 뚜벅이에요
</label><br><br><br>
<label>
<h1>루프탑을 원하시나요?</h1><br>
    <input type="checkbox" name="rooftop" value="루프탑"> 루프탑이 필요해요
</label><br><br><br>
<label>
<h1>테라스가 필요하신가요?</h1><br>
    <input type="checkbox" name="terrace" value="테라스"> 테라스가 필요해요
</label><br><br><br>
<label>
<h1>노트북을 갖고계신가요?</h1>
   <input type="radio" name="notebook" value="노트북 사용 O"> 노트북과 함께에요
    <input type="radio" name="notebook" value="노트북 사용 X"> 흙수저에요
</label><br>
  <br><br><br><input type="submit" value="전송">
</form>
</div>
</body>
</html>