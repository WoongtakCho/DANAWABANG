<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.Board, board.model.vo.PageInfo" %>
<% 
	ArrayList<Board> sList = (ArrayList<Board>)request.getAttribute("sList");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();		
	int pageLimit = pi.getPageLimit();		
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
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">	
<style>

.table th[scope="col"] {
	background: rgb(17, 187, 255);
	color: white;
}

.page-link{
	color: #11bbff;
}

.bi-search{
 color: #11BBFF;
}
}
</style>
</head>
<body style="font-family: 'Nanum Gothic', sans-serif;">
<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!상단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	<div id="main-container" class="container">
		<%@ include file="../common/top.jsp" %>
		<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!상단 끝!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		
		<!-- 중단 카테고리 -->	
		<%@ include file="../common/adminMiddleCategory.jsp" %>
		
		<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 본문(셀프가이드 리스트) !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
		<div class="row" style="padding: 10px;">
			<div class="col" style="padding: 0px;">
				<div
					style="font-weight: bold; font-size: 25px; text-align: center; color: rgb(17, 187, 255);"
					class="">셀프가이드 게시글 리스트</div>
			</div>
		</div>
		
		<!-- 테이블  -->
		<form action="" id="adminSelfGuideForm">
		<div class="row">
	            <table class="table" id="listArea" style="width: 720px; margin-left: 220px; margin-top: 10px; text-align: center; text-overflow: ellipsis;">
					<thead>
						<tr>
							<th scope="col" style="width: 30px;"><input type="checkbox" id="all" name="agree" onclick="selectAll();"></th>
								<th scope="col" style="width: 90px;">글번호</th>
								<th scope="col" style="width: 300px;">제목</th>
								<th scope="col" style="width: 140px;">작성자ID</th>
								<th scope="col"  style="width: 140px;">작성일</th>
								<th scope="col" style="width: 140px;">상세보기</th>
						</tr>
					</thead>
					<% if(sList.isEmpty()) {%>
					<tr>
						<td colspan="6">조회된 리스트가 없습니다.</td>
					</tr>
					<% } else { %>
					<tbody>
					<% 		for(Board b : sList) {%>
					<% int bId =  b.getBoardId(); %>
								<tr>
									<th scope="row" style="vertical-align: middle;"><input type="checkbox" class="check" name="check" onclick="selectOne();"></th>
									<td style="vertical-align: middle;"><%= bId %></td>
									<td style="vertical-align: middle;"><%= b.getBoardTitle() %></td>
									<td style="vertical-align: middle;"><%= b.getWriter() %></td>
									<td style="vertical-align: middle;"><%= b.getEnrollDate() %></td>
									<td onclick="location.href='<%= request.getContextPath() %>/adminSelfGuideDetail.bo?bId='+ <%= bId %>" 
									style="cursor:pointer; vertical-align: middle;"><i class="bi bi-search"></i></td>
								</tr>
								<% checkBoardCount++; %>
					<% 		} %>	
					<% } %>			
					</tbody>
				</table>
		</div>
		<!-- 체크된 게시글의 번호 저장 -->
		<input type="hidden" id="checkBoards" name="checkBoards" value="">
		
		<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 30px;"></div>
		
		<div class="row" style="height: 50px;">
			<!-- 검색창  -->
			<div class="col-3" style="left: 18%;">
				<div class="input-group mb-3">
				</div>
			</div>
			<!-- 버튼 -->
			<% if(loginUser != null && loginUser.getIsAdmin().equals("ADMIN")){ %>
			<div class="col" style="left: 38%; width: 70%;">
				<!-- 등록 버튼 -->
				<button type="button" class="button1" onclick="location.href='<%=request.getContextPath() %>/adminSelfGuideEnroll.bo'">등록</button>
				<!-- 삭제 버튼 -->
				<button class="button1" id="delete" onclick="selectDeleteBoard();">삭제</button>
			</div>
			<% } %>
		</div>
		</form>

		<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 40px;"></div>

		<!-- 페이징 -->
		<nav aria-label="Page navigation example" class="pagination justify-content-center page-item">
         <!-- 맨 처음으로 -->
         <button class="page-link" onclick="location.href='<%=request.getContextPath() %>/adminSelfGuide.bo?currentPage=1'" id="bebeforeBtn"> &lt;&lt; </button>
         <!-- 이전 페이지로 -->
         <button class="page-link" onclick="location.href='<%=request.getContextPath() %>/adminSelfGuide.bo?currentPage=<%= currentPage -1 %>'" id="beforeBtn"> &lt; </button>
         <script>
            if(<%= currentPage %> <= 1){
               $('#bebeforeBtn').attr('disabled', 'true');
               $('#beforeBtn').attr('disabled', 'true');
            }
         </script>
 
         <!-- 숫자 버튼 -->
         <% for(int p = startPage; p <= endPage; p++) { %>
         <%       if(p == currentPage) { %>
                  <button class="page-link" id="chosen" disabled> <%= p %> </button>
         <%         } else { %>
                  <button class="page-link" id="numBtn" onclick="location.href='<%= request.getContextPath()%>/adminSelfGuide.bo?currentPage=<%= p %>'"><%= p %></button>
         <%             } %>   
         <% }%>
         
         <!-- 다음 페이지로 -->
         <button class="page-link" onclick="location.href='<%=request.getContextPath() %>/adminSelfGuide.bo?currentPage=<%= currentPage + 1%>'" id="afterBtn"> &gt; </button>
  
         <!-- 맨 끝으로 -->
         <button class="page-link" onclick="location.href='<%=request.getContextPath() %>/adminSelfGuide.bo?currentPage=<%= maxPage %>'" id="afafterBtn"> &gt;&gt;</button>
      	 <script>
            if(<%= currentPage %> >= <%=maxPage %>){
               $('#afterBtn').prop('disabled', true);
               $('#afafterBtn').prop('disabled', true);
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
		/* 체크박스 선택방식 메소드 */
		function selectAll() {
			var check = document.getElementsByName("check");
			var all = document.getElementById("all");
			
			if(document.getElementById("all").checked) {
				for(var i = 0 ; i < check.length ; i++ ) {
					check[i].checked = true;
				}
			} else {
				for(var i = 0 ; i < check.length ; i++ ) {
					check[i].checked = false;
				}
			}
		}
		
		function selectOne() {
			var check = document.getElementsByName("check");
			var all = document.getElementById("all");
			
			var count = 0;
				
			for(var i = 1 ; i < check.length ; i++) {
				if(check[i].checked) {
					count++;		
				}
			}
				
			if(count != 10)  {
				all.checked = false;
			} else {
				all.checked = true;
			}		
		}
		
		
		// 체크박스를 이용한 여러 게시글 한번에 삭제하기
		 function selectDeleteBoard(){
			var checkList = document.getElementsByName('check');
			var checkBoardId = '';
			
			// 체크박스 선택된 게시글의 아이디 목록 저장하기 
			for(var i = 0 ; i < <%= checkBoardCount %> ; i++) {
				if(checkList[i].checked) {
					checkBoardId += checkList[i].parentNode.nextSibling.nextSibling.innerHTML + ",";
				}
			}
			document.getElementById('checkBoards').value = checkBoardId;
			
			if(checkBoardId == '' || checkBoardId.length == 0) {
				alert("게시글을 먼저 체크해주세요");
				return 0;
			}
			
			
			var result = window.prompt("정말 삭제하시겠습니까? 삭제하시려면 관리자 코드를 입력하십시오");
			
			if(result == 'realadmin'){
				alert("삭제 완료했습니다.");
				$('#adminSelfGuideForm').attr('action', '<%= request.getContextPath() %>/deleteSelfGuides.bo');
				$('#adminSelfGuideForm').submit();
				
			} else if(result == null){
					
			} else {
				alert("값을 제대로 입력해주세요.");				
			}
		} 
		
	</script>
</body>
</html>