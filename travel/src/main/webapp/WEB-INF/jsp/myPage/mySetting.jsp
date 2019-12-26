<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ include file="myPageHeader.jsp"%>
<meta charset="UTF-8">
<title>Mypage</title>
<style>
td {
	text-align: center;
}
</style>
	<br>
	<h4>
		<b>내정보</b>
	</h4>
	<br>
	<form name="form" action="updateUserVo.do" method="post">
	<table class="table table-bordered tb"
		style="width: 60%; margin: auto;">
		<thead>
		</thead>
		<colgroup>
			<col width="25%">
			<col width="75%">
		</colgroup>
		<tbody>
		<c:forEach var="list" items="${list}">
			<tr>
				<td><label for="id">Id</label></td>
				<td><input type="text" class="form-control" id="uId" name="uId" value="${list.uId}" readonly> </td>
			</tr>
			<tr>
				<td><label for="uPwd">Pwd</label></td>
				<td><input type="password" class="form-control" id="uPwd" name="uPwd" ></td>
			</tr>
			<tr>
				<td><label for="name">Name</label></td>
				<td><input type="text" class="form-control" id="uName" name="uName" value="${list.uName}"></td>
			</tr>
			<tr>
				<td><label for="age">Age</label></td>
				<td><input type="text" class="form-control" id="uAge" name="uAge" value="${list.uAge}"></td>
			</tr>
			<tr>
				<td><label for="phone">Phone</label></td>
				<td><input type="text" class="form-control" id="uPhone" name="uPhone" value="${list.uPhone}"></td>
			</tr>
			<tr>
				<td><label for="email">Email</label></td>
				<td><input type="text" class="form-control" id="uEmail" name="uEmail" value="${list.uEmail}"></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</form>
	<br>
	<br>
	<script>
		$(document).ready(function() {
			$("#update").click(function() {
				if(confirm("수정하시겠습니까?")){
				document.form.action="updateUserVo.do";
				document.form.submit();
				}
			});
		});
		
		$(document).ready(function() {
			$("#delete").click(function() {
				if(confirm("삭제하시겠습니까?")){
				document.form.action="DeleteUserVo.do";
				document.form.submit();
				}
			});
		});
	</script>
	<table style="margin: auto;">
		<tr>
			<td style="padding-left: 20px;">
				<button type="button" class="butt" id="update">수정</button>
			</td>
			<td style="padding-left: 20px;">
				<button type="button" class="butt" id="delete">탈퇴</button>
			</td>
		</tr>
	</table></div>
	<script src="../../assets/js/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<%@ include file="../footer.jsp"%>