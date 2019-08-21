<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
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
<p>로그인/로그아웃    회원가입/마이페이지    고객센터</p>
<h1>
   로고
</h1>
<div id="header">DIY SIG BEST Recipe</div>

<form name = "cJoinForm" action = "customerInsert"  method="post" onsubmit="return check()">
<table align="center">
	<tr>
		<td colspan="2" class="subject">일반 회원가입</td>
	</tr>
	<tr>
		<td>아이디 </td>
		<td><input type="text" id="id" name="c_id"></td>
	</tr>
	<tr>
		<td>비밀번호 </td>
		<td><input type="password" name="c_pwd"></td>
	</tr>
	<tr>
		<td>이름 </td>
		<td><input type="text" name="c_name"></td>
	</tr>
	<tr>
		<td>주소(배송지) </td>
		<td><input type="text" name="c_address"></td>
	</tr>
	<tr>
		<td>전화번호 </td>
		<td><input type="text" name="c_phone"></td>
	</tr>
	<tr>
		<td>이메일 </td>
		<td><input type="text" name="c_email">
		</td>
	</tr>
	<tr>
		<td colspan="5" class="subject">
		<input type="submit" value="회원가입">
		<input type="button" value="취소" onclick="goLoginForm()">
		</td>
	</tr>
</table>
</form>
<div id="footer" align="center"><br>업체명: Salad82 | 사업자번호:123-45-6789<br>
                        주소: 인천 남구 학익동 663-1 태승빌딩 | 전화번호:032-123-4567<br>
                        Copyrights(c) ㈜Salad82 2015 all rights reserved.</div>

</body>
<script>
/* function validForm(passForm) { 
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
	
function Check(chk){
	if(document.myform.Check_All.value=="전체선택"){
	for (i = 0; i < chk.length; i++)
		chk[i].checked = true ;
		document.myform.Check_All.value="전체선택해제";
	}else{
		for (i = 0; i < chk.length; i++)
		chk[i].checked = false ;
		document.myform.Check_All.value="전체선택";
	}
}
*/

function goLoginForm() {
    location.href="loginform.jsp";
} 
</script>
</html>