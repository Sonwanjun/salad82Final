<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자상세-판매기록</title>
<style>
	#sInfoDetail {
		width : 1050px;
		height : 120px;
		margin : 0 auto;
		border : 3px solid yellow;
	}
	#sInfoDetail td{
		
	}

	#sDetailTab {
		width: 600px;
		margin: 10px auto;
		background-color: orange;
	}
	#sDetailTab td {
		width: 250px;
		height: 70px;
		margin: 0 25px;
		font-size: 24px;
		font-weight: bold;
		text-align: center;
		background-color: magenta;
	}
	#sDetailTab td[onclick] {
		cursor: pointer;
	}
	#sDetailTab td[onclick]:hover {
		background-color: #f58cec;
	}

	
</style>
</head>
<body>
	<table id="sInfoDetail">	<!-- 해당 사업자의 자세한 정보 -->
		<tr>
			<td>사업자번호</td>
			<td>사업자번호 넣을 자리</td>
			<td>업체명</td>
			<td>업체명 넣을 자리</td>
			<td>연락처</td>
			<td>연락처 넣을 자리</td>
		</tr>
		<tr>
			<td>아이디</td>
			<td>아이디 넣을 자리</td>
			<td>이메일</td>
			<td>이메일 넣을 자리</td>
			<td>가입일자</td>
			<td>가입일자 넣을 자리</td>
		</tr>
		<tr>
			<td>주소</td>
			<td colspan="5">주소 넣을 자리</td>
		</tr>
	</table>

	<table id="sDetailTab">		<!-- 상세페이지 내의 탭 -->
		<tr>
			<td>판매기록</td>
			<td onclick="써야함">등록된 품목</td>
		</tr>
	</table>
	
	<table id="selledProd">
		<tr>
			<th>판매일</th>
			<th>판매한 품목</th>
			<th>판매수량</th>
			<th>판매액</th>
		</tr>
		<tr>
			<!-- 판매 내역을 페이지당 최대 10개,최신순으로 출력하도록 만들기. ajax와 json을 써보자 -->
			<!-- height  -->
		</tr>
		<tr>
			<td>총 판매건수</td>	<!-- 해당 판매자의 전체 판매 건수 -->
			<td>총 판매액</td>		<!-- 해당 판매자의 전체 판매액 -->
		</tr>
	</table>
	
	<div align="center">페이징 영역</div>
</body>
</html>