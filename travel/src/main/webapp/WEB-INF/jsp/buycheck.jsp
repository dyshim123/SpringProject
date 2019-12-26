<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매페이지</title>
</head>
<%@ include file="header.jsp" %>
<style>
 #design {
 border: 3px solid #ffffff;
border-radius: 100px;
-webkit-border-radius: 100px; max-width:75%; height:250px; margin: auto;
 }
</style>
<br><br><br><br><br>
<c:set var="result" value="${result}"/>
<c:set var="point" value="${point}"/>
<div style="margin-left: 200px;">
<h1><b>주문/결제</b></h1>
</div>
<br>
<div style=" border: 2px solid #dee2e6; width:80%; margin: auto; height: 350px;">
<div class="form-group row">
<div class="col-3">
 <img src="/image/${result.bPic1}" class="d-block w-100" alt="..." id="design" style="margin-top: 50px;">
</div>
<div class="col-3" style="margin-top: 120px;">
 <h5><b>제목:</b>&nbsp;&nbsp;${result.bTitle} </h5><br>
 <h5><b>작성자:</b>&nbsp;&nbsp;${result.uId} </h5>
</div>
<div class="col-3" style="margin-top: 140px;">
  <h5><b style="font-size: xx-large; color: #007bff;">결제금액:&nbsp;&nbsp;${result.bPrice} &nbsp;원</b></h5><br>
</div>
<div class="col-3" style="margin-top: 120px;">
<h5><b>현재 포인트 :</b>&nbsp;&nbsp;${point.rPoint} &nbsp;원</h5><br>
 <h5><b>구매 후 포인트 :</b>&nbsp;&nbsp;${point.rPoint - result.bPrice} &nbsp;원</h5>
</div>
</div>
</div>
<script>
$(function() {
	$("#payMsg").click(function() {
		 location.href='userBuy.do?b_num='+ ${result.bNum} + '&buyPrice=' + ${result.bPrice};
	});
	});
	
$(function() {
	$("#delMsg").click(function() {
		history.back();
	});
	});
</script>
<div style="margin-left: 880px; margin-top:80px;">
<button type="button" class="btn btn-outline-primary" id="payMsg" style="width: 10%; height:50px;">결제</button>
<button type="button" class="btn btn-outline-danger" id="delMsg" style="margin-left: 10px; width: 10%; height:50px;">취소</button>
</div>

<%@ include file="footer.jsp" %>