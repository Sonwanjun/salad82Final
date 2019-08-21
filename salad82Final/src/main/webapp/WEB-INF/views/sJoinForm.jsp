<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
a{
	text-decoration: none;
}
.subject{
	text-align:center;
	height:50px;
}
select{
	height:25px;
	width:110px;
}
input{
	width:150px;
}

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

#footer {
	width: 100%;
	height: 120px;
	position: absolute;
	bottom: 0;
	background: #009900;
	font-size: 16;
}
</style>

</head>
<body>
	<p>로그인/로그아웃 회원가입/마이페이지 고객센터</p>
	<h1>로고</h1>
	<div id="header">DIY SIG BEST Recipe</div>
	
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
    	<select name='topping'>
        	<option>토핑&무게</option>
            <option>파프리카(10g)</option>
            <option>파프리카(50g)</option>
            <option>양파(10g)</option>
            <option>양파(50g)</option>
        </select></td>                                                  
     <td class="price">가격선정<input type="text" name="s_price">
     <input type="button" value="추가등록" onclick="add()"></td>
	</tr>
	<tr>
		<td>내부사진 등록(필수)</td>
	 		<td><input type=file name=AttFile[] size=100  onChange="CkImageVal()" class=textidpass>
	 		<input type=button value='사진 추가' onclick="AddFile()">
     	</td>
     </tr>
     <tr>
		<td>업체추천메뉴 </td>
		<td><input type="text" name="s_best"></td>
	</tr>
	<tr>
		<td>기타 상세설명 </td>
		<td><textarea id="memo" rows="3" cols="50"></textarea></td>
	</tr>
	<tr>
		<td colspan="2" class="subject">
		<input type="submit" value="회원가입">
		<input type="button" value="취소" onclick="goLoginForm()">
		</td>
	</tr>
</table>
	<div id="footer" align="center">
		<br>업체명: Salad82 | 사업자번호:123-45-6789<br> 주소: 인천 남구 학익동 663-1
		태승빌딩 | 전화번호:032-123-4567<br> Copyrights(c) ㈜Salad82 2015 all
		rights reserved.
	</div>

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

function goLoginForm() {
    location.href="loginform.jsp";
}
function add(){ 

    var row = document.createElement("TR") 
    var td1 = document.createElement("TD") 
    td1.appendChild(document.createTextNode("topping")) 
    var td2 = document.createElement("TD") 
    td2.appendChild (document.createTextNode("price")) 
    row.appendChild(td1); 
    row.appendChild(td2); 
  } 

function AddFile(){
	var objTbl = document.all["tblAttFiles"];
	var objRow = objTbl.insertRow();
	var objCell = objRow.insertCell();
		objCell.innerHTML =
		  "<img src=http://www.blueb.co.kr/SRC/javascript/image/no_image.gif width=90 align=absbottom>\n" +
		  "<input type=file onChange='CkImageVal()' name=AttFile[] size=40>";
	document.recalc();
}

function CkImageVal() {
	var oInput = event.srcElement;
	var fname = oInput.value;
		if((/(.jpg|.jpeg|.gif|.png)$/i).test(fname))
		  oInput.parentElement.children[0].src = fname;
	else
	  alert('이미지는 gif, jpg, png 파일만 가능합니다.');
}
</script>
</html>