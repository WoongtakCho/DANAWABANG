<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*, java.util.ArrayList"%>
<%
	Orders o = (Orders)request.getAttribute("order");
	ArrayList<ProductAttachment> fileList = (ArrayList<ProductAttachment>)request.getAttribute("fileList");
	
	String[] add = o.getOrdererAddress().split("/");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다나와방</title>
<script src="js/popper.min.js"></script>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap-4.3.1.js"></script>
<link href="css/bootstrap-4.3.1.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
	<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>

/*마이페이지-나의쇼핑관련스타일*/
/*th색상변경*/
.table th[scope="col"] {
	background: rgb(17, 187, 255);
	color: white;
}
/*테이블색상변경*/
table{
	border: 1px solid #DEEAF4;
}

/*페이지번호매기는거*/
.page-link {
  color: #11BBFF;
}
</style>
</head>
<body style="font-family: 'Nanum Gothic', sans-serif;">
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!상단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	<div id="main-container" class="container">
		<%@ include file="../common/top.jsp" %>

		<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!상단 끝!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->


		<!--!!!!!!!!!!!!!!!!!!!!!!!!! 마이 페이지 카테고리 !!!!!!!!!!!!!!!!!!!!!!!!!!-->
		<!-- 중단 카테고리 -->	
		<div class="row" id="middleCategories">
			<!-- 중단 카테고리 여백 -->
			<div class="col-3"></div>
			<!-- 나의쇼핑, 나의활동, 설정 중단카테고리 -->
			<div onclick="location.href='마이페이지-나의 쇼핑.html';"
					class="col-2" style="text-align: center; cursor: pointer; font-size: 20px; font-weight: bold; padding-right:10px;">
					나의 쇼핑</div>
			<div onclick="location.href='마이페이지-나의 활동.html';"
					class="col-2" style="text-align: center; cursor: pointer; font-size: 20px; font-weight: bold; padding-right:20px;">
					나의 활동</div>
			<div onclick="location.href='<%= request.getContextPath() %>/mySettingForm.me';"
					class="col-2" style="text-align: center; cursor: pointer; font-size: 20px; font-weight: bold;">
					설정</div>
			<!-- 상단 카테고리 여백 -->
			<div class="col-3"></div>
		</div>
		
			<!-- 행 사이 빈공간-->
			<div class="row" style="margin-top: 40px;"></div>

			<!-- 주문 상세 내역 제목 -->
			<div class="row">
				<!-- 여백 -->
				<div class="col"></div>
				<!-- 주문 상세 내역-->
				<div class="col"
					style="text-align:center; font-size: 23px; font-weight: bold; color: #11BBFF;">주문 상세 내역</div>
				<!-- 여백 -->
				<div class="col"></div>
			</div>
			<!-- 행 사이 빈공간-->
			<div class="row" style="margin-top: 20px;"></div>



		<!-- 테이블 -->
		<div class="row" style="margin-left:200px;">
			<table class="table"
				style="text-align: center; width: 720px;">
				
				<tbody>
				<tr>
					<th scope="col">주문번호</th>
					<td><%= o.getOrderId() %></td>
					<th scope="col">주문일자</th>
					<td><%= o.getOrderDate() %></td>
				</tr>
			</table>
			<table class="table"
				style="width: 720px; text-align: center; margin-top: -18px;">
				<tr>
					<th scope="col" colspan="3" style="width:100px;">대표이미지</th>
					<th scope="col" colspan="1" style="width:400px;">주문명</th>
				</tr>
				<tr>
					<%-- <th style="vertical-align:middle;"><%= o.getProductId() %></th> --%>
					<th colspan="3" style="vertical-align:middle; width: 150px;"><img src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= fileList.get(1).getProductChangeName() %>" style="width: 150px; height: 150px;"></th>
					<th colspan="1" style="vertical-align:middle;"><%= o.getOrderProductName() %></th>
				</tr>
				<tr>
					<th scope="col" style="width:150px;">총금액</th>
					<td colspan="3"><b><%= o.getOrderPrice() %>원</b></td>
				</tr>
				<tr>
					<th scope="col">받는 사람</th>
					<td colspan="3"><%= o.getOrdererName() %></td>
				</tr>
				<tr>
					<th scope="col">연락처</th>
					<td colspan="3"><%= o.getOrdererPhone() %></td>
				</tr>
				<tr>
					<th scope="col">이메일</th>
					<td colspan="3"><%= o.getOrdererEmail() %></td>
				</tr>
				<tr>
					<th scope="col" style="vertical-align:middle;">배송지</th>
					<td colspan="3">(<%= add[0] %>)<%= add[1] %> <%= add[2] %></td>
				</tr>
				<tr>
					<th scope="col">요청사항</th>
					<td colspan="3"><%= o.getOrdererRequest() %></td>
				</tr>
				</tbody>
			</table>
		</div>
		
		<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 20px;"></div>
		
			<!-- 버튼 -->
			<div class="row">
			<!-- 여백 -->
				<div class="col-8"></div>
				<!-- 돌아가기버튼 -->
				<div class="col"><button class="button1" onclick="return history.back();" style="margin-left: 60px;">돌아가기</button></div>
			</div>
	
			<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 60px;"></div>
		
			
		<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		<%@ include file="../common/bottom.jsp" %>
	</div>
	<%@ include file="../common/navbar.jsp"%>
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단 끝 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	
<!-- 상단 스크립트 -->
	<script>
		
		//중단 카테고리 색변환
		$(function() {
			$('#middleCategories').children().hover(function() {
				$(this).css('color', '#11BBFF');
			}, function() {
				$(this).css('color', 'black');
			});
		});
	</script>
	
</body>
</html>
