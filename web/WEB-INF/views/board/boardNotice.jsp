<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.Board, board.model.vo.PageInfo" %>
<% 
	ArrayList<Board> nList = (ArrayList<Board>)request.getAttribute("nList");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int fNListCount = (Integer)request.getAttribute("fNListCount");
	
	int listCount = pi.getListCount();		
	int pageLimit = pi.getPageLimit();		
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


.category {
	font-size: 18px;
	color: black;
}

table {
	margin-left: 10px;
}

td {
	font-size: 20px;
	cursor: pointer;
}

span {
	color: #11BBFF;
	font-size: 20px;
	font-weight: bold;
}

td>p {
	width: 700px;
	height: 250px;
	display: none;
}

.customer {
	margin-left: 30px;
	line-height: 30px;
	font-size: 20px;
	font-weight: bold;
}

#middleCategories {
	text-align: center;
	cursor: pointer;
	font-size: 20px;
	font-weight: bold;
}

.categories {font-size: 20px; color: #11BBFF; font-weight: bold; margin-left:20px;}

.categories:hover {color: #FBA481; text-decoration: none;}

.table th[scope="col"] {
	background: rgb(17, 187, 255);
	color: white;
}

.page-link{
	color: #11bbff;
}

}
</style>
</head>
<body style="font-family: 'Nanum Gothic', sans-serif;">
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!상단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	<div id="main-container" class="container">
		<%@ include file="../common/top.jsp" %>
		<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!상단 끝!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		<div class="row" id="middleCategories">
			<div class="col-3"></div>
			<div onclick="location.href='<%= request.getContextPath() %>/boardNotice.bo';" class="col">
				공지사항</div>
			<div onclick="location.href='<%= request.getContextPath() %>/boardOTO.bo';"
				class="col">1:1 게시판</div>
			<div onclick="location.href='<%= request.getContextPath() %>/boardFaq.bo';" class="col">
				FAQ</div>
			<div class="col-3"></div>
		</div>
		
		<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 40px;"></div>
		
		<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 본문(공지사항) !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
		<div class="row" style="padding: 10px;">
			<div class="col" style="padding: 0px;">
				<div
					style="font-weight: bold; font-size: 25px; text-align: center; color: rgb(17, 187, 255);"
					class="">공지사항</div>
			</div>
		</div>
		
		<!-- 테이블  -->
		<div class="row">
	            <table class="table" id="listArea" style="width: 720px; margin-left: 220px; margin-top: 10px; text-align: center; text-overflow: ellipsis;">
					<thead>
						<tr>
								<th scope="col" style="width: 90px;">글번호</th>
								<th scope="col" style="width: 300px;">제목</th>
								<th scope="col"  style="width: 140px;">작성일</th>
						</tr>
					</thead>
					<% if(nList.isEmpty()) {%>
					<tr>
						<td colspan="6">조회된 리스트가 없습니다.</td>
					</tr>
					<% } else { %>
					<tbody>
					<% 		for(Board b : nList) {%>
					<% int bId =  b.getBoardId(); %>
								<tr>
									<td style="font-size: 16px;"><%= bId %></td>
									<td style="font-size: 16px;"><%= b.getBoardTitle() %></td>
									<td style="font-size: 16px;"><%= b.getEnrollDate() %></td>
								</tr>
					<% 		} %>	
					<% } %>			
					</tbody>
				</table>
		</div>

		<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 40px;"></div>

		<!-- 페이징 -->
		<nav aria-label="Page navigation example" class="pagination justify-content-center page-item">
         <!-- 맨 처음으로 -->
         <button class="page-link" onclick="location.href='<%=request.getContextPath() %>/boardNotice.bo?currentPage=1'" id="bebeforeBtn"> &lt;&lt; </button>
         <!-- 이전 페이지로 -->
         <button class="page-link" onclick="location.href='<%=request.getContextPath() %>/boardNotice.bo?currentPage=<%= currentPage -1 %>'" id="beforeBtn"> &lt; </button>
         <script>
            if(<%= currentPage %> <= 1){
               $('#bebeforeBtn').attr('disabled', 'true');
               $('#beforeBtn').attr('disabled', 'true');
            }
         </script>
         <!-- 숫자 버튼 -->
         <% for(int p = startPage; p <=endPage; p++) { %>
         <%       if(p == currentPage) { %>
                  <button class="page-link" id="chosen" disabled> <%= p %> </button>
         <%         } else { %>
                  <button class="page-link" id="numBtn" onclick="location.href='<%= request.getContextPath()%>/boardNotice.bo?currentPage=<%= p %>'"><%= p %></button>
         <%             } %>   
         <% }%>
         
         <!-- 다음 페이지로 -->
         <button class="page-link" onclick="location.href='<%=request.getContextPath() %>/boardNotice.bo?currentPage=<%= currentPage + 1%>'" id="afterBtn"> &gt; </button>
         <!-- 맨 끝으로 -->
         <button class="page-link" onclick="location.href='<%=request.getContextPath() %>/boardNotice.bo?currentPage=<%= maxPage %>'" id="afafterBtn"> &gt;&gt;</button>
      	 <script>
            if(<%= currentPage %> >= <%=maxPage %>){
               $('#afafterBtn').prop('disabled', true);
               $('#afterBtn').prop('disabled', true);
            }
         </script>
      </nav>
		<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 120px;"></div>

	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		<%@ include file="../common/bottom.jsp" %>
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단 끝 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	</div>
		<%@ include file="../common/navbar.jsp"%>

	<!-- 상단 스크립트 -->
	<script>
		
		<!-- 중단 스크립트 -->
		// 중단 카테고리
		$(function() {
			$('#middleCategories').children().hover(function() {
				$(this).css('color', '#11BBFF');
			}, function() {
				$(this).css('color', 'black');
			});
		});
		

		$(function(){
			$('#listArea td').mouseenter(function(){	
				$(this).parent().css({'background':'lightgray', 'cursor':'pointer'});	
			}).mouseout(function(){
				$(this).parent().css({'background':'none'});	
			}).click(function(){
				var bId = $(this).parent().children().eq(0).text();	
				location.href='<%= request.getContextPath() %>/boardNoticeDetail.bo?bId='+ bId;
			});	
			
		});	
		
		// 중요 공지 표시
		$(function(){
			<% if(currentPage == 1) { %>
			for(var i = 1; i <= <%= fNListCount %>; i++){
				$('#listArea td').parent().children().eq(3 * i - 2).css({'font-weight' : 'bold'});
			}
			<% } %>
		});	
	</script>
</body>
</html>