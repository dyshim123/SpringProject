<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<c:set var="list" value="${list}"/>
  <div class="form-group row">
<label class="col-sm-6" style="text-align: left; font-size: 1.5em;">
받는이: ${list.sId}</label>
<label class="col-sm-6" style="text-align: right; font-size: 1.5em;">${list.mDate}</label></div>
<br><br><br>
<div class="form-group row" style="margin-bottom: 50px;">
 <div class="col-2" style="font-size: 1.5em; color:#007bff;"><b>제목:</b></div>
  <div class="col-6" style="font-size: 1.5em;">${list.mSid}</div>
 </div>
 <div class="form-group row" style="margin-bottom: 10px;">
 <div class="col-2" style="font-size: 1.5em; color:#007bff;"><b>내용</b></div></div>
  <div class="form-group row" style="margin-bottom: 30px;">
  <div class="col-6" style="font-size: 1.5em;">${list.mContent}</div>
 </div>