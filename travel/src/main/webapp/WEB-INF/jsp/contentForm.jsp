<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />

<title>Insert title here</title>
<link rel="stylesheet" href="../../assets/css/content.css" />
<link rel="stylesheet" href="../../assets/css/writeForm.css" />
<%@ include file="header.jsp"%>
<style>
.butt{
   width:100px;
   height:50px;
   border-radius:0;
   float:left;
   margin:10px;
}
.butt1{
   margin-left:280px;
   margin-top:50px;
}

</style>

</head>
<body>
<br><br><br>
<div class="container">

   <c:set var="result" value="${result}"/>
   <c:set var="results" value="${results}"/>
<div class="form-group row">
  <div class="col-7">
     <div id="carouselExampleControls" class="carousel slide" data-ride="carousel" >
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="/image/${result.bPic1}" class="d-block w-100" alt="..." style="max-width:800px; height:400px;">
	    </div>
	    <div class="carousel-item">
	      <img src="/image/${result.bPic2}" class="d-block w-100" alt="..." style="max-width:800px; height:400px;">
	    </div>
	    <div class="carousel-item">
	      <img src="/image/${result.bPic3}" class="d-block w-100" alt="..." style="max-width:800px; height:400px;">
	    </div>
	  </div>
	  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="sr-only">Previous</span>
	  </a>
	  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="sr-only">Next</span>
	  </a>
   </div>
 </div>
      <div class="col-5">
            <div class="card">
               <div class="card-body">
                
                     <div class="row">
                      <div class="col-md-5">
                        <h3 style="font-weight: bold;">
                           [${result.bCate}]
                        </h3></div> <div class="col-md-7">
                        <h3> ${result.bTitle}</h3>
                     </div></div>
                     <div class="row">
                        <div class="col-md-7">
                           <h5>
                              <a class="a" data-toggle="modal" data-target="#exampleModal"><b>${result.uId}</b>&nbsp;&nbsp;
                                 <img src="images/message.png" width="30px"></a>
                           </h5>
                        </div>
                        <div class="col-md-5" align="right">
                              <div class="stco"><h4>★총점: ${count} </h4></div>
 
                        </div>
                     </div>
                     <hr>
                     <br>
                     <div class="row">
                        <div class="col-md-7">
                           <h5>
                              <b>여행지역</b>
                           </h5>
                        </div>
                        <div class="col-md-5" align="right">
                           <div>
                              <h5>${result.bLo}</h5>
                           </div>
                        </div>
                     </div>
                     <div class="row">
                        <div class="col-md-7">
                           <h5>
                              <b>교통수단</b>
                           </h5>
                        </div>
                        <div class="col-md-5" align="right">
                           <h5>${result.bTr}</h5>
                        </div>
                     </div>
                     <div class="row" >
                        <div class="col-md-7">
                           <h5>
                              <b>예상일수</b>
                           </h5>
                        </div>
                        <div class="col-md-5" align="right">
                           <h5>${result.bDay1}박 ${result.bDay2}일 
                           <c:if test="${result.bOne != null}">
                            <c:out value="${result.bOne}" />
                             </c:if>

                           </h5>
                        </div>
                     </div>
                     <div class="row">
                        <div class="col-md-7">
                           <h3 style="font-weight: bold;">예상경비</h3>
                        </div>
                        <div align="right" class="col-md-5">
                           <h3 style="font-weight: bold; color: #2c96ed;">${result.bAc}
                           </h3>
                        </div>
                     </div>
                
               </div>
            </div>
            </div>
 </div>
     
         <script type="text/javascript">
   function sendMsg() {
      var form_data = new FormData();
      form_data.append("bNum","${param.b_num}");
      form_data.append("uId","  ${sessionScope.u_id}");
      form_data.append("mContent", $("#mContent").val());
      form_data.append("mSid", $("#mSid").val());
      form_data.append("sId", $("#sId").val());
      
      $.ajax({
          data: form_data,
           type: "POST",
           url: 'messagePro.do',
           cache: false,
           contentType: false,
           processData: false,         
          success: function(Data) {
        	  alert("쪽지를 보냈습니다.");
        	  history.go(0);
             
          },
         error: function(request, status, error){
         alert("메시지 전송을 실패하였습니다.");

         }
      });
      return false;
   }
</script>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
         <div class="modal-content" >
            <div class="modal-header">
               <h5 class="modal-title" id="exampleModalLabel">쪽지 보내기</h5>
               <button type="button" class="close" data-dismiss="modal"aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <form id="contact-us" onsubmit="return false;">
                  <div class="col-xs-6 wow animated slideInLeft" data-wow-delay=".5s">
                    <table>
                          <tr><td>
                     <input type="text" name="mSid" id="mSid" required="required" class="s_form s_form-input" placeholder="제목을 입력하세요"
                     style="border-radius: 6px; border: solid 1px #e5e5e5; margin-bottom:20px;padding-left:20px;width: 50%;height:40px;" /></td>
                     <td><input type="text" name="sId" id="sId" class="s_form s_form-input" value="${result.uId}"
                     style="margin-left: -90px; margin-top:-20px; width:100px; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" readonly/></td></tr>
                     <tr><td><textarea name="mContent" id="mContent" class="s_form s_textarea" placeholder="내용을 입럭하세요"
                       style="border-radius: 6px; border: solid 1px #e5e5e5; width:460px;height:200px;"></textarea></td></tr></table><br>
                     <input type="hidden" name="uId" id="uId" class="s_form s_form-input" />
                     <button type="submit" id="submit" name="submit" onclick="sendMsg();" class="s_form-btn semibold"
                     style="border-radius: 5px; border:1px solid #2C96ED;">보내기</button>
                     
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div><br>
   <!-- 지도 -->
<div class="out" id="map" style="height:350px;">
   <script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fd6857e52f9e9cc4d68b949a22e061d1&libraries=services"></script>
   <script>
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
            mapOption = { 
                center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };
            
            var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
        </script>
   <script type="text/javascript">
function setPosMap(addr, nday){
   // 주소-좌표 변환 객체를 생성합니다
   var geocoder = new daum.maps.services.Geocoder();

   geocoder.addressSearch(addr, function(result, status) {

       // 정상적으로 검색이 완료됐으면 
        if (status === daum.maps.services.Status.OK) {

           var coords = new daum.maps.LatLng(result[0].y, result[0].x);

           // 결과값으로 받은 위치를 마커로 표시합니다
           var marker = new daum.maps.Marker({
               map: map,
               position: coords
           });

           // 인포윈도우로 장소에 대한 설명을 표시합니다
           var infowindow = new daum.maps.InfoWindow({
               content: '<div style="width:150px;text-align:center;padding:6px 0;">'+nday+'박 여행지</div>'
           });
           infowindow.open(map, marker);

           // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
           map.setCenter(coords);
       } 
   });    
}
</script>
</div>   
<section class="design-process-section" id="process-tab">
   <div class="container">
      <div class="row">
         <div class="col-12">
            <ul class="process-model more-icon-preocess " role="tablist" style="text-align:center;">
              <c:forEach var="i" begin="0" end="${result.bDay2-1}">
               <li role="presentation" class="active">
               <a href="#discover" aria-controls="discover" role="tab" data-toggle="tab"><i id="bb${i}" aria-hidden="true" onclick="show_hide(${i})">${i+1}일차</i></a></li>
            </c:forEach>
            </ul><!-- 'display', '' -->  
       <script type="text/javascript">
            function show_hide(idx){
               var div_id = 'strategy';
               
               for(var k=0; k < ${result.bDay2}; k++){
                  if(idx == (k)){
                     $('#strategy'+k).css('display', '');
                     $('#bb'+k).css('background', '#2C96ED');
                  }else{
                     $('#strategy'+k).css('display', 'none');
                     $('#bb'+k).css('background', '');
                  }
               }
               var addr = $('#addr'+idx).val();
               setPosMap(addr, (idx+1)+'');
            }
           </script>

            <div class="tab-content">
                         <div role="tabpanel" class="tab-pane active" id="discover">
                       
                        <c:forEach items="${results}" var="results" varStatus="status">
                          <c:forEach var="i" begin="0" end="${result.bDay2}">
                            <c:if test="${status.index eq i}">
                             <div role="tabpanel" class="tab-pane" id="strategy${i}" style="display: none;">
                                <h3 class="semi-bold" style=" margin-top:30px;">${i+1}일차 &nbsp; (주소: ${results.bPost}) </h3>
                                <input type="hidden" id="addr${i}" value=" ${results.bPost}">
                                <br>
                               <div class="form-group row" style="text-align: center;">
		<div class="col-sm-3"><img src="images/trav.png" style="max-width: 30%;"><h5><label for="b_trav" class="col-form-label">여행비</label></h5></div>
		<div class="col-sm-3"><img src="images/food.png" style="max-width: 30%;"><h5><label for="b_food" class="col-form-label">식비</label></h5></div>
		<div class="col-sm-3"><img src="images/trans.png" style="max-width: 30%;"><h5><label for="b_trans" class="col-form-label">교통비</label></h5></div>
		<div class="col-sm-3"><img src="images/stay.png" style="max-width: 30%;"><h5><label for="b_stay" class="col-form-label">숙박비</label></h5></div>
		</div>  
                    <div class="form-group row" style="text-align: center;">
		             <div class="col-sm-3" ><h2>${results.bTrav} 원</h2></div>
                    <div class="col-sm-3" ><h2>${results.bFood} 원</h2></div>
                         <div class="col-sm-3" ><h2>${results.bTrans} 원</h2> </div>
                       <div class="col-sm-3" ><h2>${results.bStay} 원</h2></div>
                       <br><br><br><br><br>
                     </div>
                          ${results.bCont}
                             </div>
                             </c:if>
                             </c:forEach>
                   </c:forEach>
                        </div>
                   </div>
             </div>
       </div>
   </div>
</section>
<script>
 function del() {
		alert("삭제되었습니다.");
		location.href = 'delForm.do?b_num=${param.b_num}';
	}
</script>
<div class="row butt1">
<div class="col-md-6" style="margin-left: 65px;">
 <c:if test="${result.uId == sessionScope.u_id}">
   <button id="br" class="butt" style="float: center; padding:0.7em;" onclick= "del()">삭제</button> 
  <button id="br" class="butt" style="float: center; padding:0.7em;" onclick= "location.href = 'updateForm.do?b_num=${param.b_num}'">수정</button>                   
  </c:if>
  <button id="br" class="butt"style="float: center; padding:0.7em;" onclick= "location.href = 'detail.do?&lotation=&day=&trans=&cost=&tema=&search='">목록</button>
</div>
</div>
</div><br><br><hr><br>
<!-- 후기 -->
<form method="post" action="commnetWrite.do?b_num=${param.b_num}" enctype="multipart/form-data">
<input type="hidden" name="u_id" value="${sessionScope.u_id}"> 
<input type="hidden" name="b_num" value="${param.b_num}"> 
<input type="hidden" name="c_id" value="${sessionScope.u_id}">
   <div class="container">
      <h3>
         <b>후기 (${fn:length(comment)})</b>
      </h3>
      <div class="stco"><h4>총점: ( ${count} ) ★★★★★ </h4></div><br>
      <!-- if문시작 -->
       <c:if test="${sessionScope.u_id != result.uId}">
      <div>
         <h2>${sessionScope.u_id}
            <span class="star"> <span class="input"> <input
                  type="radio" name="Star" value="1" id="p1"> <label
                  for="p1">1</label> <input type="radio" name="Star" value="2"
                  id="p2"> <label for="p2">2</label> <input type="radio"
                  name="Star" value="3" id="p3"> <label for="p3">3</label> <input
                  type="radio" name="Star" value="4" id="p4"> <label
                  for="p4">4</label> <input type="radio" name="Star" value="5"
                  id="p5" checked="checked"> <label for="p5">5</label>
            </span>
            </span>
         </h2>
      </div>
      <textarea name="cContent" required="required"></textarea>
      <br>
      <div class="form-group">
         <input type="file" name="cPic" id="file" class="input-file">
         <label for="file" class="btn btn-tertiary js-labelFile"> <i
            class="fa fa-camera"></i> <span class="js-fileName">사진추가</span>
         </label>
      </div>
      <button type="submit" id="br">등록</button>
       </c:if>
      <br> <br> <br>
          <div id="line"></div> 
      
       <!-- if문끝 -->  
     
       <!-- for문 시작 -->
   <c:forEach items="${comment}" var="comment"> 
        
<div id="conid${comment.cNum}">
      <div class="stco1">
         <h4>${comment.cId}</h4>
      </div>
      <div class="stco">  <c:if test="${comment.star eq '5'}">★★★★★</c:if>
   <c:if test="${comment.star eq '4'}">★★★★</c:if>
   <c:if test="${comment.star eq '3'}">★★★</c:if> 
    <c:if test="${comment.star eq '2'}">★★</c:if> 
     <c:if test="${comment.star eq '1'}">★</c:if> 
     </div>
      <br>
      <div class="stco2">${comment.cReg}</div>
      <br><br><br>
      <div id="cc${comment.cNum}">
         <h4>${comment.cContent}</h4>
      </div><br><br>
       <c:if test="${comment.cPic != null}">
       <div>
          <img class="cimg" src="/image/${comment.cPic}" alt="">    </div> 
       </c:if> 
       </div>
       <c:if test="${sessionScope.u_id == comment.cId}">
   <div id="cc1">
   <input type="button" class="btn btn-link" value="수정" onclick="upda(${comment.cNum},${comment.bNum});">
      <input type="button" class="btn btn-link" value="삭제" onclick="dell(${comment.cNum},${comment.bNum});">
   </div>
   <div id="in${comment.cNum}"></div>
  </c:if>
   <div id="cc1">
  <c:if test="${sessionScope.u_id == '관리자'}">
  <input type="button" class="btn btn-link" value="삭제" onclick="dell(${comment.cNum},${comment.bNum});">
  </c:if></div>
   <br>

   <div id="line"></div>
   </c:forEach>
</div>


</form>

<!-- for문 끝 -->
<br><br><br>
<script>
$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {

    var href = $(e.target).attr('href');
    var $curr = $(".process-model  a[href='" + href + "']").parent();

    $('.process-model li').removeClass();

    $curr.addClass("active");
    $curr.prevAll().addClass("visited");
});
//end  script for tab steps
function dell(c_num,b_num){
   if (confirm("정말 삭제하시겠습니까??") == true){    //확인
      location.href ="cdelete.do?c_num="+c_num+"&b_num="+b_num;
   }else{   //취소
       return;
   }
}

show_hide(0);

var c="";
var b="";
function upda(c_num,b_num){
	 c=c_num;b=b_num;
   document.getElementById("in"+c_num).innerHTML = "" ;
   var append =  $("#upda").html(); 
   $("#in"+c_num).append(append);
  
   var str =document.getElementById("cc"+c_num).innerHTML;
   var string1=str.substring(14,str.length-12);
   document.getElementById("tete1").value=string1;
  
   $("#conid"+c_num).hide();//수정버튼눌렀을때 기존 댓글 숨기기
}

function fg(){
   $("#frmSubmit").attr("action", "cupdate.do?b_num="+b+"&c_num="+c);
}
</script>  
<div id="upda">
<form method="post" id="frmSubmit" enctype="multipart/form-data">
      <div>
         <h2><%=session.getAttribute("u_id")%>
            <span class="star"> <span class="input"> <input
                  type="radio" name="Star" value="1" id="p1"> <label
                  for="p1">1</label> <input type="radio" name="Star" value="2"
                  id="p2"> <label for="p2">2</label> <input type="radio"
                  name="Star" value="3" id="p3"> <label for="p3">3</label> <input
                  type="radio" name="Star" value="4" id="p4"> <label
                  for="p4">4</label> <input type="radio" name="Star" value="5"
                  id="p5" checked="checked"> <label for="p5">5</label>
            </span>
            </span>
         </h2>
      </div>
      <textarea name="cContent" id="tete1" required="required"></textarea>
      <div class="form-group">
         <input type="file" name="c_pic1" id="file1" class="input-file1">
         <label for="file1" class="btn btn-tertiary js-labelFile"> <i
            class="fa fa-camera"></i> <span class="js-fileName1">사진추가</span>
         </label>
      </div>
      <div id="cc1">
      <button type="submit" onclick="fg();" id="br">수정</button>
      </div>
</form>
</div>   
<script src="../../assets/js/main.js"></script>
<script src="../../assets/js/star1.js"></script>
<script src="../../assets/js/jquery.min.js"></script>
<script src="../../assets/js/star.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<%@ include file="footer.jsp" %>