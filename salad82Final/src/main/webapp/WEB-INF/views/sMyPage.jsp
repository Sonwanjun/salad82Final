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
<aside class="sidebar">
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
</aside>

<!-- DB불러올 정보 -->
<table align="center">
	<tr>
		<td colspan="2" class="subject">판매자 회원가입</td>
	</tr>
	<tr>
		<td>아이디 </td>
		<td><input type="text" id="id" name="s_id"></td>
	</tr>
	<form name="form" action="#" onsubmit="return validForm(this)">
	<tr>
		<td>비밀번호 </td>
		<td><input type="text" name="s_pwd"></td>
	</tr>
	<tr>
		<td>비밀번호 재확인 </td>
		<td><input type="text" name="s_pwdchek">&nbsp&nbsp<input type="submit" value="중복체크"></td>
	</tr>
	</form> 
	<tr>
		<td>업체명 </td>
		<td><input type="text" name="s_name"></td>
	</tr>
	<tr>
		<td>사업자번호 </td>
		<td><input type="text" name="s_number"></td>
	</tr>
	<tr>
		<td>이메일 </td>
		<td><input type="text" name="s_email">@ 
			<select email="" email="">
                <option value="naver.com">naver.com</option>
                <option value="gmail.com">gmail.com</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>대표번호 </td>
		<td><input type="text" name="s_phone"></td>
	</tr>
	<tr>
		<td>사업자주소 </td>
		<td><input type="text" name="s_address"></td>
	</tr>
	<tr>
	<td class="topping">토핑&무게
    	<select name='topping' style="height:22px">
        	<option>토핑&무게</option>
            <option>파프리카(10g)</option>
            <option>파프리카(50g)</option>
            <option>양파(10g)</option>
            <option>양파(50g)</option>
        </select></td>                                                  
     <td class="price">가격선정<input type="text" name="s_price" placeholder="ex)5,000원" style="width:100px">
     <input type="button" value="추가등록" onclick="add()"></td>
	</tr>
	<tr>
		<td>내부사진 등록(필수)</td>
	 		<td><input type=file name=AttFile[] size=100  onChange="CkImageVal()" class=textidpass>
	 		<input type=button value='사진 추가' onclick="AddFile()">
     	</td>
     </tr>
     <tr>
		<td colspan="2" class="subject">
		<input type="submit" value="회원탈퇴">
		<input type="button" value="수정완료" onclick="goHomeForm()">
		</td>
	</tr>
</table>

<!-- 하단메뉴바 -->
<div id="footer" align="center"><br>업체명: Salad82 | 사업자번호:123-45-6789<br>
                        주소: 인천 남구 학익동 663-1 태승빌딩 | 전화번호:032-123-4567<br>
                        Copyrights(c) ㈜Salad82 2015 all rights reserved.</div>

</body>
<script>
function validForm(passForm) { 
	  if (passForm.s_pwd.value == "") { 
	    alert("패스워드를 입력하세요.");
	    passForm.s_pwd.focus();
	    return false;
	  } 
	  if (passForm.s_pwd.value != passForm.s_pwdchek.value) { 
	    alert("패스워드가 맞지 않습니다. 확인 후 다시입력하세요");
	    passForm.s_pwd.focus();
	    passForm.s_pwd.select();
	    return false;
	  } 
	  return true;
	}
	
function goHomeForm() {
    location.href="loginform.jsp";
}	
	
</script>

</html>