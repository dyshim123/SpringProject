<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="../../assets/css/circleimage.css" />
<link rel="stylesheet" href="../../assets/css/main.css" />
<link rel="stylesheet" href="../../assets/css/detail.css" />
<link href="https://unpkg.com/ionicons@4.4.4/dist/css/ionicons.min.css"
   rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.2/css/all.css">
<link rel="stylesheet" 
  href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
 
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<meta charset="UTF-8">
<title>Popularity</title>
<style>
#check {
   margin-left: auto;
   margin-right: auto;
}

#checks {
   margin-left: 670;
}

#text {
   width: 48%;
   height: 2em;
   font-size: 30px;
   font-family: fontAwesome;
   border: solid #2C96ED;
}
.ba button{
   color:#ec2d32;
   border:2px solid #ec2d32;
}
.ba1 button{
   color:#b6d2ed;
   border:2px solid #b6d2ed;
}
.ba2 button{
   color:#ec9933;
   border:2px solid #ec9933;
}
.top3{
width:100%;
   margin-left:170px;
}
.tit{
   text-align:center;
   font-size:2.8em;
}
.win{
   width:100px;
}
.win1{
  
   margin-bottom:20px;
}
.win2{
 
   margin-bottom:20px;
}
.win3{
  
   margin-bottom:20px;
}
</style>

<div class="b_container">
<div class="tit"><b>인기코스 TOP3</b></div><br><br><br><div class="form-group row" style="text-align: center;">
<div class="col-sm-4"><img src="images/first.png" class="win win1"/></div>
<div class="col-sm-4"><img src="images/second.png" class="win win2" /></div>
<div class="col-sm-4"><img src="images/third.png" class="win win3" /></div></div>
<div class="row justify-content-center">
<c:set var="loop_flags" value="true" />
	<c:forEach var="pop" items="${modalPopLists}" varStatus="roop">
		<c:if  test="${roop.count > 3}">
		<c:set var="loop_flags" value="false" />
		</c:if>
		<c:if test="${loop_flags}">
		<div class="col-lg-4">
			<!-- /.panel -->
			<div style="text-align: center; font-size: 2.2em; margin-top: -30px; color: #007bff; margin-bottom: 20px;"><b><i class="fas fa-map-marker-alt"></i>&nbsp;${pop.boardMap[0].bLo}</b></div>
			 <section class="box special" data-toggle="modal" data-target="#mainModal"onclick="show('${pop.boardMap[0].bTitle}',
                 '${pop.boardMap[0].bCate}','${pop.boardMap[0].uId}','${pop.boardMap[0].bDay1}',
                 '${pop.boardMap[0].bDay2}','${pop.boardMap[0].bAc}','${pop.boardMap[0].bPic1}',
                 '${pop.boardMap[0].bPic2}','${pop.boardMap[0].bPic3}','${pop.boardMap[0].bPrice}',
                 '${pop.boardMap[0].bLo}','${pop.boardMap[0].bNum}')">
				<span class="image featured"><img src="/image/${pop.boardMap[0].bPic1}" alt="" class="mip" /></span>
				 <div class="txt_line1" style="font-size: 20px;">${pop.boardMap[0].bTitle}</div>
			</section>
		</div>
		</c:if>
	</c:forEach>
</div><br><br><hr><br>
<div class="row" style="margin-top: 130px;">
<c:forEach var="pop" items="${modalPopLists}" varStatus="roop">
 <c:if  test="${roop.count > 3}">
<div class="col-lg-4" style="margin-bottom: 60px;">
			<!-- /.panel -->
			<div style="text-align: center; font-size: 2.2em; margin-top: -30px; color: #000000; margin-bottom: 20px;"><b><i class="fas fa-map-marker-alt"></i>&nbsp;${pop.boardMap[0].bLo}</b></div>
			 <section class="box special" data-toggle="modal" data-target="#mainModal"onclick="show('${pop.boardMap[0].bTitle}',
                 '${pop.boardMap[0].bCate}','${pop.boardMap[0].uId}','${pop.boardMap[0].bDay1}',
                 '${pop.boardMap[0].bDay2}','${pop.boardMap[0].bAc}','${pop.boardMap[0].bPic1}',
                 '${pop.boardMap[0].bPic2}','${pop.boardMap[0].bPic3}','${pop.boardMap[0].bPrice}',
                 '${pop.boardMap[0].bLo}','${pop.boardMap[0].bNum}','${sessionScope.u_id}')">
				<span class="image featured"><img src="/image/${pop.boardMap[0].bPic1}" alt="" class="mip" /></span>
				 <div class="txt_line1" style="font-size: 20px;">${pop.boardMap[0].bTitle}</div>
			</section>
		</div><br><br>
		</c:if>
</c:forEach></div>
</div>

<script type="text/javascript">
   function show(b_title, b_cate, u_id, b_day1, b_day2, b_ac, b_pic1, b_pic2,
         b_pic3, b_price, b_lo, b_num, u_ids) { 
	   
	   var list = new Array(); 
	   var lists = new Array(); 
	   <c:forEach items="${buyList}" var="item">
	   list.push("${item.bNum}");
	   </c:forEach>
	   <c:forEach items="${myWrite}" var="items">
	   lists.push("${items.bNum}");
	   </c:forEach>
	   
	   $("#title").html(b_title);
	      $("#cate").html(b_cate);
	      $("#id").html(u_id);
	      $("#day1").html(b_day1);
	      $("#day2").html(b_day2);
	      $("#ac").html(b_ac);
	      $("#price").html(b_price);
	      $("#loc").html(b_lo);
	      $("#b_num").html(b_num);
	      
	      document.getElementById('profile-upload').style.backgroundImage = 'url(/image/'
	            + b_pic1 + ')';
	      document.getElementById('profile-upload2').style.backgroundImage = 'url(/image/'
	            + b_pic2 + ')';
	      document.getElementById('profile-upload3').style.backgroundImage = 'url(/image/'
	            + b_pic3 + ')';
	      //modal을 띄워준다.
	      if(u_ids == "관리자"){
	    	  location.href = 'buyPro.do?b_num=' + b_num;
	      }else{
	    	  
	      } 
	      
	      for ( var i = 0; i < list.length; i++) {
	    	if(list[i] == b_num){
		    location.href = 'buyPro.do?b_num=' + b_num;
	    	}
		}
	    for ( var i = 0; i < lists.length; i++) {
	    	if(lists[i] == b_num){
		    location.href = 'buyPro.do?b_num=' + b_num;
	    	}
		}
	     document.getElementById("mbut").onclick = function() {
	    	 var result = confirm("구매하셔야 하는 페이지입니다. 구매하시겠습니까?");
	    	    if(result){
	    	    	 location.href = 'buycheck.do?b_num=' + b_num;
	    	    }else{
	    	    	 return;
	    	    }
      }
	   
   }
   </script>
  <div class="modal fade" id="mainModal" role="dialog">
   <div class="modal-dialog modal-lg"  style="max-width: 44%;">
      <div class="modal-content mc1">
         <div class="modal-body mb1">
            <div class="row">
               <div>
                  <br>
                  <h2 class="h2-responsive product-name">
                     <b>[</b><strong id="cate"></strong><b>]</b> <strong id="title"></strong>
                  </h2>
                  <br> <br>
                  <div id="profile-upload" class="cir"></div>
                  <div id="profile-upload2" class="cir"></div>
                  <div id="profile-upload3" class="cir"></div>

                  <table id="detata">
                     <tr>
                        <td class="mota"><img src="../../images/writer.png" id="mpicto">
                           <h6>글쓴이</h6><br>
                           <h3>
                              <strong id="id"></strong>
                           </h3></td>
                        <td class="mota"><img src="../../images/hour.png" id="mpicto">
                           <h6>예상일수</h6><br>
                           <h3>
                              <strong id="day1"></strong>박 <strong id="day2"></strong>일
                           </h3></td>

                        <td class="mota"><img src="../../images/won.png" id="mpicto">
                           <h6>예상금액</h6><br>
                           <h3>
                              <strong id="ac"></strong>원
                           </h3></td>
                        <td class="mota"><img src="../../images/world.png" id="mpicto">
                           <h6>지역</h6><br>
                           <h3>
                              <strong id="loc"></strong>
                           </h3></td>
                     </tr>
                  </table>
                  <div class="text-center">
                     <button id="mbut" style="margin-top: -35px;">
                        -<strong id="price"></strong>p                      
                     </button>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div> 
<%@ include file="footer.jsp"%>