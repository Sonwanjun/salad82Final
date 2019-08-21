<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
table {
	width: 1000px;
	caption-side: top;
	border-collapse: separate;
	border-spacing: 40px;
	margin-top: 50px;
}

table td {
	border: 1px solid green;
	padding: 20px;
	border-radius: 80px/100px;
}

caption {
	font-size: 30px;
}
a{
	text-decoration: none;
}

h1 {
	text-align: center;
}

p {
	text-align: right;
}

#header {
	width: 100%;
	text-align: center;
	background: #009900;
	font-size: 20;
	padding: 1%;
}

#footer {
	width: 100%;
	height: 120px;
	position: absolute;
	bottom: 0;
	background: #009900;
	font-size: 16;
}
</style>
</head>
<body>
	<p>로그인/로그아웃 회원가입/마이페이지 고객센터</p>
	<h1>로고</h1>
	<div id="header">DIY SIG BEST Recipe</div>
	<table align="center">
		<caption>회원가입 종류를 선택해 주세요.</caption>
		<tbody>
			<tr>
				<td width="200" height="300" align="center"><a href="./njoinFrm">일반회원</a></td>
				<td width="200" height="300" align="center"><a href="./sjoinFrm">판매자회원</a></td>
		</tbody>
	</table>
	<div id="footer" align="center"><br>업체명: Salad82 | 사업자번호:123-45-6789<br>
                        주소: 인천 남구 학익동 663-1 태승빌딩 | 전화번호:032-123-4567<br>
                        Copyrights(c) ㈜Salad82 2015 all rights reserved.
    </div>
</body>
</html>