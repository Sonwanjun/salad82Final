
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<style>
h1 {
	text-align: center;
}

#row {
	text-align: right;
}

#top {
	width: 100%;
	border-top: 1px solid #009900;
	border-bottom: 1px solid #009900;
	border-collapse: collapse;
	text-align: center;
	background: #009900;
}

#mainmenu th, td {
	border-top: 1px solid #009900;
	border-bottom: 1px solid #009900;
	padding: 20px 210px 20px;
}

.footer {
	width: 100%;
	height: 120px;
	position: absolute;
	bottom: 0;
	background: #009900;
	font-size: 16;
}

#footer {
	background: #009900;
}

#WriteTitle {
	margin-left: 5px;
	margin-top: 15px;
	padding: 50px;
	text-align: center;
	width: 100%;
	border: 1px solid #009900;
	margin-top: 15px;
}

#titleAndContents {
	margin-left: 5px;
	margin-top: 15px;
	padding: 20px;
	text-align: center;
	width: 100%;
	border: 1px solid #009900;
}

#putTitle {
	text-align: center;
	width: 1300px;
	height: 30px;
	font-size: 25px;
}

#contentCook {
	margin-left: 5px;
	margin-top: 15px;
	padding: 16px;
	text-align: center;
	width: 100%;
	border: 1px solid #009900;
}

#putContentCook {
	text-align: center;
	width: 1300px;
	height: 250px;
	font-size: 12px;
}

#categoryTable {
	margin-left: 5px;
	margin-top: 15px;
	padding: 20px;
	text-align: center;
	width: 100%;
	border: 1px solid #009900;
}

#cookinfo {
	margin-left: 5px;
	margin-top: 15px;
	padding: 20px;
	text-align: center;
	width: 100%;
	border: 1px solid #009900;
}

#cookResource {
	margin-left: 5px;
	margin-top: 15px;
	padding: 20px;
	text-align: center;
	width: 100%;
	border: 1px solid #009900;
}

#cookResource th {
	border: 1px solid red;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<body>
	<p id="row">
		<button class="login">로그인</button>
	<form id="logoutFrm" action="logout" method="post">
		<a href="javascript:logout()">로그아웃</a>
	</form>
	회원가입/마이페이지 고객센터
	</p>
	<h1>로고</h1>



	<table id="top">
		<tr id="mainmenu">
			<td>DIY</td>
			<td>시그니쳐</td>
			<td>Best</td>
			<td>나만의 레시피</td>
		</tr>
	</table>

	<table id="WriteTitle">
		<tr>
			<th>게시판 글쓰기</th>
		</tr>
	</table>
	<table id="titleAndContents">
		<tr>
			<th width="180px" height="150px">레시피 제목</th>
			<th><textarea id="putTitle" style="resize: none;"></textarea></th>
	</table>
	<table id="contentCook">
		<tr>
			<th width="180px" height="150px">요리소개</th>
			<th><textarea id="putContentCook" rows="10" cols="5"
					style="resize: none;"></textarea>
	</table>
	<table id="categoryTable">
		<tr>
			<th width="180px" height="150px">카테고리</th>
			<th>육류:<select name="selectBox" id="selectBox"
				style="width: 80px;" class="select_00">
					<c:forEach var="Category" items="${meat}">
						<option value="${Category.cs_name}">${Category.cs_name}</option>
					</c:forEach>
			</select></th>
			<th>어류:<select name="selectBox" id="selectBox"
				style="width: 80px;" class="select_00">
					<c:forEach var="Category" items="${fish}">
						<option value="${Category.cs_name}">${Category.cs_name}</option>
					</c:forEach>
			</select></th>
			<th>유제품류:<select name="selectBox" id="selectBox"
				style="width: 80px;" class="select_00">
					<c:forEach var="Category" items="${milk}">
						<option value="${Category.cs_name}">${Category.cs_name}</option>
					</c:forEach>
			</select></th>
			<th>채소류:<select name="selectBox" id="selectBox"
				style="width: 80px;" class="select_00">
					<c:forEach var="Category" items="${veg}">
						<option value="${Category.cs_name}">${Category.cs_name}</option>
					</c:forEach>
			</select></th>
			<!--var를 var='Category'라고 선언했을때  대소문자는 같아야한다$('***'.'sql컬럼명(cs_name))'-->



		</tr>
	</table>
	<table id="cookResource">
		<thead>
			<tr>
				<th width="180px" height="150px">재료종류</th>
				<th>재료</th>
				<th>수량:<input type='text' value='0' id='quan'
					style='width: 30px'></th>
				<th><input type='button' onclick='up()' value='△'> <input
					type='button' onclick='down()' value='▽'></th>
				<th>계량정보:<input type='text' id='cookInfo' style='width: 150px;'></th>
				<th><input type='button' id='addForm' onclick='addForm()'
					value='+'><input type='button' id='delForm'
					onclick='delForm()' value='-'></th>
			</tr>
		</thead>
		<tbody id="mytbody"></tbody>
	</table>















	<div id="footer" align="center">
		<br>업체명: Salad82 | 사업자번호:123-45-6789<br> 주소: 인천 남구 학익동 663-1
		태승빌딩 | 전화번호:032-123-4567<br> Copyrights(c) ㈜Salad82 2015 all
		rights reserved.
	</div>
</body>

<script>
	function logout() {
		$('#logoutFrm').submit(); //서버로 전송
	}
</script>
<script>
	/*var addResource
	 $.ajax({
	 type : 'post', // 데이터  방식 
	 url : './addCookResource', //콘트롤러에서 요청? 
	 data : data,    //서버로 보낼값은 재료들 상추 고기 흰살생선 
	
	 success:function(data){ // 성공일시  상추 고기 흰살생선이 더야함 param에 담을것 
	 alert(성공)
	 console.log(data);
	
	 error:function(error){
	 alert(실패)
	 console.log(data);
	
	 })*/
</script>
<script>
	function down() {
		var expense = $("#quan").val();
		expense = (Number(expense) - 1);
		if (expense >= 0) {
			$("#quan").val(expense);
		}
	};
	function up() {
		var expense = $("#quan").val();
		expense = (Number(expense) + 1);
		if ($("#quan").val() < 100) {
			$("#quan").val(expense);
		}
	};
</script>
<script>
	function addForm() {
		var addForm = document.getElementById('mytbody');
		var row = addForm.insertRow(addForm.rows.length);
		var cell1 = row.insertCell(0);
		var cell2 = row.insertCell(1);
		cell1.innerHTML = '항목'
		cell2.innerHTML = '뜨아아아'
	}
	function delForm() {
		var delForm = document.getElementById('mytbody');
		if (delForm.rows.length < 1)
			return;
		delForm.deleteRow(delForm.rows.length-1);
	}
</script>
</html>