<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*"%>
<%
ArrayList<CartWhole> cartList = (ArrayList) request.getAttribute("cartList");
ArrayList<ProductAttachment> fList = (ArrayList) request.getAttribute("fList");
PageInfo pi = (PageInfo)request.getAttribute("pi");

int listCount = pi.getListCount();
int currentPage = pi.getCurrentPage();
int maxPage = pi.getMaxPage();
int startPage = pi.getStartPage(); 
int endPage = pi.getEndPage();
int checkBoardCount = 0;
int checkPayCount = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다나와방</title>
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
		<input type="hidden" id="checkBoards" name="checkBoards" value="">
		<input type="hidden" id="checkPayment" name="checkPayment" value="">
		<div class="row-12" style="font-size: 25px; color: #11BBFF; font-weight: bold; text-align: center; margin-bottom:30px;">
		장바구니</div>
		<div class="row-12" style="margin-left:218px; font-size:16px; margin-bottom:10px;"><input type="checkbox" id="all" name="agree" 
								onclick="selectAll();" style="width: 30px;">전체선택</div>
		
		<% if(cartList.isEmpty() || fList.isEmpty()) { %>
		<div class="row">
			<div class="col-2"><img src="images\nosearch.png"></div>
			<div class="col-8 text-center" style="height:300px; top:300px; font-size:30px; font-weight: bold;">등록된 장바구니가 없네요...<br>
			<input type="button" id="goShopping" class="water3" style="font-size:16px; cursor:pointer;" onclick="location.href='<%=request.getContextPath() %>/boardStore.bo'" value="담으러 가기">
			</div>
			<div class="col-2"></div>
		</div>
			<div class="row" style="margin-top: 50px; margin-bottom:100px;"></div>
		<% } else { %>
		<% for(int i = 0; i < cartList.size(); i++) { %>
					<% CartWhole cw = cartList.get(i); %>
		<div class="row" style="margin-bottom:20px; margin-left: 210px; border:2px solid #11bbff; border-radius:10px; height: 300px; width:700px;">
			<!-- 사진 -->
					<div class="col-3" style="margin-top:10px;">
					<input type="checkbox" class="check" name="check"
								onclick="selectOne();" style="margin-right: 50px;" value="<%= cw.getProductDeliveryFee() + (cw.getProductPrice() * cw.getCartProductAmount()) %>">
					<% for(int j = 0; j < fList.size(); j++) { %>
								<% ProductAttachment pa = fList.get(j); %>
								<% if(cw.getProductId() == pa.getProductId() && pa.getProductFileLevel() == 0) { %>
									<span><img src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= pa.getProductChangeName() %>"
									style="width:200px; height:200px; margin-top:20px;"></span><br><br>
									<% checkBoardCount++; %>
									<% checkPayCount++; %>
								<% } %>
							<% } %>				
					</div>
					<div class="col-1"><input type="hidden" name="cId" value="<%= cw.getCartId()%>"></div>
					<div class="col-8" style="margin-top: 7px;"><br>
									<span style="font-size: 13px;"><%= cw.getProductBrand() %></span><br>
									<span style="font-size: 18px; font-weight:bold;"><%= cw.getProductName() %></span>
									<hr>
							<div style="margin-bottom:10px;">
									<span style="font-size: 14px; display:inline-block; margin-bottom: 10px;">옵션 : <%= cw.getProductOptionValue() %></span><br>
									<span style="font-size: 14px; display:inline-block; margin-bottom: 10px;">수량 : <%= cw.getCartProductAmount() %></span>
									<span style="font-size: 12px; display:inline-block; margin-bottom: 10px; margin-left: 270px; cursor:pointer;">
									<input type="button" class="water3" onclick="location.href='<%=request.getContextPath()%>/cartUpdateForm.bo?cId=' + <%= cw.getCartId() %>" 
									value="옵션 및 수량 변경" style="cursor: pointer;"></span>
									</div>	
								<div style="font-size: 14px; text-align: right;">
									<span>배송비 + </span>
									<span>상품가격 = </span>
									<span style="font-size:18px; font-weight:bold;">총가격</span><br>
								</div>
								<div style="font-size: 14px; text-align: right;">
								<% if (cw.getProductPrice() * cw.getCartProductAmount() > 100000) { %>
									<span id="baesong">0 + </span>
								<% } else { %>
									<span id="baesong"><%= cw.getProductDeliveryFee() %> + </span>	
								<% } %>
									<span id="productPrice"><%= cw.getProductPrice() * cw.getCartProductAmount() %> = </span>
									<span id="sumPrice" style="font-weight:bold; font-size:18px;"><%= cw.getProductDeliveryFee() + (cw.getProductPrice() * cw.getCartProductAmount()) %>원</span>	
								</div>	
							</div>
					</div>
					<% } %>
					
					</form>
				</div>
		<div class="row" style="margin-top: 30px; margin-bottom:50px; margin-left: 320px;">
		<div class="col-4"></div>
		<div class="col-8" style="font-size:14px;">
		<input type="button" id="delete" class="water" onclick="selectDeleteBoard();" value="삭제하기">
		<input type="button" id="pay" class="water" onclick="selectPay();" value="결제하기">
		</div>
		</div>
<% } %>
		<!-- 페이징 -->
		<nav aria-label="Page navigation example" class="pagination justify-content-center page-item" style="display:flex;">
		<!-- 맨 처음으로 -->
			<button class="page-link" onclick="location.href='<%=request.getContextPath() %>/cart.bo?currentPage=1'" id="bebeforeBtn"> &lt;&lt; </button>
			<!-- 이전 페이지로 -->
			<button class="page-link" onclick="location.href='<%=request.getContextPath() %>/cart.bo?currentPage=<%= currentPage -1 %>'" id="beforeBtn"> &lt; </button>
			<script>
				if(<%= currentPage %> <= 1){
					$('#bebeforeBtn').attr('disabled', 'true');
					$('#beforeBtn').attr('disabled', 'true');
				}
			</script>
			<!-- 숫자 버튼 -->
			<% for(int p = startPage; p <=endPage; p++) { %>
			<%		 if(p== currentPage) { %>
						<button class="page-link" id="chosen" disabled> <%= p %> </button>
			<%			} else { %>
						<button class="page-link" id="numBtn" onclick="location.href='<%= request.getContextPath()%>/cart.bo?currentPage=<%= p %>'"><%= p %></button>
			<% 				} %>	
			<% }%>		
			<!-- 다음 페이지로 -->
			<button class="page-link" onclick="location.href='<%=request.getContextPath() %>/cart.bo?currentPage=<%= currentPage + 1%>'" id="afterBtn"> &gt; </button>
			<!-- 맨 끝으로 -->
			<button class="page-link" onclick="location.href='<%=request.getContextPath() %>/cart.bo?currentPage=<%= maxPage %>'" id="afafterBtn"> &gt;&gt;</button>
			<script>
				if(<%= currentPage %> >= <%=maxPage %>){
					$('#afterBtn').prop('disabled', true);
					$('#afafterBtn').prop('disabled', true);
				}
			</script>
		</nav>
		<div class="row" style="margin-bottom: 120px;"></div>
		
		
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->

		<%@ include file="../common/bottom.jsp" %>
		<%@ include file="../common/navbar.jsp"%>
	
	
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단 끝 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->

	
	
	
	<script>			
		/* 체크박스 선택방식 메소드 */
		function selectAll() {
			var check = document.getElementsByName("check");
			var all = document.getElementById("all");
			
			if(document.getElementById("all").checked) {
				for(var i = 0 ; i < check.length ; i++ ) {
					check[i].checked = true;
				}
			} else {
				for(var i = 0 ; i < check.length ; i++ ) {
					check[i].checked = false;
				}
			}
		}
		
		function selectOne() {
			var check = document.getElementsByName("check");
			var all = document.getElementById("all");
			var count = 0;
				
			for(var i = 0 ; i < check.length-1; i++) {
				if(check[i].checked) {
					count++;	
				} 
			}
				
			if(count != 5)  {
				all.checked = false;
			} else {
				all.checked = true;
			}		
		}
		// 체크박스를 이용한 여러 게시글 한번에 삭제하기
		 function selectDeleteBoard(){
			var checkList = document.getElementsByName('check');
			var checkBoardId = '';
			
			// 체크박스 선택된 게시글의 아이디 목록 저장하기 
			for(var i = 0 ; i < <%= checkBoardCount %> ; i++) {
				if(checkList[i].checked) {
					checkBoardId += checkList[i].parentNode.nextSibling.nextSibling.firstChild.value + ",";
					console.log(checkList[i]);
					console.log(checkList[i].parentNode.nextSibling.nextSibling.firstChild.value);
				}
			}
		
			document.getElementById('checkBoards').value = checkBoardId;
			console.log(document.getElementById('checkBoards').value);
			if(checkBoardId == '' || checkBoardId.length == 0) {
				alert("상품을 먼저 체크해주세요");
				return 0;
			}
			
			var bool = confirm("정말 삭제하시겠습니까?");
			
			if(bool){
				alert("삭제 완료했습니다.");
				$('#detailForm').attr('action', '<%= request.getContextPath() %>/deleteCarts.bo');
				$('#detailForm').submit();
				
			}  else{
				return false;				
			}
		} 
		// 체크박스를 이용해 주문하기
		 function selectPay(){
			var checkList = document.getElementsByName('check');
			var checkBoardId = '';
			
			// 체크박스 선택된 게시글의 아이디 목록 저장하기 
			for(var i = 0 ; i < <%= checkPayCount %> ; i++) {
				if(checkList[i].checked) {
					checkBoardId += checkList[i].parentNode.nextSibling.nextSibling.firstChild.value + ",";
				}
			}
		
			document.getElementById('checkPayment').value = checkBoardId;
			console.log(document.getElementById('checkPayment').value);
			if(checkBoardId == '' || checkBoardId.length == 0) {
				alert("상품을 먼저 체크해주세요");
				return 0;
			}
			
			var bool = confirm("결제정보 입력창으로 넘어가시겠습니까?");
			
			if(bool){
				$('#detailForm').attr('action', '<%= request.getContextPath() %>/orderForm.bo');
				$('#detailForm').submit();
				
			}  else{
				return false;				
			}
		} 
	</script>
</body>
</html> 