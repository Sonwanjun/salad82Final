
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<style>
h1 {
	text-align: center;
}

#row {
	text-align: right;
}

#top {
	width: 100%;
	border-top: 1px solid #009900;
	border-bottom: 1px solid #009900;
	border-collapse: collapse;
	text-align: center;
	background: #009900;
}

#mainmenu th, td {
	border-top: 1px solid #009900;
	border-bottom: 1px solid #009900;
	padding: 20px 210px 20px;
}

.footer {
	width: 100%;
	height: 120px;
	position: absolute;
	bottom: 0;
	background: #009900;
	font-size: 16;
}

#footer {
	background: #009900;
}

#WriteTitle {
	margin-left: 5px;
	margin-top: 15px;
	padding: 50px;
	text-align: center;
	width: 100%;
	border: 1px solid #009900;
	margin-top: 15px;
}

#titleAndContents {
	margin-left: 5px;
	margin-top: 15px;
	padding: 20px;
	text-align: center;
	width: 100%;
	border: 1px solid #009900;
}

#putTitle {
	text-align: center;
	width: 1300px;
	height: 30px;
	font-size: 25px;
}

#contentCook {
	margin-left: 5px;
	margin-top: 15px;
	padding: 16px;
	text-align: center;
	width: 100%;
	border: 1px solid #009900;
}

#putContentCook {
	text-align: center;
	width: 1300px;
	height: 250px;
	font-size: 12px;
}

#categoryTable {
	margin-left: 5px;
	margin-top: 15px;
	padding: 20px;
	text-align: center;
	width: 100%;
	border: 1px solid #009900;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<body>
	<p id="row">
		<button class="login">로그인</button>
	<form id="logoutFrm" action="logout" method="post">
		<a href="javascript:logout()">로그아웃</a>
	</form>
	회원가입/마이페이지 고객센터
	</p>
	<h1>로고</h1>



	<table id="top">
		<tr id="mainmenu">
			<td>DIY</td>
			<td>시그니쳐</td>
			<td>Best</td>
			<td>나만의 레시피</td>
		</tr>
	</table>

	<table id="WriteTitle">
		<tr>
			<th>게시판 글쓰기</th>
		</tr>
	</table>
	<table id="titleAndContents">
		<tr>
			<th width="130px" ,height="150px">레시피 제목</th>
			<th><textarea id="putTitle" style="resize: none;"></textarea></th>
	</table>
	<table id="contentCook">
		<tr>
			<th width="130px" ,height="150px">요리소개</th>
			<th><textarea id="putContentCook" rows="10" cols="5"
					style="resize: none;"></textarea>
	</table>
	<table id="categoryTable">
		<tr>
			<th width="130px" ,height="150px">카테고리</th>
			<th>육류: <select name="selectBox" id="selectBox"
				style="width: 80px;" class="select_00">
					<c:forEach var="Category" items="${mcList}">
						<option value="${Category.cs_name}">${Category.cs_name}</option>
					</c:forEach>
			</select></th>
			<!--var를 var='Category'라고 선언했을때  대소문자는 같아야한다$('***'.'sql컬럼명(cs_name))'-->

			<th>생선류:<select name="selectBox" id="selectBox"
				style="width: 80px;" class="select_01">
					<c:forEach var="Category1" items="${mcList1}">
						<option value="${Category1.cs_name}">${Category1.cs_name}</option>
					</c:forEach>
			</select></th>

			<th>채소류<select name="selectBox" id="selectBox"
				style="width: 80px;" class="select_02">
					<c:forEach var="Category2" items="${mcList2}">
						<option value="${Category2.cs_name}">${Category2.cs_name}</option>
					</c:forEach>
			</select></th>
		</tr>
	</table>















	<div id="footer" align="center">
		<br>업체명: Salad82 | 사업자번호:123-45-6789<br> 주소: 인천 남구 학익동 663-1
		태승빌딩 | 전화번호:032-123-4567<br> Copyrights(c) ㈜Salad82 2015 all
		rights reserved.
	</div>
</body>

<script>
	function logout() {
		$('#logoutFrm').submit(); //서버로 전송
	}
</script>
</html>