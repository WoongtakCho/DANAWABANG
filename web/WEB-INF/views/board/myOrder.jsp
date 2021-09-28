<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*"%>
<!DOCTYPE html>
<%
ArrayList<Orders> list = (ArrayList<Orders>)request.getAttribute("list");
PageInfo pi = (PageInfo) request.getAttribute("pi");

int listCount = pi.getListCount();
int currentPage = pi.getCurrentPage();
int maxPage = pi.getMaxPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();

%>
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
/*페이지번호매기는거*/
.page-link {
  color: #11BBFF;
}
/*상세보기 색상*/
.bi-search{
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
			<div onclick="location.href='<%= request.getContextPath() %>/myOrder.bo'"
					class="col-2" style="text-align: center; cursor: pointer; font-size: 20px; font-weight: bold; padding-right:10px;">
					나의 쇼핑</div>
			<div onclick="location.href='<%= request.getContextPath() %>/myReply.bo'"
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

			<!-- 주문 내역 제목 -->
			<div class="row">
				<!-- 여백 -->
				<div class="col"></div>
				<!-- 주문 내역-->
				<div class="col"
					style="text-align:center; font-size: 23px; font-weight: bold; color:#11BBFF;">주문
					내역</div>
				<!-- 여백 -->
				<div class="col"></div>
			</div>
			<!-- 행 사이 빈공간-->
			<div class="row" style="margin-top: 20px;"></div>


			<!-- 주문 내역 -->
			<div class="row">
				<table class="table"
					style="margin-left: 16.5%; width: 70%; text-align: center; font-size:14px;">
					<thead>
						<tr>
							<th scope="col" style="width: 130px;">주문번호</th>
							<th scope="col" style="width: 300px;">상품명</th>
							<th scope="col" style="width: 130px;">주문가격</th>
							<th scope="col" style="width: 130px;">주문일</th>
							<th scope="col" style="width: 80px;">상세보기</th>
						</tr>
					</thead>
					<tbody>
					<% if(list.isEmpty()) { %>
					<tr>
						<td colspan="5" style="font-size: 20px;">회원님의 주문 내역이 없습니다.</td>
					</tr>
					<!-- 행 사이 빈공간-->
					<div class="row" style="margin-top: 500px;"></div>
					<% } else { %>
						<% for(Orders o : list) { %>
							<tr>
								<td><%= o.getOrderId() %></td>
								<td><%= o.getOrderProductName() %></td>
								<td><%= o.getOrderPrice() %></td>
								<td><%= o.getOrderDate() %></td>
								<td onclick="location.href='myOrderDetail.bo?orderId=<%= o.getOrderId() %>'" style="cursor:pointer;"><i class="bi bi-search"></i></td>
							</tr>
						<% } %>
						<% } %>
					</tbody>
				</table>
			</div>
			
			<!-- 행 사이 빈공간-->
			<div class="row" style="margin-top: 60px;"></div>
			
			
			<!-- 페이지수 표시 -->
		<nav aria-label="Page navigation example" class="pagination justify-content-center page-item">
         <!-- 맨 처음으로 -->
         <button class="page-link" onclick="location.href='<%=request.getContextPath() %>/myOrder.bo?currentPage=1'" id="bebeforeBtn"> &lt;&lt; </button>
         <!-- 이전 페이지로 -->
         <button class="page-link" onclick="location.href='<%=request.getContextPath() %>/myOrder.bo?currentPage=<%= currentPage -1 %>'" id="beforeBtn"> &lt; </button>
         <script>
            if(<%= currentPage %> <= 1){
               $('#bebeforeBtn').attr('disabled', 'true');
               $('#beforeBtn').attr('disabled', 'true');
            }
         </script>
         <!-- 숫자 버튼 -->
         <% for(int p = startPage; p <=endPage; p++) { %>
         <%       if(p== currentPage) { %>
                  <button class="page-link" id="chosen" disabled> <%= p %> </button>
         <%         } else { %>
                  <button class="page-link" id="numBtn" onclick="location.href='<%= request.getContextPath()%>/myOrder.bo?currentPage=<%= p %>'"><%= p %></button>
         <%             } %>   
         <% }%>
         
         <!-- 다음 페이지로 -->
         <button class="page-link" onclick="location.href='<%=request.getContextPath() %>/myOrder.bo?currentPage=<%= currentPage + 1%>'" id="afterBtn"> &gt; </button>
         <!-- 맨 끝으로 -->
         <button class="page-link" onclick="location.href='<%=request.getContextPath() %>/myOrder.bo?currentPage=<%= maxPage %>'" id="afafterBtn"> &gt;&gt;</button>
         <script>
            if(<%= currentPage %> >= <%=maxPage %>){
               $('#afafterBtn').prop('disabled', true);
               $('#afterBtn').prop('disabled', true);
            }
         </script>
      </nav>

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
