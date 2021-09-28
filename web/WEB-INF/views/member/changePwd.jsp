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
							class="">새 비밀번호 변경</div>
							<br>
							고객님의 안전한 정보보호를 위해 비밀번호를 변경해주세요.
					</div>
				</div>

				<!-- 행 사이 빈공간-->
				<div class="row" style="margin-top: 40px;"></div>

				<!-- 아이디와 비밀번호 입력 -->
				<form action="<%= request.getContextPath() %>/changePwd.me" method="post" onsubmit="return checkPwd();">
					<input type="password" class="info form-control" name="pwd" id="pwd" placeholder="새 비밀번호"><br> 
					<input type="password" class="info form-control" name="pwd" id="pwd2" placeholder="새 비밀번호 확인" onkeyup="checkPw();"><br>
					<input type="hidden" name="id" value="<%= m.getId() %>">

					<!-- 입력오류시 나타내줄 알림 영역 -->
					<div id="check" style="color: red;">&nbsp;</div>
					<br>
					<button type="submit" class="button1">변경하기</button>
				</form>

				<!-- 행 사이 빈공간-->
				<div class="row" style="margin-top: 30px;"></div>

			</div>
			<div class="col"></div>
		</div>

		<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		<%@ include file="../common/bottom.jsp" %>
	</div>
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단 끝 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	<%@ include file="../common/navbar.jsp"%>

	<!-- 상단 스크립트 -->
	<script>
		function checkPw() {
			var pw1 = document.getElementById('pwd').value;
			var pw2 = document.getElementById('pwd2').value;
			var check = document.getElementById('check');
	
			if (pw2 == '' || pw2.length == 0) {
				check.innerHTML = '';
			} else if (pw1 != pw2) {
				check.style.color = 'red';
				check.innerHTML = '비밀번호가 일치하지 않습니다.';
			} else {
				check.style.color = 'green';
				check.innerHTML = '비밀번호가 일치합니다.';
			}
		}

		//비밀번호 입력 확인
		function checkPwd() {

			var pwd = document.getElementById("pwd").value;
			var pwd2 = document.getElementById("pwd2").value;

			if (pwd == "" || pwd.length == 0 || pwd2 == "" || pwd2.length == 0) {
				document.getElementById("check").innerText = "비밀번호를 입력해주세요";
				return false;
			} else if(document.getElementById('check').style.color == 'red' || pwd != pwd2) {
				alert('비밀번호가 일치하지 않습니다.');
				document.getElementById('pwd').value = '';
				document.getElementById('pwd').focus();
				return false;
			} else {
				alert("비밀번호가 변경되었습니다.");
				return true;
			}
		}
	</script>
	
</body>
</html>
