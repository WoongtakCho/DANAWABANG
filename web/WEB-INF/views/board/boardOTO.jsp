<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.Board, board.model.vo.PageInfo, board.model.vo.Reply"%>
<% 
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int checkBoardCount = 0;
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

body{line-height: 1.5;
	
	margin-left: 0px;
	margin-right: 0px;
	}

/*th색상변경*/
.table th[scope="col"] {
	background: rgb(17, 187, 255);
	color: white;
}
/*페이지번호매기는거*/
.pagination {
  display: -ms-flexbox;
  display: flex;
  padding-left: 0;
  list-style: none;
  border-radius: 0.25rem;
  color: #11BBFF;
}

.page-link{
	color: #11bbff;
}

#middleCategories {
	text-align: center;
	cursor: pointer;
	font-size: 20px;
	font-weight: bold;
}



</style>
</head>
<body style="font-family: 'Nanum Gothic', sans-serif;">
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!상단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	<div id="main-container" class="container" >
		<%@ include file="../common/top.jsp" %>

		<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!상단 끝!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->


		<!-- 고객센터 카테고리 -->
		<div class="row" id="middleCategories">
			<div class="col-3"></div>
			<div onclick="location.href='<%= request.getContextPath() %>/boardNotice.bo';" class="col">공지사항</div>
			<div onclick="location.href='<%= request.getContextPath() %>/boardOTO.bo';" class="col">1:1 게시판</div>
			<div onclick="location.href='<%= request.getContextPath() %>/boardFaq.bo';" class="col">FAQ</div>
			<div class="col-3"></div>
		</div>

		<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 50px;"></div>

		<!-- 본문 -->
		<div class="row">
			<div class="col">
				<div style="font-weight: bold; font-size: 25px; text-align: center; color: rgb(17, 187, 255);"
					class="">1대1 게시판</div>
			</div>
		</div>

		<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 20px;"></div>

		<div class="row">
			<div class="col"></div>
			<div class="col"></div>
			<div class="col-8">
				<form>
					<div class="row">
					<table class="table" id="listArea" style="text-align: center; width: 750px;">
						<thead>
							<tr>
								<th scope="col" style="width: 80px;">글번호</th>
								<th scope="col" style="width: 500px;">제목</th>
								<th scope="col" style="width: 120px;">작성자ID</th>
								<th scope="col" style="width: 140px;">작성일</th>
							</tr>
						</thead>
						<tbody>
						<% if (list.isEmpty()) { %>
						<tr>
							<td colspan="4" style="cursor:default;">조회된 리스트가 없습니다.</td>
						</tr>
						<% } else { %>
						<tbody>
						<% if(loginUser != null){ %>
						<% for(Board b : list) { %>
						<% int bId = b.getBoardId(); %>
						<% String id = b.getWriter(); %>
						<% int length = id.length(); %>
						<% length = length -3; %>
						<% String maskId = id.substring(0, length); %>
						<% maskId = maskId + "***"; %>
						
							<tr>
								<td><%= b.getBoardId() %></td>
								<td><%= b.getBoardTitle() %><span style="font-weight:bolder; color:#11BBFF">(<%=b.getReplyCount() %>)</span></td>
								<td style="display:none;"><%= b.getWriter() %></td>
								<td><%= maskId %></td>
								<td><%= b.getEnrollDate() %></td>
							</tr>
							<% checkBoardCount++; %>
								<% } %>
							<% } else { %>
							<tr>
								<td colspan="4">회원만 등록 및 조회가 가능합니다.</td>
							</tr>
						<% } %>
						<% } %>
						</tbody>
					</table>
					</div>
				</form>
			</div>	
			<div class="col"></div>
			<div class="col"></div>
		</div>
		
	 	<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 20px;"></div>
		<!-- 버튼 -->
	<form action="<%= request.getContextPath() %>/boardOTO.bo" id="listForm" method="post" >
					
		<div class="row" style="height: 50px;">
			
			<% if(loginUser != null){ %>
			<div class="col-2"></div>
			<div class="col"><button type="button" class="button1" onclick="location.href='<%= request.getContextPath() %>/boardOTOEnroll.bo';" style="margin-left: 600px;">등록</button></div>
			<% } %>
		</div>
	</form>
		
		<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 50px;"></div>
		
		<!-- 페이징 -->
		<% if(loginUser != null){ %>
		<nav aria-label="Page navigation example" class="pagination justify-content-center page-item">
		<!-- 맨 처음으로 -->
			<button class="page-link" onclick="location.href='<%=request.getContextPath() %>/boardOTO.bo?currentPage=1'" id="bebeforeBtn"> &lt;&lt; </button>
			<!-- 이전 페이지로 -->
			<button class="page-link" onclick="location.href='<%=request.getContextPath() %>/boardOTO.bo?currentPage=<%= currentPage -1 %>'" id="beforeBtn"> &lt; </button>
			<script>
				if(<%= currentPage %> <= 1){
					$('#bebeforeBtn').attr('disabled', 'true');
					$('#beforeBtn').attr('disabled', 'true');
				}
			</script>
			<!-- 숫자 버튼 -->
			<% for(int p = startPage; p <=endPage; p++) { %>
			<%		 if(p== currentPage) { %>
						<button class="page-link" id="chosen" disabled> <%= p %> </button>
			<%			} else { %>
						<button class="page-link" id="numBtn" onclick="location.href='<%= request.getContextPath()%>/boardOTO.bo?currentPage=<%= p %> '"><%= p %></button>
			<% 				} %>	
			<% }%>		
			<!-- 다음 페이지로 -->
			<button class="page-link" onclick="location.href='<%=request.getContextPath() %>/boardOTO.bo?currentPage=<%= currentPage + 1%>'" id="afterBtn"> &gt; </button>
			<!-- 맨 끝으로 -->
			<button class="page-link" onclick="location.href='<%=request.getContextPath() %>/boardOTO.bo?currentPage=<%= maxPage %>'" id="afafterBtn"> &gt;&gt;</button>
			<script>
				if(<%= currentPage %> >= <%=maxPage %>){
					$('#afterBtn').prop('disabled', true);
					$('#afafterBtn').prop('disabled', true);
				}
			</script>
		</nav>
		<% } %>

		<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		<%@ include file="../common/bottom.jsp" %>
	</div>
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단 끝 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		<%@ include file="../common/navbar.jsp"%>

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
		
		//제목 좌측정렬
	 	$(function() {
			for(var i = 1; i <= 10 ; i++) {
				$('tr').eq(i).children().eq(1).css('text-align', 'left');
			}
		});
		// 조회 리스트 없을때
		
		$('#empty').on('click', function(){
			
		});
	 	<% if(loginUser != null){ %>
	       $(function(){
	         $('#listArea td').mouseenter(function(){   
	            $(this).parent().css({'background':'lightgray', 'cursor':'pointer'});   
	         }).mouseout(function(){
	            $(this).parent().css({'background':'none'});   
	         }).click(function(){
	            var writer = $(this).parent().children().eq(2).text();
	            
	            if(	writer == "<%= loginUser.getId() %>" || "<%= loginUser.getIsAdmin() %>" == "ADMIN") {
	            	var bId = $(this).parent().children().eq(0).text();
	            	console.log(bId);
	               if(bId != null){
		               location.href='<%= request.getContextPath() %>/boardOTODetail.bo?bId='+ bId;      
	               } 
               
	            } else{
	            	alert("글 작성자만 내용을 볼 수 있습니다.")
	            }
	           
	         });   
	      });   
	      <% }%>
		
		
	</script>
	
	
</body>
</html>

	
