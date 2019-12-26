<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<title>관리자 페이지</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../../../assets/manager/css/main.css" />
<link rel="stylesheet" href="../../../assets/manager/css/navbar.css" />
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:300' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="../../../assets/bootstrap-4.1.0/css/bootstrap.min.css">
</head>
<style>
.btn-default {
color: #ffffff;
background-color: #E2F4E5;
border-color: #ccc;
}

.btn {
display: inline-block;
padding: 6px 12px;
margin-bottom: 0;
font-size: 14px;
font-weight: 400;
line-height: 1.42857143;
text-align: center;
white-space: nowrap;
vertical-align: middle;
cursor: pointer;
-webkit-user-select: none;
-moz-user-select: none;
-ms-user-select: none;
user-select: none;
background-image: none;
border: 1px solid transparent;
border-radius: 4px;
}

#page-content-wrapper {
width: 100%;
padding: 15px;
}

#page-content-wrapper {
padding: 20px;
}

.sidebar {
  list-style-type:none;
  background-color:#E2F4E5;
  width:17%;
  height:100%;
  top:0;
  bottom:0;
  left:0;
  text-align:left;
  position: absolute;
  margin: 0;
  padding: 0;
  list-style: none;
  transition:1s ease;
}

.sidebar a {
  text-decoration:none;
  color:#6c757d;
  transition:1s ease;
}

.sidebar li {
  text-indent: 20px;
  line-height: 40px;
  transition:0.5s ease;
}

.sidebar li:hover {
  background-color:#b5e3ba;
  cursor:pointer;
  text-indent: 30px;
}

.sidebar > .sidebar-brand {
height: 65px;
line-height: 60px;
}

 #hing {
 margin-bottom: 15px; margin-top:15px; font-size: 1.5rem; 
 } 

	</style>
<body>
<c:choose>
 <c:when test="${sessionScope.u_id != null }">
	<section id="nnaa">
		<a href="/managerlogin/main.do?name= ${sessionScope.u_id}" class="lolo"><img src="../../../assets/manager/images/main.png" style="width: 300px;"></a>
		<div class="alignid" style="color:#000000; margin-left: 30px; font-size: 1.4rem;">${sessionScope.u_id}
			<a href="/logout.do" class="sp"><i
				class="fa fa-sign-out" style="color:#000000; font-size: 1.4rem;"></i></a>
		</div><div class="alignid" style="margin-top: 9px; font-size: 1.4rem;"><a href="/indexPage.do">메인으로</a></div>
	</section>
<script>
var a =" ${msg}";
if (a != null && a != " "){
alert(a);
location.href="loginForm.do";

}
</script>

  <ul class="sidebar" style="margin-top: 70px; height: 1000px; text-align:center;">
      <li class="sidebar-brand" id="hing"><a href="/manager/user.do" ><b>회원 관리</b></a></li>
      <li class="sidebar-brand" id="hing"><a href="/manager/board.do"><b>게시물 관리</b></a>
      </li>
      <li class="sidebar-brand" id="hing"><a href="/manager/message.do"><b>쪽지 관리</b></a>
      </li>
      </ul>
      
      </c:when>
<c:otherwise></c:otherwise>
</c:choose>

	
	