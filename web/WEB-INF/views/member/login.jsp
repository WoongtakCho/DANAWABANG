<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
<body style="font-family: 'Nanum Gothic', sans-serif; margin-left:-17px" >
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
							class="">로그인</div>
					</div>
				</div>

				<!-- 행 사이 빈공간-->
				<div class="row" style="margin-top: 20px;"></div>


				<!-- 아이디와 비밀번호 입력 -->
		
					<form id="loginForm" action="<%=request.getContextPath()%>/login.me"
					method="post" onsubmit="return login();">
					
					<input type="text" class="info form-control" name="id" id="id" placeholder="아이디"><br> 
					<input type="password" class="info form-control" name="pass" id="pass" placeholder="비밀번호"><br>
					<input type="hidden" id="pwdLength" name="pwdLength" value="">
					<!-- 입력오류시 나타내줄 알림 영역 -->
					<div id="check" style="color: red;">&nbsp;</div>
					<br>
					<button type="submit" class="button1">로그인</button>
				</form>

				<hr>

				<!-- 행 사이 빈공간-->
				<div class="row" style="margin-top: 25px;"></div>

				<div class="row" style="font-weight: bold; font-size: 16px;">
					<div class="col">
						<a style="text-decoration: none;" class="logins" href="<%= request.getContextPath() %>/signUpForm.me">회원가입</a>
					</div>
					<div class="col">
						<a style="text-decoration: none;" class="logins" href="<%= request.getContextPath() %>/findIdForm.me">아이디찾기</a>
					</div>
					<div class="col">
						<a style="text-decoration: none;" class="logins" href="<%= request.getContextPath() %>/findPwdForm.me">비밀번호찾기</a>
					</div>
				</div>

				<!-- 행 사이 빈공간-->
				<div class="row" style="margin-top: 30px;"></div>

				<div class="row">
					<div class="col" style="color: gray; font-size: 16px;">
						SNS계정으로 간편 로그인 / 회원가입</div>
				</div>

				<!-- 행 사이 빈공간-->
				<div class="row" style="margin-top: 30px;"></div>

				<div class="row" style="">
					<div class="col">
						<!-- 카카오 로그인 버튼 -->
						<a href="javascript:kakaoLogin();"><img
							src="images/kakao_login_medium_narrow.png"
							style="height: 45px; width: auto;" /></a>
					</div>
				</div>
			</div>
			<div class="col"></div>
		</div>

		<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	</div>
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단 끝 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	<%@ include file="../common/bottom.jsp"%>
	<%@ include file="../common/navbar.jsp"%>

	<!-- 상단 스크립트 -->
	<script>
		

		//아이디/비밀번호 입력 확인
		function login() {

			var id = document.getElementById("id").value;
			var pass = document.getElementById("pass").value;
			document.getElementById("pwdLength").value = pass.length;

			if (id == "" || id.length == 0 || pass == "" || pass.length == 0) {
				document.getElementById("check").innerText = "아이디/비밀번호를 입력해주세요";
				return false;
			} else {
				return true;
			}
		}
	</script>
	<!------------------------ 카카오 로그인 script ------------------------>
	<!-- 1. sdk 초기화 -->	
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	
	<!-- 2. Javascript키 설정 -->
	<script>
		window.Kakao.init("d60784116c3161d8563cb0d099c48c4f"); 
		
		// 1-1. sdk 초기화 여부 판단
		console.log(Kakao.isInitialized());
	</script>
	
	<!-- 3. 로그인 함수 Kakao.Auth.authorize 실행   -->
	<!-- 사용자가 필수 항목에 동의하고 로그인을 요청하면, 인가 코드가 앱 정보의 Redirect URI로 발급 및 전달됨  -->
	<!-- 이 인가 코드를 이용해 액세스 토큰 요청 + 받아와야 함 -->

	<script>
		function kakaoLogin() {
			window.Kakao.Auth.login({ 
				scope : 'profile, account_email',  // 추가 항목 동의
				success : function(authObj) { 
					console.log(authObj);
					window.Kakao.API.request({
						url : '/v2/user/me',
						data: {
						   property_keys: ["kakao_account.profile", "kakao_account.email"]
						 },
						success : function(response) {
							var accessToken = Kakao.Auth.getAccessToken();
							Kakao.Auth.setAccessToken(accessToken);
							
							$('#id').attr('name', 'kakaoLoginEmail');
							$('#id').val(response.kakao_account.email);
							
							$('#pass').attr('name', 'kakaoLoginPwd');
							$('#pass').val('kakaoPwd1111');	
							
							$('#loginForm').append('<input type="hidden" name="nickName" id="nickName">');
							$('#nickName').attr('name', 'kakaoLoginNickName');
							$('#nickName').val(response.kakao_account.profile.nickname);	
							
							$('#loginForm').attr('action', '<%=request.getContextPath()%>/kakaoLogin.me');
							$('#loginForm').submit();
							// name에 담긴 비밀번호를 암호화하려면 여기서 비밀번호를 보내줘야 함
						},
						fail : function(error) {
							console.log('카카오톡과 연결이 완료되지 않았습니다. \n 다시 시도해주세요.');
						}
					});
				},
				fail : function(error){
					console.log('카카오톡과 연결 실패하였습니다. \n다시 시도해주시기 바랍니다.');
				}
			});
		};
	</script>
	
	<!-- 카카오 로그아웃 스크립트  -->
	<script>
		$('#logout').on('click', function(){		
			Kakao.init("d60784116c3161d8563cb0d099c48c4f");
			Kakao.inIntialized();
			
			if(!Kakao.Auth.getAccessToken()){
				console.log("로그인 상태가 아닙니다.");
				return;
			}
			
			Kakao.Auth.logout(function(){
				console.log(Kakao.Auth.getAccessToken());
			});
		});
	</script>


	
</body>
</html>