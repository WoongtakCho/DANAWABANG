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
	width: 60px;
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
		
		<%@ include file="../common/adminMiddleCategory.jsp" %>	
		<!------ 본문 (FAQ 게시글 등록)-------->
		<div class="row" style="padding: 10px;">
			<div class="col" style="padding: 0px;">
				<div
					style="font-weight: bold; font-size: 25px; text-align: center; margin-bottom : 10px;color: rgb(17, 187, 255);"
					class="">FAQ 게시글 등록</div>
			</div>
		</div>
		<!-- 테이블 -->
		<div class="row">
			<form action="<%=request.getContextPath() %>/adminFaqInsert.me" onsubmit="return enroll();" method="post">
				<table class="table" style="width: 720px; margin-left: 220px; margin-top: 10px; text-align: center;">
						<tr>
							<th scope="col" style="vertical-align: middle;">제목</th>
							<td><input type="text" size="35px" id="title" name="title" class="form-control"></td>
							<th scope="col" style="vertical-align: middle;">카테고리</th>
							<td width="30%">
							<select name="faqCategory" id="category" class="form-control" style="vertical-align: middle;">
									<option value="주문/결제">주문/결제</option>
									<option value="배송관련">배송관련</option>
									<option value="취소/환불">취소/환불</option>
									<option value="회원정보변경">회원정보변경</option>
									<option value="서비스/기타">서비스/기타</option>
							</select>
							</td>
						</tr>
						<tr>
							<th scope="col" style="vertical-align: middle;">내용</th>
							<td colspan="3"><textarea class="form-control" id="content" name="content"
									style="height: 500px; resize:none;"></textarea></td>
						</tr>
					</table>
				<br>
				<div class="col">
					<input type="button" class="button1" onclick="location.href='<%=request.getContextPath()%>/adminFaq.me'" value="돌아가기" style="margin-left: 205px; margin-right: 510px;">
					<% if(loginUser.getIsAdmin().equals("ADMIN")){ %>
					<input type="submit" class="button1" value="등록">
					<% } %>
				</div>
			</form>
		</div>

		
		
		
				<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 160px;"></div>
			
		<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		<%@ include file="../common/bottom.jsp" %>
	</div>
		<%@ include file="../common/navbar.jsp"%>
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단 끝 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->

	<!-- 상단 스크립트 -->
	<script>
		function enroll(){
			if($('#title').val().trim() == ""){
				alert("제목을 입력해주세요");
				$('#title').focus();
				return false;
			} else if($('#content').val().trim() == ""){
				alert("내용을 입력해주세요");
				$('#content').focus();
				return false;
			} else {
				var bool = confirm('정말 등록하시겠습니까?');
				if (bool) {
					alert('등록되었습니다.');
					return true;
				} else {
					return false;
				}
			}
		}
	</script>
</body>
</html>