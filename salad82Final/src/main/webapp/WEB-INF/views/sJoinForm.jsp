<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link
    href="http://netdna.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css"
    rel="stylesheet">
<link rel="stylesheet" href="assets/css/login.css" />

<style>
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
h2{
	text-align:center;
}
</style>
</head>
<body>

<p>로그인/로그아웃    회원가입/마이페이지    고객센터</p>
<h1>
   로고
</h1>
<div id="header">DIY SIG BEST Recipe</div>

<h2>판매자 회원가입</h2>
<div class='container' align="center">
        <div class="wrapper">
            <div class="image"></div>
            <div class="join">
                <form name="signupForm" id="signupForm" method="post" action="sellerInsert">
                    <div class="input">
                        <input type="text" class="box" placeholder="아이디" name="s_id"
                            required>
                    </div>
                    <div class="input">
                        <input type="password" class="box" placeholder="비밀번호"
                            name="s_pwd" required>
                    </div>
                    <div class="input">
                        <input type="password" class="box" placeholder="비밀번호 확인"
                            name="passwordConfirm" required>
                    </div>
                    <div class="input">
                        <input type="text" class="box" placeholder="업체명" name="s_name"
                            required>
                    </div>
                    <div class="input">
                        <input type="text" class="box" placeholder="사업자번호(-없이 입력해주세요.)" name="s_num"
                            required>
                    </div>
                    <div class="input">
                        <input type="email" class="box" placeholder="이메일" name="s_email"
                            required>
                    </div>
                    <div class="input">
                        <input type="text" class="box" placeholder="대표번호(-없이 입력해주세요.)" name="s_phone"
                            required>
                    </div>
                    <div class="input">
                        <input type="text" class="box" placeholder="주소(인천 미추홀구 250번길 아이유1차 102동 1201호)" name="s_address" style="width:400px"
                            required>
                    </div>
                   <div class="input">
                 		(내부사진등록해주세요.)
                            <input type="file" name="files" id="files" multiple="multiple" onchange="fileChk(this)"/>
							<input type="hidden" value="0" id="fileCheck" name="fileCheck"/>
                    </div>
                   
                   <div class="login_btn">
                            <input type="submit" class="login_btn" value="회원가입">
                        </div>
                    <div class="option">
                        <input type="submit" class="cc" value="취소">
                    </div> 
                    </form>
            </div>
        </div>
 
    </div>

<div id="footer" align="center"><br>업체명: Salad82 | 사업자번호:123-45-6789<br>
                        주소: 인천 남구 학익동 663-1 태승빌딩 | 전화번호:032-123-4567<br>
                        Copyrights(c) ㈜Salad82 2015 all rights reserved.</div>

</body>
<script>

</script>
</html>