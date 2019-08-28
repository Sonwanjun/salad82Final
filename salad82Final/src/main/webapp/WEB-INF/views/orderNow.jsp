
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
	<meta charset="UTF-8">
	<title>orderPage</title>
</head>
<style>
h1{
text-align:center;
}
#row
{
text-align:right;
}
#top{
    width: 100%;
    border-top: 1px solid #009900;
    border-bottom: 1px solid #009900;
    border-collapse: collapse;
    text-align:center;
    background:#009900;
}
th, td {
    border-top: 1px solid #009900;
    border-bottom: 1px solid #009900;
    padding:20px 210px 20px;

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

#contents{
	position:absolute;
	top:0; left:600; bottom:0; right:500;
	height:10%;
	margin:10% auto;
	font-size: 30px;
	line-height: 5;	
	align: center;
}

#table{
	display: table;
	border: 2px solid #009900; 
	padding: 60px;
}

.col1{
	padding:50 0 0 0;
	font-size: 20px;
	font-weight: bold;
	line-height: 2;
}
.col2{
	padding:50 0 0 0;
	font-size: 20px;
	font-weight: bold;
	line-height: 2;
}
.col3{
	padding:50 0 0 0;
	font-size: 20px;
	font-weight: bold;
	line-height: 2;
}
.col4{
	padding:50 0 0 0;
	font-size: 20px;
	font-weight: bold;
	line-height: 2;
}
</style>

<body>
<p id="row"><button class="login">로그인</button><button class="logout">로그아웃</button>    회원가입/마이페이지    고객센터</p>
<h1>
   로고
</h1>

<table id="top">
<tr>
<td>DIY</td>   
<td>시그니쳐</td>
<td>Best</td>
<td>나만의 레시피</td>
</tr>
</table>

<div id="contents" align="center">주문이 완료되었습니다.
<div id="table">
		<div class="row" align="left">
			<span class="cell col1">주문번호: 2019-08-2215486635547</span>
		</div>
		<div class="row" align="left">
			<span class="cell col2">수령인 : 차팀장</span>
		</div>
		<div class="row" align="left">
			<span class="cell col3">주문일시 : 2019-08-22 13:55:12</span>
		</div>
		<div class="row" align="left">
			<span class="cell col4">가격 : 55,555</span>
		</div>
		<div class="row" align="left">
			<span class="cell col3">배송상태 : 결재 완료</span>
		</div>
		
	</div>
	
	<div id="bottom">
	</div>
	<div>
		<button type="button" >확인</button>
	</div>
	</div>


	
<div id="footer" align="center"><br>업체명: Salad82 | 사업자번호:123-45-6789<br>
                        주소: 인천 남구 학익동 663-1 태승빌딩 | 전화번호:032-123-4567<br>
                        Copyrights(c) ㈜Salad82 2015 all rights reserved.</div>
</body>
</html>