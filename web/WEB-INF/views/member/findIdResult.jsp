<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.Member"%>

<%
	Member m = (Member) request.getAttribute("findIdMember");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>
<script src="js/popper.min.js"></script>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap-4.3.1.js"></script>
<link href="css/bootstrap-4.3.1.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<style>
</style>
</head>
<body style="font-family: 'Nanum Gothic', sans-serif;">
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!상단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	<div id="main-container" class="container">
		<%@ include file="../common/top.jsp"%>

		<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 본문(회원 리스트) !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->

		<!-- 중단 카테고리 여백 -->
			<div class="col" style="margin-top: 40px;"></div>
			
		<div class='row'>
			<div class="col">
				<div
					style="font-weight: bold; font-size: 25px; text-align: center; color: rgb(17, 187, 255);"
					class="">아이디 찾기</div>
					<!-- 행 사이 빈공간-->
					<div class="row" style="margin-top: 50px;"></div>
				<% if(m.getId() != null) { %>
				<p style="text-align: center;">고객님의 정보와 일치하는 아이디 입니다.</p>
				
				<div style="display: flex; align-items: center; border: 1px solid lightgray; margin: 0 auto; height: 100px; width: 500px; text-align: center;">
					<span style="margin-left: 110px; font-size: 18px; font-weight: bold;"><%=m.getId()%></span>
					<span style="margin-left: 100px;">가입일 : <%=m.getEnrollDate()%></span>
				</div>
				<%} else { %>
					<p style="text-align: center;">고객님의 정보와 일치하는 아이디가 없습니다.</p>
				<%} %>
			</div>
		</div>

		<div class="row">
			<div class="col-4"></div>
			<div class="col">
				<!-- 행 사이 빈공간-->
				<div class="row" style="margin-top: 60px;"></div>
				<% if(m.getId() != null) { %>
				<button type="button" class="button1" style="width: 110px; margin-left: 55px;" onclick="location.href='<%=request.getContextPath()%>/loginForm.me'">로그인</button>
				<button type="button" class="button1" style="width: 110px; margin-left: 10px;" onclick="location.href='<%=request.getContextPath()%>/findPwdForm.me'">비밀번호 찾기</button>
				<% } else  {%>
				<button type="button" class="button1" style="width: 110px; margin-left: 115px;" onclick="history.back();">돌아가기</button>
				<%} %>
			</div>
			<div class="col-4"></div>	
		</div>
	</div>

	<!-- 행 사이 빈공간-->
	<div class="row" style="margin-top: 160px;"></div>

	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	<%@ include file="../common/bottom.jsp"%>
	</div>
	<%@ include file="../common/navbar.jsp"%>


</body>
</html>