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

	#sDetailTab{
		width: 600px;
		margin: 10px auto;
		background-color: orange;
	}
	#sDetailTab td{
		width: 250px;
		height: 70px;
		margin: 0 25px;
		font-size: 24px;
		font-weight: bold;
		text-align: center;
		background-color: magenta;
	}
	#sDetailTab td[onclick]{
		cursor: pointer;
	}
	#sDetailTab td[onclick]:hover{
		background-color: #f58cec;
	}
	#sDetailTab td:not([onclick]){
		background-color: #f553e7;
	}

	.regProd,#totals{
		border : 3px solid purple;
		width : 900px; /* height 속성은 판매기록의 출력 갯수에 따라 유동적으로 바뀔 예정. 여기서는 설정X */
		margin : 0 auto;
	}
	.regProd th{
		background-color : gray;
	}
	.regProd th:nth-child(1){
		width : 100px;
	}
	.regProd th:nth-child(2){
		width : 200px;
	}
	.regProd th:nth-child(3){
		width : 350px;
	}
	.regProd th:nth-child(4){
		width : 100px;
	}
	.regProd th:nth-child(5){
		width : 150px;
	}
	.regProd td{
		background-color : #9fc0f5;
	}
	.regProd td:nth-child(1){
		width : 100px;
	}
	.regProd td:nth-child(2) {
		width : 200px;
	}
	.regProd td:nth-child(3) {
		width : 350px;
	}
	.regProd td:nth-child(4) {
		width : 100px;
	}
	.regProd td:nth-child(5) {
		width : 150px;
	}
	#totals td{
		background-color : green;
	}
</style>
</head>
<body><!-- 훑 -->
	<table id="sInfoDetail">	<!-- 해당 사업자의 자세한 정보 -->
		<tr>
			<td>사업자번호</td>
			<td>${infoDetail.s_num }</td>
			<td>업체명</td>
			<td>${infoDetail.s_name }</td>
			<td>연락처</td>
			<td>${infoDetail.s_phone }</td>
		</tr>
		<tr>
			<td>아이디</td>
			<td>${infoDetail.s_id }</td>
			<td>이메일</td>
			<td>${infoDetail.s_email }</td>
			<td>가입일자</td>
			<td>${infoDetail.s_date }</td>
		</tr>
		<tr>
			<td>주소</td>
			<td colspan="5">${infoDetail.s_address }</td>
		</tr>
	</table>

	<table id="sDetailTab">		<!-- 상세페이지 내의 탭 -->
		<tr>
			<td onclick="showDetail('${infoDetail.s_id}', 'S')">판매기록</td>
			<td>등록된 품목</td>
		</tr>
	</table>
	
	<table class="regProd">		<!-- 해당 사업자의 등록품목이 출력될 테이블 -->
		<tr>
			<th>타입</th>
			<th>등록일</th>
			<th>품목명</th>
			<th>재고량</th>
			<th>단가</th>
		</tr>
	</table>
		
	<table class="regProd" id="pList">
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
			<td colspan="5" width="900px">총 품목 가짓수 : ${totalCount }</td>	<!-- 해당 판매자의 등록 품목 수 -->
		</tr>
	</table>
	
	<div align="center">${paging }</div>
</body>
</html>