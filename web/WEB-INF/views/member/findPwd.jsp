<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
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

.findId {
	color: black;
}

.findId:hover {
	color: #11BBFF;
}

.info {
	margin-left: 92px;
	width: 260px;
	font-size: 18px;
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
						<div style="font-weight: bold; font-size: 25px; text-align: center; color: rgb(17, 187, 255);"
							class="">비밀번호 찾기</div>
					</div>
				</div>

				<!-- 행 사이 빈공간-->
				<div class="row" style="margin-top: 30px;"></div>

				<form action="findPwd.me" onsubmit="return findPw();">

					<!-- 정보 입력란 -->
					<input type="text" class="info form-control" placeholder="아이디"	id="id" name="id">
					 <br>
					 <input type="text"	class="info form-control" placeholder="이메일" id="email" name="email">
					 <br>

					<!-- 버튼 -->
					<br>
					<button type="button" class="button1" onclick="history.back();">돌아가기</button>
					<button type="submit" class="button1" style="margin-left: 35px;">확인</button>

					<!-- 행 사이 빈공간-->
					<div class="row" style="margin-top: 20px;"></div>
					
					<hr>

					<div class="row">
						<div class="col" style="font-size: 18px; font-weight: bold;">
							<a href="<%= request.getContextPath() %>/findIdForm.me" class="findId" style="text-decoration: none;">아이디 찾기</a>
						</div>
					</div>

					<!-- 행 사이 빈공간-->
					<div class="row" style="margin-top: 20px;"></div>

				</form>
			</div>
			<div class="col"></div>
		</div>

		<div class="row" style="margin-top: 10px;"></div>
		<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		<%@ include file="../common/bottom.jsp" %>
	</div>
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단 끝 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	<%@ include file="../common/navbar.jsp"%>

	<!-- 상단 스크립트 -->
	<script>
		

		//내용 작성 확인
		function findPw() {
			var id = document.getElementById("id").value;
			var email = document.getElementById("email").value;

			if (id == '' || id.length == 0) {
				alert("아이디를 입력해주세요.");
				document.getElementById("id").focus();
				return false;
			} else if (email == '' || email.length == 0) {
				alert("이메일을 입력해주세요.");
				document.getElementById("email").focus();
				return false;
			} else {
				return true;
			}
		}
	</script>

	
</body>
</html>
