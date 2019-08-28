
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
	top:10; left:500; bottom:0; right:500;
	height:10%;
	margin:10% auto;
	padding: 60px;	
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
}

#product{
	width: 100%;
}
.gdsInfo{
	
	font-size:20;
}
.cell{
	display: table-cell;
	padding: 0px;

}
.col1{
	width: 20%;
	font-weight: bold;
}
.col2{
	width: 20%;
}

#price{
	position:absolute;
	top:230; left:500; bottom:0; right:500;
	height:6%;
	margin:10% auto;
	padding:0;	
	background-color: #eee;
	
}

#info{
	position:absolute;
	top:400; left:400; bottom:0; right:590;
	height:40%;
	margin:5%;
	
	
}

#price{
	position:absolute;
	top:230; left:500; bottom:0; right:500;
	height:6%;
	margin:10% auto;
	padding:0;	
	background-color: #eee;
	
}

.col4{
	line-height: 1.9;	
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

	<div id="contents" align="center">

	<div id="product">
		
	<img align="left" src="C:\Users\Public\Pictures\Sample Pictures\koala.jpg" />
	
	<div class="gdsInfo">
	<p >
		<span class="cell col1">상품명</span>
		<span class="cell col1">개당 가격</span>
		<span class="cell col1">구입 수량</span>
		<span class="cell col1">최종 가격</span>
	</p>
	<div class="details">
	<p>
		<span class="cell col2">오리지널</span>
		<span class="cell col2">5,500</span>
		<span class="cell col2">1 개</span>
		<span class="cell col2">5,500</span>
	</p>
	</div>
	</div>
	</div>
	</div>
	
		
			<div id="price">
			<p font-weight="bold">총 합계: 5,500원</p>
			</div>
			<div id="info">
			<div>
			<span class="col4">수령인&emsp;&ensp; <input type="text" name="수령인" ></span>
			</div>
			<div>
			<span class="col4">연락처&emsp;&ensp; <input type="text" name="연락처" ></span>
			</div>
			<div>
			<span class="col4">우편번호&nbsp; <input type="text" name="우편번호" ></span>
			</div>
			<div>
			<span class="col4">주소&emsp;&emsp;&nbsp; <input type="text" name="주소" ></span>
			</div>
			<div>
			<span class="col4">요청사항&nbsp; <input type="text" name="요청사항" ></span>	
			</div>
			
			<div id="bottom">
			<div>
				<button type="button" >주문</button>
				<button type="button" >취소</button>
			</div>
			</div>
		</div>
	
	
	
	
<div id="footer" align="center"><br>업체명: Salad82 | 사업자번호:123-45-6789<br>
                        주소: 인천 남구 학익동 663-1 태승빌딩 | 전화번호:032-123-4567<br>
                        Copyrights(c) ㈜Salad82 2015 all rights reserved.</div>
</body>
</html>