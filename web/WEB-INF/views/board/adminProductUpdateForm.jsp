<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="board.model.vo.*, java.util.*"%>
<%
	Product p = (Product) request.getAttribute("p");

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
					class="">상품 정보 수정</div>
			</div>
		</div>
		
			<!-- 테이블 -->
		<div class="row">
			<form action="<%=request.getContextPath() %>/adminProductUpdate.bo" onsubmit="return enroll();" method="post" encType="multipart/form-data">
			<table class="table" style="width: 720px; margin-left: 220px; margin-top: 10px; text-align: center;">
				<tbody>
						<tr>
							<th scope="col" style="vertical-align: middle;">상품명<input type="hidden" name="pId" value="<%= p.getProductId()%>"></th>
							<td><input type="text"  id="name" name="name" class="form-control" value="<%= p.getProductName() %>" ><input type="hidden" name="status" class="form-control" <%= p.getProductStatus().equals("SALES") ? "checked" : "" %>></td>
							<th scope="col" style="vertical-align: middle;">카테고리</th>
							<td>
								<select name="category" id="category" class="form-control" style="vertical-align: middle;">
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
							<td><input type="text"  id="brand" name="brand" class="form-control" value="<%= p.getProductBrand() %>" ></td>
							<th scope="col" style="vertical-align: middle;">기본 가격</th>
							<td><input type="text"  id="price" name="price" class="form-control" value="<%= p.getProductPrice() %>" ></td>
						</tr>
						<% int last = 0; 
						if(optionList.size() == 2) { %>
							 <% for(int i = 0; i < 2; i++) {%>
								<tr>
									<th scope="col" style="vertical-align: middle;">옵션<%= i + 1 %><input type="hidden" name="pOId" value="<%= optionList.get(i).getProductOptionId() %>"></th>
									<td><input type="text"  id="option<%= i + 1 %>"  name="options" value="<%= optionList.get(i).getProductOptionValue() %>" class="form-control" ></td>
									<th scope="col" style="vertical-align: middle;">옵션<%= i + 1 %>  수량</th>
									<td><input type="text"  id="option<%= i + 1 %>Amount" name="optionsAmount" value="<%= optionList.get(0).getProductOptionAmount() %>" class="form-control"></td>
								</tr>
							 <% } %>
							 	<tr>
									<th scope="col" style="vertical-align: middle;">옵션3 </th>
									<td><input type="text"  id="option3"  name="options" class="form-control" value="" ></td>
									<th scope="col" style="vertical-align: middle;">옵션3 수량</th>
									<td><input type="text"  id="option3Amount" name="optionsAmount" value="<%= optionList.size() == 2 ? "" : optionList.get(2).getProductOptionAmount() %>" class="form-control" ></td>
								</tr>
						<% } else { %>
						 	<% for(int i = 0; i < 2; i++) {%>
								<tr>
									<th scope="col" style="vertical-align: middle;">옵션<%= i + 1 %><input type="hidden" name="pOId" value="<%= optionList.get(i).getProductOptionId() %>"></th>
									<td><input type="text"  id="option<%= i + 1 %>"  name="options" value="<%= optionList.get(i).getProductOptionValue() %>" class="form-control" ></td>
									<th scope="col" style="vertical-align: middle;">옵션<%= i + 1 %> 수량</th>
									<td><input type="text"  id="option<%= i + 1 %>Amount" name="optionsAmount" value="<%= optionList.get(0).getProductOptionAmount() %>" class="form-control" ></td>
								</tr>
							 <% } %>
						<% } %>
						<tr>
							<th scope="col" style="vertical-align: middle;">배송비</th>
							<td><input type="text"  id="deliveryFee" name="deliveryFee" value="<%= p.getProductDeliveryFee() %>" class="form-control" ></td>
							<th scope="col" style="vertical-align: middle;">사이즈</th>
							<td><input type="text"  id="size" name="size" value="<%= p.getProductSize() %>" class="form-control" ></td>
						</tr>
						<tr>
							<th scope="col" style="vertical-align: middle;">할인율</th>
							<td colspan="3"><input type="text"  id="discount" name="discount" class="form-control" value="<%= p.getProductDiscountRate() %>" ></td>
						</tr>

						<tr>
							<th scope="col" style="vertical-align: middle;">상품 대표이미지</th>
							<td id="titleImgArea">
							<input type="hidden" name="titleImgChangeName" value="<%=titleImg.getProductChangeName()%>">
							<input type="hidden" name="titleImgId" value="<%=titleImg.getProductFileId()%>">
							<img id="titleImg" name="titleImg" width="200" height="200" src="<%=request.getContextPath()%>/thumbnail_uploadFiles/<%=titleImg.getProductChangeName()%>"></td>
							<th scope="col" style="vertical-align: middle;">상세이미지 1</th>
							<td id="contentImgArea1">
							<input type="hidden" name="contentImg1ChangeName" value="<%= contentImg1.getProductChangeName() %>">
							<input type="hidden" name="contentImg1Id" value="<%=contentImg1.getProductFileId()%>">
							<img id="contentImg1" name="contentImg1" width="200" height="200" src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%=contentImg1.getProductChangeName()%>"></td>
						</tr>
						<tr>
							<th scope="col" style="vertical-align: middle;">상세이미지 2</th>
							<td id="contentImgArea2">
							<input type="hidden" name="contentImg2ChangeName" value="<%=contentImg2.getProductChangeName()%>">
							<input type="hidden" name="contentImg2Id" value="<%=contentImg2.getProductFileId()%>">
							<img id="contentImg2" name="contentImg2" width="200" height="200" src="<%=request.getContextPath()%>/thumbnail_uploadFiles/<%=contentImg2.getProductChangeName()%>"></td>
							<th scope="col" style="vertical-align: middle;">상세이미지 3</th>
							<td id="contentImgArea3">
							<input type="hidden" name="contentImg3ChangeName" value="<%= contentImg3.getProductChangeName() %>">
							<input type="hidden" name="contentImg3Id" value="<%= contentImg3.getProductFileId() %>">
							<img id="contentImg3" name="contentImg3" width="200" height="200" src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%=contentImg3.getProductChangeName()%>"></td>
						</tr>
						<tr>
							<th scope="col" style="vertical-align: middle;">팁</th>
							<td colspan="3"><textarea class="form-control" id="tip" name="tip"
									style="height: 100px; resize:none;" ><%= p.getProductTip() %></textarea></td>
						</tr>
						<tr>
							<th scope="col" style="vertical-align: middle;">내용</th>
							<td colspan="3"><textarea class="form-control" id="content" name="content"
									style="height: 200px; resize:none;" ><%= p.getProductContent() %></textarea></td>
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
						onclick="location.href='<%=request.getContextPath()%>/adminProduct.bo'"
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