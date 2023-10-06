<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
/* code */
/* 인풋은 화면에 안보이게 합니다.*/
input[type="checkbox"]{display:none}
input[type="checkbox"] + label span{
  display:inline-block;
  width:50px;
  height:50px;
  border:1px solid #000;
  vertical-align:middle;
}
input[type="checkbox"]:checked + label span{
  /* 구글에서 가져온 이미지입니다, 원하는 이미지로 변경하면 됩니다. */
  background:url(/dda/image/스벅.png);
  
  /*   이미지 크기가 체크박스보다 크다면 cover를 적용 */
  /*   background-size:cover; */
}
</script>
<style type="text/css">
input.img-button {
  background: url("https://i.ibb.co/3493r17/cat.jpg") no-repeat;
  width: 180px;
  height: 180px;
  margin-top: 200px;
  margin-left: 100px;
}
</style>
</head>
<body>
<input type="button" class="img-button" onclick="alert('하나')">
<input type="button" class="img-button" onclick="alert('둘')">
<div class="check_wrap">
  <input type="checkbox" id="img_checkbox">
  <label for="img_checkbox">
    <span></span> <!-- 체크박스 -->
    클릭하면 체크박스 이미지가 나타납니다.
  </label>
</div>
</body>
</html>