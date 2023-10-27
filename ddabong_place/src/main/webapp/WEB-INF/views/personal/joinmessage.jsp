<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
// <![CDATA[
var bits=300; // 불꽃조각수 설정하기
var intensity=10; // 폭발강도 설정하기(최소 3 ~ 최대 10)
var speed=8; // 불꽃날리는 속도 설정하기(숫자가 작을수록 빠름)
var colours=new Array("#03f", "#f03", "#0e0", "#93f", "#0cc", "#f93");  // 불꽃색상 설정하기 (배열형태)
var dx, xpos, ypos, bangheight;
var Xpos=new Array();
var Ypos=new Array();
var dX=new Array();
var dY=new Array();
var decay=new Array();
var colour=0;
var swide=800;
var shigh=600;
function write_fire() {
  var b, s;
  b=document.createElement("div");
  s=b.style;
  s.position="absolute";
  b.setAttribute("id", "bod");
  document.body.appendChild(b);
  set_scroll();
  set_width();
  b.appendChild(div("lg", 3, 4));
  b.appendChild(div("tg", 2, 3));
  for (var i=0; i<bits; i++) b.appendChild(div("bg"+i, 1, 1));
}
function div(id, w, h) {
  var d=document.createElement("div");
  d.style.position="absolute";
  d.style.overflow="hidden";
  d.style.width=w+"px";
  d.style.height=h+"px";
  d.setAttribute("id", id);
  return (d);
}
function bang() {
  var i, X, Y, Z, A=0;
  for (i=0; i<bits; i++) {
    X=Math.round(Xpos[i]);
    Y=Math.round(Ypos[i]);
    Z=document.getElementById("bg"+i).style;
    if((X>=0)&&(X<swide)&&(Y>=0)&&(Y<shigh)) {
      Z.left=X+"px";
      Z.top=Y+"px";
 }
    if ((decay[i]-=1)>14) {
   Z.width="3px";
   Z.height="3px";
    }
    else if (decay[i]>7) {
   Z.width="2px";
   Z.height="2px";
    }
    else if (decay[i]>3) {
   Z.width="1px";
   Z.height="1px";
    }
    else if (++A) Z.visibility="hidden";
    Xpos[i]+=dX[i];
    Ypos[i]+=(dY[i]+=1.25/intensity);
  }
  if (A!=bits) setTimeout("bang()", speed);
}

function stepthrough() {
  var i, Z;
  var oldx=xpos;
  var oldy=ypos;
  xpos+=dx;
  ypos-=4;
  if (ypos<bangheight||xpos<0||xpos>=swide||ypos>=shigh) {
    for (i=0; i<bits; i++) {
      Xpos[i]=xpos;
      Ypos[i]=ypos;
      dY[i]=(Math.random()-0.5)*intensity;
      dX[i]=(Math.random()-0.5)*(intensity-Math.abs(dY[i]))*1.25;
      decay[i]=Math.floor((Math.random()*16)+16);
      Z=document.getElementById("bg"+i).style;
      Z.backgroundColor=colours[colour];
   Z.visibility="visible";
    }
    bang();
    launch();
  }
  document.getElementById("lg").style.left=xpos+"px";
  document.getElementById("lg").style.top=ypos+"px";
  document.getElementById("tg").style.left=oldx+"px";
  document.getElementById("tg").style.top=oldy+"px";
}
function launch() {
  colour=Math.floor(Math.random()*colours.length);
  xpos=Math.round((0.5+Math.random())*swide*0.5);
  ypos=shigh-5;
  dx=(Math.random()-0.5)*4;
  bangheight=Math.round((0.5+Math.random())*shigh*0.4);
  document.getElementById("lg").style.backgroundColor=colours[colour];
  document.getElementById("tg").style.backgroundColor=colours[colour];
}
window.onscroll=set_scroll;
function set_scroll() {
  var sleft, sdown;
  if (typeof(self.pageYOffset)=="number") {
    sdown=self.pageYOffset;
    sleft=self.pageXOffset;
  }
  else if (document.body.scrollTop || document.body.scrollLeft) {
    sdown=document.body.scrollTop;
    sleft=document.body.scrollLeft;
  }
  else if (document.documentElement && (document.documentElement.scrollTop || document.documentElement.scrollLeft)) {
    sleft=document.documentElement.scrollLeft;
 sdown=document.documentElement.scrollTop;
  }
  else {
    sdown=0;
    sleft=0;
  }
  var s=document.getElementById("bod").style;
  s.top=sdown+"px";
  s.left=sleft+"px";
}
window.onresize=set_width;
function set_width() {
  if (typeof(self.innerWidth)=="number") {
    swide=self.innerWidth;
    shigh=self.innerHeight;
  }
  else if (document.documentElement && document.documentElement.clientWidth) {
    swide=document.documentElement.clientWidth;
    shigh=document.documentElement.clientHeight;
  }
  else if (document.body.clientWidth) {
    swide=document.body.clientWidth;
    shigh=document.body.clientHeight;
  }
}
window.onload=function() { if (document.getElementById) {
  set_width();
  write_fire();
  launch();
  setInterval('stepthrough()', speed);
}}
// ]]>
</script>
<meta charset="UTF-8">
<meta http-equiv="Refresh" content="5; main">
<title>Insert title here</title>
</head>
<body>
	<div class="BZ">
		<h1 style="margin-top: 150px;">따봉플레이스 회원가입을 축하드립니다 !</h1>
		<img alt="따봉 로고" src="/dda/image/welcome.jpg">
		<h4>(잠시후 메인으로 이동됩니다.)</h4>
	</div>

</body>
</html>