<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="header.jsp" %>
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:300' rel='stylesheet' type='text/css'>
  <script src="../../../assets/js/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../../../assets/css/header.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="../../../assets/bootstrap-4.1.0/css/bootstrap.min.css">
    <script type="text/javascript">

    var a = ${cate.get(2).count};
    var b = ${cate.get(1).count};
    var c = ${cate.get(3).count};
    var d = ${cate.get(4).count};
    var e = ${cate.get(5).count};
    
    var gw = ${location.get(1).locount};
    var gg = ${location.get(2).locount};
    var gs = ${location.get(3).locount};
    var bs = ${location.get(4).locount};
    var seoul = ${location.get(5).locount};
    var jeon = ${location.get(6).locount};
    var jj = ${location.get(7).locount};
    var chch = ${location.get(8).locount};
    </script>
<div id="wrapper">
      <div id="main">
         <div class="inner" style=" margin-left: 300px;">
            <div class="row">
               <div class="col-lg-4">
                  <div class="rad-info-box rad-txt-success">
                     <a href="/manager/user.do"><i class="fa fa-user" style="padding-top: 13px;"></i> <span class="heading">회원현황</span>
                        <span class="value">${fn:length(list)} 명</span></a>
                  </div>
               </div>
               <div class="col-lg-4">
                  <div class="rad-info-box rad-txt-primary">
                     <a href="/manager/board.do"><i class="fa fa-file-text" style="padding-top: 13px;"></i> <span
                        class="heading">미승인 상품</span> <span class="value">${fn:length(lists)} 개</span></a>
                  </div>
               </div>
               <div class="col-lg-4">
                  <div class="rad-info-box rad-txt-danger">
                     <a href="/manager/message.do"><i class="fa fa-commenting" style="padding-top: 11px;"></i> <span
                        class="heading">받은 쪽지</span> <span class="value">${fn:length(msg)} 개</span></a>
                  </div>
               </div>
            </div>
         </div>	
         <%--  <c:forEach items="${cate}" var="list">
         ${list.count} </c:forEach> --%>
    <%--   <c:set var="list" value="${cate}" />
    ${list.get(2).count};  --%>
    <div class="form-group row">
      <div class="col-6"><div id="containers" style="width: 65%; height: 400px; margin-left: 440px; margin-top:150px;">
         </div></div>
      <div class="col-6"> <div id="container" style="width: 70%; height: 400px; margin-left: 100px; margin-top:150px;"></div></div>
    </div>
      </div>
      </div>  
<script src="../../../assets/js/chart.jsp"></script>
<script src="../../../assets/js/circlechart.jsp"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/drilldown.js"></script>
<%@ include file="footer.jsp" %>