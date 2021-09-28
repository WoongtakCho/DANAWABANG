<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member, java.util.ArrayList, board.model.vo.PageInfo"%>
    
<% 
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list"); 
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int memberCount = 0;
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
	width: 100px;
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
		
		<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 본문(회원 리스트) !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
		<div class="row" style="padding: 10px;">
			<div class="col" style="padding: 0px;">
				<div
					style="font-weight: bold; font-size: 25px; text-align: center; color: rgb(17, 187, 255);"
					class="">회원 리스트</div>
			</div>
		</div>
		
		<form action="" id="adminMemberForm">
		<!-- 테이블  -->
		<div class="row">
			<table class="table" id="table" style="width: 720px; margin-left: 220px; margin-top: 10px; text-align: center;">
				<thead>
					<tr>
						<th scope="col"><input type="checkbox" id="all" onclick="selectAll();"></th>
						<th scope="col">이름</th>
						<th scope="col">ID</th>
						<th scope="col">권한</th>
						<th scope="col">상세보기</th>
					</tr>
				</thead>
				<tbody>
					<% for(Member m : list) { %>
						<tr>
							<td><input type="checkbox" class="check" name="check" onclick="selectOne();"></td>
							<td><%= m.getName() %></td>
							<td><%= m.getId() %></td>
							<td><%= m.getIsAdmin() %></td>
							<td onclick="location.href='adminMemberDetail.me?userId=<%=m.getId() %>'" style="cursor:pointer;"><i class="bi bi-search"></i></td>
						</tr>
						<% memberCount++; %><!-- 한페이지에 나온 게시글의 개수 파악 -->
					<% } %>
				</tbody>
			</table>
		</div>
		<!-- 체크된 회원의 아이디 저장 -->
		<input type="hidden" id="checkMembers" name="checkMembers" value="">
		<!-- 어떤 권한으로 바꿀지 저장해놓기 -->
		<input type="hidden" id="access" name="access" value="">
		
		<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 30px;"></div>
		
		<div class="row" style="height: 50px;">
			<!-- 검색창  -->
			<div class="col-3" style="left: 20%;">
				<div class="input-group mb-3">
				</div>
			</div>
			
			<!-- 버튼 -->
			<div class="col" style="left: 37%; width: 70%;">
				<!-- 권한 수정 버튼 -->
				<button class="button1" onclick="changeAccess();">권한 수정</button>
				<!-- 회원 탈퇴 버튼 -->
				<button class="button1" onclick="selectDeleteMember();">회원 탈퇴</button>
				<!--  관리자 등록 버튼 눌렀을 때 회원가입 폼이 뜨게 함 -->
			</div>
		</div>
		</form>	

		<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 40px;"></div>

		<!-- 페이지수 표시 -->
		<nav aria-label="Page navigation example" class="pagination justify-content-center page-item">
         <!-- 맨 처음으로 -->
         <button class="page-link" onclick="location.href='<%=request.getContextPath() %>/adminMember.me?currentPage=1'" id="bebeforeBtn"> &lt;&lt; </button>
         <!-- 이전 페이지로 -->
         <button class="page-link" onclick="location.href='<%=request.getContextPath() %>/adminMember.me?currentPage=<%= currentPage -1 %>'" id="beforeBtn"> &lt; </button>
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
                  <button class="page-link" id="numBtn" onclick="location.href='<%= request.getContextPath()%>/adminMember.me?currentPage=<%= p %>'"><%= p %></button>
         <%             } %>   
         <% }%>
         
         <!-- 다음 페이지로 -->
         <button class="page-link" onclick="location.href='<%=request.getContextPath() %>/adminMember.me?currentPage=<%= currentPage + 1%>'" id="afterBtn"> &gt; </button>
         <!-- 맨 끝으로 -->
         <button class="page-link" onclick="location.href='<%=request.getContextPath() %>/adminMember.me?currentPage=<%= maxPage %>'" id="afafterBtn"> &gt;&gt;</button>
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
			
			console.log(all);
			
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
		
		// 체크박스를 이용한 여러 회원 한번에 탈퇴 시키기
		 function selectDeleteMember(){
			var checkList = document.getElementsByName('check');
			var checkMemberId = '';
			
			// 체크박스 선택된 회원의 아이디 목록 저장하기 
			for(var i = 0 ; i < <%= memberCount %> ; i++) {
				if(checkList[i].checked) {
					checkMemberId += checkList[i].parentNode.nextSibling.nextSibling.nextSibling.nextSibling.innerHTML + ",";
				}
			}
			document.getElementById('checkMembers').value = checkMemberId;
			
			if(checkMemberId == '' || checkMemberId.length == 0) {
				alert("회원을 먼저 체크해주세요");
				return 0;
			}
			
			
			var result = window.prompt("정말 삭제하시겠습니까? 삭제하시려면 관리자 코드를 입력하십시오");
			
			if(result == 'realadmin'){
				alert("삭제 완료했습니다.");
				$('#adminMemberForm').attr('action', '<%= request.getContextPath() %>/deleteMembers.me');
				$('#adminMemberForm').submit();
				
			} else if(result == null){
					
			} else{
				alert("잘못 입력하셨습니다.");				
			}
		} 
		
		// 권한 수정하기
		function changeAccess() {
			var checkList = document.getElementsByName('check');
			var checkMemberId = '';
			
			for(var i = 0 ; i < <%= memberCount %> ; i++) {
				if(checkList[i].checked) {
					checkMemberId += checkList[i].parentNode.nextSibling.nextSibling.nextSibling.nextSibling.innerHTML + ",";
				}
			}
			
			if(checkMemberId == '' || checkMemberId.length == 0) {
				alert("회원을 먼저 체크해주세요");
				return 0;
			}
			
			document.getElementById('checkMembers').value = checkMemberId;
			
			while(true) {
				var result = window.prompt("권한을 수정하시겠습니까?(ADMIN, USER)");
				if(result == null) {
					return 0;
				}
				result = result.toUpperCase();
				if(result == 'ADMIN' || result == 'USER') {
					break;
				}	
			}
			// 어떤 권한으로 변경할 것인지 값을 받아 저장하기
			document.getElementById('access').value = result;
			
			result = window.prompt("권한수정하시려면 관리자 코드를 입력하십시오");
			if(result == 'realadmin'){
				alert("권한수정 완료했습니다.");
				$('#adminMemberForm').attr('action', '<%= request.getContextPath() %>/changeAccess.me');
				$('#adminMemberForm').submit();
			} else if (result == null){
				
			} else {
				alert("잘못 입력하셨습니다.");
			}
		}
	</script>
	
</body>
</html>