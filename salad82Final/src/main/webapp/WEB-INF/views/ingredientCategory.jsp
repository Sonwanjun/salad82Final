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
	#fName {
		width : 270px;
		height : 25px;
	}
	#sName, #fNameList {
		width : 130px;
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
	input[type='button'] {
		border-radius : 10px;
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
					<td><input type="button" value="취소" onclick="cleanText('CF')"></td>
				</tr>
			</table>
		</form>
	</div>
	
	<!---------- 소분류 영역 ---------->
	<div class="divs">
		<p id="sCount">소분류(${count.cs_count })</p>
		
		<form action="어디로갈까" method="get">
			<div class="listArea">	<!-- 소분류 리스트가 뜰 영역 -->
				<table id="sList">
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
					<td colspan="2">
						<select id="fNameList">
							<c:forEach var="list" items="${first }">
								<option value="${list.cf_code }">${list.cf_name }</option>
							</c:forEach>
						</select>
						<input type="text" id="sName" placeholder="추가할 소분류">
					</td>
					<td rowspan="2"><input type="button" id="delChecked" value="체크항목삭제"></td>
				</tr>
				<tr>
					<td><input type="button" value="추가" onclick="addCategory('CS')"></td>
					<td><input type="button" value="취소" onclick="cleanText('CS')"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script>
	function addCategory(dbViewName){
		var category; //추가할 대분류or소분류명을 담을 변수
		if(dbViewName=='CF'){
			category = $('#fName').val(); //val에 파라미터가 없으면 해당 요소의 값을 가져옴
			$('#fName').val(''); //val에 파라미터가 있으면 값을 가져오지 않고 반대로 해당 요소의 값을 파라미터로 대체함
			if(category==''){
				alert('추가할 대분류명을 입력하세요');
				return false;
			}
			$.ajax({
				type : 'get',
				url : 'ajax/addFirstCategory',
				contentType : 'application/json; charset=UTF-8',
				data : {'dbViewName':dbViewName , 'category':category},
				dataType : 'json',
				success : function(data){
					alert('대분류 추가 성공');
					
					var fList = '';
					//추가 후의 대분류리스트 표시부분 수정하기
					for(var i=0; i<data.first.length; i++){
						fList += '<tr><td><input type="checkbox" name="cfCode" value="'+data.first[i].cf_code
								+'"></td><td>'+data.first[i].cf_name+'</td><td>빼기자리</td></tr>';
					};
					//대분류 갯수 수정
					var fCount = '대분류('+data.count.cf_count+')';
					//소분류쪽 셀렉트박스 수정
					var fNameList = '';
					for(var i=0; i<data.first.length; i++){
						fNameList += '<option value="'+data.first[i].cf_code+'">'+data.first[i].cf_name+'</option>';
					}
					
					$('#fList').html(fList);
					$('#fCount').html(fCount);
					$('#fNameList').html(fNameList);
				},
				error : function(error){
					alert('대분류 추가 실패');
				}
			});
		} else if(dbViewName=='CS') {
			category = $('#sName').val();
			$('#sName').val('');
			if(category==''){
				alert('추가할 소분류명을 입력하세요');
				return false;
			}
			var cf_code = $('#fNameList option:selected').val(); //대분류 셀렉트박스에서 선택된 값을 가져옴
			$.ajax({
				type : 'get',
				url : 'ajax/addSecondCategory',
				contentType : 'application/json; charset=UTF-8',
				data : {'dbViewName':dbViewName , 'category':category , 'cf_code':cf_code},
				dataType : 'json',
				success : function(data){
					alert('소분류 추가 성공');
					
					var sList = '';
					//추가 후의 소분류리스트 표시부분 수정
					for(var i=0; i<data.second.length; i++){
						sList += '<tr><td><input type="checkbox" name="cs_code" value="'+data.second[i].cs_code
								+'"></td><td>'+data.second[i].cs_name+'</td><td>빼기자리</td></tr>';
					};
					//소분류 갯수 수정
					var sCount = '소분류('+data.count.cs_count+')';
					
					$('#sList').html(sList);
					$('#sCount').html(sCount);
				},
				error : function(error){
					alert('소분류 추가 실패');
				}
			});
		}
	}

	function deleteCheckedCategory(){ //체크된 분류들 삭제기능. 만들어야함
		
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
	
	function cleanText(dbViewName){
		if(dbViewName=='CF'){
			$('#fName').val('');
		}
		if(dbViewName=='CS'){
			$('#sName').val('');
		}
	};
</script>
</html>