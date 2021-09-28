<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
  
<%
	Member m = (Member)request.getAttribute("member");

	/* String splitStr = m.getAddress();
	String[] address = new String[3];
	address = splitStr.split("/");
	String address2 = address[0] + ", " + address[1] + " " + address[2];  */
	
	String[] address = m.getAddress().split("/");
	String address2 = address[0] + ", "  + address[1] + " " + address[2]; 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자_회원관리_관리자상세</title>
<script src="js/popper.min.js"></script>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap-4.3.1.js"></script>
<link href="css/bootstrap-4.3.1.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">	
<style>


table{
	border: 1px solid #DEEAF4;
}

.table th[scope="col"] {
	background: rgb(17, 187, 255);
	color: white;
}


.page-link{
	color: #11bbff;
}


</style>
</head>
<body style="font-family: 'Nanum Gothic', sans-serif;">
<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!상단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	<div id="main-container" class="container">
		<%@ include file="../common/top.jsp" %>

		<!-- 중단 카테고리(상품관리페이지) -->	
		<%@ include file="../common/adminMiddleCategory.jsp" %>
		
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 본문 (관리자 상세 정보) !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		<div class="row" style="padding: 10px;">
			<div class="col" style="padding: 0px;">
				<div
					style="font-weight: bold; font-size: 25px; text-align: center; color: rgb(17, 187, 255);"
					class="">관리자 정보</div>
			</div>
		</div>
		
		<!--  -->
		<!-- 주문 내역 -->
         <form action="deleteMember.me" onsubmit="return deleteMember();">
         <div class="row">
            <table class="table" style="width: 720px; margin-left: 220px; margin-top: 10px; text-align: center;">
				<tbody>
				<tr>
					<th scope="col" style="vertical-align: middle;">이름</th>
					<td width="37%"><%= m.getName() %></td>
					<th scope="col" style="vertical-align: middle;">아이디</th>
					<td width="37%"><%= m.getId() %><input type="hidden" id="userId" name="userId" value="<%= m.getId() %>"></td>
				</tr>
				<tr>
					<th scope="col" style="vertical-align: middle;">이메일</th>
					<td><%= m.getEmail() %></td>
					<th scope="col" style="vertical-align: middle;">연락처</th>
					<td><%= m.getPhone() %></td>
				</tr>
				<tr>
					<th scope="col" style="vertical-align: middle;">주소</th>
					<td><%= address2 %></td>
					<th scope="col" style="vertical-align: middle;">가입일</th>
					<td><%= m.getEnrollDate() %></td>
				</tr>
				</tbody>
			</table>
		</div>
		
		<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 30px;"></div>
		
		<!-- 버튼 -->
		<div class="row" style="height: 50px;">
			<!-- 돌아가기 버튼 -->
			<div class="col"
				style="left: 18%; width: 70%;">
			<button class="button1" onclick="history.back(); return false;">돌아가기</button>
			</div>
			<!-- 삭제 버튼 -->
			<div class="col"
				style="left: 22%; width: 70%;">
				<button type="submit" class="button1" id="delete">삭제</button>
			</div>	
		</div>
	
		</form>
			<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 160px;"></div>
			
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		<%@ include file="../common/bottom.jsp" %>
	</div>
	<%@ include file="../common/navbar.jsp"%>


	<!-- 상단 스크립트 -->
	<script>
		
		
		
		// 삭제 버튼
		function deleteMember() {
			var result = window.prompt('정말 삭제하시겠습니까? 삭제하시려면 관리자 코드를 입력하십시오');
			
			if(result == 'realadmin'){
				alert("삭제 완료했습니다.");
				return true;
			} else if (result == null) {
				return false;
			} else {
				alert("잘못 입력하셨습니다.");
				return false;
			}
		}
	</script>
	
</body>
</html>