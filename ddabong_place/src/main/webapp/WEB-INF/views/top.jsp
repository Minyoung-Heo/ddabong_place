<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<header style="text-align: center;">
	<h1>따봉플레이스</h1>
</header>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="main">시험이야잇</a>
		</div>
		<ul class="nav navbar-nav">
			<li class="active">
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">회원정보<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="memberinput">회원 가입</a></li>
					<c:choose>
						<c:when test="${loginstate ==true}">
							<li><a href="notice">회원 출력</a></li>
							<li><a href="membermodify">회원 정보 수정</a></li>
							<li><a href="membersearch">회원 정보 검색</a></li>
						</c:when>
					</c:choose>
				</ul></li>
		</ul>

		<c:choose>
			<c:when test="${loginstate ==true}">
				<ul class="nav navbar-nav">
					<li class="active">
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">쇼핑몰 관리<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="shopinput">쇼핑몰 정보 입력</a></li>
							<li><a href="shoppage">쇼핑몰 상품 출력</a></li>
							<li><a href="spout">상품별 총판매액 출력</a></li>
							<li><a href="dateout">날짜별 총판매액 출력</a></li>
						</ul></li>
				</ul>
			</c:when>
		</c:choose>

		<ul class="nav navbar-nav navbar-right">
			<li class="active"><a href="map">찾아오시는길</a></li>
			<c:choose>
				<c:when test="${loginstate ==true}">
					<li><a href="#"><span class="glyphicon glyphicon-user"></span>
							${member.name }님 어서오세요.</a></li>
					<li><a href="logout"><span
							class="glyphicon glyphicon-user"></span> 로그아웃</a></li>
				</c:when>

				<c:otherwise>
					<li><a href="memberinput"><span
							class="glyphicon glyphicon-user"></span> 회원가입</a></li>
					<li><a href="memberlogin"><span
							class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</nav>
</html>