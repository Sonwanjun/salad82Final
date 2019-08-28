<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자상세-판매기록</title>
<style>
	#cInfoDetail{
		width : 1050px;
		height : 120px;
		margin : 0 auto;
		border : 3px solid yellow;
		border-collapse: collapse;
	}
	#cInfoDetail td{
		border : 1px solid red;
		padding-left : 10px;
	}
	.titles{
		background-color : #b4d9be;
	}
	
	#parent{
		width : 300px;
		height : 70px;
		font-size : 24px;
		font-weight : bold;
		text-align : center;
		margin : 10px auto;
		border : 3px dotted orange;
		position : relative;
	}
	#child{
		margin : auto;
		position : absolute;
		top : 50%;
		left : 50%;	
		transform: translateX(-50%) translateY(-50%);
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
	<table id="cInfoDetail">	<!-- 해당 구매자의 자세한 정보 -->
		<tr>
			<td class="titles">아이디</td>
			<td>${infoDetail.c_id }</td>
			<td class="titles">회원이름</td>
			<td>${infoDetail.c_name }</td>
			<td class="titles">연락처</td>
			<td>${infoDetail.c_phone }</td>
		</tr>
		<tr>
			<td class="titles">이메일</td>
			<td colspan="2">${infoDetail.c_email }</td>
			<td class="titles">가입일자</td>
			<td colspan="2">${infoDetail.c_date }</td>
		</tr>
		<tr>
			<td class="titles">주소</td>
			<td colspan="5">${infoDetail.c_address }</td>
		</tr>
	</table>
	
	<div id="parent">
		<div id="child">
			구매 목록
		</div>
	</div>
	
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
				<td>${pd.o_date }</td>
				<td>${pd.o_num }</td>
				<td>${pd.p_name }</td>
				<td>${pd.od_amount }</td>
				<td>${pd.price }</td>
			</tr>
		</c:forEach>
	</table>
		
	<table id="totals">
		<tr>
			<td width="400px">총 주문 횟수 : ${totalCount }</td>	<!-- 해당 구매자의 총 구매건수 -->
			<td width="500px">총 구매 금액 : ${totalPurcMoney }</td>
		</tr>
	</table>
	
	<div align="center">${paging }</div>
</body>
</html>