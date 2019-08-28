<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="resources/js/jquery.serializeObject.js"></script>

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

<table>
	<tr bgcolor="gray" height="30">
		<th width="100">번호</th>
		<th width="100">제목</th>
		<th width="100">내용</th>
		<th width="100">작성일</th>
	</tr>
	<c:forEach var="notice" items="${nList}">
		<tr height="25">
			<td align="center">${notice.n_num }</td>
			<!-- href="#" 페이지 맨 위로 이동뒤 이벤트 발생
				 href="#;" 페이지 현재 위치에서 이벤트 발생 -->
			<td align="center"><a href="#" onclick="articleView(${notice.n_num })">
			${notice.n_title }</a></td>
			<td align="center">${notice.n_contents }</td>
			<td align="center">${notice.n_date }</td>
		</tr>		
	</c:forEach>
</table>

<form action="writeFrm">
	<button>글쓰기</button>
</form>
<form action="deleteFrm">
	<button>삭제</button>
</form>

<div align="center">${paging}</div>

<div id="articleView_layer">
	<div id="bg_layer"></div>
	<div id="contents_layer"></div>
</div>


<div id="footer" align="center"><br>업체명: Salad82 | 사업자번호:123-45-6789<br>
                        주소: 인천 남구 학익동 663-1 태승빌딩 | 전화번호:032-123-4567<br>
                        Copyrights(c) ㈜Salad82 2015 all rights reserved.</div>

</body>
<script>
function articleView(num){
	$('#articleView_layer').addClass('open');
	$.ajax({
		type:'get',
		url:'contents',
		data:{n_num:num},
		dataType:'html',
		success:function(data){
			//alert(data);
			$('#contents_layer').html(data);
		},
		error:function(error){
			alert('error');
			console.log(error);
		}
	}); //ajax End
}//function End
//LightBox 해제
var $layerWindow=$('#articleView_layer');
$layerWindow.find('#bg_layer').on('mousedown',function(event){
	console.log(event);
	$layerWindow.removeClass('open');
	return;
});//on End
$(document).keydown(function(event){
	console.log(event);
	if(event.keyCode!=27) return;
	if($layerWindow.hasClass('open')){
		$layerWindow.removeClass('open');
	}
});//keydown End

</script>

</html>