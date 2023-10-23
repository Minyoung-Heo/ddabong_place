<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".reviewsubmit").click(function(event) {
			var f = document.reviewform;
			var content = f.reviewcontent.value;
			var id = "${personal.id}";

			if (content === null || content === "") {
				alert("리뷰 내용을 입력하세요.");
				event.preventDefault(); // submit 막음
			} else if (id === null || id.trim() === "") {
				alert("로그인이 필요합니다.");
				event.preventDefault(); // submit 막음
			} else {
				// AJAX로 reviewcheck 메소드 호출
				$.ajax({
					type : "POST",
					async : true,
					url : "reviewcheck",
					data : {
						storeid : "${storeid}",
						customerid : "${customerid}"
					},
					success : function(result) {
						if (result === "ok") {

						} else {
							alert("예약 이력이 없습니다.");
							event.preventDefault(); // submit 막음
						}
					}
				});
			}
		});
	});

	  document.addEventListener("DOMContentLoaded", function() {
		    var starInputs = document.querySelectorAll("input.outstar");
		    starInputs.forEach(function(input) {
		      input.disabled = true; // 모든 별점 input 요소를 비활성화
		    });
		  });
</script>
<style type="text/css">
.detailtable {
	width: 860px;
	margin: 0 auto;
	border: 1px solid #b3b3b3;
	border-radius: 20px;
	border-left-color: #e6e6e6;
	border-right-color: #e6e6e6;
}
.reviewtable {
	width: 860px;
	height: 300px;
	margin: 0 auto;
	border: 1px solid #b3b3b3;
	border-radius: 20px;
	border-left-color: #e6e6e6;
	border-right-color: #e6e6e6;
}

.reviewsubmit {
	position: relative;
	right: 25px;
	top: 60px;
}

.reviewcontent {
	position: relative;
	bottom: 20px;
}

.reviewattach {
	position: relative;
	left: 200px;
	bottom: 50px;
}

.center-td {
	text-align: center;
	vertical-align: top;
}

.table-bottom {
	padding-bottom: 14px;
}

.reservbtn {
	width: 250px;
	height: 100px;
	border-radius: 14px;
	border: 1px solid #b3b3b3;
}

.reviewfile {
	position: relative;
	left: 270px;
}

/* 리뷰출력 */
.rev-img {
	margin-right: 48px;
	margin-top: 10px;
	width: 260px;
	height: 260px;
	position: relative;
}

/* 끝 */
.blind {
	position: absolute;
	overflow: hidden;
	margin: -1px;
	padding: 0;
	width: 1px;
	height: 1px;
	border: none;
	clip: rect(0, 0, 0, 0);
}

.startRadio {
	display: inline-block;
	overflow: hidden;
	height: 40px;
	position: relative;
	right: 200px;
}

.startRadio:after {
	content: "";
	display: block;
	position: relative;
	z-index: 10;
	height: 40px;
	background:
		url("data:image/png;base64,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")
		repeat-x 0 0;
	background-size: contain;
	pointer-events: none;
}

.startRadio__box {
	position: relative;
	z-index: 1;
	float: left;
	width: 20px;
	height: 40px;
	cursor: pointer;
}

.startRadio__box input {
	opacity: 0 !important;
	height: 0 !important;
	width: 0 !important;
	position: absolute !important;
}

.startRadio__box input:checked+.startRadio__img {
	background-color: #0084ff;
}

.startRadio__img {
	display: block;
	position: absolute;
	right: 0;
	width: 500px;
	height: 40px;
	pointer-events: none;
}
.reviewstar img {
width:25px;
margin-right:5px;
margin-bottom:5px;
}
.reviewstar {
font-size: 20px;
}
.starout
{
position: relative;
padding-right: 110px;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<br>
	<br>
	<br>
	<c:set var="storeid" value="" scope="page" />
	<c:forEach items="${registrationlist}" var="regi" varStatus="loop">
		<c:forEach items="${ddabonglist}" var="dda">
			<c:set target="${pageScope}" property="storeid"
				value="${regi.store_id}" />
			<div class="detailtable">
				<table width="100%">
					<tr>
						<td style="text-align: left;"><img src="/dda/image/pin.png" width="21px"> ${regi.region_name}<br>
						<h1>${regi.storename}</h1>
						<span class="review">
						<c:forEach items="${reviewstarList}" var="re">
						<c:if test="${regi.store_id == re.store_id}">
						<span class="reviewstar">
						<img src="/dda/image/star.png">
						${re.star_score} (${re.review_count})</span> 
						</c:if>
						</c:forEach>
					<img src="/dda/image/tel.png" width="18px"> ${regi.tel }
							&emsp;&emsp;&emsp;&emsp;${regi.address}</td>
					</tr>
				
					<tr>
						<td class="center-td" style="padding: 10px;"><img
							src="image/${regi.imageList[0]}" width="840px" height="500px"></td>
					</tr>
					<tr>

						<td style="text-align: center; padding: 50px, 50px, 50px, 50px;"><c:forEach
								items="${regi.imageList}" var="img" varStatus="loop">
								<c:if test="${loop.index >= 1 && loop.index < 7}">
									<img src="image/${img}" width="120px" height="120px">
								</c:if>
							</c:forEach></td>

					</tr>
					
					<tr>
						<td><br>
							<h3>우리 매장의 대표메뉴</h3> <br> <img
							src="image/${regi.main_image}" width="150px" height="150px">
							<br>
							<h4>${regi.main_menu}</h4> <br></td>
					</tr>
					<tr>
						<td class="table-bottom"><form action="reserv" method="POST">
								<input type="hidden" name="storename" value="${regi.storename}">
								<input type="hidden" name="storeID" value="${regi.store_id}">
								<button class="reservbtn" type="submit">
									<h1>예약하기</h1>
								</button>
							</form></td>
						<a href="waitingInput?store_id=${regi.store_id}">웨이팅</a>
					</tr>
				</table>
			</div>
		</c:forEach>
	</c:forEach>
	<div class="detailtable">
		<form action="review" method="post" name="reviewform"
			enctype="multipart/form-data">
			<input type="hidden" name="storeid" value="${storeid }"> <input
				type="hidden" name="customerid" value="${personal.id }">
			<table width="100%" height="100%">
				<tr>
					<td>
						<h2 style="text-align: left;">&emsp;리뷰 작성하기</h2> <br>
						<div class="startRadio">
							<label class="startRadio__box"> <input type="radio"
								name="star" value="0.5"> <span class="startRadio__img"><span
									class="blind">별 0.5개</span></span>
							</label> <label class="startRadio__box"> <input type="radio"
								name="star" value="1"> <span class="startRadio__img"><span
									class="blind">별 1.0개</span></span>
							</label> <label class="startRadio__box"> <input type="radio"
								name="star" value="1.5"> <span class="startRadio__img"><span
									class="blind">별 1.5개</span></span>
							</label> <label class="startRadio__box"> <input type="radio"
								name="star" value="2"> <span class="startRadio__img"><span
									class="blind">별 2.0개</span></span>
							</label> <label class="startRadio__box"> <input type="radio"
								name="star" value="2.5"> <span class="startRadio__img"><span
									class="blind">별 2.5개</span></span>
							</label> <label class="startRadio__box"> <input type="radio"
								name="star" value="3"> <span class="startRadio__img"><span
									class="blind">별 3.0개</span></span>
							</label> <label class="startRadio__box"> <input type="radio"
								name="star" value="3.5"> <span class="startRadio__img"><span
									class="blind">별 3.5개</span></span>
							</label> <label class="startRadio__box"> <input type="radio"
								name="star" value="4"> <span class="startRadio__img"><span
									class="blind">별 4.0개</span></span>
							</label> <label class="startRadio__box"> <input type="radio"
								name="star" value="4.5"> <span class="startRadio__img"><span
									class="blind">별 4.5개</span></span>
							</label> <label class="startRadio__box"> <input type="radio"
								name="star" value="5"> <span class="startRadio__img"><span
									class="blind">별 5.0개</span></span>
							</label>
						</div>
						<div class="reviewattach">
							리뷰할 사진을 모두 선택해 주세요. <input class="reviewfile" name="reviewfile"
								type="file" multiple="multiple">
						</div> <textarea class="reviewcontent" rows="5" cols="80"
							name="reviewcontent"></textarea>
					</td>
					<td><input class="reviewsubmit" type="submit"
						style="width: 100px; height: 100px;" value="작성하기"></td>
				</tr>
			</table>
		</form>
	</div>
	<c:forEach items="${reviewlist}" var="rev" varStatus="loop">
		<c:set var="uid" value="${rev.id}" />
		<c:set var="length" value="${fn:length(uid)}" />
		<c:set var="replaceid" value="${fn:substring(uid, 3, length)}" />
		<c:set var="id"
			value="${fn:substring(uid, 0, 3)}${replaceid.replaceAll('.', '*')}" />
		<div class="reviewtable">
			<table width="100%" height="100%" align="center">
				<tr style="text-align: left;">
					<td><br>&emsp;&emsp;${rev.nickname}님(${id})</td>
				</tr>
				<tr>
					<td>
					<div class="starout">
					<div class="startRadio">
							<label class="startRadio__box"> <input type="radio"
								name="star" value="0.5" ${rev.star == 0.5 ? 'checked' : ''} class="outstar"> <span class="startRadio__img"><span
									class="blind">별 0.5개</span></span>
							</label> <label class="startRadio__box"> <input type="radio"
								name="star" value="1" ${rev.star == 1 ? 'checked' : ''} class="outstar"> <span class="startRadio__img"><span
									class="blind">별 1.0개</span></span>
							</label> <label class="startRadio__box"> <input type="radio"
								name="star" value="1.5" ${rev.star == 1.5 ? 'checked' : ''} class="outstar"> <span class="startRadio__img"><span
									class="blind">별 1.5개</span></span>
							</label> <label class="startRadio__box"> <input type="radio"
								name="star" value="2" ${rev.star == 2 ? 'checked' : ''} class="outstar"> <span class="startRadio__img"><span
									class="blind">별 2.0개</span></span>
							</label> <label class="startRadio__box"> <input type="radio"
								name="star" value="2.5" ${rev.star == 2.5 ? 'checked' : ''} class="outstar"> <span class="startRadio__img"><span
									class="blind">별 2.5개</span></span>
							</label> <label class="startRadio__box"> <input type="radio"
								name="star" value="3" ${rev.star == 3 ? 'checked' : ''} class="outstar"> <span class="startRadio__img"><span
									class="blind">별 3.0개</span></span>
							</label> <label class="startRadio__box"> <input type="radio"
								name="star" value="3.5" ${rev.star == 3.5 ? 'checked' : ''} class="outstar"> <span class="startRadio__img"><span
									class="blind">별 3.5개</span></span>
							</label> <label class="startRadio__box"> <input type="radio"
								name="star" value="4" ${rev.star == 4 ? 'checked' : ''} class="outstar"> <span class="startRadio__img"><span
									class="blind">별 4.0개</span></span>
							</label> <label class="startRadio__box"> <input type="radio"
								name="star" value="4.5" ${rev.star == 4.5 ? 'checked' : ''} class="outstar"> <span class="startRadio__img"><span
									class="blind">별 4.5개</span></span>
							</label> <label class="startRadio__box"> <input type="radio"
								name="star" value="5" ${rev.star == 5 ? 'checked' : ''} class="outstar"> <span class="startRadio__img"><span
									class="blind">별 5.0개</span></span>
							</label>
						</div></div></td><td>드래곤</td>
				</tr>
				<tr>
					<td><div class="rev-img">
							<img src="image/${rev.imageList[0]}" width="200px">
						</div></td>
				</tr>
			</table>
		</div>
	</c:forEach>

</body>
</html>
