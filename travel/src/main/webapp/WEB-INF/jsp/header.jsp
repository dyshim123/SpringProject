<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<script src="../../assets/js/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../../assets/css/header.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="../../assets/bootstrap-4.1.0/css/bootstrap.min.css">
</head>
<body>
	<nav class="navbar  bnav">
		<div class="container-fluid">
			<a href="indexPage.do"> <img src="images/main.png"></a>
			<div>
			<c:choose>
			 <c:when test="${sessionScope.u_id == null }">
				<ul class="nav navbar-right">
					<li class="h_set"><a class="nav-link disabled"
						data-toggle="modal" data-target="#myModal">로그인</a></li>
					<li class="h_set"><a class="nav-link disabled"
						data-toggle="modal" data-target="#joinModal">회원가입</a></li>
				</ul>
				<!-- Modal -->
				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header" style="padding: 35px 50px;">

								<h1>Login</h1>
							</div>
							<div class="modal-body" style="padding: 40px 50px;"><!--  method="post" -->
								<form name="form1" method="post">
									<div class="form-group">
										<label for="usrname"><span
											class="glyphicon glyphicon-user"></span> ID</label> <input
											type="text" class="form-control" id="u_Id" name="uId"
											placeholder="아이디">  <!-- onkeydown="inputIdChk()" -->
									</div>

									<div class="form-group">
										<label for="psw"><span
											class="glyphicon glyphicon-eye-open"></span> Password</label> <input
											type="password" class="form-control" id="uPwd" name="uPwd"
											placeholder="비밀번호">
									</div>


									<button type="button" class="btn btn-ff btn-block" id="btnLogin">
										<span class="glyphicon glyphicon-off"></span> Login
									</button>
								</form>
							</div>
							<div class="modal-footer">
								<p>
									Forgot <a href="searchIdForm.do">ID? or Password?</a>
								</p>
							</div>
						</div>

					</div>
				</div>
			</div>
			<script>
			$(document).ready(function() {
				$("#btnLogin").click(function() {
					var uId = $("#u_Id").val();
					var uPwd = $("#uPwd").val();
					if(uId == "") {
						alert("아이디입력");
						$("#uId").focus();
						return;
					}
					if(uPwd == "") {
						alert("비밀번호입력");
						$("#uPwd").focus();
						return;
					}
					document.form1.action="loginCheck.do";
					document.form1.submit();
				});
			});
			
			
			$(document).ready(function() {
					$("#myBtn").click(function() {
						$("#myModal").modal();
					});
				});
	</script>
	<script  type="text/javascript">
	$(function() {
		$("#idck").click(function() {
			 	var uId = $("#uId").val();
				if(uId == "") {
					alert("아이디입력");
					$("#uId").focus();
					return;
				}
			var formData = new FormData();
			formData.append("uId", $('#uId').val());
			//alert(formData);
			$.ajax({
				type : "POST",
				url : 'idcheck.do',
			    dataType : "text",
				processData : false,
				contentType : false,
				data : formData,
				success : function(data) { //요청에 성공햇을 떄 행위
					if (data != "") {
						alert("이미 사용중인 ID입니다.");
						$("#sub").attr("disabled", "disabled");
					} else {
						alert("사용가능한 ID입니다.");
						$("#sub").removeAttr("disabled");
					}
				},
				 error : function(request, status, error) {
					    if (request.status != '0') {
					     alert("code : " + request.status + "\r\nmessage : "
					       + request.reponseText + "\r\nerror : " + error);
					    }
					   }
			});
		});
	});
	</script>
			<!-- joinModal -->
			<div class="modal fade" id="joinModal" role="dialog">
			<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header" style="padding: 35px 50px;">

				<h1>회원가입</h1>
			</div>
			<div class="modal-body" style="padding: 40px 50px;">
				<form name="form2" action="insertUserVo.do" method="post">
					<div class="form-group">
						<label for="user_id"><span
							class="glyphicon glyphicon-user"></span> ID (*중복확인을 꼭 해주세요*)</label> 
							<input type="text" class="form-control" id="uId" name="uId" placeholder="아이디" required>
							<input type="button" id="idck" name="idck" class="btn btn-ff btn-block" value="중복확인">
					</div>
					<div class="form-group">
						<label for="psw"><span
							class="glyphicon glyphicon-eye-open"></span> Password</label> <input
							type="password" class="form-control" id="uPwd" name="uPwd"
							placeholder="비밀번호" required>
					</div>
					<div class="form-group">
						<label for="name"><span
							class="glyphicon glyphicon-eye-open"></span> name</label> <input
							type="text" class="form-control" id="uName" name="uName"
							placeholder="이름" required>
					</div>
					<div class="form-group">
						<label for="age"><span
							class="glyphicon glyphicon-eye-open"></span> Age</label> <input
							type="text" class="form-control" id="uAge" name="uAge"
							placeholder="나이" required>
					</div>
					<div class="form-group">
						<label for="phone"><span
							class="glyphicon glyphicon-eye-open"></span> Phone</label> <input
							type="text" class="form-control" id="uPhone" name="uPhone"
							placeholder="전화번호" required>
					</div>
					<div class="form-group">
						<label for="email"><span
							class="glyphicon glyphicon-eye-open"></span> Email (*구글이메일을 사용하시기 바랍니다.*)</label> <input
							type="email" class="form-control" id="uEmail" name="uEmail"
							placeholder="이메일" required>
					</div>
					<div class="form-group">
						<label for="gender"><span
							class="glyphicon glyphicon-eye-open"></span> Gender</label>

						<div class="btn-group col-sm-8" data-toggle="buttons">
							<label class="btn btn-primary active"> <input
								type="radio" name="uGender" autocomplete="off" value="여자"
								checked style="-webkit-appearance: button;">여자
							</label> <label class="btn btn-primary"> <input type="radio"
								name="uGender" autocomplete="off" value="남자" style="-webkit-appearance: button;">남자
							</label>
						</div>
					</div>
					<button id="sub" class="btn btn-ff btn-block" disabled="disabled">
						<span class="glyphicon glyphicon-off"></span> join
					</button>
				</form>
			</div>
		</div>
	</div>
			</div>
		</div>
		<script>
		$(document).ready(function() {
			$("#sub").click(function() {
				document.form2.action="insertUserVo.do";
			});
		});
		
			$(document).ready(function() {
				$("#joinBtn").click(function() {
					$("#joinModal").modal();
				});
			});
		</script>
	</c:when>
	<c:when test="${sessionScope.u_id == '관리자'}">
	 <ul class="nav navbar-right">
		<li><div class="nav-link disabled">${sessionScope.u_id}님 환영합니다!</div></li>
		 <li><a class="nav-link disabled" href="managerlogin/main.do">관리자 페이지</a></li>
		 <li><a class="nav-link disabled" href="logout.do">로그아웃</a></li>
		 </ul>	
	</c:when>
	<c:otherwise>
	 <ul class="nav navbar-right">
			<li><div class="nav-link disabled">${sessionScope.u_id}님 환영합니다!</div></li>
	       <li><a class="nav-link disabled" href="myPage.do">마이페이지</a></li>	
	       <li><a class="nav-link disabled" href="logout.do">로그아웃</a></li>	
	       </ul>
	 </c:otherwise>
	 </c:choose>
	</nav>