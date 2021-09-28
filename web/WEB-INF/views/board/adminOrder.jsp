<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*, java.util.ArrayList"%>

<%
	ArrayList<Orders> list = (ArrayList<Orders>)request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
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
		<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 본문(주문 리스트) !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
		<div class="row" style="padding: 10px;">
			<div class="col" style="padding: 0px;">
				<div
					style="font-weight: bold; font-size: 25px; text-align: center; color: rgb(17, 187, 255);"
					class="">주문 리스트</div>
			</div>
		</div>
		
		<!-- 테이블 -->
		<div class="row" style="height: 580px;">
			<form>
            <table class="table" style="width: 720px; margin-left: 220px; margin-top: 10px; text-align: center;">
				<thead>
					<tr>
						<th scope="col" style="width: 110px;">주문번호</th>
						<th scope="col" style="width: 320px;">주문명</th>
						<th scope="col" style="width: 100px;">구매자ID</th>
						<th scope="col" style="width: 150px;">주문일</th>
						<th scope="col" style="width: 100px;">상세보기</th>
					</tr>
				</thead>
				<% if(list.isEmpty()) { %>
					<tr>
						<td colspan="5">조회된 리스트가 없습니다.</td>
					</tr>
					<% } else { %>
				<tbody>
						<% for(Orders o : list) { %>
					<tr>
						<td><%= o.getOrderId() %></td>
						<td style="text-align: left;"><%= o.getOrderProductName() %></td>
						<td><%= o.getMemberId() %></td>
						<td><%= o.getOrderDate() %></td>
						<td onclick="location.href='<%=request.getContextPath() %>/adminOrderDetail.bo?orderId=<%= o.getOrderId() %>';" style="cursor:pointer;"><i class="bi bi-search"></i></td>
					</tr>
						<% } %>
					<% } %>
				</tbody>
			</table>
			</form>
		</div>
		
		
		<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 30px;"></div>
		
			<!-- 페이지수 표시 -->
		<nav aria-label="Page navigation example" class="pagination justify-content-center page-item">
         <!-- 맨 처음으로 -->
         <button class="page-link" onclick="location.href='<%=request.getContextPath() %>/adminOrder.bo?currentPage=1'" id="bebeforeBtn"> &lt;&lt; </button>
         <!-- 이전 페이지로 -->
         <button class="page-link" onclick="location.href='<%=request.getContextPath() %>/adminOrder.bo?currentPage=<%= currentPage -1 %>'" id="beforeBtn"> &lt; </button>
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
                  <button class="page-link" id="numBtn" onclick="location.href='<%= request.getContextPath()%>/adminOrder.bo?currentPage=<%= p %>'"><%= p %></button>
         <%             } %>   
         <% }%>
         
         <!-- 다음 페이지로 -->
         <button class="page-link" onclick="location.href='<%=request.getContextPath() %>/adminOrder.bo?currentPage=<%= currentPage + 1%>'" id="afterBtn"> &gt; </button>
         <!-- 맨 끝으로 -->
         <button class="page-link" onclick="location.href='<%=request.getContextPath() %>/adminOrder.bo?currentPage=<%= maxPage %>'" id="afafterBtn"> &gt;&gt;</button>
         <script>
            if(<%= currentPage %> >= <%= maxPage %>){
               $('#afafterBtn').prop('disabled', true);
               $('#afterBtn').prop('disabled', true);
            }
         </script>
      </nav>
		
		<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 160px;"></div>

<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		<%@ include file="../common/bottom.jsp" %>
	</div>
		<%@ include file="../common/navbar.jsp"%>
</body>
</html>