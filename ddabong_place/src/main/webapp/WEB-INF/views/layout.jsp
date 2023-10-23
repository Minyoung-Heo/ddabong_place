<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="t"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="image/ddabong.png" rel="shortcut icon" type="image/x-icon"> <!-- 로고 변경 -->
<style type="text/css">
.login {
   margin-top:52px;
}

.login a {
   margin-left: 55px;
   color: #FF8C00;
   text-decoration: none;
   font-size: 20px;
}

.header2 {
   margin:10px;
   margin-top:25px;
}

.search {
   margin-top: 36px;
}
#searchbtn {
	border: none;
	background-image: url("/dda/image/search.png"); 
 	background-size:cover;
 	background-color:white;
	position: absolute;
   width: 25px;
   height:25px;
   top: 55px;
   left: 66.5%;
}
.in2 {
   width: 700px;
   height: 60px;
   border: 3px solid #ff8c00;
   border-radius: 50px;
   padding: 10px 17px;
   font-size: 14px;
   outline: none;
   margin-left: 20px;
   	
}

#container {
   border: 1px slid #bcbcbc;
}

#header {
   text-align: center;
   width: 100%;
   position: fixed;
}

#nav {
	width: 100%;
}
#top {
font-family: 'TmoneyRoundWindExtraBold'; 
}

#body {
	text-align: center;
	margin: 0;
	padding: 0;
	padding: 30px;
	height: auto;
	min-height: 300%;
	padding-bottom: 260px;
	margin-top: 50px;
	font-family: 'TmoneyRoundWindExtraBold'; 
}

#footer {
	padding:10px;
   height: 390px;
   width: 100%;
   position: relative;
   background-color: #FF8C00;
   color: white;
   transform: translateY(30%);
   margin: 0;
   font-weight: lighter;
   font-size: 15px;
   font-family: 'NanumSquareRound';
   line-height: 22px;
}

.info, .cc {
   float: left;
   margin: 20px;
}

.cc {
   margin-left: 100px;
   margin-right: 100px;
}

#img1 {
   margin-top: 100px;
}

.BZ {
	margin-top: 70px;
}

 @font-face { 
    font-family: 'TmoneyRoundWindExtraBold'; 
    src: 
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindExtraBold.woff');      format('woff'); 
   font-weight: normal; 
    font-style: normal; 
 } 

@font-face { 
     font-family: 'BMJUA'; 
     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff');
     font-weight: normal; 
    font-style: normal; 
} 
@font-face {
    font-family: 'NanumSquareRound';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

</style>
<meta charset="UTF-8">
<title><t:insertAttribute name="title" /></title>
</head>
<body>
  <div id="container">
      <div id="top">
         <t:insertAttribute name="top" />
      </div>
      <div id="body">
         <t:insertAttribute name="body" />
      </div>
      <div id="footer">
         <t:insertAttribute name="footer" />
      </div>
   </div>
</body>
</html>