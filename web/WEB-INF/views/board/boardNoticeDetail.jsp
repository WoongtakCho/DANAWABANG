<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.Board"%>
<% Board board = (Board)request.getAttribute("board"); %>   
    
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
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<style>


table {
	border: 1px solid #DEEAF4;
}

.table th[scope="col"] {
	background: rgb(17, 187, 255);
	color: white;
	width: 70px;
}

#middleCategories {
	text-align: center;
	cursor: pointer;
	font-size: 20px;
	font-weight: bold;
}


</style>
</head>
<body style="font-family: 'Nanum Gothic', sans-serif;">
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!상단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	<div id="main-container" class="container">
		<%@ include file="../common/top.jsp" %>
		<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!상단 끝!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		<div class="row" id="middleCategories">
			<div class="col-3"></div>
			<div onclick="location.href='부트공지사항.html';" class="col">공지사항</div>
			<div onclick="location.href='부트1대1 게시판2.html';" class="col">1:1
				게시판</div>
			<div onclick="location.href='#';" class="col">FAQ</div>
			<div class="col-3"></div>
		</div>

		<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 40px;"></div>

		<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  본문(공지사항 게시글 상세보기) !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
		<div class="row" style="padding: 10px;">
			<div class="col" style="padding: 0px;">
				<div
					style="font-weight: bold; font-size: 25px; text-align: center; color: rgb(17, 187, 255);"
					class="">공지사항 게시글 상세보기</div>
			</div>
		</div>
		
		<!-- 테이블 -->
		<div class="row">
			<form action="<%= request.getContextPath() %>/adminNoticeUpdateForm.bo" id="detailForm" method="post">
					<table class="table"
						style="margin-left: 220px; width: 720px; text-align: center;">
						<tbody>
							<tr>
								<th scope="col" style="vertical-align: middle;">제목<input type="hidden" name="bId" value="<%= board.getBoardId() %>"></th>
								<td><%= board.getBoardTitle() %>
								<input type="hidden" name="title" value="<%= board.getBoardTitle() %>" size="35px" class="form-control"></td>
								<th scope="col" style="vertical-align: middle;">조회수</th>
								<td><%= board.getBoardCount() %></td>
							</tr>
							<tr>
								<th scope="col" id="ie" style="vertical-align: middle;">내용<input type="hidden" name="isFirst" value="<%= board.getIsFirst() %>"></th>
								<td colspan="3">
								<textarea name="content" class="form-control" readonly style="height: 500px; resize: none; "><%= board.getBoardContent() %></textarea>
								</td>
							</tr>
						</tbody>
					</table>

				<!-- 버튼 -->
				<div class="row" style="height: 50px;">
					<!-- 돌아가기 버튼 -->
					<div class="col" style="left: 23%; width: 70%;">
						<button type="button" class="button1" onclick="location.href='<%= request.getContextPath() %>/boardNotice.bo'">돌아가기</button>
					</div>
					<div class="col" style="left: 26%;">
				
			</div>	
				</div>
			</form>
		</div>
		
		<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 80px;"></div>



		<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		<%@ include file="../common/bottom.jsp" %>
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단 끝 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	</div>
		<%@ include file="../common/navbar.jsp"%>

	<!-- 상단 스크립트 -->
	<script>
		

		//중단 카테고리 색변환
		$(function() {
			$('#middleCategories').children().hover(function() {
				$(this).css('color', '#11BBFF');
			}, function() {
				$(this).css('color', 'black');
			});
		});
	</script>


</body>
</html>
