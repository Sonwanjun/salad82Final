<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyRecipeHome</title>
</head>
<style type="text/css">
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

ul {
	list-style-type: none;
}

li {
	display: inline;
	float: left;
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

#myRecipeTitle {
	margin-top: 20px;
	margin-left: 12.5px;
	margin-bottom: 20px;
	width: 100%;
	height: 80px;
	text-align: center;
	border: black solid 5px;
}

#category {
	text-align: center;
	border: black double 3px;
	margin-top: 20px;
	margin-left: 20px;
	margin-bottom: 20px;
	padding-top: 15px;
	padding-bottom: 15px;
	float: center;
}

#suggestRecipeTitle {
	margin-top: 20px;
	margin-left: 12.5px;
	margin-bottom: 20px;
	width: 100%;
	height: 80px;
	text-align: center;
	border: black solid 5px;
}

.suggestRecipeWraper {
	text-align: center;
}

.suggestRecipe {
	text-align: center;
	display: inline-block;
	margin: 30px 80px;
}

.searchRecipe {
	text-align: center;
}

#boardlistsTitle {
	margin-top: 20px;
	margin-left: 12.5px;
	margin-bottom: 20px;
	width: 100%;
	height: 80px;
	text-align: center;
	border: black solid 5px;
}

#boardlist {
	text-align: center;
	border: black double 3px;
	margin-top: 20px;
	margin-left: 20px;
	margin-bottom: 20px;
	padding-top: 15px;
	padding-bottom: 15px;
	float: center;
}
#boardListCount{
text-align:center;}

div {
	overflow-x: auto;
}

table {
	width: 100%;
	min-width: 500px;
}

td {
	padding: 20px;
	border: 1px solid #444444;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
	
</script>
<body>
	<p>로그인/로그아웃 회원가입/마이페이지 고객센터</p>
	<h1>로고</h1>
	<div id="header">DIY SIG BEST Recipe</div>
	<div id="myRecipeTitle">
		<h2>나만의 레시피</h2>
	</div>
	<div id="category">
		<tr>
			<td style="padding: 20px">종류별: <input type="button" name="비건"
				value="비건"> <input type="button" name="샐러드" value="샐러드">
				<input type="button" name="다이어트" value="다이어트"> <input
				type="button" name="나물류" value="나물류"> <input type="button"
				name="미정" value="미정">
			</td>
			<br>
			<br>
			<td style="padding: 20px">방법별: <input type="button" name="데침"
				value="데침"> <input type="button" name="무침" value="무침">
				<input type="button" name="비빔" value="비빔"> <input
				type="button" name="삶기" value="삶기"> <input type="button"
				name="볶음" value="볶음">
			</td>
			<br>
			<br>
			<td style="padding: 20px">재료별: <input type="button" name="채소류"
				value="채소"> <input type="button" name="과일류" value="과일">
				<input type="button" name="버섯" value="버섯"> <input
				type="button" name="견과류" value="견과류"> <input type="button"
				name="잡곡" value="잡곡류">
			</td>
			<br>
		</tr>
	</div>
	<div id=suggestRecipeTitle>
		<h2>강력 추천 나의레시피</h2>
	</div>
	<div class=suggestRecipeWraper>
		<div class="suggestRecipe">
			<img src="resources/salad.jpg">
		</div>
		<div class="suggestRecipe">
			<img src="resources/salad.jpg">
		</div>
		<div class="suggestRecipe">
			<img src="resources/salad.jpg">
		</div>
	</div>


	<div id="search" Style="text-align: center">
		<form id="searchFrm" action="searchList" method="get">
			<input type="hidden" name="searchNum" value="${bList}" /> 
			<input type="text" name="searchWord" size="15" maxlength="30"
				style="width: 1000px" /> <input type="submit" value="검색" />
		</form>
	</div>

	<div id="boardlistsTitle">
		<h2>마이 레시피 리스트</h2>
	</div>
	<div id="boardlist">
		<table>
			<c:forEach var="board" items="${bList}">
				<tr>
					<td>${board.b_num}</td>
					<td width="500px">레시피 제목</td>
					<td colspan="1">${board.c_id}</td>
					<td>작성일:${board.b_date}</td>
					<td colspan="1">조회수:${board.b_views}</td>
				</tr>
				<tr>
					<td height="130px">재료</td>
					<td colspan="3">내용:${board.b_contents}</td>
					<td>이미지지지지</td>
				</tr>
			</c:forEach>
		</table>
		<div>${paging}
		</div>
	</div>
	<div id="myRecipeWriteHtml">
	<input type=button value="글쓰기" Onclick="window.location='myRecipeWrite'">
	<form name=myRecipeWrite method=post action="myRecipeWrite"></form>
	</div>
	<br>
	<br>

	<br>
	<br>

	<div id="footer" align="center">
		<br>업체명: Salad82 | 사업자번호:123-45-6789<br> 주소: 인천 남구 학익동 663-1
		태승빌딩 | 전화번호:032-123-4567<br> Copyrights(c) ㈜Salad82 2015 all <br>
	</div>
</body>
<script>
	
</script>
</html>
