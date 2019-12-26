<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="header.jsp" %>   
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table class="table" style="display: inline-table; width:70%; margin-left:450px;">
		<thead>
			<tr>
				<th scope="col" style=" vertical-align: middle;">글번호</th>
				<th scope="col" style=" vertical-align: middle;">수정 내역</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var ="listq" items="${lista}">
			<tr style="background-color: #ffffff;">
				<td><button>${listq.bNum}</button></td>
				<td><a href="/manager/userUpdate.do?bNum=${listq.bNum}">삭제</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
<%@ include file="footer.jsp" %>