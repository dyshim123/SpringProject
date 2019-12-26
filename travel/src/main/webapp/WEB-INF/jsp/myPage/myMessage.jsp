<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#main_div {    width: 150px;        white-space: nowrap;    overflow: hidden;    text-overflow: ellipsis; }

</style>
<link rel="stylesheet" href="../../../assets/css/jquery.modal.css" />
	<%@ include file="myPageHeader.jsp"%>
	<script>   
	$(document).ready(function(){
	    //최상단 체크박스 클릭
	    $("input[name=all1]").click(function(){
	        //클릭되었으면
	        if($("#checkalla").prop("checked")){
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	            $("input[name=mNum]").prop("checked",true);
	            //클릭이 안되있으면
	        }
	        else{
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	            $("input[name=mNum]").prop("checked",false);
	        }
	    }) })
	    
	</script>
	<br>
	<table>
		<tr>
			<td>
				<h4>
					<b>내 쪽지함</b>
				</h4>
			</td>
			<td style="padding-left: 780px;"><a class="a"
				data-toggle="modal" data-target="#example"
				style="margin-top: 200px; cursor:pointer;">관리자한테 쪽지&nbsp;&nbsp; <img
					src="images/message.png" width="30px">
			</a></td>
		</tr>
	</table>
	<br>

	<div class="col-md-12 text-center" id="pad">
		<nav class="nav-justified ">
			<div class="nav nav-tabs " id="nav-tab" role="tablist">
				<a class="nav-item nav-link active" id="pop2-tab" data-toggle="tab"
					href="#pop2" role="tab" aria-controls="pop2" aria-selected="false">받은쪽지함</a>
				<a class="nav-item nav-link" id="pop1-tab" data-toggle="tab"
					href="#pop1" role="tab" aria-controls="pop1" aria-selected="true">보낸쪽지함</a>
			</div>
		</nav>
	</div>
	<div class="tab-content" id="nav-tabContent">
		<div class="tab-pane fade " id="pop1" role="tabpanel"
			aria-labelledby="pop1-tab">
			<div class="pt-3">
				<script>
						/* function delMsg(){
							if(!confirm('쪽지를 삭제하시겠습니까?')){
								return false;
							}
							
							delForm.submit();
						} */
						$(function() {
							$("#delMsg").click(function() {
								var arr = [];
								
								$("input[name=mNums]:checked").each(function(){
									/* arr.push($(this).val()); */
									var test = $(this).val();
									arr.push(test);
								});
				                 
							    $.ajax({
				                    url         :"mp_messageDelPro.do",
				                    traditional : true,
				                    type        :"post",
				                    data        : {
				                        main : arr
				                    },
				                    success  :   function(a){
				                       alert("정상적으로 삭제가 되었습니다.");
				                       location.href='myMessage.do';
				                    },
				                    error :   function(request, status, error){
				                        console.log("");
				                    }
				                });
							});
						});
						</script>
				<div> <!-- onclick="delMsg()" -->
					<button type="button" class="btn btn-outline-primary" id="delMsg" style="margin-left: 1020px; margin-bottom: 8px; margin-top: -8px;">삭제</button>
				</div>
				<form name="delForm" action="mp_messageDelPro.do" method="post">
					<table class="table table-header-rotated">
						<thead>
							<tr>
							    <th scope="col">선택</th>
								<th scope="col">받는이</th>
								<th scope="col">제목</th>
								<th scope="col">내용</th>
								<th scope="col" style="text-align: right;">보낸날짜</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="message" items="${message}">
							<tr>
							<td><input type="checkbox" class="chcktbl" id="de" name="mNums" value="${message.mNum}" style="margin-top: 10px;"></td>
								<td>${message.sId}</td>
								<td class="txt_line"><div id="main_div"><a href="message_views.do?mNum=${message.mNum}"
										rel="modal2:open">${message.mSid}</a></div></td>
								<td><div id="main_div">${message.mContent}</div></td>
								<td class="txt_line" style="text-align: right;">${message.mDate}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
		</div>
		<script>   
	$(document).ready(function(){
	    //최상단 체크박스 클릭
	    $("input[name=all2]").click(function(){
	        //클릭되었으면
	        if($("#checkallb").prop("checked")){
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	            $("input[name=ck2]").prop("checked",true);
	            //클릭이 안되있으면
	        }
	        else{
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	            $("input[name=ck2]").prop("checked",false);
	        }
	    }) })
	</script>
		<div class="tab-pane fade show active" id="pop2" role="tabpanel"
			aria-labelledby="pop2-tab">
			<div class="pt-3">
				<button type="button" class="btn btn-outline-primary" id="delMsg" style="margin-left: 1020px; margin-bottom: 8px; margin-top: -8px;">삭제</button>
				<table class="table">
						<thead>
							<tr>
								<th scope="col">보낸이</th>
								<th scope="col">제목</th>
								<th scope="col">내용</th>
								<th scope="col" style="text-align: right;">보낸날짜</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="messages" items="${messages}">
							<tr>
							    <td>${messages.uId}</td>
								<td class="txt_line"><div id="main_div"><a href="message_view.do?mNum=${messages.mNum}"
										rel="modal2:open">${messages.mSid}</a></div></td>
								<td><div id="main_div">${messages.mContent}</div></td>
								<td class="txt_line" style="text-align: right;">${messages.mDate}</td>
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
	<script type="text/javascript">
	function sendMsgs2() {
		var form_datas = new FormData();

		
		form_datas.append("mContent", $("#mContent").val());
		form_datas.append("mSid", $("#mSid").val());
		form_datas.append("sId", "manager");
		
	   $.ajax({
	       data: form_datas,
	        type: "POST",
	        url: 'mp_messagePro.do',
	        cache: false,
	        contentType: false,
	        processData: false,		   
	       success: function(a) {
	    	   alert("정상적으로 보냈습니다.");
	    	   location.href='myMessage.do';
	       },
		   error: function(request, status, error){
			alert("메시지 전송을 실패하였습니다.");

		   }
		});
	      
		return false;
	}

</script>
	<div class="modal fade" id="example" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">쪽지 보내기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="contact-us" onsubmit="return false;">
						<div class="col-xs-6 wow animated slideInLeft"
							data-wow-delay=".5s">
							<table>
								<tr>
									<td><input type="text" name="mSid" id="mSid"
										required="required" class="s_form s_form-input"
										placeholder="제목을 입력하세요"
										style="border-radius: 6px; border: solid 1px #e5e5e5; margin-bottom: 20px; padding-left: 20px; width: 50%; height: 40px;" /></td>
									<td><input type="text" name="sId" id="sId" value="관리자"
										style="margin-left: -90px; margin-top: -20px; width: 100px; border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;"
										readonly /></td>
								</tr>
								<tr>
									<td><textarea name="mContent" id="mContent"
											class="s_form s_textarea" placeholder="내용을 입럭하세요"
											style="padding: 0.5rem; border-radius: 6px; border: solid 1px #e5e5e5; width: 460px; height: 200px;"></textarea></td>
								</tr>
							</table>
							<br> <input type="hidden" name="uId" id="uId"
								class="s_form s_form-input" value="u_id" />
							<button type="button" id="submit" name="submit"
								onclick="sendMsgs2();" class="btn" id="mbut"
								style="margin-left: 334px; color: #2C96ED; background: none; border-radius: 5px; border: 1px solid #2C96ED;">Send
								Message</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</div>
	<script src="../../../assets/js/jquery.modal.js"></script>
	<%@ include file="myFooter.jsp"%>