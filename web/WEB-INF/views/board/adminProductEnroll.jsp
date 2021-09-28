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
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  본문(상품 등록) !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
		<div class="row" style="padding: 10px;">
			<div class="col" style="padding: 0px;">
				<div
					style="font-weight: bold; font-size: 25px; text-align: center; color: rgb(17, 187, 255);"
					class="">상품 등록</div>
			</div>
		</div>
		
		<!-- 테이블 -->
		<div class="row">
			<form action="<%=request.getContextPath() %>/adminProductInsert.bo" onsubmit="return enroll();" method="post" encType="multipart/form-data">
				<table class="table" style="width: 720px; margin-left: 220px; margin-top: 10px; text-align: center;">
					<tbody>
						<tr>
							<th scope="col" style="vertical-align: middle;">*상품명</th>
							<td><input type="text"  id="name" name="name" class="form-control" required></td>
							<th scope="col" style="vertical-align: middle;">*카테고리</th>
							<td>
								<select name="category" id="category" class="form-control" style="vertical-align: middle;" required>
									<option value="침대">침대</option>
									<option value="매트리스">매트리스</option>
									<option value="서랍장">서랍장</option>
									<option value="커튼">커튼</option>
									<option value="조명">조명</option>
									<option value="행거">행거</option>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="col" style="vertical-align: middle;">*브랜드</th>
							<td><input type="text"  id="brand" name="brand" class="form-control" required></td>
							<th scope="col" style="vertical-align: middle;">*기본 가격</th>
							<td><input type="text"  id="price" name="price" class="form-control" required></td>
						</tr>
						<tr>
							<th scope="col" style="vertical-align: middle;">*옵션1</th>
							<td><input type="text"  id="option1"  name="options" class="form-control" required></td>
							<th scope="col" style="vertical-align: middle;">*옵션1 수량</th>
							<td><input type="text"  id="option1Amount" name="optionsAmount" class="form-control" required></td>
						</tr>
						<tr>
							<th scope="col" style="vertical-align: middle;">*옵션2</th>
							<td><input type="text"  id="option2"  name="options" class="form-control" required></td>
							<th scope="col" style="vertical-align: middle;">*옵션2 수량</th>
							<td><input type="text"  id="option2Amount" name="optionsAmount" class="form-control" required></td>
						</tr>
						<tr>
							<th scope="col" style="vertical-align: middle;">옵션3</th>
							<td><input type="text"  id="option3"  name="options" class="form-control"></td>
							<th scope="col" style="vertical-align: middle;">옵션3 수량</th>
							<td><input type="text"  id="option3Amount" name="optionsAmount" class="form-control"></td>
						</tr>
						<tr>
							<th scope="col" style="vertical-align: middle;">*배송비</th>
							<td><input type="text"  id="deliveryFee" name="deliveryFee" class="form-control" required></td>
							<th scope="col" style="vertical-align: middle;">*사이즈</th>
							<td><input type="text"  id="size" name="size" class="form-control" required></td>
						</tr>
						<tr>
						</tr>
						<tr>
							<th scope="col" style="vertical-align: middle;">*할인율</th>
							<td colspan="3"><input type="text"  id="discount" name="discount" class="form-control" required></td>
						</tr>
						<tr>
							<th scope="col" style="vertical-align: middle;">상품 대표이미지 등록</th>
							<td id="titleImgArea" style="cursor: pointer;">
							<img id="titleImg" width="200" height="200"></td>
							<th scope="col" style="vertical-align: middle;">상세이미지 등록1</th>
							<td id="contentImgArea1" style="cursor: pointer;">
							<img id="contentImg1" width="200" height="200"></td>
						</tr>
						<tr>
							<th scope="col" style="vertical-align: middle;">상세이미지 등록2</th>
							<td id="contentImgArea2" style="cursor: pointer;">
							<img id="contentImg2" width="200" height="200"></td>
							<th scope="col" style="vertical-align: middle;">상세이미지 등록3</th>
							<td id="contentImgArea3" style="cursor: pointer;">
							<img id="contentImg3" width="200" height="200"></td>
						</tr>
						<tr>
							<th scope="col" style="vertical-align: middle;">팁</th>
							<td colspan="3"><textarea class="form-control" id="tip" name="tip"
									style="height: 100px; resize:none;"></textarea></td>
						</tr>
						<tr>
							<th scope="col" style="vertical-align: middle;">내용</th>
							<td colspan="3"><textarea class="form-control" id="content" name="content"
									style="height: 200px; resize:none;">반품/교환 사유에 따른 요청 가능 기간
반품 시 먼저 판매자와 연락하셔서 반품사유, 택배사, 배송비, 반품지 주소 등을 협의하신 후 반품상품을 발송해 주시기 바랍니다.

구매자 단순 변심은 상품 수령 후 7일 이내 (구매자 반품배송비 부담)
표시/광고와 상이, 상품하자의 경우 상품 수령 후 3개월 이내 혹은 표시/광고와 다른 사실을 안 날로부터 30일 이내.
둘 중 하나 경과 시 반품/교환 불가 (판매자 반품배송비 부담)
반품/교환 불가능 사유
아래와 같은 경우 반품/교환이 불가능합니다.

반품요청기간이 지난 경우
구매자의 책임 있는 사유로 상품 등이 멸실 또는 훼손된 경우 (단, 상품의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외)
포장을 개봉하였으나 포장이 훼손되어 상품가치가 현저히 상실된 경우 (예: 식품, 화장품)
구매자의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우 (라벨이 떨어진 의류 또는 태그가 떨어진 명품관 상품인 경우)
시간의 경과에 의하여 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우 (예: 식품, 화장품)
고객주문 확인 후 상품제작에 들어가는 주문제작상품
복제가 가능한 상품 등의 포장을 훼손한 경우 (CD/DVD/GAME/도서의 경우 포장 개봉 시)</textarea></td>
						</tr>
					</tbody>
				</table>

			<!-- 파일 업로드 하는 부분 -->
				<div id="fileArea">
					<input type="file" id="thumbnailImg1" multiple="multiple" name="thumbnailImg1" onchange="LoadImg(this,1)" required>
					<input type="file" id="thumbnailImg2" multiple="multiple" name="thumbnailImg2" onchange="LoadImg(this,2)" required>
					<input type="file" id="thumbnailImg3" multiple="multiple" name="thumbnailImg3" onchange="LoadImg(this,3)" required>
					<input type="file" id="thumbnailImg4" multiple="multiple" name="thumbnailImg4" onchange="LoadImg(this,4)" required>
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
					<input type="button" class="button1" onclick="location.href='<%=request.getContextPath()%>/adminPromotion.bo'" value="돌아가기" style="margin-left: 205px; margin-right: 510px;">
					<input type="submit" class="button1" value="등록">
				</div>
			</form>
		</div>
				<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 140px;"></div>
			
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		<%@ include file="../common/bottom.jsp" %>
	</div>
		<%@ include file="../common/navbar.jsp"%>

	<!-- 상단 스크립트 -->
	<script>
		function enroll(){
			var bool = confirm('정말 등록하시겠습니까?');
			if (bool) {
				alert('등록되었습니다.');
				return true;
			} else {
				return false;
			}
		}
	</script>
</body>
</html>