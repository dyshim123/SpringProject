<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="header.jsp" %>    
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../../assets/css/jquery.modal.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<br><br>
<div style="display: inline-table; width:70%; margin-left:450px;">
	<div class="col-md-12 text-center" id="pad">
		<nav class="nav-justified ">
			<div class="nav nav-tabs " id="nav-tab" role="tablist">
				<a class="nav-item nav-link active" id="pop2-tab" data-toggle="tab"
					href="#pop2" role="tab" aria-controls="pop2" aria-selected="false">보낸 쪽지</a>
				<a class="nav-item nav-link" id="pop1-tab" data-toggle="tab"
					href="#pop1" role="tab" aria-controls="pop1" aria-selected="true">받은 쪽지</a>
			</div>
		</nav>
	</div><br><br>
	<div class="tab-content" id="nav-tabContent">
		<div class="tab-pane fade " id="pop1" role="tabpanel"
			aria-labelledby="pop1-tab">
			<div class="pt-3">
				<div> <!-- onclick="delMsg()" -->
					</div>
					<table class="table table-header-rotated">
					<thead>
							<tr>
								<th scope="col"  style="width: 8%; vertical-align: middle;">번호</th>
								<th scope="col" style="width: 15%;vertical-align: middle;">보낸이</th>
								<th scope="col" style="width: 25%;vertical-align: middle;">제목</th>
								<th scope="col" style="width: 25%;vertical-align: middle;">내용</th>
								<th scope="col" style="text-align: right; width: 25%; vertical-align: middle;">등록날짜</th>
							</tr>
						</thead>
						<tbody>
						  <c:forEach var="list" items="${lists}">
							<tr style="background-color: #ffffff;">
							    <td>${list.mNum}</td>
								<td class="txt_line"><div id="main_div">${list.uId}</div></td>
								<td class="txt_line"><div id="main_div">${list.mSid}</div></td>
								<td><div id="main_div"><a href="/manager/replymsg.do?mNum=${list.mNum}"
										rel="modal2:open"> ${list.mContent}</a></div></td>
								<td  style="text-align: right;">${list.mDate}</td>
							</tr>
							</c:forEach> 
						</tbody>
					</table>
			
			</div>
		</div>
	
		<div class="tab-pane fade show active" id="pop2" role="tabpanel"
			aria-labelledby="pop2-tab">
			<div class="pt-3">
				<table class="table">
						<thead>
							<tr>
								<th scope="col"  style="width: 8%; vertical-align: middle;">번호</th>
								<th scope="col" style="width: 15%;vertical-align: middle;">받는이</th>
								<th scope="col" style="width: 25%;vertical-align: middle;">제목</th>
								<th scope="col" style="width: 25%;vertical-align: middle;">내용</th>
								<th scope="col" style="text-align: right; width: 25%; vertical-align: middle;">등록날짜</th>
							</tr>
						</thead>
						<tbody>
						 <c:forEach var="list" items="${list}">
							<tr style="background-color: #ffffff;">
							    <td>${list.mNum}</td>
								<td class="txt_line"><div id="main_div">${list.sId}</div></td>
								<td class="txt_line"><div id="main_div">${list.mSid}</div></td>
								<td><div id="main_div"><a href="/manager/sendmsg.do?mNum=${list.mNum}"
										rel="modal2:open"> ${list.mContent}</a></div></td>
								<td  style="text-align: right;">${list.mDate}</td>
							</tr>
							</c:forEach> 
						</tbody>
				</table>
			</div>
		</div>
	</div>

	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalCenterTitle">삭제완료</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">,,</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	</div>
<link rel="stylesheet" media="(max-width: 320px)" />
<script src="../../../assets/js/jquery.min.js"></script>
<script src="../../../assets/js/jquery.dropotron.min.js"></script>
<script src="../../../assets/bootstrap-4.1.0/js/bootstrap.min.js"></script> 
	<script src="../../../assets/js/jquery.modal.js"></script>
<%@ include file="footer.jsp" %>