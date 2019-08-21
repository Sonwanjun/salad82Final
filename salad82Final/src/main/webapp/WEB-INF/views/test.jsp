<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
    new daum.Postcode({
        oncomplete : function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
        }
    }).open();
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
                <form name="signupForm" id="signupForm" method="post">
                    <div class="input">
                        <input type="text" class="box" placeholder="아이디" name="id"
                            required>
                    </div>
                    <div class="input">
                        <input type="password" class="box" placeholder="비밀번호"
                            name="password" required
                            pattern="(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,12}">
                    </div>
                    <div class="input">
                        <input type="password" class="box" placeholder="비밀번호 확인"
                            name="passwordConfirm" required>
                    </div>
                    <div class="input">
                        <input type="text" class="box" placeholder="업체명" name="name"
                            required>
                    </div>
                    <div class="input">
                        <input type="text" class="box" placeholder="사업자번호(-없이 입력해주세요.)" name="sNumber"
                            required>
                    </div>
                    <div class="input">
                        <input type="email" class="box" placeholder="이메일" name="email"
                            required>
                    </div>
                    <div class="input">
                        <input type="text" class="box" placeholder="대표번호(-없이 입력해주세요.)" name="number"
                            required>
                    </div>
                    <div class="input">
                        <input type="button" class="btn-primary box"
                            onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
                    </div>
                    <div class="input">
                        <input type="text" name="post" class="box" id="sample4_postcode"
                            placeholder="우편번호" required>
                    </div>
 
                    <div class="input">
                        <input type="text" name="roadAddress" class="box"
                            id="sample4_roadAddress" placeholder="도로명주소" required>
                    </div>
                    <div class="input">
                        <input type="text" name="jibunAddress" class="box"
                            id="sample4_jibunAddress" placeholder="지번주소" required>
                    </div>
                    <div class="input">
                        <select name="topping">
                        	<option>토핑&무게</option>
            				<option>파프리카(10g)</option>
           					<option>파프리카(50g)</option>
            				<option>양파(10g)</option>
            				<option>양파(50g)</option>
        				</select>
        				<input type="text" class="box" placeholder="가격선정 ex)5,000원" name="price"
                            required>
                        <input type="button" value="추가등록" onclick="add()">
                    </div>
                    
 
                    <a href="#"><div class="login_btn">
                            <input type="submit" class="login_btn" value="회원가입">
                        </div></a>
                    <div class="option">
                        <a href="index.jsp"><div class="back">취소</div></a>
                    </div>
            </div>
        </div>
 
    </div>

<div id="footer" align="center"><br>업체명: Salad82 | 사업자번호:123-45-6789<br>
                        주소: 인천 남구 학익동 663-1 태승빌딩 | 전화번호:032-123-4567<br>
                        Copyrights(c) ㈜Salad82 2015 all rights reserved.</div>

</body>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script>
        function sample4_execDaumPostcode() {
            new daum.Postcode(
                    {
                        oncomplete : function(data) {
                            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                            alert(fullRoadAddr);
                            var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                            if (data.bname !== ''
                                    && /[동|로|가]$/g.test(data.bname)) {
                                extraRoadAddr += data.bname;
                            }
                            // 건물명이 있고, 공동주택일 경우 추가한다.
                            if (data.buildingName !== ''
                                    && data.apartment === 'Y') {
                                extraRoadAddr += (extraRoadAddr !== '' ? ', '
                                        + data.buildingName : data.buildingName);
                            }
                            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                            if (extraRoadAddr !== '') {
                                extraRoadAddr = ' (' + extraRoadAddr + ')';
                            }
                            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                            if (fullRoadAddr !== '') {
                                fullRoadAddr += extraRoadAddr;
                            }
 
                            // 우편번호와 주소 정보를 해당 필드에 넣는다.
                            document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                            document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                            document.getElementById('sample4_jibunAddress').value = data.jibunAddress;
 
                            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                            if (data.autoRoadAddress) {
                                //예상되는 도로명 주소에 조합형 주소를 추가한다.
                                var expRoadAddr = data.autoRoadAddress
                                        + extraRoadAddr;
                                document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
                                        + expRoadAddr + ')';
 
                            } else if (data.autoJibunAddress) {
                                var expJibunAddr = data.autoJibunAddress;
                                document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
                                        + expJibunAddr + ')';
 
                            } else {
                                document.getElementById('guide').innerHTML = '';
                            }
                        }
                    }).open();
        }
    </script>

</html>