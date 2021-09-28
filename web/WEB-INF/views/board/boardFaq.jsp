<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.Board" %>
<%
	ArrayList<Board> list = (ArrayList) request.getAttribute("list");
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>

body{line-height: 1.5;}
.form-control {height: calc(1.5em + 1.2rem + 2px);}
#main-search {height: calc(1.5em + 1.2rem + 2px);}

.category {
	font-size: 18px;
	color: black;
}

table {
	margin-left: 10px;
}

td {
	font-size: 20px;
	cursor: pointer;
}

span {
	color: #11BBFF;
	font-size: 20px;
	font-weight: bold;
}

td>p {
	width: 700px;
	height: 100px;
	display: none;
}

.customer {
	margin-left: 30px;
	line-height: 30px;
	font-size: 20px;
	font-weight: bold;
}

#middleCategories {
	text-align: center;
	cursor: pointer;
	font-size: 20px;
	font-weight: bold;
}

.categories {font-size: 20px; color: #11BBFF; font-weight: bold; margin-left:20px;}

.categories:hover {color: #FBA481; text-decoration: none;}


</style>
</head>
<body style="font-family: 'Nanum Gothic', sans-serif;">
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!상단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	<div id="main-container" class="container">
		<%@ include file="../common/top.jsp" %>
		<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!상단 끝!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		<div class="row" id="middleCategories">
			<div class="col-3"></div>
			<div onclick="location.href='<%= request.getContextPath() %>/boardNotice.bo';" class="col">
				공지사항</div>
			<div onclick="location.href='<%= request.getContextPath() %>/boardOTO.bo';" class="col">1:1 게시판</div>
			<div onclick="location.href='<%= request.getContextPath() %>/boardFaq.bo';" class="col">
				FAQ</div>
			<div class="col-3"></div>
		</div>


		<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 50px;"></div>

		<div class="row">
			<div class="col-3"></div>
			<div class="col-6"
				style="border: 2px solid rgb(17, 187, 255); height: 200px; margin:auto;">
				<div class="row customer"
					style="margin-top: 30px; font-size: 30px; color: #11BBFF;">
					다나와방 고객센터</div>
				<div class="row customer" style="margin-top: 30px;">
					운영시간 : 평일 9:00 ~ 18:00(주말 & 공휴일 제외)<br> 전화 : 1551 - 5551
				</div>
			</div>
			<div class="col-3"></div>
		</div>
	
		<div class="row" style="margin-top: 100px;">
			<div class="col"></div>
			<div class="col-10">
			
				<!-- FAQ 카테고리 -->
				<ul class="nav nav-tabs"
					style="margin-left: 50px; font-size: 18px; color: #11BBFF; font-weight: bold;">
					<li class="active"><a data-toggle="tab" class="categories" href="#home">전체</a></li>
					<li><a data-toggle="tab" class="categories" href="#menu1">주문/결제</a></li>
					<li><a data-toggle="tab" class="categories" href="#menu2">배송관련</a></li>
					<li><a data-toggle="tab" class="categories" href="#menu3">취소/환불</a></li>
					<li><a data-toggle="tab" class="categories" href="#menu4">회원정보변경</a></li>
					<li><a data-toggle="tab" class="categories" href="#menu5">서비스/기타</a></li>
				</ul>
				<!-- FAQ 카테고리에 해당하는 질문들 -->
				<div class="tab-content">
					<div id="home" class="tab-pane fade in active">
						<div class="row">
							<div class="col"></div>

							<div class="col-11">
								<form>
									<table>
										<%
											if (list.isEmpty()) {
										%>
										<tr>
											<td>조회된 리스트가 없습니다.</td>
										</tr>
										<% } else { %>
										<% for(Board b : list) { %>
										<tr style="line-height: 50px;">
											<td width="950px;" class="q" style="font-size: 17px;" >
											<span>Q&nbsp;</span><%= b.getBoardTitle() %> <br>
												<p style="font-size: 14px; line-height: 25px;"><%= b.getBoardContent() %></p>
											</td>
										</tr>
										<tr style="border-top: 1px solid #11BBFF;">
											<% } %>
										<% } %>
									</table>
								</form>
							</div>
							<div class="col"></div>
						</div>
					</div>
					<div id="menu1" class="tab-pane fade">
						<div class="row">
							<div class="col"></div>

							<div class="col-11">
								<form>
									<table>
										<%
											if (list.isEmpty()) {
										%>
										<tr>
											<td>조회된 리스트가 없습니다.</td>
										</tr>
										<% } else { %>
										<% for(Board b : list) { %>
										<% if(b.getBoardCategoryId() == 2451) { %>
										<tr style="line-height: 50px;">
											<td width="950px;" class="q" style="font-size: 17px;"><span>Q&nbsp;</span><%= b.getBoardTitle() %> <br>
												<p style="font-size: 14px; line-height: 25px;"><%= b.getBoardContent() %></p>
												<input type="hidden" name="count" value="<%= b.getBoardId() %>">
											</td>
										</tr> 
										<tr style="border-top: 1px solid #11BBFF;">
												<% } %>
											<% } %>
										<% } %>
									</table>
								</form>
							</div>
							<div class="col"></div>
						</div>
					</div>
					<div id="menu2" class="tab-pane fade">
						<div class="row">
							<div class="col"></div>

							<div class="col-11">
								<form>
									<table
										style="border-bottom: 1px solid #11BBFF; line-height: 50px;">
										<%
											if (list.isEmpty()) {
										%>
										<tr>
											<td>조회된 리스트가 없습니다.</td>
										</tr>
										<% } else { %>
										<% for (Board b : list) { %>
										<% if(b.getBoardCategoryId() == 2452) { %>
										<tr style="line-height: 50px;">
											<td width="950px;" class="q" style="font-size: 17px;"><span>Q&nbsp;</span><%= b.getBoardTitle() %> <br>
												<p style="font-size: 14px; line-height: 25px;"><%= b.getBoardContent() %></p>
												<input type="hidden" name="count" value="<%= b.getBoardId() %>">
											</td>
										</tr>
										<tr style="border-top: 1px solid #11BBFF;">
												<% } %>
											<% } %>
										<% } %>
									</table>
								</form>
							</div>
							<div class="col"></div>
						</div>
					</div>
					<div id="menu3" class="tab-pane fade">
						<div class="row">
							<div class="col"></div>

							<div class="col-11">
								<form>
									<table
										style="border-bottom: 1px solid #11BBFF; line-height: 50px;">
										<%
											if (list.isEmpty()) {
										%>
										<tr>
											<td>조회된 리스트가 없습니다.</td>
										</tr>
										<% } else { %>
										<% for(Board b : list) { %>
										<% if(b.getBoardCategoryId() == 2453) { %>
										<tr style="line-height: 50px;">
											<td width="950px;" class="q" style="font-size: 17px;"><span>Q&nbsp;</span><%= b.getBoardTitle() %> <br>
												<p style="font-size: 14px; line-height: 25px;"><%= b.getBoardContent() %></p>
												<input type="hidden" name="count" value="<%= b.getBoardId() %>">
												</td>
										</tr>
										<tr style="border-top: 1px solid #11BBFF;">
												<% } %>
											<% } %>
										<% } %>
									</table>
								</form>
							</div>
							<div class="col"></div>
						</div>
					</div>
					<div id="menu4" class="tab-pane fade">
						<div class="row">
							<div class="col"></div>

							<div class="col-11">
								<form>
									<table
										style="border-bottom: 1px solid #11BBFF; line-height: 50px;">
										<%
											if (list.isEmpty()) {
										%>
										<tr>
											<td>조회된 리스트가 없습니다.</td>
										</tr>
										<% } else { %>
										<% for(Board b : list) { %>
										<% if(b.getBoardCategoryId() == 2454) { %>
										<tr style="line-height: 50px;">
											<td width="950px;" class="q" style="font-size: 17px;"><span>Q&nbsp;</span><%= b.getBoardTitle() %> <br>
												<p style="font-size: 14px; line-height: 25px;"><%= b.getBoardContent() %></p>
												<input type="hidden" name="count" value="<%= b.getBoardId() %>">
											</td>
										</tr>
										<tr style="border-top: 1px solid #11BBFF;">
												<% } %>
											<% } %>
										<% } %>
									</table>
								</form>
							</div>
							<div class="col"></div>
						</div>
					</div>
					<div id="menu5" class="tab-pane fade">
						<div class="row">
							<div class="col"></div>

							<div class="col-11">
								<form>
									<table
										style="border-bottom: 1px solid #11BBFF; line-height: 50px;">
										<%
											if (list.isEmpty()) {
										%>
										<tr>
											<td>조회된 리스트가 없습니다.</td>
										</tr>
										<% } else { %>
										<% for(Board b : list) { %>
										<% if(b.getBoardCategoryId() == 2455) { %>
										<tr style="line-height: 50px;">
											<td width="950px;" class="q" style="font-size: 17px;"><span>Q&nbsp;</span><%= b.getBoardTitle() %> <br>
												<p style="font-size: 14px; line-height: 25px;"><%= b.getBoardContent() %></p>
												<input type="hidden" name="count" value="<%= b.getBoardId() %>">
											</td>
										</tr>
										<tr style="border-top: 1px solid #11BBFF;">
												<% } %>
											<% } %>
										<% } %>
									</table>
								</form>
							</div>
							<div class="col"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="col"></div>
		</div>

	
	<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 120px;"></div>
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		<%@ include file="../common/bottom.jsp" %>
	</div>
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단 끝 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		<%@ include file="../common/navbar.jsp"%>
	<!-- 상단 스크립트 -->
	<script>
		/* 중단 카테고리 호버 */
		$(function() {
			$('#middleCategories').children().hover(function() {
				$(this).css('color', '#11BBFF');
			}, function() {
				$(this).css('color', 'black');
			});
		});
		
		$(function() {
			$('.q').click(function() {
				$(this).find('p').slideToggle();
			});
		});
	</script>
	
		
</body>
</html>
