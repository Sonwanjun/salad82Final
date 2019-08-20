<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
body {
	width: 100%;
	height: 100%;
}

#wrapper {
	width: 1910px;
	height: 100%;
	margin-left: -5px;
}


#header h1 {
	text-align: center;
}

#header p {
	text-align: right;
	margin-right : 20px;
}

#topMenu {
	width: 100%;
	height: 70px;
	border-top: 1px solid #009900;
	border-bottom: 1px solid #009900;
	border-collapse: collapse;
	text-aline: center;
	background: #009900;
	border-top: 1px solid #009900;
}

#topMenu td {
	border-top: 1px solid #009900;
	border-bottom: 1px solid #009900;
	padding: 20px 150px 20px;
}

#header {
	width: 100%;
	height: 100px;
}

#menubar {
	width: 100%;
	height: 70px;
	margin-bottom: 30px;
	background-color: #1fbf37;
}

#mainContent {
	width: 100%;
	height: 620px;
}

#leftMenuArea {
	width: 250px;
	height: 600px;
	margin-left: 70px;
	background-color: blue;
	display: inline-block;
}

#leftMenuArea * {
	display: inline;
}

#leftMenu td {
	width: 248px;
	height: 50px;
	margin-top: 30px;
	padding-top: 20px;
	text-align: center;
	display: inline-block;
	background-color: green;
	text-align: center;
	cursor : pointer;
}

#ajaxArea {
	width: 1150px;
	height: 600px;
	margin-left: 70px;
	background-color: pink;
	display: inline-block;
	position: absolute;
	overflow: scroll;
}

#footer {
	width: 100%;
	height: 120px;
	text-align : center;
	bottom: 0;
	background: #009900;
	font-size: 16;
}

</style>
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<p>로그인/로그아웃&nbsp;&nbsp;회원가입/마이페이지&nbsp;&nbsp;고객센터</p>
			<h1>로고</h1>
		</div>

		<div id="menubar">
			<table id="topMenu">
				<tr>
					<td>DIY</td>
					<td>시그니쳐</td>
					<td>Best</td>
					<td>나만의 레시피</td>
				</tr>
			</table>
		</div>

		<div id="mainContent">
			<div id="leftMenuArea">
				<table id="leftMenu">
					<tr>
						<td onclick="sellerInfo()">메뉴1</td>
					</tr>
					<tr>
						<td>메뉴2</td>
					</tr>
					<tr>
						<td>메뉴3</td>
					</tr>
					<tr>
						<td>메뉴4</td>
					</tr>
				</table>
			</div>
			<div id="ajaxArea">ajax 영역</div>
		</div>

		<div id="footer">
			<br>업체명: Salad82 | 사업자번호:123-45-67890 <br>주소: 인천 남구 학익동
			663-1 태승빌딩 | 전화번호:032-123-4567 <br>Copyrights(c) ㈜Salad82 2015
			all rights reserved.
		</div>
	</div>
</body>
<script>
	function sellerInfo(pNum){
		$.ajax({
			type : 'get',
			url : 'sellerInfo',
			data : {pNum : pNum},
			dataType : 'html',
			success : function(data){
				$('#ajaxArea').html(data);
			},
			error : function(error){
				alert('에러다 에러');
			}
		});
	};
</script>
</html>