<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재료 분류 관리</title>
<style>
	@font-face{
		font-family: 'SQUARE';
		src:url('resources/NNsquare.ttf') format('truetype');
	}
	*{
		font-family : "SQUARE";
	}
	table {
		text-align : center;
	}

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
		font-size : 20px;
		font-weight : bold;
	}
	.listArea td:nth-child(3) {
		width : 100px;
	}
	
	.btArea {
		width : 450px;
		height : 120px;
		margin : 17px auto;
	}
	.btArea td {
		border : 2px solid yellow;
		width : 150px;
	}
	.btArea input[type='text'] {
		width : 270px;
		height : 25px;
	}
	.btArea input[type='button']:not([id='delChecked']) {
		width : 100px;
		height : 30px;
	}
	
	input[type='checkbox'] {
		width : 20px;
		height : 20px;
	}
	input[type='checkbox']+font {
		vertical-align : 5px;
	}
	
	#delChecked {
		width : 120px;
		height : 90px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<!---------- 대분류 영역 ---------->
	<div class="divs">
		<p id="fCount">대분류(${count.cf_count })</p>
		
		<form action="어디로갈까" method="get">
			<div class="listArea">	<!-- 대분류 리스트가 뜰 영역 -->
				<table id="fList">
					<c:forEach var="list" items="${first }">
						<tr>
							<td><input type="checkbox" name="cfCode" value="${list.cf_code }"></td>
							<td>${list.cf_name }</td>
							<td>빼기자리</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			
			<table class="btArea">
				<tr>
					<td colspan="2"><input type="text" id="fName" placeholder="추가할 대분류"></td>
					<td rowspan="2"><input type="button" id="delChecked" value="체크항목삭제"></td>
				</tr>
				<tr>
					<td><input type="button" value="추가" onclick="addCategory('CF')"></td>
					<td><input type="button" value="취소"></td>
				</tr>
			</table>
		</form>
	</div>
	
	<!---------- 소분류 영역 ---------->
	<div class="divs">
		<p>소분류</p>
		
		<form action="어디로갈까" method="get">
			<div class="listArea">	<!-- 분류 리스트가 뜰 영역 -->
				<table>
					<c:forEach var="list" items="${second }">
						<tr>
							<td><input type="checkbox" name="csCode" value="${list.cs_code }"></td>
							<td>${list.cs_name }</td>
							<td>빼기자리</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			
			<table class="btArea">
				<tr>
					<td colspan="2"><input type="text" placeholder="추가할 소분류"></td>
					<td rowspan="2"><input type="button" id="delChecked" value="체크항목삭제"></td>
				</tr>
				<tr>
					<td><input type="button" value="추가"></td>
					<td><input type="button" value="취소"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script>
	function addCategory(dbViewName){
		var category;
		if(dbViewName=='CF'){
			category = document.getElementById('fName').value;
			$('#fName').val('');
			$.ajax({
				type : 'get',
				url : 'ajax/addCategory',
				contentType : 'application/json; charset=UTF-8',
				data : {'dbViewName':dbViewName , 'category':category},
				dataType : 'json',
				success : function(data){
					alert('대분류 추가 성공');
					
					var fList = '';
					//추가 후의 대분류리스트 표시부분 다시 만들기
					for(var i=0; i<data.first.length; i++){
						fList += '<tr><td><input type="checkbox" name="cfCode" value="'+data.first[i].cf_code
								+'"></td><td>'+data.first[i].cf_name+'</td><td>빼기자리</td></tr>';
					};
					//대분류 숫자 수정
					var fCount = '대분류('+data.count.cf_count+')';
					$('#fList').html(fList);
					$('#fCount').html(fCount);
				},
				error : function(error){
					alert('대분류 추가 실패');
				}
			});
		} else {
			//소분류 입력칸의 값 처리하도록 만들기
		}
	}

	function deleteCheckedCategory(){ //분류 삭제기능 만들어야함
		
		var go = confirm('값 확인?');
		if(go==true){
			var array = new Array();
			$('input[name="cfCode"]:checked').each(function(){ 
				array.push($(this).val());
			});
			var jsonStr = JSON.stringify(array);
			$.ajax({
				type : 'get',
				url : 'ajax/deleteCategory',
				contentType : 'application/json',
				data : jsonStr,
				dataType : 'json',
				success : function(data){
					
				},
				error : function(error){
					alert('체크한 대분류 지우기 실패');
				}
			});
		}
		
	};
</script>
</html>