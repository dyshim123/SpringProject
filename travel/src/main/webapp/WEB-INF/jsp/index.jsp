<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
   <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE HTML>
<html>
<head>
<title>Trip</title>
<meta charset="utf-8" /> 
<link rel="stylesheet" href="../../assets/css/main.css" />
<link rel="stylesheet" href="../../assets/css/circleimage.css" />
<link rel="stylesheet" href="../../assets/css/detail.css" />
<style>
      ol{
        border-right:none;
      }
      h1 {
        border-bottom:none;
      }
    }
#check {
	margin-left: 30px;
	margin-right: auto;
}

#checks {
	width: 100%;
    margin-bottom: 60px;
  
}

#text {
	width: 50%;
	height: 3em;
	font-size: 30px;
	font-family: fontAwesome;
	border: solid #2C96ED;
	margin-left: 50px;
}

.ba button {
	color: #ec2d32;
	border: 2px solid #ec2d32;
}

.ba1 button {
	color: #b6d2ed;
	border: 2px solid #b6d2ed;
}

.ba2 button {
	color: #ec9933;
	border: 2px solid #ec9933;
}

.txt_line1 {
	text-align: center;
	font-size: 20px;
}
</style>
</head>
<body>
<div id="wrapper header">
<%@ include file="header.jsp" %>
	<!-- main visual(s) -->
<script>	
/* $(function(){
    var responseMessage = "<c:out value="${email}" />";
    if(responseMessage != ""){
        alert(responseMessage)
    }
})  */

$(function(){
    var responseMessage = ${auth_check};
    if(responseMessage != ""){
        alert(responseMessage)
    }
}) 

$(function(){
    var responseMessage = "<c:out value="${auth_check}" />";
    var noresponseMessage = "<c:out value="${already}" />";
    if(responseMessage != ""){
        alert(responseMessage)
    }else if(noresponseMessage != ""){
        alert(noresponseMessage)
    }
}) 
</script>
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner ci">
			
			<div class="carousel-item active">
				<div class="bannerimg ba">
					<div class="content">
						<h5>BEST</h5>
						<h1>ROADRUWA 인기코스</h1>
						<h6>생생한 후기가 넘쳐나는 코스를 한눈에</h6>
						<br>
						<button onclick="location.href = 'popularity.do'">자세히 보기</button>
					</div>
					<div class="img-cover"></div>
				</div>
			</div>

			<div class="carousel-item">
				<div class="bannerimg ba1">
					<div class="content">
						<h5>THEMA</h5>
						<h1>추운 겨울엔 호캉스!</h1>
						<h6>다가오는 겨울! 힘든 일정 대신 호캉스가 대세</h6>
						<br>
						<button onclick="location.href = 'detail.do?lotation=&day=&trans=&cost=&tema=호캉스&search='">자세히 보기</button>
					</div>
					<div class="img-cover"></div>
				</div>
			</div>
			<div class="carousel-item">
				<div class="bannerimg ba2">
					<div class="content">
						<h5>#제주</h5>
						<h1>제주 같이 갈래요?</h1>
						<h6>낭만적인 제주 여행으로 힐링하자</h6>
						<br>
						<button
							onclick="location.href = 'detail.do?lotation=제주&day=&trans=&cost=&tema=&search='">자세히
							보기</button>
					</div>
					<div class="img-cover"></div>
				</div>
			</div>
		</div>
	
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
	<!-- main visual(e) -->
	<br><br><br><br>
	<div class="row col-lg-12 justify-content-center">
		<div class="col-lg-8">
			<form class="search-container row col-lg-12 justify-content-center" id="checks" action="detail.do" method="get">
			   <input type="hidden" name="lotation" value="" /> 
			   <input type="hidden" name="day" value="" /> 
			   <input type="hidden" name="trans" value="" />
			   <input type="hidden" name="cost" value="" /> 
			   <input type="hidden" name="tema" value="" /> 
			   <input type="text" id="text" name="search" placeholder="&#xf002; search">
			</form>
		</div>		
	</div>
	<br>
	<div class="row justify-content-center">
		<div class="col-lg-12">
			<table class="tables" id="check" border="1">
				<tr>
					<td><h5>지역: </h5></td>
					<td>
						<div class="sel sel--black-panther">
							<select name="lotation" id="lotation">
								<option value="">전체</option>
								<option value="서울">서울</option>
								<option value="경기/인천">경기/인천</option>
								<option value="강원">강원</option>
								<option value="충청">충청</option>
								<option value="전라">전라</option>
								<option value="경상">경상</option>
								<option value="부산">부산</option>
								<option value="제주">제주</option>
							</select>
						</div>
					</td>
					<td></td>
					<td><h5>여행일수: </h5></td>
					<td><div class="sel sel--black-panther">
							<select name="day" id="day">
								<option value="">전체</option>
								<option value="1">1일 이하</option>
								<option value="2">2일</option>
								<option value="3">3일</option>
								<option value="4">4일</option>
								<option value="5">5일 이상</option>
							</select>
						</div></td>
		
					<td><h5>교통: </h5></td>
					<td><div class="sel sel--black-panther">
							<select name="trans" id="trans">
								<option value="">전체</option>
								<option value="자동차">자동차</option>
								<option value="대중교통">대중교통</option>
								<option value="기타">기타</option>
							</select>
						</div></td>
		
					<td><h5>경비: </h5></td>
					<td>
		
						<div class="sel sel--black-panther">
							<select name="cost" id="cost">
								<option value="">전체</option>
								<option value="99999">10만원 미만</option>
								<option value="199999">20만원 미만</option>
								<option value="200000">20만원 이상</option>
							</select>
						</div>
					</td>
		
					<td><h5>테마: </h5></td>
					<td>
						<div class="sel sel--black-panther">
							<select name="tema" id="tema">
								<option value="">전체</option>
								<option value="먹방">먹방</option>
								<option value="관광지">관광지</option>
								<option value="문화재/역사">문화재/역사</option>
								<option value="호캉스">호캉스</option>
								<option value="액티비티">액티비티</option>
							</select>
						</div>
					</td>
					<td>
						<div class="wrap">
							<button onclick="search()" class="button" id="m_td">검색</button>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<script>
   window.onload = function reset(){//실행시 값 초기화
      $("#tema option:first").attr('selected','selected');
      $("#lotation option:first").attr('selected','selected');
      $("#cost option:first").attr('selected','selected');
      $("#day option:first").attr('selected','selected');
      $("#trans option:first").attr('selected','selected');
   }

   function search() {
      var lotation = document.getElementById("lotation").value; //lotation이라는 id를 가져와서 값을 저장해라
      var cost =document.getElementById("cost").value;
      var day = document.getElementById("day").value;
      var trans = document.getElementById("trans").value;
      var tema = document.getElementById("tema").value;
      var search = document.getElementById("text").value;
      
       location.href = "detail.do?lotation=" + lotation + "&day=" + day
       + "&trans=" + trans + "&cost=" + cost + "&tema=" + tema
       + "&search=" + search;
   }
</script>
	<br><br>
	<br><br>
	<hr>
	<div>
	<div class="row justify-content-center">
	   <div class="col-3">
	      <h4>최근 등록된 글</h4>
	   </div>
	   <div class="col-3"></div>
	   <div class="col-3">
	      <h5 class="a">
	         <a href="detail.do?lotation=&day=&trans=&cost=&tema=&search=">더보기></a>
	      </h5>
	   </div>
	</div>
	<div class="row justify-content-center">
		<c:set var="loop_flag" value="true" />
		<c:forEach var="detail" items="${modalLists}" varStatus="roop">
		<c:if  test="${roop.count > 3}">
			<c:set var="loop_flag" value="false" />
		</c:if>
		<c:if test="${loop_flag}">
		<div class="col-lg-3" id="js-load">
			<!-- /.panel -->
			<section class="box special" data-toggle="modal"
				data-target="#mainModal" onclick="show('${detail.bTitle}',
                    '${detail.bCate}','${detail.uId}','${detail.bDay1}',
                    '${detail.bDay2}','${detail.bAc}','${detail.bPic1}',
                    '${detail.bPic2}','${detail.bPic3}','${detail.bPrice}',
                    '${detail.bLo}','${detail.bNum}','${sessionScope.u_id}')"> 
				<span class="image featured"><img src="<c:url value="/image/${detail.bPic1}"/>" alt="" class="mip" /></span>
				<div class="txt_line1">${detail.bTitle}</div>
			</section>
		</div>
		</c:if>
		</c:forEach>
	</div>
	<script>
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
	      //'buyPro.do?b_num=' + b_num 
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
    <br><br>
	<hr>
	<div class="row justify-content-center">
	   <div class="col-3">
	      <h4>인기코스</h4>
	   </div>
	   <div class="col-3"></div>
	   <div class="col-3">
	      <h5 class="a">
	         <a href="popularity.do">더보기></a>
	      </h5>
	   </div>
	</div>
	<div class="row justify-content-center">
	<c:set var="loop_flags" value="true" />
	<c:forEach var="pop" items="${modalPopLists}" varStatus="roop">
		<c:if  test="${roop.count > 3}">
		<c:set var="loop_flags" value="false" />
		</c:if>
		<c:if test="${loop_flags}">
		<div class="col-lg-3" id="js-load">
			<!-- /.panel -->
			 <section class="box special" data-toggle="modal" data-target="#mainModal"onclick="show('${pop.boardMap[0].bTitle}',
                 '${pop.boardMap[0].bCate}','${pop.boardMap[0].uId}','${pop.boardMap[0].bDay1}',
                 '${pop.boardMap[0].bDay2}','${pop.boardMap[0].bAc}','${pop.boardMap[0].bPic1}',
                 '${pop.boardMap[0].bPic2}','${pop.boardMap[0].bPic3}','${pop.boardMap[0].bPrice}',
                 '${pop.boardMap[0].bLo}','${pop.boardMap[0].bNum}','${sessionScope.u_id}')">
				<span class="image featured"><img src="<c:url value="/image/${pop.boardMap[0].bPic1}"/>" alt="" class="mip" /></span>
				 <div class="txt_line1">${pop.boardMap[0].bTitle}</div>
			</section>
		</div>
		</c:if>
	</c:forEach> 
	</div>
</div></div>
<div class="modal fade" id="mainModal" role="dialog">
   <div class="modal-dialog modal-lg"  style="max-width: 45%;">
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
                  <div class="form group row">
                 <div class="col-6" style="font-size: 2rem; color: #2C96ED;">
                  <div></div></div>
                 <div class="col-6">
                     <button id="mbut">
                        -<strong id="price"></strong>p                    
                     </button></div></div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>


	<%@ include file="footer.jsp" %>
