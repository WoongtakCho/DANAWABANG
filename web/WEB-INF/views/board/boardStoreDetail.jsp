<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*"%>
<%
	Product p = (Product) request.getAttribute("product");
	
	ArrayList<ProductAttachment> fileList = (ArrayList) request.getAttribute("fileList");
	ProductAttachment titleImg = fileList.get(0);
	ProductAttachment contentImg1 = fileList.get(1);
	ProductAttachment contentImg2 = fileList.get(2);
	ProductAttachment contentImg3 = fileList.get(3);
	
	ArrayList<ProductOption> optionList = (ArrayList) request.getAttribute("optionList");
	
	ArrayList<ProductReply> productReplyList = (ArrayList)request.getAttribute("productReplyList");

	int checkStock = 0;
	String[] select = new String[optionList.size()];
	for(int i = 0 ; i < optionList.size() ; i++) {
		if(optionList.get(i).getProductOptionAmount() == 0) {
			select[i] = "disabled";
		} else {
			select[i] = "";
			checkStock++;
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스토어_상세</title>
<script src="js/popper.min.js"></script>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap-4.3.1.js"></script>
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
<link href="css/bootstrap-4.3.1.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">

<style>



#cart {
	background: rgb(184, 233, 255);
	border-color: rgb(184, 233, 255);
	width: 150px;
	height: 50px;
	border: none;
	color: black;
	border-radius: 4px;
}

#cartPayment {
	background: #11BBFF;
	border-color: #11BBFF;
	width: 150px;
	height: 50px;
	border: none;
	color: white;
	border-radius: 4px;
}


/*댓글 색변경-----------------*/
.repBtnB {
	color: #11BBFF;
	margin-left:10px;
}

.repBtnB:hover {
	color: #FBA481;
	cursor:pointer;
}
.repBtnF {
	color: #11BBFF;
	margin-left:20px;
}

.repBtnF:hover {
	color: #FBA481;
	cursor:pointer;
}


.categories {font-size: 20px; color: #11BBFF; font-weight: bold; margin-left:30px;}

.categories:hover {color: #FBA481; text-decoration: none;}
</style>
</head>
<body style="font-family: 'Nanum Gothic', sans-serif;">
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!상단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	<div id="main-container" class="container">
		<%@ include file="../common/top.jsp"%>

		<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!상단 끝!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->



		<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 40px;"></div>


		<!-- ------------------------------------상품 상세 페이지--------------------------------------------- -->


		<div class="row">
			<div class="col-12">
				<h5
					style="color: #11BBFF; text-align: center; font-weight: bold; font-size: 25px;">상품
					상세 페이지
					</h5>
				<hr>
			</div>
		</div>
		<form action="" id="detailForm" method="post">
			<div class="row">
				<div class="col-5">
					<!-- 왼쪽 영역 첫행  -->
					<div class="row">
						<div class="col-12">
						<input type="hidden" id="productId" name="productId" value="<%= p.getProductId() %>">
							<img id="titleImg" name="titleImg" width="500" height="350"
								src="<%=request.getContextPath()%>/thumbnail_uploadFiles/<%=titleImg.getProductChangeName()%>">
						</div>
					</div>
					<br>
					<% 
						String tips = null; 
						int links = 0;
					%>
					<% switch(p.getProductCategoryId()){ 
	                  case 1 : tips = "침구의 종류와 침구를 선책하는 간단한 팁은?"; links= 89; break; // 침대
	                  case 2 : tips = "메트리스 종류와 선택하는 팁은?"; links= 86; break; // 매트리스
	                  case 3 : tips = "공간에 따른 효율적인 수납 팁은?"; links= 119; break; // 서랍장
	                  case 4 : tips = "커튼마다 종류와 기능이 달라요!"; links= 88; break; // 커튼
	                  case 5 : tips = "조명 하나로 원하는 분위기를 연출할 수 있어요!"; links= 91; break; // 조명
	                  case 6 : tips = "가구를 효율적으로 배치할 수 있는 팁은?"; links= 90; break; // 행거
                	} %>
					<div class="row">
						<div class="col-12">
							<div style="font-size: 20px; width:500px; border-radius:8px;  background: rgb(184, 233, 255)">
								<span style="font-weight: bold;">&nbsp; Tips: <%= tips %><br> </span>
								<span style="font-size: 17px;"> &nbsp; 자세한 정보를 원한다면 click! &nbsp; </span>
								<span><a href="<%= request.getContextPath() %>/boardSelfGuideDetail.bo?bId=<%= links %>"><%=p.getProductTip()%></a></span>
							</div>
						</div>
					</div>
				</div>

				<div class="col-1" align="left"></div>
				<!-- 오른쪽 영역  -->
				<div class="col-6" align="left"">
					<!-- 오른쪽 영역  -->
					<div class="row">
						<div class="col-12" style="font-weight: bold; color: #686868;">
							<%=p.getProductBrand() %>
						</div>
					</div>
					<div class="row">
						<div class="col-12" style="font-weight: bold; font-size: 25px;">
							<%=p.getProductName()%>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<span style="font-weight: bold; font-size: 22px;"><%=p.getProductPrice()%>원</span>
							<span style="color: rgb(231, 76, 60);"><%= (int)(p.getProductDiscountRate() * 100.0) %>%</span>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<a href="#"
								style="color: rgb(158, 158, 158); text-decoration: none; font-size: 18px;">
								배송비 </a> <a href="#"
								style="color: rgb(158, 158, 158); text-decoration: none; font-size: 20px;">
								<%=p.getProductDeliveryFee()%>원
							</a>
						</div>
					</div>
					<div class="row">

						<div class="col-12">
							<b style="font-size: 20px;">옵션</b>
						</div>
						<div class="col-12">
							<select class="form-control" name="pOptionId" id="pOptionId" onchange="changeOption();"
								style="width: 200px; margin-top: 5px; margin-bottom: 10px;">
								<option disabled>== 선택 ==</option>
								<%	
									for (int i = 0 ; i < optionList.size() ; i++) {
								%>
								<option <%= select[i] %> name="options" value="<%=optionList.get(i).getProductOptionId()%>"><%=optionList.get(i).getProductOptionValue()%>&nbsp;&nbsp;&nbsp;</option>
								<%	}	%>
								<% for (int i = 0 ; i < optionList.size() ; i++) {	%>
								<input type="hidden" id="optionAmount<%= i %>" name="optionAmount" value="<%= optionList.get(i).getProductOptionAmount() %>">
								<% } %>	
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<b style="font-size: 20px;">수량</b>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<input class="form-control" type="number" id ="cartProductAmount" name="cartProductAmount" min="1"
								max="<%= optionList.get(0).getProductOptionAmount() %>" step="1" value="1" onchange="totalPrice();"
								style="width: 80px; height: 30px; margin-top: 5px; margin-bottom: 10px;">
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<b>합계: <span style="color: rgb(192, 57, 43);" id="sumPrice"><%= p.getProductPrice() + p.getProductDeliveryFee() %></span>원</b>
							<input type="hidden" id="price" name="price">
						</div>
					</div>
						<div class="row" style="margin-top: 5px; margin-bottom: 10px;">
						<div class="col-12">
						<% if(checkStock == 0) { %>
						<br><br><span style="font-size: 24px; margin-left: 30px;">일시품절입니다.</span>
							<script>
								document.getElementById("cartProductAmount").value = 0;
								document.getElementById("sumPrice").innerText = 0;
							</script>
						<% } else if (checkStock != 0 && loginUser != null) { %>
							<input type="button" class="pay" id="cart" value="장바구니 담기"> &nbsp;&nbsp;
							<input type="submit" class="pay" id="cartPayment" value="결제하기">
						<% } else { %>
							<br><div style="font-size: 20px; font-weight: bold; margin-left: 50px; text-align:center;">상품을 구매하고 싶으시다면<br>로그인해주세요</div>
						<%} %>
						</div>
					</div>
				</div>
			</div>
		</form>
	
		<script>
				$(function() {
					$('#cart').click(function() {							
						var bool = confirm('상품이 담겼습니다.\n장바구니로 이동하시겠습니까?');
						if (bool) {
							$('#detailForm').attr('action', 'storeCart.bo');
							$('#detailForm').submit();
						} else {
							$('#detailForm').attr('action', 'storeCartInsert.bo');
							$('#detailForm').submit();
						}
					
						});
					$('#cartPayment').click(function() {
						var bool = confirm('결제창으로 이동하시겠습니까?');
						if (bool == true) {
							$('#detailForm').attr('action', 'cartPayment.bo');
							$('#detailForm').submit();
						}	
					});
				});
				
				// 상품 옵션이 품절일 때의 상태 나타내기
				(function() {
					var option = document.getElementsByName("options");
					
					for(var i = 0 ; i < option.length ; i++) {
						if(option[i].disabled) {
							option[i].innerText = option[i].innerText + " (품절)";
							option[i].style.backgroundColor = "lightgray";
						}
					}
				})();
				
				// 상품 옵션을 바꿀 때 수량을 1로 바꾸기
				function changeOption() {
					document.getElementById("cartProductAmount").value = 1;
					var option  = document.getElementsByName("options");
					var price = 0;
					
					document.getElementById("sumPrice").innerText = <%= p.getProductPrice() %> + <%= p.getProductDeliveryFee() %> + price;
				}
				
				// 총 합계 가격 계산
				function totalPrice() {
					var productPrice = <%= p.getProductPrice() %>;
					var amount = document.getElementById("cartProductAmount").value;
					var option  = document.getElementsByName("options");
					var optionAmount = document.getElementsByName("optionAmount");
					var result = document.getElementById("sumPrice");
					var maxValue = document.getElementById("cartProductAmount");
					var price = 0;

					for(var i = 0 ; i < option.length ; i++) {
						if(option[i].selected) {
							maxValue.setAttribute("max", optionAmount[i].value);
							price = productPrice;
						}
					}
					
					result.innerText = price * amount + <%= p.getProductDeliveryFee() %>;
					
					if(<%= p.getProductPrice() %> < 100000 && result.innerText >= 110000) {
						result.innerText -= 10000; 
					}
					
					document.getElementById("price").value = result.innerText;
					
				}
				

				
		</script>
		
		<!-- -------------------------------- 상품상세정보 / 리뷰 / 배송/환불 ----------------------------------- -->
		
		<div id="" class="row" style="margin-top: 100px;">
			<div class="col"></div>
			<div class="col-12">
			
				<!-- 카테고리 -->
				<ul class="nav nav-tabs"
					style="font-size: 18px; color: #11BBFF; font-weight: bold;">
					<li class="active"><a data-toggle="tab" class="categories" href="#home">상품상세정보</a></li>
					<li><a data-toggle="tab" class="categories" href="#menu1">리뷰</a></li>
					<li><a data-toggle="tab" class="categories" href="#menu2">배송/환불</a></li>
				</ul>
				<!-- 세부 카테고리 -->
				<div class="tab-content">
					<div id="home" class="tab-pane in active">
						<div class="row">
							<div class="col"></div>

							<div class="col-11">
								<form>
									<div style="text-align: center;" class="container"  id="product-detail">
									<br>
										<img id="titleImg" name="titleImg" style="width: 650px;"
											src="<%=request.getContextPath()%>/thumbnail_uploadFiles/<%=titleImg.getProductChangeName()%>">
										<img id="contentImg1" name="contentImg1" style="width: 650px;"
											src="<%=request.getContextPath()%>/thumbnail_uploadFiles/<%=contentImg1.getProductChangeName()%>">
										<img id="contentImg2" name="contentImg2" style="width: 650px;"
											src="<%=request.getContextPath()%>/thumbnail_uploadFiles/<%=contentImg2.getProductChangeName()%>">
										<img id="contentImg3" name="contentImg3" style="width: 650px;"
											src="<%=request.getContextPath()%>/thumbnail_uploadFiles/<%=contentImg3.getProductChangeName()%>">
									</div>
								</form>
							</div>
							<div class="col"></div>
						</div>
					</div>
					<div id="menu1" class="tab-pane fade">
						<div class="row">
							<div class="col"></div>

							<div class="col-11">
								<!-- 댓글 -->
								<div class="row">
									<div class="col-12">
										<span style="font-weight: bold; font-size: 18px;">댓글</span>
										<div style="border-top: 1px solid lightgray; border-bottom: 1px solid lightgray;">
											<div class="row" style="margin: 5px;">
												<div class="col" id="replySelectArea">
													<div id="replySelectTable">
														<% if(productReplyList.isEmpty()){ %>
															<div>
																<span >댓글이 없습니다.</span>
															</div>
														<% } else {%>
															<% for(int i = 0; i < productReplyList.size(); i++){ %>
																<div id="rep<%= i%>">
																
																	
																	<input type="hidden" class="replyId" id="replyId<%= i%>"value="<%= productReplyList.get(i).getProductReplyId() %>">
																	<span style="font-size: 18px; font-weight: bold;"><%= productReplyList.get(i).getMemberId() %></span>
																	<span style="margin-left: 10px"><%= productReplyList.get(i).getProductReplyEnrollDate() %></span>
																	
																	<% ProductReply pr = productReplyList.get(i); %>
																	<% if(loginUser != null && loginUser.getId().equals(pr.getMemberId()))  { %>
																	&nbsp;&nbsp;&nbsp;&nbsp;<span class="repBtnF repUpdate" id="repUpdate">수정</span>
																	&nbsp;&nbsp;<span class="repBtnB repDelete" id="repDelete">삭제</span>
																	
																	<% } %>
																	
																	<br>
																	<span><%= productReplyList.get(i).getProductReplyContent() %></span>
																</div>
																<div style="display: none; width: 760px; height: 120px" id="repUpdateForm<%= i%>">
																<% if(loginUser != null && loginUser.getId().equals(pr.getMemberId()))  { %>
																	<span style="font-weight: bold; font-size: 18px;"></span>
																	<span class="repBtnF update" id="update<%= i%>">등록</span>
																	<span class="repBtnB cancle" id="cancle<%= i%>">취소</span>
																<% } %>
																	<textarea rows="3" cols="107" class="form-control" id="updateContent<%= i%>" style="resize: none; border-color: lightgray;"></textarea>
																</div>
																
															<% } %>
														<% } %>
														
													</div>
												</div> 
											</div>
										</div>
									</div>
								</div>
		<!-- ----------------------------------------------------------------------------------------- -->	
								<br>
								<div class="row">
									<div class="col"></div>
									<div class="col-10">
										<div class="row">
										<% if(loginUser != null)  { %>
											<div class="col-10" style="margin-left:10px;">
											<textarea rows="3" cols="107" class="form-control" id="replyContent" style="resize: none; border-color: lightgray;" placeholder="댓글을 입력하세요."></textarea>
											</div>
											<div class="col">
												<button id="addReply" type="button" class="button1" style="margin-top: 20px;">댓글달기</button>
											</div>
										<% } %>
										</div>
									</div>
									<div class="col"></div>
								</div>
							</div>
							<div class="col"></div>
						</div>
					</div>
					<div id="menu2" class="tab-pane fade">
						<div class="row">
							<div class="col"></div>

							<div class="col-11">
								<form>
									<div style="margin-top: 80px; margin-left:70px; margin-right:70px;">
										<%= p.getProductContent() %>
									</div>
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
		<div class="row" style="margin-top: 100px;"></div>


		<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		<%@ include file="../common/bottom.jsp"%>
	</div>
		<%@ include file="../common/navbar.jsp"%>

	
	
	<script>
	/* -----댓글등록------------------------------------------------------------------- */
	
	
	<% if(loginUser != null)  { %>
	 $('#addReply').on('click', function(){
		
		var memberId = '<%= loginUser.getId() %>';
		var pId = '<%= p.getProductId() %>';
		var content = $('#replyContent').val();
		
		$.ajax({
			url: 'storeReplyInsert.bo',
			data: {memberId:memberId, content:content, pId:pId},
			success: function(data){
				
				$replyTable = $('#replySelectTable');
				$replyTableCT = $('#replySelectTable');
				$replyTable.html('');
				$replyTableCT.html('');
				console.log(data);
				
				for(var i in data){
					
					
					var $div = $('<div id="rep' + i +'">');
					var $writerTd = $('<span>').text(data[i].memberId).css({"font-size":"18px","font-weight":"bold"});
					var $dateTd = $('<span> ').text(data[i].productReplyEnrollDate).css({"margin-left":"12px"});
					var $updateTd = $('<span class="repBtnF repUpdate">').text('수정').css({"margin-left":"24px"});
					var $deleteCT = $('<span class="repBtnB repDelete">').text('삭제').css({"margin-left":"14px"});
					var $br = $('<br>');
					var $contentTd = $('<span>').text(data[i].productReplyContent);
					var $input = $('<input type="hidden" id="replyId'+ i +'" value="'+ data[i].productReplyId +'">');
					var $div2 = $('<div id="repUpdateForm' + i + '">').css({"display":"none", "width":"760px", "height":"120px"});
					var $writer = $('<span>').text(data[i].memberId).css({"font-size":"18px","font-weight":"bold"});
					var $update = $('<span class="repBtnF update" id="update'+i+'">').text("등록");
					var $cancle = $('<span class="repBtnB cancle" id="delete'+i+'">').text("취소");
					var $content = $('<textarea rows="3" cols="107" class="form-control" id="updateContent'+i+'">').css({"resize":"none", "border-color":"lightgray"});
					
					// 로그인 o -> 아이디 , 로그인 x -> 'null'
					var $userId = '<%= loginUser != null ?  loginUser.getId() : null %>';
					$div.append($input);
					$div.append($writerTd);
					$div.append($dateTd);
					
					if($userId == data[i].memberId){
						$div.append($updateTd);
						$div.append($deleteCT);
					}
					
					$div.append($br);
					$div.append($contentTd);
					$replyTable.append($div);
					$div2.append($writer);
					$div2.append($update);
					$div2.append($cancle);
					$div2.append($content);
					
	                $replyTable.append($div2);
					
				}
				
				$('#replyContent').val('');
				}
			});
		}); 
	 <% } %>
 	/* 댓글 삭제 --------------------------------------------------------------------- */
		
	
		$(document).on('click', ".repDelete", function(){
			if (!confirm("삭제하시겠습니까?")) {
				return;
			}
			console.log(this);
			
			var divId = $(this).parent().attr('id');
			console.log("divId :" + divId);
			
			var replyId = $(this).parent().children().attr('value');
			console.log("replyId"+replyId);
			$.ajax({
				url : "storeDeleteReply.bo",
				data : {
					replyId : replyId,
					divId : divId
				},
				success : function(data) {
					alert("댓글 삭제 성공 했습니다.");
						$('#' + divId).remove();
					
				}
			});
		});
 
		//--------댓글 수정--------------------------------------------------------
		$(document).on('click', ".repUpdate", function(){
			if (!confirm("수정하시겠습니까?")) {
				return;
			}
			var divId = $(this).parent().attr('id');
			var repUpdateForm = $(this).parent().next();
			
			
			$('#'+divId).hide();
			$(repUpdateForm).show();
			
					
		});
			// 댓글 수정 버튼 누른후 등록버튼 누를 때
			$(document).on('click', ".update", function() {
				
		 		var replyId = $(this).parent().prev().children().first().val();
				var content = $(this).next().next().val();
				var pId = '<%= p.getProductId() %>';
				
				console.log(replyId);
				console.log(content);
				console.log(pId);
				if(content == '') {
					$(this).next().next().attr("placeholder", "댓글을 입력해주세요");
					return 0;
				}
				
				
			$.ajax({
				url : "storeUpdateReply.bo",
				data : {
					replyId : replyId,
					content : content,
					pId : pId
				},
				 success : function(data) {
					 
					 $replyTable = $('#replySelectTable');
						$replyTableCT = $('#replySelectTable');
						$replyTable.html('');
						$replyTableCT.html('');
						
						
						
						for(var i in data){
							
							
							var $div = $('<div id="rep' + i +'">');
							var $writerTd = $('<span>').text(data[i].memberId).css({"font-size":"18px","font-weight":"bold"});
							var $dateTd = $('<span> ').text(data[i].productReplyEnrollDate).css({"margin-left":"15px"});
							var $updateTd = $('<span class="repBtnF repUpdate">').text('수정').css({"margin-left":"24px"});
							var $deleteCT = $('<span class="repBtnB repDelete">').text('삭제').css({"margin-left":"14px"});
							var $br = $('<br>');
							var $contentTd = $('<span>').text(data[i].productReplyContent);
							var $input = $('<input type="hidden" id="replyId'+ i +'" value="'+ data[i].replyId +'">');
							var $div2 = $('<div id="repUpdateForm' + i + '">').css({"display":"none", "width":"760px", "height":"120px"});
							var $writer = $('<span>').text(data[i].memberId).css({"font-size":"18px","font-weight":"bold"});
							var $update = $('<span class="repBtnF update" id="update'+i+'">').text("등록");
							var $cancle = $('<span class="repBtnB cancle" id="delete'+i+'">').text("취소");
							var $content = $('<textarea rows="3" cols="107" class="form-control" id="updateContent'+i+'">').css({"resize":"none", "border-color":"lightgray"});
							
							// 로그인 o -> 아이디 , 로그인 x -> 'null'
							var $userId = '<%= loginUser != null ?  loginUser.getId() : null %>';
							
							$div.append($input);
							$div.append($writerTd);
							$div.append($dateTd);
							
							
							if($userId == data[i].memberId){
								$div.append($updateTd);
								$div.append($deleteCT);
							}
									
							
							$div.append($br);
							$div.append($contentTd);
							$replyTable.append($div);
							$div2.append($writer);
							$div2.append($update);
							$div2.append($cancle);
							$div2.append($content);
							
			                $replyTable.append($div2);
			               
						}
				 }
			});  
		});			
			// 댓글 수정 버튼 누른 후 취소버튼 누를 때
			$(document).on('click', ".cancle", function() {
				
				var divId = $(this).parent().prev().attr('id');
				console.log(divId);
				var repUpdateForm = $(this).parent();
				console.log(repUpdateForm);
				
				$('#'+divId).show();
				$(repUpdateForm).hide();
				
			});
 	
 	
 
	</script>

</body>
</html>
