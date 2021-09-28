<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*, java.util.*"%>
<%
	Board b = (Board) request.getAttribute("b");
	ArrayList<BoardAttachment> fileList = (ArrayList) request.getAttribute("fileList");
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
</style>
</head>
<body style="font-family: 'Nanum Gothic', sans-serif;">
<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!상단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	<div id="main-container" class="container">
		<%@ include file="../common/top.jsp" %>

		<!-- 중단 카테고리 -->	
		<%@ include file="../common/adminMiddleCategory.jsp" %>
		
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  본문(프로모션 게시글 상세보기) !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
		<div class="row" style="padding: 10px;">
			<div class="col" style="padding: 0px;">
				<div
					style="font-weight: bold; font-size: 25px; text-align: center; color: rgb(17, 187, 255);"
					class="">프로모션 게시글 상세보기</div>
			</div>
		</div>
		
		<!-- 테이블 -->
		<div class="row">
			<form action="<%=request.getContextPath() %>/adminPromotionUpdate.bo" id="detailForm" method="post" encType="multipart/form-data" onsubmit="return validate();">
				<table class="table" style="width: 720px; margin-left: 220px; margin-top: 10px; text-align: center;">
					<tbody>
						<tr>
							<th scope="col" style="vertical-align: middle;">제목</th>						
							<td colspan="3"><input type="text" size="35px" id="title" name="title" class="form-control" value="<%=b.getBoardTitle()%>">
							<input type="hidden" name="bId" value="<%= b.getBoardId()%>">
						</tr>
						<tr>
							<th scope="col" style="vertical-align: middle;">대표이미지</th>
							<td id="titleImgArea" style="cursor: pointer;"><input type="hidden" name="titleImgId" value="<%=fileList.get(0).getFileId()%>">
							<img id="titleImg" width="200" height="200" src="<%=request.getContextPath()%>/thumbnail_uploadFiles/<%=fileList.get(0).getChangeName()%>"></td>
							<th scope="col" style="vertical-align: middle;">상세이미지 1</th>
							<td id="contentImgArea1" style="cursor: pointer;"><input type="hidden" name="contentImg1Id" value="<%=fileList.get(1).getFileId()%>">
							<img id="contentImg1" width="200" height="200" src="<%=request.getContextPath()%>/thumbnail_uploadFiles/<%=fileList.get(1).getChangeName()%>"></td>
						</tr>
						<tr>
							<th scope="col" style="vertical-align: middle;">상세이미지 2</th>
							<td id="contentImgArea2" style="cursor: pointer;"><input type="hidden" name="contentImg2Id" value="<%=fileList.get(2).getFileId()%>">
							<img id="contentImg2" width="200" height="200" src="<%=request.getContextPath()%>/thumbnail_uploadFiles/<%=fileList.get(2).getChangeName()%>"></td>
							<th scope="col" style="vertical-align: middle;">상세이미지 3</th>
							<td id="contentImgArea3" style="cursor: pointer;"><input type="hidden" name="contentImg3Id" value="<%=fileList.get(3).getFileId()%>">
							<img id="contentImg3" width="200" height="200" src="<%=request.getContextPath()%>/thumbnail_uploadFiles/<%=fileList.get(3).getChangeName()%>"></td>
						</tr>
						<tr>
							<th scope="col" style="vertical-align: middle;">내용</th>
							<td colspan="3"><textarea class="form-control" id="content" name="content"
									style="height: 200px; resize:none;"><%=b.getBoardContent()%></textarea></td>
						</tr>
					</tbody>
				</table>
				<!-- 파일 업로드 하는 부분 -->
				<div id="fileArea">
					<input type="file" id="thumbnailImg1" multiple="multiple" name="thumbnailImg1" onchange="LoadImg(this,1)">
					<input type="file" id="thumbnailImg2" multiple="multiple" name="thumbnailImg2" onchange="LoadImg(this,2)">
					<input type="file" id="thumbnailImg3" multiple="multiple" name="thumbnailImg3" onchange="LoadImg(this,3)">
					<input type="file" id="thumbnailImg4" multiple="multiple" name="thumbnailImg4" onchange="LoadImg(this,4)">
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
								}
							}
							
							reader.readAsDataURL(value.files[0]);
						}
					}
				</script>
				<div class="col">
					<input type="button" class="button1"
						onclick="location.href='<%=request.getContextPath()%>/adminPromotion.bo'"
						value="돌아가기" style="margin-left: 210px; margin-right: 500px;">
					<input type="submit" class="button1" id="update" value="등록">
				</div>
			</form>
		</div>
		
		
				<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 160px;"></div>
			
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		<%@ include file="../common/bottom.jsp" %>
	</div>
		<%@ include file="../common/navbar.jsp"%>
	
	<script>
	
		function validate(){
			if($('#title').val().trim() == ""){
				alert("제목을 입력해주세요");
				$('#title').focus();
				return false;
			} else if($('#titleImg').attr("src") == null){
				alert("대표이미지를 등록해주세요");
				return false;
			} else if($('#contentImg1').attr("src") == null){
				alert("상세이미지1을 등록해주세요");
				return false;
			}	else if($('#contentImg2').attr("src") == null){
				alert("상세이미지2를 등록해주세요");
				return false;
			} else if($('#contentImg3').attr("src") == null){
				alert("상세이미지3을 등록해주세요");
				return false;
			} return true;
		}
		
	</script>
</body>
</html>