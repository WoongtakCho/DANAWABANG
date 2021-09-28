<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="board.model.vo.*, java.util.*"%>
<%
	Product p = (Product) request.getAttribute("product");

	ArrayList<ProductAttachment> fileList = (ArrayList) request.getAttribute("fileList");
	ProductAttachment titleImg = fileList.get(0);
	ProductAttachment contentImg1 = fileList.get(1);
	ProductAttachment contentImg2 = fileList.get(2);
	ProductAttachment contentImg3 = fileList.get(3);
	
	ArrayList<ProductOption> optionList = (ArrayList) request.getAttribute("optionList");
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

		<!-- 중단 카테고리(상품관리페이지) -->	
		<%@ include file="../common/adminMiddleCategory.jsp" %>
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  본문(상품 상세 정보) !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
		<div class="row" style="padding: 10px;">
			<div class="col" style="padding: 0px;">
				<div
					style="font-weight: bold; font-size: 25px; text-align: center; color: rgb(17, 187, 255);"
					class="">상품 상세 정보</div>
			</div>
		</div>
		
		<!-- 테이블 -->
		<div class="row">
			<form action="<%=request.getContextPath() %>/adminProductUpdateForm.bo" id="detailForm" method="post">
				<table class="table" style="width: 720px; margin-left: 220px; margin-top: 10px; text-align: center;">
				<tbody>
						<tr>
							<th scope="col" style="vertical-align: middle;">상품명<input type="hidden" name="pId" value="<%= p.getProductId()%>"></th>
							<td><input type="text"  id="name" name="name" class="form-control" value="<%= p.getProductName() %>" readonly><input type="hidden" name="status" class="form-control" <%= p.getProductStatus().equals("SALES") ? "checked" : "" %>></td>
							<th scope="col" style="vertical-align: middle;">카테고리</th>
							<td>
								<select name="category" id="category" class="form-control" style="vertical-align: middle;" readonly>
									<option value="침대" <%= p.getProductCategoryId() == 1 ? "selected" : "" %>>침대</option>
									<option value="매트리스" <%= p.getProductCategoryId() == 2 ? "selected" : "" %>>매트리스</option>
									<option value="서랍장" <%= p.getProductCategoryId() == 3 ? "selected" : "" %>>서랍장</option>
									<option value="커튼" <%= p.getProductCategoryId() == 4 ? "selected" : "" %>>커튼</option>
									<option value="조명" <%= p.getProductCategoryId() == 5 ? "selected" : "" %>>조명</option>
									<option value="행거" <%= p.getProductCategoryId() == 6 ? "selected" : "" %>>행거</option>
								</select>	
							</td>
						</tr>
						<tr>
							<th scope="col" style="vertical-align: middle;"><input type="hidden" name="productStatus" value="<%= p.getProductStatus() %>">브랜드</th>
							<td><input type="text"  id="brand" name="brand" class="form-control" value="<%= p.getProductBrand() %>" readonly></td>
							<th scope="col" style="vertical-align: middle;">기본 가격</th>
							<td><input type="text"  id="price" name="price" class="form-control" value="<%= p.getProductPrice() %>" readonly></td>
						</tr>
						<% int last = 0; 
						if(optionList.size() == 2) { %>
							 <% for(int i = 0; i < 2; i++) {%>
								<tr>
									<th scope="col" style="vertical-align: middle;">옵션<%= i + 1 %><input type="hidden" name="pOId" value="<%= optionList.get(i).getProductOptionId() %>"></th>
									<td><input type="text"  id="option<%= i + 1 %>"  name="options" value="<%= optionList.get(i).getProductOptionValue() %>" class="form-control" readonly></td>
									<th scope="col" style="vertical-align: middle;">옵션<%= i + 1 %>  수량</th>
									<td><input type="text"  id="option<%= i + 1 %>Amount" name="optionsAmount" value="<%= optionList.get(0).getProductOptionAmount() %>" class="form-control" readonly></td>
								</tr>
							 <% } %>
							 	<tr>
									<th scope="col" style="vertical-align: middle;">옵션3 </th>
									<td><input type="text"  id="option3"  name="options" class="form-control" value="" readonly></td>
									<th scope="col" style="vertical-align: middle;">옵션3 수량</th>
									<td><input type="text"  id="option3Amount" name="optionsAmount" value="<%= optionList.size() == 2 ? "" : optionList.get(2).getProductOptionAmount() %>" class="form-control" readonly></td>
								</tr>
						<% } else { %>
						 	<% for(int i = 0; i < 3; i++) {%>
								<tr>
									<th scope="col" style="vertical-align: middle;">옵션<%= i + 1 %><input type="hidden" name="pOId" value="<%= optionList.get(i).getProductOptionId() %>"></th>
									<td><input type="text"  id="option<%= i + 1 %>"  name="options" value="<%= optionList.get(i).getProductOptionValue() %>" class="form-control" readonly></td>
									<th scope="col" style="vertical-align: middle;">옵션<%= i + 1 %> 수량</th>
									<td><input type="text"  id="option<%= i + 1 %>Amount" name="optionsAmount" value="<%= optionList.get(0).getProductOptionAmount() %>" class="form-control" readonly></td>
								</tr>
							 <% } %>
						<% } %>
						<tr>
							<th scope="col" style="vertical-align: middle;">배송비</th>
							<td><input type="text"  id="deliveryFee" name="deliveryFee" value="<%= p.getProductDeliveryFee() %>" class="form-control" readonly></td>
							<th scope="col" style="vertical-align: middle;">사이즈</th>
							<td><input type="text"  id="size" name="size" value="<%= p.getProductSize() %>" class="form-control" readonly></td>
						</tr>
						<tr>
							<th scope="col" style="vertical-align: middle;">할인율</th>
							<td colspan="3"><input type="text"  id="discount" name="discount" class="form-control" value="<%= p.getProductDiscountRate() %>" readonly></td>
						</tr>

						<tr>
							<th scope="col" style="vertical-align: middle;">상품 대표이미지</th>
							<td id="titleImgArea">
							<input type="hidden" name="titleImgChangeName" value="<%=titleImg.getProductChangeName()%>">
							<input type="hidden" name="titleImgId" value="<%=titleImg.getProductFileId()%>">
							<a href="<%=request.getContextPath()%>/thumbnail_uploadFiles/<%=titleImg.getProductChangeName()%>">
							<img id="titleImg" name="titleImg" width="200" height="200" src="<%=request.getContextPath()%>/thumbnail_uploadFiles/<%=titleImg.getProductChangeName()%>"></a></td>
							<th scope="col" style="vertical-align: middle;">상세이미지 1</th>
							<td id="contentImgArea1">
							<input type="hidden" name="contentImg1ChangeName" value="<%= contentImg1.getProductChangeName() %>">
							<input type="hidden" name="contentImg1Id" value="<%=contentImg1.getProductFileId()%>">
							<a href="<%=request.getContextPath()%>/thumbnail_uploadFiles/<%= contentImg1.getProductChangeName() %>">
							<img id="contentImg1" name="contentImg1" width="200" height="200" src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%=contentImg1.getProductChangeName()%>"></a></td>
						</tr>
						<tr>
							<th scope="col" style="vertical-align: middle;">상세이미지 2</th>
							<td id="contentImgArea2">
							<input type="hidden" name="contentImg2ChangeName" value="<%=contentImg2.getProductChangeName()%>">
							<input type="hidden" name="contentImg2Id" value="<%=contentImg2.getProductFileId()%>">
							<a href="<%=request.getContextPath()%>/thumbnail_uploadFiles/<%=contentImg2.getProductChangeName()%>">
							<img id="contentImg2" name="contentImg2" width="200" height="200" src="<%=request.getContextPath()%>/thumbnail_uploadFiles/<%=contentImg2.getProductChangeName()%>"></a></td>
							<th scope="col" style="vertical-align: middle;">상세이미지 3</th>
							<td id="contentImgArea3">
							<input type="hidden" name="contentImg3ChangeName" value="<%= contentImg3.getProductChangeName() %>">
							<input type="hidden" name="contentImg3Id" value="<%= contentImg3.getProductFileId() %>">
							<a href="<%=request.getContextPath()%>/thumbnail_uploadFiles/<%= contentImg3.getProductChangeName() %>">
							<img id="contentImg3" name="contentImg3" width="200" height="200" src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%=contentImg3.getProductChangeName()%>"></a></td>
						</tr>
						<tr>
							<th scope="col" style="vertical-align: middle;">팁</th>
							<td colspan="3"><textarea class="form-control" id="tip" name="tip"
									style="height: 100px; resize:none;" readonly><%= p.getProductTip() %></textarea></td>
						</tr>
						<tr>
							<th scope="col" style="vertical-align: middle;">내용</th>
							<td colspan="3"><textarea class="form-control" id="content" name="content"
									style="height: 200px; resize:none;" readonly><%= p.getProductContent() %></textarea></td>
						</tr>
					</tbody>
				</table>
		
		<div class="col">
					<input type="button" class="button1" onclick="location.href='<%=request.getContextPath()%>/adminProduct.bo'" value="돌아가기" style="margin-left: 205px; margin-right: 410px;">
					<input type="submit" class="button1" value="수정">
					<input type="button" class="button1" id="delete" value="삭제">
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
	// 삭제 버튼
		$(function() {
			$('#delete').click(function() {
				var bool = prompt('정말 삭제하시겠습니까? 삭제하시려면 관리자 코드를 입력하십시오')
				if (bool == "realadmin") {
					$('#detailForm').attr('action', 'adminProductDelete.bo');
					$('#detailForm').submit();
				} else {
					alert("관리자 코드를 잘못입력하셨습니다.");
				}
			});
		});
	</script>
</body>
</html>