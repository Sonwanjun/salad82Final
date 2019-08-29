<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재료 분류 관리</title>
<style>
	.divs {
		border : 2px solid red;
		width : 450px;
		height : 550px;
		margin : 20px 50px;
		float : left;
	}
	.divs>p {
		border : 1px dotted blue;
		font-size : 30px;
		text-align : center;
		margin : 20px 0;
	}
	
	.listArea {
		border : 3px solid magenta;
		height : 300px;
		overflow : scroll;
	}
	.listArea table {
		width : 425px;
		margin : 10px auto;
	}
	.listArea td {
		border : 1px dashed purple;
		height : 40px;
	}
	.listArea td:first-child {
		width : 100px;
	}
	.listArea td:nth-child(2) {
		width : 225px;
	}
	.listArea td:nth-child(3) {
		width : 100px;
	}
	
	.btArea {
		width : 440px;
		height : 120px;
		margin : 17px auto;
	}
	.btArea td {
		border : 2px solid yellow;
	}
</style>
</head>
<body>
	<div class="divs"><!-- 재료 카테고리 페이지&기능 만들기 -->
		<p>대분류</p>
		
		<form action="어디로갈까" method="get">
			<div class="listArea">	<!-- 분류 리스트가 뜰 영역 -->
				<table>
					<tr>	<!-- tr과 td부분은 나중에 반복문 돌려야함 -->
						<td>췤</td>
						<td>텍스트 자리</td>
						<td>빼기 자리</td>
					</tr>
					<tr>
						<td>체크박스 자리</td>
						<td>텍스트 자리</td>
						<td>빼기 자리</td>
					</tr>
					<tr>
						<td>체크박스 자리</td>
						<td>텍스트 자리</td>
						<td>빼기 자리</td>
					</tr>
				</table>
			</div>
			
			<table class="btArea">
				<tr>
					<td colspan="2">추가할 분류명 입력란</td>
					<td rowspan="2">체크 항목 삭제</td>
				</tr>
				<tr>
					<td>추가버튼</td>
					<td>취소버튼</td>
				</tr>
			</table>
		</form>
	</div>
	
	<div class="divs">
		<p>소분류</p>
		
		<form action="어디로갈까" method="get">
			<div class="listArea">	<!-- 분류 리스트가 뜰 영역 -->
				<table>
					<tr>	<!-- tr과 td부분은 나중에 반복문 돌려야함 -->
						<td>췤</td>
						<td>텍스트 자리</td>
						<td>빼기 자리</td>
					</tr>
					<tr>
						<td>체크박스 자리</td>
						<td>텍스트 자리</td>
						<td>빼기 자리</td>
					</tr>
					<tr>
						<td>체크박스 자리</td>
						<td>텍스트 자리</td>
						<td>빼기 자리</td>
					</tr>
					<tr>
						<td>체크박스 자리</td>
						<td>텍스트 자리</td>
						<td>빼기 자리</td>
					</tr>
					<tr>
						<td>체크박스 자리</td>
						<td>텍스트 자리</td>
						<td>빼기 자리</td>
					</tr>
					<tr>
						<td>체크박스 자리</td>
						<td>텍스트 자리</td>
						<td>빼기 자리</td>
					</tr>
					<tr>
						<td>체크박스 자리</td>
						<td>텍스트 자리</td>
						<td>빼기 자리</td>
					</tr>
				</table>
			</div>
			
			<table class="btArea">
				<tr>
					<td colspan="2">추가할 분류명 입력란</td>
					<td rowspan="2">체크 항목 삭제</td>
				</tr>
				<tr>
					<td>추가버튼</td>
					<td>취소버튼</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>