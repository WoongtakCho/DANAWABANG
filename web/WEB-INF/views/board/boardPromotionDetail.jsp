<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="board.model.vo.*, java.util.*"%>
<%
	Board b = (Board) request.getAttribute("board");
ArrayList<BoardAttachment> fileList = (ArrayList) request.getAttribute("fileList");
BoardAttachment titleImg = fileList.get(0);
BoardAttachment contentImg1 = fileList.get(1);
BoardAttachment contentImg2 = fileList.get(2);
BoardAttachment contentImg3 = fileList.get(3);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다나와방</title>
<script src="js/popper.min.js"></script>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap-4.3.1.js"></script>
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
<link href="css/bootstrap-4.3.1.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">	

<style>

.water3 {
	background: #11BBFF;
	border-color: #11BBFF;
	width: 100px;
	height: 30px;
	border: none;
	color:  white;
	border-radius: 4px;
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
		
		
		<!-- 셀프가이드 전용 -->
		<div class="container" style="margin-bottom: 50px;">
			<div class="row" >
				<div class="col-4"></div>
				<div class="col-4" style=" text-align:center; font-size: 25px; color: #11BBFF; font-weight: bold;">프로모션</div>
				<div class="col-4"></div>
			</div>
		</div>
		<div class="row">
			<div class="col-2"></div>
			<div class="col-7" style=" font-size: 30px; text-decoration: none; font-weight: bold; margin-left: 20px; margin-bottom:30px;"><%= b.getBoardTitle() %></div>
			<div class="col-3"></div>
		</div>
		<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 40px;"></div>
		<div class="row" style="margin-bottom: 20px;">
			<div class="col-2"></div>
			<div class="col-5" style=" font-size: 17px; text-decoration: none; font-weight: bold; margin-left: 20px;">조회수 : <%= b.getBoardCount() %></div>
			<div class="col-4" style=" font-size: 17px; text-decoration: none; font-weight: bold; margin-left: 50px;">작성일자 : <%= b.getEnrollDate() %></div>
		</div>
		<% 
			String links = "";
		%>
		<% switch(b.getBoardId()){ 
						case 272 : links= "1,"; break;
						case 271 : links= "3,"; break;
						case 270 : links= "3,"; break;
						case 269 : links= "6,"; break;
						case 268 : links= "3,"; break;
						case 267 : links= "6,"; break;
					 } %>
		<div class="container">
			<div class="row">
				<div class="col-2"></div>
				<div class="col-8">
					<div class="thumb-list" align="center">
						<div style="margin-bottom:30px;"><img id="titleImg" width=720 name="titleImg" src="<%=request.getContextPath()%>/thumbnail_uploadFiles/<%=titleImg.getChangeName()%>"></div>
						<div style="margin-bottom:30px;"><img id="titleImg" width=720 name="contentImg1" src="<%=request.getContextPath()%>/thumbnail_uploadFiles/<%=contentImg1.getChangeName()%>"></div>
						<div style="margin-bottom:30px;"><img id="titleImg" width=720 name="contentImg2" src="<%=request.getContextPath()%>/thumbnail_uploadFiles/<%=contentImg2.getChangeName()%>"></div>
						<div style="margin-bottom:30px;"><img id="titleImg" width=720 name="contentImg3" src="<%=request.getContextPath()%>/thumbnail_uploadFiles/<%=contentImg3.getChangeName()%>"></div>
						<div style="margin-top: 50px;font-weight:bold; font-size:20px;">프로모션 관련 상품을 보고 싶으시다면<br>
						<button class="water3" style="margin-top:30px; font-size: 18px;" 
						onclick="location.href='<%=request.getContextPath() %>/boardStore.bo?currentPage=1&checkedItemCategory=<%=links%>'">보러 가기</button></div>
					</div>
		</div>
		<div class="col-2"></div>
			</div>
		</div>

		<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 60px;"><input type="button" class="button1" onclick="location.href='<%=request.getContextPath()%>/boardPromotion.bo'" value="돌아가기" style="margin-left: 205px;">
				</div>
				
					<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 160px;"></div>
	
		<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		<%@ include file="../common/bottom.jsp" %>
	</div>
		<%@ include file="../common/navbar.jsp"%>
		
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단 끝 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	

</body>
</html>