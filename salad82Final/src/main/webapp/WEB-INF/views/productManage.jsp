<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재료 조회 및 판매승인</title>
<style>
#pmTitle {
	text-align: center;
	font-size: 32px;
	font-weight: bold;
}

#prodList {
	width: 1050px;
	margin: 40px auto;
	border: 3px solid yellow;
	border-collapse: collapse;
}

#prodList td, th {
	border: 1px solid red;
	padding-left: 10px;
}

#prodList th {
	background-color: lightgray;
	height: 35px;
}
#prodList td {
	height : 25px;
	text-align : center;
}

#prodList td:nth-child(1) {
	width: 100px;
}

#prodList td:nth-child(2) {
	width: 250px;
}

#prodList td:nth-child(3) {
	width: 150px;
}

#prodList td:nth-child(4) {
	width: 100px;
}

#prodList td:nth-child(5) {
	width: 250px;
}

#prodList td:nth-child(6) {
	width: 100px;
}

#prodList td:nth-child(7) {
	width: 100px;
}

#prodList input {
	border-radius : 10px;
}
/*.menubar li ul {
background: rgb(109,109,109);
display:none; 
height:auto;
padding:0px;
margin:0px;
border:0px;
position:absolute;
width:200px;
z-index:200;
}
.menubar li:hover ul {
display:block;
}*/
</style>
</head>
<body>

	<p id="pmTitle">전체 품목 조회 및 승인관리</p>

	<table id="prodList">
		<tr>
			<th>타입</th>
			<th>품목명</th>
			<th>판매자명</th>
			<th>단가</th>
			<th>등록일</th>
			<th>판매량</th>
			<th>승인여부</th>
		</tr>
		<c:forEach var="list" items="${allProduct }">
			<tr>
				<td>${list.p_type }</td>
				<td>${list.p_name }</td>
				<td>${list.s_name }</td>
				<td>${list.p_price }</td>
				<td>${list.p_date }</td>
				<td>${list.p_selled }</td>
				<c:choose>
					<c:when test="${list.p_permission == '승인완료'}">
						<td><input type="button" value="${list.p_permission }" disabled></td>
					</c:when>
					<c:when test="${list.p_permission == '미승인'}">
						<td>
						<input type="button" value="${list.p_permission }" onclick="allow(${list.p_code})" title="${list.p_code }">
						</td>
					</c:when>
				</c:choose>
			</tr>
		</c:forEach>
	</table>
	
	<!-- 
	<fieldset>
		<legend>이용이용</legend>
		<input type="text" placeholder="빠아앙" list="creepy">
		<datalist id="creepy">
			<option value="첫번째">콰아앙</option>
			<option value="두번째">끄어어어</option>
			<option value="세번째">hotdog</option>
		</datalist>
	</fieldset>
	<div class="menubar">
		<ul>
			<li><a href="#">Home</a></li>
			<li><a href="#" id="current">Products</a>
				<ul>
					<li><a href="#">Sliders</a></li>
					<li><a href="#">Galleries</a></li>
					<li><a href="#">Apps</a></li>
					<li><a href="#">Extensions</a></li>
				</ul></li>
			<li><a href="#">Company</a></li>
			<li><a href="#">Address</a></li>
		</ul>
	</div>
	-->


	<div align="center">${paging }</div>

</body>
<script>
	var clicked;
	$('#prodList').on('click',':button',function(event){
		clicked = $(event.target);
	});
	function allow(p_code){
		alert('판매 허가할 제품의 코드 '+p_code);
		$.ajax({
			type : 'get',
			url : 'allow',
			data : {'p_code':p_code},
			dataType : 'html',
			success : function(data){
				alert('판매가 승인되었습니다');
				clicked.attr('disabled', 'disabled').attr('value', '승인완료');
				clicked.html(clicked);
			},
			error : function(error){
				alert('실패다');
			}
		});
	}
</script>
</html>