<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="header.jsp" %>    
<meta charset="UTF-8">
<title>Insert title here</title>
<br><br>
<div style="display: inline-table; width:70%; margin-left:450px;">
	<div class="col-md-12 text-center" id="pad">
		<nav class="nav-justified ">
			<div class="nav nav-tabs " id="nav-tab" role="tablist">
				<a class="nav-item nav-link active" id="pop2-tab" data-toggle="tab"
					href="#pop2" role="tab" aria-controls="pop2" aria-selected="false">승인 상품</a>
				<a class="nav-item nav-link" id="pop1-tab" data-toggle="tab"
					href="#pop1" role="tab" aria-controls="pop1" aria-selected="true">미승인 상품</a>
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
								<th scope="col"  style="width: 8%; vertical-align: middle;">글번호</th>
								<th scope="col" style="width: 25%;vertical-align: middle;">글제목</th>
								<th scope="col" style="width: 13%;vertical-align: middle;">글카테</th>
								<th scope="col" style="width: 13%;vertical-align: middle;">일수</th>
								<th scope="col" style="text-align: right; width: 25%; vertical-align: middle;">등록날짜</th>
								<th scope="col" style="width: 15%;vertical-align: middle;">처리상태</th>
							</tr>
						</thead>
						<tbody>
						 <c:forEach var="list" items="${list}">
							<tr style="background-color: #ffffff;">
							<td>${list.bNum}</td>
								<td><a href="/manager/buyPro.do?bNum=${list.bNum}">${list.bTitle}</a></td>
								<td class="txt_line"><div id="main_div">${list.bCate}</div></td>
								<td><div id="main_div">${list.bDay1} 박  ${list.bDay2} 일</div></td>
								<td  style="text-align: right;">${list.bCreateDt}</td>
								<td class="txt_line"><a href="/manager/apprUpdate.do?bNum=${list.bNum}"><b>${list.appr}</b></a>
								<a href="/manager/boarddelete.do?bNum=${list.bNum}" style=" margin-left: 15px;">삭제</a>
								</td>
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
								<th scope="col"  style="width: 8%; vertical-align: middle;">글번호</th>
								<th scope="col" style="width: 25%;vertical-align: middle;">글제목</th>
								<th scope="col" style="width: 13%;vertical-align: middle;">글카테</th>
								<th scope="col" style="width: 13%;vertical-align: middle;">일수</th>
								<th scope="col" style="text-align: right; width: 25%; vertical-align: middle;">등록날짜</th>
								<th scope="col" style="width: 15%;vertical-align: middle;">처리상태</th>
							</tr>
						</thead>
						<tbody>
						 <c:forEach var="list" items="${lists}">
							<tr style="background-color: #ffffff;">
							<td>${list.bNum}</td>
								<td><a href="/manager/buyPro.do?bNum=${list.bNum}">${list.bTitle}</a></td>
								<td class="txt_line"><div id="main_div">${list.bCate}</div></td>
								<td><div id="main_div">${list.bDay1} 박  ${list.bDay2} 일</div></td>
								<td  style="text-align: right;">${list.bCreateDt}</td>
								<td class="txt_line"><b>${list.appr}</b><a href="/manager/boarddelete.do?bNum=${list.bNum}" style=" margin-left: 15px;">삭제</a></td>
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
<%@ include file="footer.jsp" %>