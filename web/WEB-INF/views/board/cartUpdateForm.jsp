<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*"%>
<%
CartWhole cw = (CartWhole) request.getAttribute("cw");	
ArrayList<ProductAttachment> fList = (ArrayList) request.getAttribute("fList");
ArrayList<ProductOption> oList = (ArrayList) request.getAttribute("oList");

int checkBoardCount = 0;
int checkPriceCount = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap-4.3.1.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- Bootstrap cdn 설정 -->
<link href="css/bootstrap-4.3.1.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

<style>
body {
	margin: 0;
	padding: 0;
	
	background: #FFFFFF;
	
	height: 2098px;
	margin: 0 auto;
}

/*페이지번호매기는거*/
.page-link {
  color: #11BBFF;
}
.water {
	background: #11BBFF;
	border-color: #11BBFF;
	width: 80px;
	height: 30px;
	border: none;
	color:  white;
	border-radius: 4px;
}
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


	<!-- ------------------------------------------장바구니-------------------------------------------- -->
		<form action="" id="detailForm" method="post">
		<!-- 체크된 게시글의 번호 저장 -->
		<div class="row-12" style="font-size: 25px; color: #11BBFF; font-weight: bold; text-align: center; margin-bottom:30px;">
		장바구니 수정</div>
		<input type="hidden" name="pId" value="<%= cw.getProductId()%>">
		
		<div class="row" style="margin-bottom:20px; margin-left: 210px; border:2px solid #11bbff; border-radius:10px; height: 330px; width:700px;">
			<!-- 사진 -->
					<div class="col-3" style="margin-top:10px;">
					<% for(int j = 0; j < fList.size(); j++) { %>
								<% ProductAttachment pa = fList.get(j); %>
								<% if(cw.getProductId() == pa.getProductId() && pa.getProductFileLevel() == 0) { %>
									<span><img src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= pa.getProductChangeName() %>"
									style="width:200px; height:200px; margin-top:40px;"></span><br><br>
									<% checkBoardCount++; %>
								<% } %>
							<% } %>				
					</div>
					<div class="col-1"><input type="hidden" name="cId" value="<%= cw.getCartId()%>"></div>
					<div class="col-8" style="margin-top: 7px;">
						<input type="button" id="delete" style="border:none; width:20px; cursor:pointer;
						font-weight:bold; color:#11bbff; font-size:14px; margin-left:415px;" value="X"><br>
									<span style="font-size: 13px;"><%= cw.getProductBrand() %></span><br>
									<span style="font-size: 18px; font-weight:bold;"><%= cw.getProductName() %></span>
									<hr>
							<div style="margin-bottom:10px;">
						<span style="font-size: 14px; display:inline-block;">옵션</span>
							<select class="form-control" name="pOptionId" id="pOptionId"
								style="width: 200px; margin-top: 5px; margin-bottom: 10px; font-size: 13px;">
								<option disabled>== 선택 ==</option>
								<% for (ProductOption op : oList) { %>
								<% if (cw.getProductOptionId() == op.getProductOptionId()) %>
								<option value="<%=op.getProductOptionId()%>"><%=op.getProductOptionValue()%></option>
								<% } %>
							</select>
									<span style="font-size: 14px; display:inline-block;">수량
									<input class="form-control" type="number" id ="amount" name="amount" min="1"
								max="<%= cw.getProductOptionAmount() %>" step="1" value="<%= cw.getCartProductAmount() %>"
								style="width: 80px; height: 30px; margin-top: 5px; margin-bottom: 10px; font-size: 13px;"></span>
							</div>
							<div>
									<input type="button" class="water" onclick="location.href='<%=request.getContextPath()%>/cart.bo'" 
									value="돌아가기" style="font-size: 12px; cursor: pointer; cursor:pointer;">
									<input type="button" id="update" class="water"
									value="옵션 및 수량 변경" style="cursor: pointer; font-size: 12px; margin-left: 30px;">
							</div>
						</div>
					</div>
					</form>
				</div>
	<div class="row" style="margin-bottom: 120px;"></div>
		
		
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->

		<%@ include file="../common/bottom.jsp" %>
		<%@ include file="../common/navbar.jsp"%>
	
	<script>
	// 수정 버튼
		$(function() {
			$('#update').click(function() {
				var bool = confirm("정말 수정하시겠습니까?");
				
				if(bool){
					alert("수정 완료했습니다.");
					$('#detailForm').attr('action', '<%= request.getContextPath() %>/cartUpdate.bo');
					$('#detailForm').submit();
				} else {
					return false;
				}
			});
		});
	</script>
	<script>
	// 삭제 버튼
		$(function() {
			$('#delete').click(function() {
				var bool = confirm("정말 삭제하시겠습니까?");
				
				if(bool){
					alert("삭제 완료했습니다.");
					$('#detailForm').attr('action', '<%= request.getContextPath() %>/deleteCart.bo');
					$('#detailForm').submit();
				} else {
					return false;
				}
			});
		});
	</script>
</body>
</html> 