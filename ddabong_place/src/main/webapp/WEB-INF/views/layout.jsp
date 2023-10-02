<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">

#container {
	border: 1px slid #bcbcbc;
}
#header {
	text-align: center;
	width: 100%;
}
#nav {
	width: 100%;
}
#body {
	margin: 0;
	padding: 0;
	text-align:center;
	padding: 30px;
	height: auto;
	min-height: 100%;
	padding-bottom: 260px;
	margin-top:50px;
}
#footer {
	height: 260px;
	width: 100%;
	position: relative;
	background-color: #FF8C00;
	color: white;
	transform: translatY(-100%);
	margin:0;
}
.info, .cc{
	float: left;
	margin: 20px;
}

.cc {
	margin-left: 100px;
	margin-right: 100px;
}
#img1{
margin-top: 100px;
}

@font-face {
    font-family: 'Cafe24Supermagic-Bold-v1.0';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-2@1.0/Cafe24Supermagic-Bold-v1.0.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}

h1{
font-family: 'Cafe24Supermagic-Bold-v1.0', serif;
color: rgb(150,148,253);
}
</style>
<meta charset="UTF-8">
<title><t:insertAttribute name="title"/></title>
</head>
<body>
	<div id="container">
		<div id="top">
			<t:insertAttribute name="top"/>
		</div>
		<div id="body">
			<t:insertAttribute name="body"/>
		</div>
		<div id="footer">
			<t:insertAttribute name="footer"/>
		</div>
	</div>
</body>
</html>