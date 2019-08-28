<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자상세-판매기록</title>
<style>
	#sInfoDetail{
		width : 1050px;
		height : 120px;
		margin : 0 auto;
		border : 3px solid yellow;
		border-collapse: collapse;
	}
	#sInfoDetail td{
		border : 1px solid red;
		padding-left : 10px;
	}

	.purcProd,#totals{
		border : 3px solid purple;
		width : 900px; /* height 속성은 구매기록의 출력 갯수에 따라 유동적으로 바뀔 예정. 여기서는 설정X */
		margin : 0 auto;
	}
	.purcProd th{
		background-color : gray;
	}
	.purcProd th:nth-child(1){
		width : 200px;
	}
	.purcProd th:nth-child(2){
		width : 100px;
	}
	.purcProd th:nth-child(3){
		width : 350px;
	}
	.purcProd th:nth-child(4){
		width : 100px;
	}
	.purcProd th:nth-child(5){
		width : 150px;
	}
	.purcProd td{
		background-color : #9fc0f5;
	}
	.purcProd td:nth-child(1){
		width : 200px;
	}
	.purcProd td:nth-child(2) {
		width : 100px;
	}
	.purcProd td:nth-child(3) {
		width : 350px;
	}
	.purcProd td:nth-child(4) {
		width : 100px;
	}
	.purcProd td:nth-child(5) {
		width : 150px;
	}
	#totals td{
		background-color : green;
	}
</style>
</head>
<body><!-- 훑 -->
	<table id="sInfoDetail">	<!-- 해당 구매자의 자세한 정보 -->
		<tr>
			<td>아이디</td>
			<td>빈자리</td>
			<td>회원이름</td>
			<td>빈자리</td>
			<td>연락처</td>
			<td>빈자리</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td colspan="2">빈자리</td>
			<td>가입일자</td>
			<td colspan="2">빈자리</td>
		</tr>
		<tr>
			<td>주소</td>
			<td colspan="5">빈자리</td>
		</tr>
	</table>
	
	<table class="purcProd">
		<tr>
			<th>주문 일자</th>
			<th>주문 번호</th>
			<th>주문 품목</th>
			<th>주문 수량</th>
			<th>주문 금액</th>
		</tr>
	</table>
		
	<table class="purcProd" id="pList">		<!-- 해당 구매자의 구매목록이 출력될 테이블 -->
		<c:forEach var="pd" items="${list }">
			<tr>
				<td>${pd.p_type }</td>
				<td>${pd.p_date }</td>
				<td>${pd.p_name }</td>
				<td>${pd.p_remain }</td>
				<td>${pd.p_price }</td>
			</tr>
		</c:forEach>
	</table>
		
	<table id="totals">
		<tr>
			<td width="400px">총 구매 건수 : ${totalCount }</td>	<!-- 해당 구매자의 총 구매건수 -->
			<td width="500px">총 구매 금액 : {빈자리}</td>
		</tr>
	</table>
	
	<div align="center">페이징 자리</div>
</body>
</html>