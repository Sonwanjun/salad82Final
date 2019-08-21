<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="resources/js/jquery.serializeObject.js"></script>

<style>
h1{
text-align:center;
}

#createbox
{
text-align:right;
}

#loginbox{
text-align:center;
padding-top:10%;
}

#header {
    width: 100%;
    text-align:center;
    background:#009900;
    font-size: 20;
    padding:1%;
}			

#footer
{
   width: 100%;
   height: 120px;
   position: absolute;
   bottom:0;
   background: #009900;
   font-size: 16;
}



#articleView_layer {
	display: none;
	position: fixed;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%
}

#articleView_layer.open {
	display: block;
	color: red
}

#articleView_layer #bg_layer {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: #000;
	opacity: .5;
	filter: alpha(opacity = 50);
	z-index: 100
}

#contents_layer {
	position: absolute;
	top: 40%;
	left: 40%;
	width: 400px;
	height: 400px;
	margin: -150px 0 0 -194px;
	padding: 28px 28px 0 28px;
	border: 2px solid #555;
	background: #fff;
	font-size: 12px;
	z-index: 200;
	color: #767676;
	line-height: normal;
	white-space: normal;
	overflow: scroll
}
 
</style>

</head>

<body>
<p id="createbox">로그인/로그아웃    회원가입/마이페이지    고객센터</p>
<h1>
	로고
</h1>
<div id="header">DIY SIG BEST Recipe</div>
<p id="loginbox">
아이디 : <input type = "text" name = "m_id" placeholder = "아이디"><br>
비밀번호 : <input type = "password" name = "m_pwd" placeholder="비밀번호"><br>
<button>로그인</button>
<a href="./loginform">회원가입</a>




<a href="#search" onclick="articleView()"> 아이디/비밀번호 찾기</a>
</p>
	<div id="articleView_layer">
		<div id="bg_layer"></div>
		<div id="contents_layer">
		아이디찾기<br>
		이름&nbsp;&nbsp;&nbsp; : <input type="text" name = "nameChk"><br>
		이메일 : <input type="text" name = "emailChk"><br>
		<button>확인</button><br><br><br><br><br>
		비밀번호찾기<br>
		아이디 : <input type="text" name = "nameChk"><br>
		이메일 : <input type="text" name = "emailChk"><br>
		<button>확인</button>
		</div>
	</div>

<div id="footer" align="center"><br>업체명: Salad82 | 사업자번호:123-45-6789<br>
                        주소: 인천 남구 학익동 663-1 태승빌딩 | 전화번호:032-123-4567<br>
                        Copyrights(c) ㈜Salad82 2015 all rights reserved.</div>

</body>

<script>

 function articleView(num){
	$('#articleView_layer').addClass('open'); //addClass = 클래스추가
	$.ajax({
		type:'get',                              //modalbox modallessBox
		url:'contents',
		data:obj,
		dataType:'html',
		success:function(data){
			alert('success');
			console.log(success);
		},
		error:function(error){
			alert('error');
			console.log(error);
		}
	}); //ajax End
}//function End
//LightBox 해제

  var $layerWindow=$('#articleView_layer');
 $layerWindow.find('#bg_layer').on('mousedown',function(event){
 	console.log(event);
 	$layerWindow.removeClass('open');
 	return;
 });//on End

 $(document).keydown(function(event){
		console.log(event);
		if(event.keyCode!=27) return;
		if($layerWindow.hasClass('open')){
			$layerWindow.removeClass('open');
		}
	});
 	 
 


</script>

</html>



