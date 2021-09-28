<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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

/* 입력란 길이 */
.form-control {
	width: 290px;
	font-size: 15px;
}

/* 필수항목의 (필수) */
.need {
	font-size: 12px;
	color: rgb(17, 187, 255);
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

		<div class="row">
			<div class="col"
				style="text-align: center; font-size: 30px; font-weight: bold; color: rgb(17, 187, 255);">
				회원가입</div>
		</div>

		<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 20px;"></div>

		<div class="row"
			style="line-height: 40px; font-weight: bold; font-size: 17px;">
			<div class="col"></div>
			<div class="col-6">
				<form action="<%= request.getContextPath() %>/insert.me" name="signUpForm" onsubmit="return enroll();">
					이름<br> 
					<input type="text" id="name" name="name" class="form-control" placeholder="이름">
					아이디<br>
					<input type="text" id="id" name="id" class="form-control" placeholder="중복확인 버튼을 눌러주세요" style="display: inline; background: white;" readonly>
					<button type="button" class="button1" style="margin-left: 20px;" onclick="idCheck();">중복확인</button><br>
					비밀번호<br> 
					<span style="font-weight: normal; font-size: 12px;">8~15자리이하 영,숫자를 입력해주세요</span><br>
					<input type="password" id="pw1"	class="form-control" placeholder="비밀번호"> 비밀번호 확인<br>
					<input type="password" id="pw2" name="pwd" class="form-control" placeholder="비밀번호 확인" style="display: inline" onblur="checkPw();">

					<!-- 비밀번호 동일한지 알림 -->
					<span id="check" style="font-size: 15px; font-weight: normal;">&nbsp;</span><br>

					이메일<br><input type="email" id="email" name="email" class="form-control"placeholder="이메일" style="display: inline; background: white;" >
					<button type="button" class="button1" style="margin-left: 20px;" onclick="emailCheck();">인증하기</button><br>
					
					전화번호<br><input type="text" id="phone" name="phone" class="form-control" placeholder="핸드폰 번호 : 000-0000-0000">
					
					주소<br>
					<input type="text" id="post" name="post" class="form-control" style="width: 150px;"placeholder="우편번호 : 00000">
					<input type="text" id="add1" name="add1" class="form-control" style="margin-top: 5px;" placeholder="주소">
					<input type="text" id="add2" name="add2" class="form-control" style="margin-top: 5px;" placeholder="상세주소">

					<!-- 약관동의  -->
					약관동의<br>
					<div style="border: 1px solid black; width: 460px; height: 230px;">
						<table
							style="margin-left: 20px; line-height: 40px; width: 410px; font-size: 16px; font-weight: normal;">
							<tr style="border-bottom: 1px solid black;">
								<th style="width: 30px;"><input type="checkbox" id="all"
									name="agree" onclick="selectAll();"></th>
								<th>전체동의</th>
							</tr>
							<tr>
								<td><input type="checkbox" name="agree"	onclick="selectOne();"></td>
								<td>만 14세 이상입니다.<span class="need">&nbsp;(필수)</span></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="agree"	onclick="selectOne();"></td>
								<td>이용약관<span class="need">&nbsp;(필수)</span></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="agree"	onclick="selectOne();"></td>
								<td>개인정보수집 및 이용동의<span class="need">&nbsp;(필수)</span></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="agree"	onclick="selectOne();"></td>
								<td>이벤트,프로모션 알림 메일 및 SMS 수신<span
									style="font-size: 15px; color: gray;">&nbsp;(선택)</span></td>
							</tr>
						</table>
					</div>

					<br>
					<!-- 회원가입 완료 버튼 -->
					<button type="submit" class="button1"
						style="margin-left: 30px; width: 400px; height: 45px; text-align: center; font-size: 22px;">
						회원가입</button>
				</form>

			</div>
			<div class="col"></div>
		</div>
		
		<div style="margin-bottom: 120px;"></div>

		<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		<%@ include file="../common/bottom.jsp" %>
	</div>
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단 끝 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	<%@ include file="../common/navbar.jsp"%>

	<!-- 상단 스크립트 -->
	<script>
		

		/* 비밀번호 확인하는 메소드 */
		function checkPw() {
			var pw1 = document.getElementById('pw1').value;
			var pw2 = document.getElementById('pw2').value;
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

		/* 체크박스 선택방식 메소드 */
		function selectAll() {
			var agree = document.getElementsByName("agree");
			var all = document.getElementById("all");

			if (document.getElementById("all").checked) {
				for (var i = 0; i < agree.length; i++) {
					agree[i].checked = true;
				}
			} else {
				for (var i = 0; i < agree.length; i++) {
					agree[i].checked = false;
				}
			}
		}

		function selectOne() {
			var agree = document.getElementsByName("agree");
			var all = document.getElementById("all");
			var count = 0;

			for (var i = 1; i < agree.length; i++) {
				if (agree[i].checked) {
					count++;
				}
			}

			if (count != 4) {
				all.checked = false;
			} else {
				all.checked = true;
			}
		}

		/* 약관동의 필수사항 선택확인 메소드 */
		function agreee() {
			var agree = document.getElementsByName("agree");

			for (var i = 1; i < (agree.length) - 1; i++) {
				if (agree[i].checked == false) {
					return 1;
				}
			}
			return 2;
		}

		/* 회원가입시 빠진 항목 확인 메소드 */
		function enroll() {
			var userName = document.getElementById('name').value;
			var userId = document.getElementById('id').value;
			var userPw1 = document.getElementById('pw1').value;
			var userPw2 = document.getElementById('pw2').value;
			var email = document.getElementById('email').value;
			var email = document.getElementById('email').value;
			var phone = document.getElementById('phone').value;
			var post = document.getElementById('post').value;
			var add1 = document.getElementById('add1').value;
			var add2 = document.getElementById('add2').value;
			var agree = document.getElementsByName('agree');
			
			var regExp = /^[A-Za-z0-9]{8,15}$/;
			var phoneRegExp = /^\d{3}-\d{3,4}-\d{4}$/;
			var postRegExp = /^\d{5}$/;
			
			if (userName == '' || userName.length == 0) {
				alert('이름을 입력해주세요.');
				document.getElementById('name').focus();
				return false;
			} else if (userId == '' || userId.length == 0) {
				alert('아이디를 입력해주세요.');
				document.getElementById('id').focus();
				return false;
			} else if (userPw1 == '' || userPw1.length == 0) {
				alert('비밀번호를 입력해주세요.');
				document.getElementById('pw1').focus();
				return false;
			} else if (userPw2 == '' || userPw2.length == 0) {
				alert('비밀번호 확인을 입력해주세요.');
				document.getElementById('pw2').focus();
				return false;
			} else if (document.getElementById('check').style.color == 'red' || userPw1 != userPw2) {
				alert('비밀번호가 일치하지 않습니다.');
				document.getElementById('pw2').value = '';
				document.getElementById('pw2').focus();
				return false;
			} else if (!regExp.test(userPw1)) {
				alert('비밀번호가 조건에 맞지 않습니다');
				document.getElementById('pw1').value = '';
				document.getElementById('pw2').value = '';
				document.getElementById('pw1').focus();
				return false;
			} else if (email == '' || email.length == 0) {
				alert('이메일을 입력해주세요.');
				document.getElementById('email').focus();
				return false;
			} else if(post == '' || post.length == 0) {
				alert('우편번호를 입력해주세요.');
				document.getElementById('post').focus();
				return false;
			} else if(!postRegExp.test(post)) {
				alert('우편번호는 숫자 5자리 입니다');
				document.getElementById('post').value = '';
				document.getElementById('post').focus();
				return false;
			} else if(add1 == '' || add1.length == 0) {
				alert('주소를 입력해주세요.');
				document.getElementById('add1').focus();
				return false;
			} else if(add2 == '' || add2.length == 0) {
				alert('상세주소를 입력해주세요.');
				document.getElementById('add2').focus();
				return false;				
			} else if (agreee() == 1) {
				alert("필수 항목에 동의해주세요.")
				return false;
			} else {
				alert(userName + "님, 회원가입이 성공적으로 완료되었습니다.");
				return true;
			}
		}
		
		function idCheck() {
			window.open('checkIdForm.me', 'idCheckForm', 'width=350, height=300');
		}
		
		function emailCheck() {
			window.open('checkEmailForm.me', 'emailCheckForm', 'width=350, height=300');
		}
		

		
	</script>

	
</body>
</html>
