<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
@import url('http://fonts.googleapis.com/css?family=Open+Sans:300,400,700');
@import url('http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css');
body {
  font-family: 'Open Sans', sans-serif;
  padding: 0;
  margin: 0;
  text-rendering: optimizeLegibility;
  -webkit-font-smoothing: antialiased;
}
.sidebar-toggle {
  margin-left: -240px;
}
.sidebar {
  width: 240px;
  height: 650px;
  background: #293949;
  position: absolute;
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  -ms-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
  z-index: 100;
}
.sidebar #leftside-navigation ul,
.sidebar #leftside-navigation ul ul {
  margin: -2px 0 0;
  padding: 0;
}
.sidebar #leftside-navigation ul li {
  list-style-type: none;
  border-bottom: 1px solid rgba(255, 255, 255, 0.05);
}
.sidebar #leftside-navigation ul li.active > a {
  color: #1abc9c;
}
.sidebar #leftside-navigation ul li.active ul {
  display: block;
}
.sidebar #leftside-navigation ul li a {
  color: #aeb2b7;
  text-decoration: none;
  display: block;
  padding: 18px 0 18px 25px;
  font-size: 12px;
  outline: 0;
  -webkit-transition: all 200ms ease-in;
  -moz-transition: all 200ms ease-in;
  -o-transition: all 200ms ease-in;
  -ms-transition: all 200ms ease-in;
  transition: all 200ms ease-in;
}
.sidebar #leftside-navigation ul li a:hover {
  color: #1abc9c;
}
.sidebar #leftside-navigation ul li a span {
  display: inline-block;
}
.sidebar #leftside-navigation ul li a i {
  width: 20px;
}
.sidebar #leftside-navigation ul li a i .fa-angle-left,
.sidebar #leftside-navigation ul li a i .fa-angle-right {
  padding-top: 3px;
}
.sidebar #leftside-navigation ul ul {
  display: none;
}
.sidebar #leftside-navigation ul ul li {
  background: #23313f;
  margin-bottom: 0;
  margin-left: 0;
  margin-right: 0;
  border-bottom: none;
}
.sidebar #leftside-navigation ul ul li a {
  font-size: 12px;
  padding-top: 13px;
  padding-bottom: 13px;
  color: #aeb2b7;
}
.subject{
	text-align:center;
	height:50px;
}
h1{
text-align:center;
}
p
{
text-align:right;
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


</style>
</head>
<body>
<!-- 상단메뉴바 -->
<p>로그인/로그아웃    회원가입/마이페이지    고객센터</p>
<h1>
   로고
</h1>
<div id="header">DIY SIG BEST Recipe</div>

<!-- 사이드메뉴바 -->
<!-- <aside class="sidebar">
  <div id="leftside-navigation" class="nano">
    <ul class="nano-content">
      <li>
        <a href="./"><i class="fa fa-dashboard"></i><span>Salad82</span></a>
      </li>
      <li class="sub-menu">
        <a href="./sMyPage"><i class="fa fa-cogs"></i><span>프로필수정</span><i class="arrow fa fa-angle-right pull-right"></i></a>

      </li>
      <li class="sub-menu">
        <a href="./ingredient"><i class="fa fa-table"></i><span>재료관리</span><i class="arrow fa fa-angle-right pull-right"></i></a>

      </li>
      <li class="sub-menu">
        <a href="./myproductList"><i class="fa fa fa-tasks"></i><span>상품관리</span><i class="arrow fa fa-angle-right pull-right"></i></a>

      </li>
      <li class="sub-menu">
        <a href="./productStatus"><i class="fa fa-envelope"></i><span>상품주문현황</span><i class="arrow fa fa-angle-right pull-right"></i></a>
      </li>
      <li class="sub-menu">
        <a href="./productSale"><i class="fa fa-bar-chart-o"></i><span>판매실적</span><i class="arrow fa fa-angle-right pull-right"></i></a>
      </li>
      <li class="sub-menu">
        <a href="./requestHome"><i class="fa fa-map-marker"></i><span>재료요청</span><i class="arrow fa fa-angle-right pull-right"></i></a>
      </li>
    </ul>
  </div>
</aside> -->

<!-- DB불러올 정보 -->
<table id="one_table" style="text-align:center">
	
	
	<tr height="30">
		<td width="80" bgcolor="orange" align="center">아이디</td>
		<td width="80" align="center">${sm.s_id}</td>
	</tr>
	<tr height="30">
		<td width="80" bgcolor="orange" align="center">업체명</td>
		<td width="80" align="center">${sm.s_name}</td>
	</tr>
	<tr height="30">
		<td width="80" bgcolor="orange" align="center">사업자주소</td>
		<td width="80" align="center">${sm.s_num}</td>
		
	</tr>
	<tr height="30">
		<td width="80" bgcolor="orange" align="center">번호</td>
		<td width="80" align="center">${sm.s_phone}</td>
	</tr>
</table>
<br>
<table>
	<tr bgcolor="gray" height="30" style="text-align:center">
		<th width="100">업체명</th>
		<th width="100">사업자번호</th>
		<th width="100">주소</th>
		<th width="100">번호</th>
	</tr>
	<c:forEach var="seller" items="${sList}">  <!-- 리스트로 반복문돌려서 가져오기 -->
		<tr height="25">
			<td align="center">${seller.s_name }</td>
			<td align="center">${seller.s_num }</td>
			<td align="center">${seller.s_address }</td>
			<td align="center">${seller.s_phone }</td>
		</tr>		
	</c:forEach>
</table>


<!-- 하단메뉴바 -->
<div id="footer" align="center"><br>업체명: Salad82 | 사업자번호:123-45-6789<br>
                        주소: 인천 남구 학익동 663-1 태승빌딩 | 전화번호:032-123-4567<br>
                        Copyrights(c) ㈜Salad82 2015 all rights reserved.</div>

</body>
<script>

	
</script>

</html>