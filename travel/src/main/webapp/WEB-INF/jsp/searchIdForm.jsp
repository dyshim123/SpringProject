<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="../../assets/css/main.css" />
<%@ include file="header.jsp"%>
<style>
body {
	text-align: center;
}

table {
	margin-left: auto;
	margin-right: auto;
	border: 1px solid #DEE2E6;
}

bn {
     background-color: #A6E7F7;
}

input[type="submit"], input[type="reset"], input[type="button"], .button {
    background-color: #679ECB;
 }
 
 td {
     text-align: center;
     }
</style>

<title>아이디 찾기/비밀번호 찾기</title>
</head>
<link href="style.css" rel="stylesheet" type="text/css">
<br><br><br><br><br><br>

<script>
$(function(){
    var responseMessage = "<c:out value="${u_id}" />";
    var noresponseMessage = "<c:out value="${no_id}" />";
    if(responseMessage != ""){
        alert(responseMessage)
    }else if(noresponseMessage != ""){
        alert(noresponseMessage)
    }
}) 
</script>
<script>
$(function(){
    var responseMessage = "<c:out value="${succes}" />";
    var noresponseMessage = "<c:out value="${fail}" />";
    if(responseMessage != ""){
        alert(responseMessage)
    }else if(noresponseMessage != ""){
        alert(noresponseMessage)
    }
}) 
</script>
<div class="containter">
	<form method="post" action="searchId.do">
		<table class="table" style="width: 30%;">
			<tr>
				<td colspan="2" style="padding-bottom: 0px;"><h3>
						<b>아이디 찾기</b>
					</h3></td>
			<tr>
				<td>이름</td>
				<td><input type="text" name="uName" id="uName" size="18" required="required">
				</td>
			</tr>
			<tr>
				<td>이메일 번호</td>
				<td><input type="text" name="uEmail" id="uEmail" required="required"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="확인"> <input
					type="button" value="취소"
					onclick="javascript:window.location = 'indexPage.do'"></td>
			</tr>
		</table>
	</form>
</div>
<br><br><br>
<form method="get" action="searchPw.do">
	<table class="table" style="width: 30%;">
		<tr><td colspan="2" style="padding-bottom: 0px;"><h3>
				<b>비밀번호 찾기</b>
			</h3></td></tr>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="uId" id="uId" size="18">
			</td>
		</tr>
		<tr>
			<td>이메일 번호</td>
			     <p>'@'포함한 이메일주소를 정확히 입력해주세요.</p>
				<td><input type="text" name="uEmail" id="uEmail" required="required"></td>
		</tr>
		<tr>
			<td colspan="2" id="bn"><input type="submit" value="확인"> <input
				type="button" value="취소"
				onclick="javascript:window.location = 'indexPage.do'"></td>
		</tr>
	</table>
</form>

<script src="../../assets/js/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>