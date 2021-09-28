<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*"%>
<% 
	ArrayList<Board> bList = (ArrayList<Board>)request.getAttribute("bList");
	ArrayList<BoardAttachment> fList = (ArrayList<BoardAttachment>)request.getAttribute("fList");
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
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">	
<style>



.table th[scope="col"] {
	background: rgb(17, 187, 255);
	color: white;
	width: 60px;
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

		
		<!-- 중단 카테고리 -->	
		<%@ include file="../common/adminMiddleCategory.jsp" %>
		
		<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 본문(프로모션 게시글 리스트) !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
		<div class="row" style="padding: 10px;">
			<div class="col" style="padding: 0px;">
				<div
					style="font-weight: bold; font-size: 25px; text-align: center; color: rgb(17, 187, 255);"
					class="">프로모션 게시글 리스트</div>
			</div>
		</div>
		
		<!-- 테이블  -->
		<form action="" id="adminPromotionForm">
		<div class="row">
	             <table class="table" style="width: 730px; margin-left: 220px; margin-top: 10px; text-align: center;">
					<thead>
						<tr>
							<th scope="col"><input type="checkbox" id="all" name="agree" 
								onclick="selectAll();" style="width: 30px;"></th>
							<th scope="col" style="width: 70px;">글번호</th>
							<th scope="col" style="width: 390px;">제목</th>
							<th scope="col" style="width: 140px;">작성자</th>
							<th scope="col" style="width: 90px;">상세보기</th>
						</tr>
					</thead>
					<% if(bList.isEmpty()) {%>
					<tr>
						<td colspan="5">조회된 리스트가 없습니다.</td>
					</tr>
					<% } else { %>
					<tbody>
					<% for(Board b : bList) { %>
						<tr>
							<td><input type="checkbox" class="check" name="check"
								onclick="selectOne();"></td>
							<td><%= b.getBoardId() %></td>
							<td><%= b.getBoardTitle() %></td>
							<td><%= b.getWriter() %></td>
							<td onclick="location.href='<%=request.getContextPath()%>/adminPromotionDetail.bo?bId=' + <%= b.getBoardId() %>"
								style="cursor: pointer;"><i class="bi bi-search"></i></td>
						</tr>
						<% checkBoardCount++; %>
						<% } %>
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
			<div class="col-5">
				<!-- 검색 아이콘  -->
				<div style="margin-left:200px;">
				</div>
			</div>
			<div class="col-1" style="margin-top: -30px;">
			</div>		
			
			<!-- 버튼 -->
			<% if(loginUser.getIsAdmin().equals("ADMIN")){ %>
			<div class="col" style="margin-left: 150px;">
				<!-- 등록 버튼 -->
				<button class="button1" type="button" onclick="location.href='<%=request.getContextPath() %>/adminPromotionEnrollForm.bo';">등록</button>
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
			<button class="page-link" onclick="location.href='<%=request.getContextPath() %>/adminPromotion.bo?currentPage=1'" id="bebeforeBtn"> &lt;&lt; </button>
			<!-- 이전 페이지로 -->
			<button class="page-link" onclick="location.href='<%=request.getContextPath() %>/adminPromotion.bo?currentPage=<%= currentPage -1 %>'" id="beforeBtn"> &lt; </button>
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
						<button class="page-link" id="numBtn" onclick="location.href='<%= request.getContextPath()%>/adminPromotion.bo?currentPage=<%= p %>'"><%= p %></button>
			<% 				} %>	
			<% }%>		
			<!-- 다음 페이지로 -->
			<button class="page-link" onclick="location.href='<%=request.getContextPath() %>/adminPromotion.bo?currentPage=<%= currentPage + 1%>'" id="afterBtn"> &gt; </button>
			<!-- 맨 끝으로 -->
			<button class="page-link" onclick="location.href='<%=request.getContextPath() %>/adminPromotion.bo?currentPage=<%= maxPage %>'" id="afafterBtn"> &gt;&gt;</button>
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
				$('#adminPromotionForm').attr('action', '<%= request.getContextPath() %>/deletePromotions.bo');
				$('#adminPromotionForm').submit();
				
			} else if(result == null){
					
			} else{
				alert("잘못 입력하셨습니다.");				
			}
		} 
		
	</script>
</body>
</html>