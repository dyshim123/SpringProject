<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="../../../assets/css/main.css" />
  <c:set var="list" value="${list}"/>
  <div class="form-group row">
<label class="col-sm-6" style="text-align: left; font-size: 1.5em;">
받는이: ${list.uId}</label>
<label class="col-sm-6" style="text-align: right; font-size: 1.5em;">${list.mDate}</label></div>
<div class="form-group row" style="margin-bottom: 10px;">
 <div class="col-2" style="font-size: 1.5em; color:#007bff;"><b>제목:</b></div>
  <div class="col-6" style="font-size: 1.5em;">${list.mSid}</div>
 </div>
 <div class="form-group row" style="margin-bottom: 20px;">
 <div class="col-2" style="font-size: 1.5em; color:#007bff;"><b>내용</b></div></div>
  <div class="form-group row" style="margin-bottom: 30px;">
  <div class="col-6" style="font-size: 1.5em;">${list.mContent}</div>
 </div>
 <div style="font-size: 1.5em; color:#007bff;"><b>&nbsp;&nbsp;답장</b></div><br>
 <form name="replyMsgForm" method="post" action="/manager/messagereply.do">
 <input type="hidden" name="sId" value=" ${list.uId}"/>
 <div class="form-group row" style="margin-bottom: 20px;">
<input type="text" name="mSid" id="mSid" required="required" class="s_form s_form-input"  placeholder="제목을 입력하세요" style="width:50%; margin-top: 10px; margin-left:30px;"/>
</div>
 <div class="form-group row" style="margin-bottom: 10px;">
 <textarea name="mContent" id="mContent" cols="20" rows="5" placeholder="내용을 입력하세요" style="margin-top: 20px; width:90%; height:200px; margin-left:30px;"></textarea>
</div><br><br>
<div class="form-group row" style="margin-bottom: 10px;">
<button type="submit" style="margin: auto; width: 13%; padding-right: 35px;">답장</button>
</div>
</form>
</html>