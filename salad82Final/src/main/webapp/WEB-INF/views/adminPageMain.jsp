<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
@font-face{
            font-family: 'SQUARE';
            src:url('resources/NNsquare.ttf') format('truetype');
}

input[type='button'] {
	outline : 0;
}

body {
	width: 100%;
	height: 100%;
	font-family : 'SQUARE';
}

button {
	border : 0;
	outline: 0;
}

#wrapper {
	width: 1910px;
	height: 100%;
	margin-left: -5px;
}


#header h1 {
	text-align: center;
}

#header p {
	text-align: right;
	margin-right : 20px;
}

#topMenu {
	width: 100%;
	height: 70px;
	border-top: 1px solid #009900;
	border-bottom: 1px solid #009900;
	border-collapse: collapse;
	text-aline: center;
	background: #009900;
	border-top: 1px solid #009900;
}

#topMenu td {
	border-top: 1px solid #009900;
	border-bottom: 1px solid #009900;
	padding: 20px 150px 20px;
}

#header {
	width: 100%;
	height: 100px;
}

#menubar {
	width: 100%;
	height: 70px;
	margin-bottom: 30px;
	background-color: #1fbf37;
}

#mainContent {
	width: 100%;
	height: 620px;
}

#leftMenuArea {
	width: 250px;
	height: 600px;
	margin-left: 70px;
	background-color: blue;
	display: inline-block;
}

#leftMenuArea * {
	display: inline;
}

#leftMenu {
	font-size : 20px;
	font-weight : bold;
}
#leftMenu td {
	width: 248px;
	height: 50px;
	margin-top: 30px;
	padding-top: 20px;
	text-align: center;
	display: inline-block;
	background-color: green;
	text-align: center;
}
#leftMenu td[onclick] {
	cursor : pointer;
}

#ajaxArea {
	width: 1150px;
	height: 600px;
	margin-left: 70px;
	background-color: pink;
	display: inline-block;
	position: absolute;
	overflow: auto;
}

#footer {
	width: 100%;
	height: 120px;
	text-align : center;
	bottom: 0;
	background: #009900;
	font-size: 16;
}

</style>
</head>
<body><!-- 훑 -->
	<div id="wrapper">
		<div id="header">
			<p>로그인/로그아웃&nbsp;&nbsp;회원가입/마이페이지&nbsp;&nbsp;고객센터</p>
			<h1>로고</h1>
		</div>

		<div id="menubar">
			<table id="topMenu">
				<tr>
					<td>DIY</td>
					<td>시그니쳐</td>
					<td>Best</td>
					<td>나만의 레시피</td>
				</tr>
			</table>
		</div>

		<div id="mainContent">
			<div id="leftMenuArea">
				<table id="leftMenu">
					<tr>
						<td onclick="sellerInfo()">판매자/구매자 정보</td>
					</tr>
					<tr>
						<td onclick="goIngrPage()">DIY 재료 분류 관리</td>
					</tr>
					<tr>
						<td onclick="productManage()">전체 품목 조회 및 승인</td>
					</tr>
					<tr>
						<td>메뉴4</td>
					</tr>
				</table>
			</div>
			<div id="ajaxArea">ajax 영역</div>
		</div>

		<div id="footer">
			<br>업체명: Salad82 | 사업자번호:123-45-67890 <br>주소: 인천 남구 학익동
			663-1 태승빌딩 | 전화번호:032-123-4567 <br>Copyrights(c) ㈜Salad82 2015
			all rights reserved.
		</div>
	</div>
</body>
<script>
	function sellerInfo(pNum){
		$.ajax({
			type : 'get',
			url : 'sellerInfo',
			data : {pNum : pNum},
			dataType : 'html',
			success : function(data){
				$('#ajaxArea').html(data);
			},
			error : function(error){
				alert('에러다 에러');
			}
		});
	};
	sellerInfo();
	
	function showDetail(id, m_type, pNum){
		var url;
		var mData;
		alert('빠밤');
		if(m_type == 'S'){
			url = "selledProdInfo";
			mData = {s_id:id, pNum:pNum};
		} else if(m_type == 'C') { //문자열 비교에 ==쓰는게 맞나?
			url = "purcProdInfo";
			mData = {c_id:id, pNum:pNum};
		}
		
		$.ajax({
			type : 'get',
			url : url,
			data : mData, //이름 부분에는 따옴표를 붙여도 되고 안붙여도 됨
			dataType : 'html',
			success : function(data){
				alert('성공');
				$('#ajaxArea').html(data);
			},
			error : function(error){
				console.log(error);
				alert('에러요!!!!!!!!!');
			}
		});
	};
	
	function regProdInfo(s_id, pNum){
		alert('regProdInfo 실행');
		$.ajax({
			type : 'get',
			url : 'regProdInfo',
			data : {s_id:s_id, pNum:pNum},
			dataType : 'html',
			success : function(data){
				alert('regProdInfo 성공');
				$('#ajaxArea').html(data);
			},
			error : function(error){
				alert('regProdInfo의 에러');
				console.log(error);
			}
		});
	};
	
	function goIngrPage(){
		alert('goIngrPage 실행');
		$.ajax({
			type : 'get',
			url : 'ingredientCategory',
			dataType : 'html',
			success : function(data){
				alert('goIngrPage 성공');
				$('#ajaxArea').html(data);
			},
			error : function(error){
				alert('goIngrPage의 에러');
				console.log(error);
			}
		});
	}
	
	function productManage(pNum){
		alert('productManage 실행');
		$.ajax({
			type : 'get',
			url : 'productManage',
			data : {'pNum':pNum},
			dataType : 'html',
			success : function(data){
				alert('productManage 성공');
				$('#ajaxArea').html(data);
			},
			error : function(error){
				alert('productManage 실패');
				console.log(error);
			}
		});
	}
	
	
</script>
</html>