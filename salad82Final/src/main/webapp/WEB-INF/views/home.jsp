
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
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



	
<div id="footer" align="center"><br>업체명: Salad82 | 사업자번호:123-45-6789<br>
                        주소: 인천 남구 학익동 663-1 태승빌딩 | 전화번호:032-123-4567<br>
                        Copyrights(c) ㈜Salad82 2015 all rights reserved.</div>
</body>
</html>