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
		
		<!-- 중단 카테고리 -->	
		<%@ include file="../common/adminMiddleCategory.jsp" %>

	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  본문(공지사항 게시글 등록) !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->

		<div class="row">
			<div class="col">
				<div style="font-weight: bold; font-size: 25px; text-align: center; color: rgb(17, 187, 255);"
					class="">공지사항 게시글 등록</div>
			</div>
		</div>

		<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 20px;"></div>

		<div class="row">
			<form action="<%= request.getContextPath() %>/adminNoticeInsert.bo" onsubmit="return enroll();" method="post">
				<table class="table"
					style="margin-left: 220px; width: 720px; text-align: center;">
					<tbody>
						<tr>
							<th scope="col" style="vertical-align: middle;">제목</th>
							<td><input type="text" name="title" id="title" size="20px" class="form-control"></td>
							<th scope="col" style="vertical-align: middle;">중요</th>
							<td><input type="checkbox" id="isFirst" name="isFirst" class="form-control"></td>		
						</tr>
						<tr>
							<th scope="col" style="vertical-align: middle;">내용</th>
							<td colspan="3"><textarea name="content" id="content" class="form-control" style="height: 500px; resize: none;"></textarea></td>
						</tr>
					</tbody>
				</table>

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
		<div class="row" style="margin-top: 80px;"></div>

	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		<%@ include file="../common/bottom.jsp" %>
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단 끝 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	</div>
		<%@ include file="../common/navbar.jsp"%>
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