<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyRecipeHome</title>
</head>
<style>
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

.footer {
	width: 100%;
	height: 120px;
	position: absolute;
	bottom: 0;
	background:#009900;
	font-size: 16;
	
}
#footer{
background:#009900;
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

#suggestRecipe {
	text-align: center;
	border: black double 3px;
	margin-top: 20px;
	margin-left: 20px;
	margin-bottom: 20px;
	padding-top: 15px;
	padding-bottom: 15px;
	float: center;
}
#searchRecipe {
	text-align: center;
	width:1350px;
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
</style>
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
	<div id=suggestRecipe>
		<ul>
			<td><img src="resources/salad.jpg" width="150px",height="120px", vspace="30px", hspace="110px"></td>
			<td>이거슨베스트</td>
			<td><img src="resources/salad.jpg" width="150px",height="120px", vspace="30px", hspace="110px"></td>
			<td>이거슨베스트</td>
			<td><img src="resources/salad.jpg" width="150px",height="120px", vspace="30px", hspace="110px"></td>
			<td>이거슨베스트</td>
		</ul>
	</div>
	<div id="searchRecipe">
	<input type="text" placeholder="검색어 입력" ><button>검색</button></div>
	<br>
	
	<div id="boardlistsTitle"><h2>마이 레시피 리스트</h2> </div>
	<div id="board"><h1>쫘라라라라라라라ㅏㄹ리리리리릴ㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹ리 이거슨 나중에!~</h1></div>


	<div id="footer" align="center">
		<br>업체명: Salad82 | 사업자번호:123-45-6789<br> 주소: 인천 남구 학익동 663-1
		태승빌딩 | 전화번호:032-123-4567<br> Copyrights(c) ㈜Salad82 2015 all
		  <br>
	</div>
</body>

</html>
