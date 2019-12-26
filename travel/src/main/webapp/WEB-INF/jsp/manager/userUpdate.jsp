<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <c:forEach items="${lists}" var="lists">
  <label class="col-sm-12" style="text-align: right; font-size: 1.5em;">${lists.uReg}</label>
  <br><br>
  <form name="userUpdate" method="post" action="/manager/update.do" style=" margin-top: 70px; margin-left:150px; font-size: 1.5rem;">
 <div class="form-group row" style="margin-bottom: 50px;">
 <div class="col-4">회원 아이디:</div>
  <div class="col-6"><input type="text" value="${lists.uId}" name="uId" readonly="readonly"></div>
 </div>
  <div class="form-group row" style="margin-bottom: 50px;">
 <div class="col-4">회원 패스워드:</div>
  <div class="col-6"><input type="text" value="${lists.uPwd}" name="uPwd"></div>
 </div>
 <div class="form-group row" style="margin-bottom: 50px;">
 <div class="col-4">회원 이름:</div>
  <div class="col-6"><input type="text" value="${lists.uName}" name="uName"></div>
 </div>
 <div class="form-group row" style="margin-bottom: 50px;">
 <div class="col-4">회원 폰번호:</div>
  <div class="col-6"><input type="text" value="${lists.uPhone}" name="uPhone"></div>
 </div>
  <div class="form-group row" style="margin-bottom: 70px;">
 <div class="col-4">회원 이메일:</div>
  <div class="col-6"><input type="text" value="${lists.uEmail}" name="uEmail"></div>
 </div>
  <div class="form-group row" style="margin-bottom: 70px;">
  <div class="col-4">
  <button type="submit" style="margin: auto; float: right; height: 70px;">수정</button></div>
  <div class="col-6">
  <button type="button" style="margin: auto; height: 70px;" id="cancel">취소</button></div>
  </div>
 </form>
 <script>
 $(function() {
		$("#cancel").click(function() {
			history(-1);
		});
 });
 </script>
</c:forEach>