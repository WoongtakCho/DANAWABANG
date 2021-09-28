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
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>


.table{
	border: 1px solid #DEEAF4;
}

.table th[scope="col"] {
	background: rgb(17, 187, 255);
	color: white;
}

.page-link{
	color: #11bbff;
}



/*검색창 색상*/
.bi-search{
 color: #11BBFF;
}
</style>
</head>
<body style="font-family: 'Nanum Gothic', sans-serif;">
<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!상단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	<div id="main-container" class="container">
		<%@ include file="../common/top.jsp" %>

		<!-- 중단 카테고리(상품관리페이지) -->	
		<%@ include file="../common/adminMiddleCategory.jsp" %>
		<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 본문(주문 상세 정보) !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
		<div class="row" style="padding: 10px;">
			<div class="col" style="padding: 0px;">
				<div
					style="font-weight: bold; font-size: 25px; text-align: center; color: rgb(17, 187, 255);"
					class="">주문 정보</div>
			</div>
		</div>	
		
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
					<th scope="col" colspan="2" style="width:100px;">대표이미지</th>
					<th scope="col" colspan="2" style="width:350px;">주문명</th>
				</tr>
				<tr>
					<th colspan="2" style="vertical-align:middle;"><img src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= fileList.get(1).getProductChangeName() %>" style="width: 150px; height: 150px;"></th>
					<th colspan="2" style="vertical-align:middle;"><%= o.getOrderProductName() %></th>
				</tr>
				<tr>
					<th scope="col" style="width:150px;">총금액</th>
					<td colspan="3"><b><%= o.getOrderPrice() %>원</b></td>
				</tr>
				<tr>
					<th scope="col">받는 사람</th>
					<td style="width: 210px;"><%= o.getOrdererName() %></td>
					<th scope="col" style="width:150px;">주문 ID</th>
					<td><%= o.getMemberId() %></td>
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
				<tr>
					<th scope="col">IMP_UID</th>
					<td colspan="3"><%= o.getImpUid() %></td>
				</tr>
				<tr>
					<th scope="col">카드번호</th>
					<td colspan="3"><%= o.getApplyNum() %></td>
				</tr>
				</tbody>
			</table>
		</div>
		
		
		<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 40px;"></div>
		
	<!-- 버튼 -->
			<div class="row">
			<!-- 여백 -->
				<div class="col-8"></div>
				<!-- 돌아가기버튼 -->
				<div class="col"><button class="button1" onclick="return history.back();" style="margin-left: 60px;">돌아가기</button></div>
			</div>
		
		
		<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 100px;"></div>
			
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		<%@ include file="../common/bottom.jsp" %>
	</div>
		<%@ include file="../common/navbar.jsp"%>
</body>
</html>