<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>

</style>
</head>
<body style="font-family: 'Nanum Gothic', sans-serif;">
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!상단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	<div id="main-container" class="container">
		<%@ include file="../common/top.jsp" %>

		<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!상단 끝!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
			
			
			<!-- 홍보1 -->	
			<div class="row">
				<!-- 여백 -->
				<div class="col"></div>
				<!-- 내용 -->
				<div class="col"
					style="text-align: center; vertical-align: middle; text-decoration: none; font-size: 30px; font-weight: bold; color: rgb(17, 187, 255);">누구나 예쁜 집에<br>살 수 있도록</div>
				<!-- 여백 -->
				<div class="col"></div>
			</div>
			<!-- 행 사이 빈공간-->
			<div class="row" style="margin-top: 10px;"></div>
			<!-- 안내 문구 -->
		<div class="row">
			<div class="col"></div>
			<div class="col" style="text-align:center; font-size:13px; color:#6c757d;">우리는 원스톱 인테리어 플랫폼'다나와방'을 통해<br>집을 꾸미는 방식을 새롭게 정의합니다.<br>이를 통해 누구나 쉽고 재미있게 자신의 공간을<br>만들어가는 문화가 널리 퍼지기를 꿈꿉니다.</div>
			<div class="col"></div>
		</div>
		<!-- 행 사이 빈공간-->
			<div class="row" style="margin-top: 40px;"></div>
			

			
			<div class="container marketing">
				<!-- 상단 광고 3개 -->
				<!-- 상단 광고1 -->
				<div class="row">
					<div class="col-4" style="text-align:center;">
						<i class="bi bi-house" style="font-size:60px; color:#11BBFF;"></i>

						<h5 style="text-align:center; color:#6c757d;"><b>누구보다 멋진<br>당신의 방을 위해</b></h5>
						<p></p>
					</div>
					<div class="col-4" style="text-align:center;">
						<i class="bi bi-emoji-smile" style="font-size:60px; color:#11BBFF;"></i>

						<h5 style="text-align:center; color:#6c757d;"><b>그 방에서 행복할<br>당신을 생각하며</b></h5>
						<p></p>
					</div>
					<div class="col-4" style="text-align:center;">
						<i class="bi bi-hammer" style="font-size:60px; color:#11BBFF;"></i>

						<h5 style="text-align:center; color:#6c757d;"><b>오늘도 저희는<br>더 노력하고 있습니다.</b></h5>
						<p></p>
					</div>
				</div>
				
<!-- 행 사이 빈공간-->
			<div class="row" style="margin-top: 10px;"></div>

				<hr class="featurette-divider">

				<div class="row featurette">
					<div class="col-7" style="margin-top:80px;">
						<h3 class="featurette-heading" style="color:#11bbff">
							<span class="text-muted">제품 탐색부터<br>구매까지 가능한</span> 스토어
						</h3>
						<p class="lead" style="font-size:13px;">콘텐츠 속 제품 정보가 궁금하다면 태그를 클릭하여 제품의 상세 정보를 확인하고,<br>
						구매까지 한 번에 이루어질 수 있도록 편리한 구매 경험을 제공합니다.</p>
					</div>
					<div class="col-5">
						<img src="images/회사소개이미지1.png">
					</div>
				</div>

				<hr class="featurette-divider">

				<div class="row featurette">
					<div class="col-7" style="margin-top:80px;">
						<h3 class="featurette-heading" style="color:#11bbff">
							쉽고 편하게 <span class="text-muted"><br>집을 꾸밀 수 있도록</span>
						</h3>
						<p class="lead" style="font-size:13px;">공간을 바꾸면 삶이 바뀐다는 믿음 아래<br>누구나 쉽게 집을 꾸밀 수 있도록 필요한 정보와 서비스를 제공합니다.</p>
					</div>
					<div class="col-5">
						<img src="images/회사소개이미지2.png">
					</div>
				</div>

				<hr class="featurette-divider">

				<div class="row featurette">
					<div class="col-12" style="text-align: center; margin-top:30px;">
						<h3 class="featurette-heading" style="color:#11bbff; margin-bottom:30px;">
							<span class="text-muted">이런 저희의 서비스를</span><br>경험해보고 싶으시다면,<br>
						</h3>
						<button onclick="location.href='<%= request.getContextPath() %>/boardStore.bo';" style="border: 1px solid rgb(17, 187, 255); background-color: rgb(17, 187, 255); color: white;
	border-radius: 4px; width: 130px; height: 60px; margin-bottom:30px;">지금 바로<br>쇼핑하러 가기</button>
					</div>
					
				</div>

				<hr class="featurette-divider">

				<!-- /END THE FEATURETTES -->

			</div>
			<!-- /.container -->

		<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		<%@ include file="../common/bottom.jsp" %>
	</div>
		<%@ include file="../common/navbar.jsp"%>
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단 끝 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->

	<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>