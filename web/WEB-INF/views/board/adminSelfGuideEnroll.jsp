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
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">	
<style>

table{
	border: 1px solid #DEEAF4;
}

.table th[scope="col"] {
	background: rgb(17, 187, 255);
	color: white;
	width: 16%;
}

.page-link{
	color: #11bbff;
}



/*검색창 색상*/
.bi-search{
 color: #11BBFF;
}

.thumb-list:hover {cursor:pointer;}  
</style>
</head>
<body style="font-family: 'Nanum Gothic', sans-serif;">
<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!상단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	<div id="main-container" class="container">
		<%@ include file="../common/top.jsp" %>

		<!-- 중단 카테고리 -->	
		<%@ include file="../common/adminMiddleCategory.jsp" %>
		
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  본문(셀프가이드 게시글 등록) !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
		<div class="row" style="padding: 10px;">
			<div class="col" style="padding: 0px;">
				<div
					style="font-weight: bold; font-size: 25px; text-align: center; color: rgb(17, 187, 255);"
					class="">셀프가이드 게시글 등록</div>
			</div>
		</div>
		
		<!-- 테이블 -->
		<div class="row">
			<form action="<%= request.getContextPath() %>/adminSelfGuideInsert.bo" method="post" encType="multipart/form-data" onsubmit="return validate();">
				<table class="table"
					style="margin-left: 220px; width: 720px; text-align: center;">
					<tbody>
						<tr>
							<th scope="col" style="vertical-align: middle;">제목</th>
							<td><input type="text" name="title" id="title" size="35px" class="form-control" required></td>
							<th scope="col" style="vertical-align: middle;">카테고리</th>
							<td width="30%">
							<select name="selfGuideCategory" id="category" class="form-control" class="form-control" style="vertical-align: middle;" required>
									<option value="계획하기">계획하기</option>
									<option value="조명">조명</option>
									<option value="공간배치">공간배치</option>
									<option value="수납정리">수납정리</option>
									<option value="페브릭">페브릭</option>
							</select></td>
						</tr>
						<tr>
							<th scope="col" style="vertical-align: middle;">대표이미지 등록</th>
							<td id="titleImgArea" style="cursor: pointer;">
							<img id="titleImg" width="200" height="200"> </td>
							<th scope="col" style="vertical-align: middle;">상세이미지 등록1</th>
							<td id="contentImgArea1" style="cursor: pointer;">
							<img id="contentImg1" width="200" height="200"></td>
						</tr>
						<tr>
							<th scope="col" style="vertical-align: middle;">상세이미지 등록2</th>
							<td id="contentImgArea2" style="cursor: pointer;">
							<img id="contentImg2" width="200" height="200"></td>
							<th scope="col" style="vertical-align: middle;">상세이미지 등록3</th>
							<td id="contentImgArea3" style="cursor: pointer;">
							<img id="contentImg3" width="200" height="200"></td>
						</tr>
						<tr>
							<th scope="col" style="vertical-align: middle;">상세이미지 등록4</th>
							<td id="contentImgArea4" style="cursor: pointer;">
							<img id="contentImg4" width="200" height="200"></td>
							<th scope="col" style="vertical-align: middle;">상세이미지 등록5</th>
							<td id="contentImgArea5" style="cursor: pointer;">
							<img id="contentImg5" width="200" height="200"></td>
						</tr>
					</tbody>
				</table>
				
				<!-- 파일 업로드 하는 부분 -->
				<div id="fileArea">
					<input type="file" id="thumbnailImg1" multiple="multiple" name="thumbnailImg1" onchange="LoadImg(this,1)" required>
					<input type="file" id="thumbnailImg2" multiple="multiple" name="thumbnailImg2" onchange="LoadImg(this,2)" required>
					<input type="file" id="thumbnailImg3" multiple="multiple" name="thumbnailImg3" onchange="LoadImg(this,3)" required>
					<input type="file" id="thumbnailImg4" multiple="multiple" name="thumbnailImg4" onchange="LoadImg(this,4)" required>
					<input type="file" id="thumbnailImg5" multiple="multiple" name="thumbnailImg5" onchange="LoadImg(this,5)" required>
					<input type="file" id="thumbnailImg6" multiple="multiple" name="thumbnailImg6" onchange="LoadImg(this,6)" required>
				</div>
				<script>
					// 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
					$(function(){
						$("#fileArea").hide();
						
						$("#titleImgArea").click(function(){
							$("#thumbnailImg1").click();
						});
						$("#contentImgArea1").click(function(){
							$("#thumbnailImg2").click();
						});
						$("#contentImgArea2").click(function(){
							$("#thumbnailImg3").click();
						});
						$("#contentImgArea3").click(function(){
							$("#thumbnailImg4").click();
						});
						$("#contentImgArea4").click(function(){
							$("#thumbnailImg5").click();
						});
						$("#contentImgArea5").click(function(){
							$("#thumbnailImg6").click();
						});
					});
					
					// 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
					function LoadImg(value, num){
						if(value.files && value.files[0]){
							var reader = new FileReader();
							
							reader.onload = function(e){								
								switch(num){
								case 1: 
									$("#titleImg").attr("src", e.target.result);
									break;
								case 2:
									$("#contentImg1").attr("src", e.target.result);
									break;
								case 3: 
									$("#contentImg2").attr("src", e.target.result);
									break;
								case 4:
									$("#contentImg3").attr("src", e.target.result);
									break;
								case 5: 
									$("#contentImg4").attr("src", e.target.result);
									break;
								case 6:
									$("#contentImg5").attr("src", e.target.result);
									break;
								}
							}
							
							reader.readAsDataURL(value.files[0]);
						}
					}
				</script>
				
				<!-- 버튼 -->
				<div class="row" style="height: 50px;">
					<!-- 돌아가기 버튼 -->
					<div class="col" style="left: 23%; width: 70%;">
						<button type="button" class="button1" onclick="history.back();">돌아가기</button>
					</div>
					<div class="col" style="left: 36%; width: 70%;">
						<!-- 등록 버튼 -->
						<% if(loginUser.getIsAdmin().equals("ADMIN")){ %>
						<button type="submit" class="button1">등록</button>
						<% } %>
					</div>	
				</div>
			</form>
		</div>
		
		<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 160px;"></div>
			
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		<%@ include file="../common/bottom.jsp" %>
	</div>
		<%@ include file="../common/navbar.jsp"%>
	
</body>
</html>