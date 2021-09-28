<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
    
<% Member m = (Member)request.getAttribute("member"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 비밀번호 변경</title>
<script src="js/popper.min.js"></script>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap-4.3.1.js"></script>
<link href="css/bootstrap-4.3.1.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<style>

.logins {
	color: black;
}

.logins:hover {
	color: #11BBFF;
}

.info {
	width: 260px;
	font-size: 16px;
	margin-left: 93px;
}
</style>
</head>
<body style="font-family: 'Nanum Gothic', sans-serif;">
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!상단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	<div id="main-container" class="container">
		<%@ include file="../common/top.jsp" %>

		<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!상단 끝!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->


		<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 40px;"></div>

		<div class="row" style="text-align: center;">
			<div class="col"></div>
			<div class="col-5">
				<div class="row">
					<div class="col">
						<div
							style="font-weight: bold; font-size: 25px; text-align: center; color: rgb(17, 187, 255);"
							class="">임시 비밀번호 발송</div>
							<br><br>
							고객님의 임시 비밀번호를 입력하신 이메일로 보냈습니다.<br>
							
					</div>
				</div>

				<!-- 행 사이 빈공간-->
				<div class="row" style="margin-top: 300px;"></div>

			</div>
			<div class="col"></div>
		</div>

		<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		<%@ include file="../common/bottom.jsp" %>
	</div>
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단 끝 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		<%@ include file="../common/navbar.jsp"%>

</body>
</html>