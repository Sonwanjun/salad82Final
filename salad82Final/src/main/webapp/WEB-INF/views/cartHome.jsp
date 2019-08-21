
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>cartHome</title>
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
	top:0; left:300; bottom:0; right:300;
	height:10%;
	margin:10% auto;	
}

#product{
	display: table;
	width: 100%;
}   
.row{
	display: table-row;
}
.cell{
	display: table-cell;
	padding: 3px;
	border-bottom:1px solid #009900;
	border-top:1px solid #009900;
}
.col1{
	width: 20%;
}
.col2{
	width: 20%;
}
.col3{
	width: 20%;
}
.col4{
	width: 20%;
}
.col5{
	width: 20%;
}
#bottom{
	border-bottom:1px solid #009900;
	padding:10px;
}
.button{overflow:hidden;clear:both;width:100%}
.button.fl{float:left}
.button.fr{float:right}
</style>

<body>
<p id="row">로그인/로그아웃    회원가입/마이페이지    고객센터</p>
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

	<div id="contents" align="center">

	<h1>장바구니</h1>
	<p>주문하실 상품명 및 수량을 정확하게 확인해주세요</p>
	<div id="product">
		<div class="row">
		<span class="cell col1">선택</span>
		<span class="cell col2">상품 정보</span>
		<span class="cell col3">수 량</span>
		<span class="cell col4">상품 금액</span>
		<span class="cell col5">주문 금액</span>
		</div>
		
		<input type="checkbox"/>
	</div>
		<br>
		<p>	장바구니에 담긴 상품이 없습니다. </p>
		<br>
	<div id="bottom">
	</div>
	<div>
		<button type="button" >선택삭제</button>
		<button type="button" >주문하기</button>
	</div>
	</div>

	
<div id="footer" align="center"><br>업체명: Salad82 | 사업자번호:123-45-6789<br>
                        주소: 인천 남구 학익동 663-1 태승빌딩 | 전화번호:032-123-4567<br>
                        Copyrights(c) ㈜Salad82 2015 all rights reserved.</div>
</body>
</html>
