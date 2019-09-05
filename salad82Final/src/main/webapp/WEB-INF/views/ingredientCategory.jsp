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
	.btArea input[type='button']:not([class='delChecked']) {
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
	
	.delChecked {
		width : 120px;
		height : 90px;
	}
	
	.divs img {
		width : 25px;
		height : 25px;
	}
	.divs img:hover {
		cursor : pointer;
	}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<!---------- 대분류 영역 ---------->
	<div class="divs">
		<p id="fCount">대분류(${count.cf_count })</p>
		
		
			<div class="listArea">	<!-- 대분류 리스트가 뜰 영역 -->
				<table id="fList">
					<c:forEach var="list" items="${first }">
						<tr>
							<td><input type="checkbox" name="cfCode" value="${list.cf_code }"></td>
							<td>${list.cf_name }</td>
							<td><img src="resources/minusButton.png" alt="${list.cf_code }"></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			
			<table class="btArea">
				<tr>
					<td colspan="2"><input type="text" id="fName" placeholder="추가할 대분류"></td>
					<td rowspan="2"><input type="button" class="delChecked" value="체크항목삭제" onclick="deleteChkCategory('CF')"></td>
				</tr>
				<tr>
					<td><input type="button" value="추가" onclick="addCategory('CF')"></td>
					<td><input type="button" value="취소" onclick="cleanText('CF')"></td>
				</tr>
			</table>
		
	</div>
	
	<!---------- 소분류 영역 ---------->
	<div class="divs">
		<p id="sCount">소분류(${count.cs_count })</p>
		
		
			<div class="listArea">	<!-- 소분류 리스트가 뜰 영역 -->
				<table id="sList">
					<c:forEach var="list" items="${second }">
						<tr>
							<td><input type="checkbox" name="csCode" value="${list.cs_code }"></td>
							<td>${list.cs_name }</td>
							<td><img src="resources/minusButton.png" alt="${list.cs_code }"></td>
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
					<td rowspan="2"><input type="button" class="delChecked" value="체크항목삭제" onclick="deleteChkCategory('CS')"></td>
				</tr>
				<tr>
					<td><input type="button" value="추가" onclick="addCategory('CS')"></td>
					<td><input type="button" value="취소" onclick="cleanText('CS')"></td>
				</tr>
			</table>
		
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
				data : {'dbViewName':dbViewName , 'category':category},
				dataType : 'json',
				success : function(data){
					alert('대분류 추가 성공');
					var fList = '';
					//추가 후의 대분류리스트 표시부분 수정하기
					for(var i=0; i<data.first.length; i++){
						fList += '<tr><td><input type="checkbox" name="cfcode" value="'+data.first[i].cf_code
								+'"></td><td>'+data.first[i].cf_name+'</td><td>'
								+'<img src="resources/minusButton.png" alt="'+data.first[i].cf_code+'" title="되냐"></td></tr>';
					}
					
					
					
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
						sList += '<tr><td><input type="checkbox" name="csCode" value="'+data.second[i].cs_code
								+'"></td><td>'+data.second[i].cs_name+'</td><td>'
								+'<img src="resources/minusButton.png" alt="'+data.second[i].cs_code+'"></td></tr>';
					}
					//소분류 갯수 수정
					var sCount = '소분류('+data.count.cs_count+')';
					
					$('#sList').html(sList);
					$('#sCount').html(sCount);
					$('#fNameList option:first').prop('selected',true);
				},
				error : function(error){
					alert('소분류 추가 실패');
				}
			});
		}
	}

	function deleteChkCategory(dbViewName, solo){ //solo : 체크를 통하지 않고 개별항목 삭제시 전달받을 분류 코드

		if(dbViewName=='CF'){ /////////////////삭제하려는 분류가 대분류일때
			
			//★★★★★중요★★★★★ jquery에서 html()로 붙여넣은 태그는 css 속성 선택자(대괄호)가 먹히지 않는다
			//click()같은 함수도 먹히지 않는다. 이벤트 처리에는 on()을 쓰자.
			var length = $('#fList :checkbox:checked').length;
			alert('선택한 체크박스 수는 '+length);
			//var leng = $('#fList input[name="cfCode"]:checked').length;	//html()로 넣은 태그에는 적용되지 않음
			//alert('속성 선택자 '+leng);									//
			
			if($('#fList input:checked').length==0 && solo==null){ //체크된 대분류 항목이 없다면
				alert('선택한 대분류가 없습니다');
				return false;
			}
			if(confirm('대분류 삭제시 해당 대분류에 포함된 소분류도 같이 삭제됩니다.삭제하시겠습니까?')==false){
				return false;
			}
			var c;
			if(solo==null){ //체크박스로 삭제시
				c = new Array();
				$('#fList input:checked').each(function(){ 
					c.push($(this).val()); //체크된 대분류 항목의 코드를 배열에 넣음
				});
			} else { //단일 항목 삭제시
				c = new Array();
				c.push(solo);
			}
			var json = JSON.stringify(c);
			alert('코드 배열에 넣기 성공');
			$.ajax({
				type : 'post',
				url : 'deleteIngrCategory',
				data : {'json':json , 'dbViewName':dbViewName},
				dataType : 'html',
				success : function(data){
					alert('대분류 지우기 성공');
					$('#ajaxArea').html(data);
				},
				error : function(error){
					alert('체크한 대분류 지우기 실패');
				}
			});
			
		} else if(dbViewName=='CS') { /////////////////삭제하려는 분류가 소분류일때
			
			if($('#sList input:checked').length==0 && solo==null){ //체크된 소분류 항목이 없다면
				alert('선택한 소분류가 없습니다');
				return false;
			}
			if(confirm('선택한 소분류를 삭제하시겠습니까?')==false){
				return false;
			}
			var c = new Array();
			if(solo==null){ //체크박스로 삭제시
				$('#sList input:checked').each(function(){ 
					c.push($(this).val()); //체크된 소분류 항목의 코드를 배열에 넣음
				});
			} else { //단일 항목 삭제시
				c.push(solo);
			}
			var json = JSON.stringify(c);
			alert('코드 배열에 넣기 성공');
			$.ajax({
				type : 'post',
				url : 'deleteIngrCategory',
				data : {'json':json , 'dbViewName':dbViewName},
				dataType : 'html',
				success : function(data){
					alert('소분류 지우기 성공');
					$('#ajaxArea').html(data);
				},
				error : function(error){
					alert('체크한 소분류 지우기 실패');
				}
			});
			
		}
		
	};
	$('#fList').on('click','img',function() {
		var cf_code = $(this).attr('alt');
		alert('대분류 개별삭제');
		alert(cf_code);
		deleteChkCategory('CF',cf_code);
	});
	/*$('#fList img').click(function(event) {
		var cf_code = $(event.target).attr('alt');
		alert('대분류 개별삭제');
		deleteChkCategory('CF',cf_code);
	});*/
	$('#sList').on('click','img',function() {
		alert('소분류 개별삭제');
		var cs_code = $(this).attr('alt');
		deleteChkCategory('CS',cs_code);
	});
	
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