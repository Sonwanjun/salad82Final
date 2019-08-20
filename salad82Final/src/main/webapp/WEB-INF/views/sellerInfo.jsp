<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국</title>
<style>
#scTab {
	width: 600px;
	margin: 30px auto;
	background-color: orange;
}

#scTab td {
	width: 250px;
	height: 70px;
	margin: 0 25px;
	font-size: 24px;
	font-weight: bold;
	text-align: center;
	background-color: magenta;
}

#scTab td[onclick] {
	cursor: pointer;
}

#scTab td[onclick]:hover {
	background-color: #f58cec;
}

.infoTable {
	width: 850px;
	margin: 0 auto;
	border-collapse: collapse;
	background-color: #a1d66f;
	text-align: center;
}

.infoTable td {
	width: 250px;
	background-color: yellow;
	border-bottom: 2px solid lightgreen;
}

.infoTable th{
	width : 250px;
}

.infoTable .narrow {
	width: 100px;
}
</style>
</head>
<body>
	<table id="scTab">
		<tr>
			<td>판매자</td>
			<td onclick="consumerInfo()">구매자</td>
		</tr>
	</table>

	<table class="infoTable">
		<tr height="30px">
			<th class="narrow">순서</th>
			<th>사업자아이디</th>
			<th>사업자명</th>
			<th>상세보기</th>
		</tr>
	</table>
	<table class="infoTable">
		<c:forEach var="seller" items="${sList }">
			<tr height="30px">
				<td class="narrow" style="background-color: skyblue">${seller.ronum }</td>
				<td>${seller.s_id }</td>
				<td>${seller.s_name }</td>
				<td><a href="#" onclick="showDetail(${seller.s_id })">상세정보</a></td>
				<!-- showDetail 만들기 -->
			</tr>
		</c:forEach>
	</table>
</body>
<script>
	function consumerInfo(pNum){
		$.ajax({
			type : 'get',
			url : 'consumerInfo',
			data : {pNum : pNum},
			dataType : 'html',
			success : function(data){
				$('#ajaxArea').html(data);
			},
			error : function(error){
				console.log(error);
				alert('에러다 에러');
			}
		});
	}
</script>
</html>