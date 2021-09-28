<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*, java.util.*"%>
<%
	Board b = (Board) request.getAttribute("board");
	ArrayList<BoardAttachment> fileList = (ArrayList) request.getAttribute("fileList");
	BoardAttachment titleImg = fileList.get(0);
	BoardAttachment contentImg1 = fileList.get(1);
	BoardAttachment contentImg2 = fileList.get(2);
	BoardAttachment contentImg3 = fileList.get(3);
	BoardAttachment contentImg4 = fileList.get(4);
	BoardAttachment contentImg5 = fileList.get(5);

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

	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!상단 끝!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		
	<!-- 중단 카테고리 -->	
	<%@ include file="../common/adminMiddleCategory.jsp" %>
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  본문(셀프가이드 게시글 상세보기) !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
		<div class="row" style="padding: 10px;">
			<div class="col" style="padding: 0px;">
				<div
					style="font-weight: bold; font-size: 25px; text-align: center; color: rgb(17, 187, 255);"
					class="">셀프가이드 게시글 상세보기</div>
			</div>
		</div>
		
		<!-- 테이블 -->
		<div class="row">
			<form action="<%= request.getContextPath() %>/adminSelfGuideUpdateForm.bo" id="detailForm" method="post">
				<table class="table"
					style="margin-left: 220px; width: 720px; text-align: center;">
					<tbody>
						<tr>
							<th scope="col" style="vertical-align: middle;">제목
							<input type="hidden" name="bId" value="<%= b.getBoardId() %>"></th>
							<td style="vertical-align: middle;">
								<input type="hidden" name="title" value="<%= b.getBoardTitle() %>">
								<%= b.getBoardTitle()%>
							</td>
							<th scope="col" style="vertical-align: middle;">카테고리</th>
							<td width="30%"><select class="form-control"  disabled name="selfGuideCategory">
									<option value="계획하기" <%= b.getBoardCategoryName().equals("계획하기") ? "selected" : "" %>>계획하기</option>
									<option value="조명" <%= b.getBoardCategoryName().equals("조명") ? "selected" : "" %>>조명</option>
									<option value="공간배치" <%= b.getBoardCategoryName().equals("공간배치") ? "selected" : "" %>>공간배치</option>
									<option value="수납정리" <%= b.getBoardCategoryName().equals("수납정리") ? "selected" : "" %>>수납정리</option>
									<option value="페브릭" <%= b.getBoardCategoryName().equals("페브릭") ? "selected" : "" %>>페브릭</option>
							</select>
							<input type="hidden" name="selfGuideCategory" value="<%= b.getBoardCategoryName() %>">
							</td>
						</tr>
						<tr>
							<th scope="col" style="vertical-align: middle;">대표이미지</th>
							<td id="titleImgArea">
							<input type="hidden" name="titleImgChangeName" value="<%=titleImg.getChangeName()%>">
							<input type="hidden" name="titleImgId" value="<%=titleImg.getFileId()%>">
							<a href="<%=request.getContextPath()%>/selfGuide_uploadFiles/<%=titleImg.getChangeName()%>">
							<img id="titleImg" name="titleImg" width="200" height="200" src="<%=request.getContextPath()%>/selfGuide_uploadFiles/<%=titleImg.getChangeName()%>"></a></td>
							<th scope="col" style="vertical-align: middle;">상세이미지 1</th>
							<td id="contentImgArea1">
							<input type="hidden" name="contentImg1ChangeName" value="<%=contentImg1.getChangeName()%>">
							<input type="hidden" name="contentImg1Id" value="<%=contentImg1.getFileId()%>">
							<a href="<%=request.getContextPath()%>/selfGuide_uploadFiles/<%=contentImg1.getChangeName()%>">
							<img id="contentImg1" name="contentImg1" width="200" height="200" src="<%=request.getContextPath()%>/selfGuide_uploadFiles/<%=contentImg1.getChangeName()%>"></a></td>
						</tr>
						<tr>
							<th scope="col" style="vertical-align: middle;">상세이미지 2</th>
							<td id="contentImgArea2">
							<input type="hidden" name="contentImg2ChangeName" value="<%=contentImg2.getChangeName()%>">
							<input type="hidden" name="contentImg2Id" value="<%=contentImg2.getFileId()%>">
							<a href="<%=request.getContextPath()%>/selfGuide_uploadFiles/<%=contentImg2.getChangeName()%>">
							<img id="contentImg2" name="contentImg2" width="200" height="200" src="<%=request.getContextPath()%>/selfGuide_uploadFiles/<%=contentImg2.getChangeName()%>"></a></td>
							<th scope="col" style="vertical-align: middle;">상세이미지 3</th>
							<td id="contentImgArea3">
							<input type="hidden" name="contentImg3ChangeName" value="<%=contentImg3.getChangeName()%>">
							<input type="hidden" name="contentImg3Id" value="<%=contentImg3.getFileId()%>">
							<a href="<%=request.getContextPath()%>/selfGuide_uploadFiles/<%=contentImg3.getChangeName()%>">
							<img id="contentImg3" name="contentImg3" width="200" height="200" src="<%=request.getContextPath()%>/selfGuide_uploadFiles/<%=contentImg3.getChangeName()%>"></a></td>
						</tr>
						<tr>
							<th scope="col" style="vertical-align: middle;">상세이미지 4</th>
							<td id="contentImgArea4">
							<input type="hidden" name="contentImg4ChangeName" value="<%=contentImg4.getChangeName()%>">
							<input type="hidden" name="contentImg4Id" value="<%=contentImg4.getFileId()%>">
							<a href="<%=request.getContextPath()%>/selfGuide_uploadFiles/<%=contentImg4.getChangeName()%>">
							<img id="contentImg4" name="contentImg4" width="200" height="200" src="<%=request.getContextPath()%>/selfGuide_uploadFiles/<%=contentImg4.getChangeName()%>"></a></td>
							<th scope="col" style="vertical-align: middle;">상세이미지 5</th>
							<td id="contentImgArea5">
							<input type="hidden" name="contentImg5ChangeName" value="<%=contentImg5.getChangeName()%>">
							<input type="hidden" name="contentImg5Id" value="<%=contentImg5.getFileId()%>">
							<a href="<%=request.getContextPath()%>/selfGuide_uploadFiles/<%=contentImg5.getChangeName()%>">
							<img id="contentImg5" name="contentImg5" width="200" height="200" src="<%=request.getContextPath()%>/selfGuide_uploadFiles/<%=contentImg5.getChangeName()%>"></a></td>
						</tr>
					</tbody>
				</table>
			
				<!-- 버튼 -->
				<div class="row" style="height: 50px;">
					<!-- 돌아가기 버튼 -->
					<div class="col" style="left: 23%; width: 70%;">
						<button type="button" class="button1" onclick="location.href='<%= request.getContextPath() %>/adminSelfGuide.bo'">돌아가기</button>
					</div>
					<div class="col" style="left: 26%;">
						<% if(loginUser != null && loginUser.getIsAdmin().contains("ADMIN")) { %>
						<!-- 수정 버튼 -->
						<button type="submit" class="button1">수정</button>
						<!-- 삭제 버튼 -->
						<button type="button" id="delete" class="button1">삭제</button>
						<% } %>
					</div>	
				</div>
			</form>
		</div>
		
		<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 80px;"></div>
			
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		<%@ include file="../common/bottom.jsp" %>
	</div>
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단 끝 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	<%@ include file="../common/navbar.jsp"%>

	<!-- 상단 스크립트 -->

	<script>
		// 삭제 버튼
		$(function(){
			$('#delete').click(function(){
				var bool = prompt('정말 삭제하시겠습니까? 삭제하시려면 관리자 코드를 입력하십시오')
				if(bool == "realadmin"){
					$('#detailForm').attr('action', 'delete.bo');
					$('#detailForm').submit();
				}  else {
					if(bool == null) {
						
					} else {
						alert("값을 제대로 입력해주세요.");	
					}
				}
			});	
		});	
	</script>
	
</body>
</html>