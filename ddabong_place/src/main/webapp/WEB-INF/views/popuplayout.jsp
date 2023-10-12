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
<style type="text/css">
.login {
   float: right;
   position: relative;
   text-align: right;
   margin-right: 50px;
   margin-top: -5px;
   margin-bottom: 0px;
}

.login a {
   margin-left: 50px;
   color: #FF8C00;
   text-decoration: none;
   font-size: 20px;
}

.header2 {
   float: left;
   position: relative;
   margin-top: -40px;
   margin-left: 20px;
}

.search {
   margin-top: -30px;
   float: right;
   margin-right: 1100px;
   position: relative;
   width: 300px;
}
#searchbtn {
	border: none;
	border-radius: 0px;
}
.in2 {
   width: 250%;
   height: 60px;
   border: 3.8px solid #ff8c00;
   border-radius: 50px;
   padding: 10px 12px;
   font-size: 14px;
}

.img2 {
   position: absolute;
   width: 17px;
   top: 20px;
   left: 235%;
   margin: 0;
}

.test{
   position: fixed;
   float: left;
   left: 300px;
   top: 150px;
   font-size: 30px;
}

#container {
   border: 1px slid #bcbcbc;
}

#body {
	text-align: center;
	padding: 10px;
	height: auto;
	min-height: 300%;
}


.info, .cc {
   float: left;
   margin: 20px;
}

.cc {
   margin-left: 100px;
   margin-right: 100px;
}


.BZ {
	margin-top: 70px;
}

@font-face {
   font-family: 'TmoneyRoundWindExtraBold';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindExtraBold.woff')
      format('woff');
   font-weight: normal;
   font-style: normal;
}

* {
   font-family: 'TmoneyRoundWindExtraBold', sans-serif;
}

</style>
<meta charset="UTF-8">
<title><t:insertAttribute name="title" /></title>
</head>
<body>
   <div id="container">
      <div id="body">
         <t:insertAttribute name="body" />
      </div>
   </div>
</body>
</html>