<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <c:set var="sendMsg" value="${sendMsg}"/>
 <div class="form-group row">
<label class="col-sm-6" style="text-align: left; font-size: 1.5em;">
받는이: ${sendMsg.sId}</label>
<label class="col-sm-6" style="text-align: right; font-size: 1.5em;">${sendMsg.mDate}</label></div>
<table>
<colgroup>
	<col width="10%">
	<col width="*%">
</colgroup>
<tr><td style="font-size: 1.5em;">
<b style="color: #007bff;">제목</b> &nbsp; ${sendMsg.mSid}</td></tr>
<tr><td style="padding-top: 20px; font-size: 1.5em; color: #007bff;">
<b>내용</b></td></tr><tr><td style="padding-top: 10px; font-size: 1.2em;"> ${sendMsg.mContent}</td></tr></table>
<br>