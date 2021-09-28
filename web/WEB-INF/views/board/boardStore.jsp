<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*"%>
<% 
	ArrayList<Product> pList = (ArrayList<Product>)request.getAttribute("pList");
	ArrayList<ProductAttachment> fList = (ArrayList<ProductAttachment>)request.getAttribute("fList");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	// 검색 조건을 유지하기 위해 검색 조건항목들의 값을 가져오기
	String[] roomSize = null;
	int[] itemCategory = null;
	int maxPrice = 0;
	String index = (String)request.getAttribute("index");
	
	String sendRoom = "";
	String sendCategory = "";
	
	if(request.getAttribute("roomSize") != null) {
		roomSize = (String[])request.getAttribute("roomSize");
		for(int i = 0 ; i < roomSize.length ; i++) {
			sendRoom += roomSize[i] + ",";
		}
	}
	
	if(request.getAttribute("itemCategory") != null) {
		itemCategory = (int[])request.getAttribute("itemCategory");
		for(int i = 0 ; i < itemCategory.length ; i ++) {
			sendCategory += itemCategory[i] + ",";
		}
	}
	
	if(request.getAttribute("maxPrice") != null) {
		maxPrice = (int)request.getAttribute("maxPrice");
	}

	// 선택되었던 검색 조건들을 유지 시키기 위해 사용
	String[] checkedRoomSize = new String[6];
	if(roomSize != null) {
		for(int i = 0 ; i < roomSize.length ; i ++) {
			switch(roomSize[i]) {
			case "6": checkedRoomSize[0] = "checked"; break;
			case "8": checkedRoomSize[1] = "checked"; break;
			case "10": checkedRoomSize[2] = "checked"; break;
			case "12": checkedRoomSize[3] = "checked"; break;
			case "14": checkedRoomSize[4] = "checked"; break;
			case "16": checkedRoomSize[5] = "checked"; break;
			}
		}
	}
	
	String[] checkedCategory = new String[6];
	if(itemCategory != null) {
		for(int i = 0 ; i < itemCategory.length ; i++) {
			switch(itemCategory[i]) {
			case 1: checkedCategory[0] = "checked"; break;
			case 2: checkedCategory[1] = "checked"; break;
			case 3: checkedCategory[2] = "checked"; break;
			case 4: checkedCategory[3] = "checked"; break;
			case 5: checkedCategory[4] = "checked"; break;
			case 6: checkedCategory[5] = "checked"; break;
			}
		}
	}
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int checkBoardCount = 0;
%>      
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>다나와방</title>
<script src="js/popper.min.js"></script>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap-4.3.1.js"></script>
<link href="css/bootstrap-4.3.1.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>



<style>
body{line-height: 1.5;}
.form-control {height: calc(1.5em + 1.2rem + 2px);}
#main-search {height: calc(1.5em + 1.2rem + 2px);}

.categories {font-size: 20px; color: #11BBFF; font-weight: bold; margin-left:20px;}

.categories:hover {color: #FBA481; text-decoration: none;}

.page-link{
	color: #11bbff;
}

/* ---------카테고리----------- */
.categorys {font-size: 25px; color: #11BBFF; font-weight: bold; margin-left:30px;}

.categorys:hover {color: #FBA481; text-decoration: none;}


.place { width: 50px; height: 50px; background-color: #336699; }
</style>
</head>
<body style="font-family: 'Nanum Gothic', sans-serif;">
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!상단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	<div id="main-container" class="container">
		<%@ include file="../common/top.jsp" %>

		<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!상단 끝!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		<div class="row" style="margin-top: 40px;">
			<div class="col-12"
				style="font-size: 25px; color: #11BBFF; text-align: center; font-weight: bold;">스토어</div>
		</div>
			<!-- 상세 검색 ---->
			<div class="row"
				style="margin-top: 60px; margin-left: 80px; font-size: 20px; font-weight: bold; color: #11BBFF;">상세검색</div>
			<!--테두리-->
			<form action="boardStore.bo" id="storeForm" onsubmit="checkList();" method="post">
			<div class="container"
				style="left: 20px; margin-top: 20px; border: 3px solid #11bbff; width: 1000px; border-radius: 10px;">
				<!--여백-->
				<div
					style="margin-left: 30px; margin-top: 30px; margin-bottom: 30px;">
					<!--평수-->
					<div class="row"
						style="font-size: 17px; color: #11BBFF; font-weight: bold; margin-bottom: 20px;">평수</div>
					<!--평수 체크박스-->
					<div class="row" style="margin-bottom: 30px;">
						<div class="col-8">
							<div class="row"
								style="font-size: 15px; color: gray; font-weight: bold;">
								<div class="col-2">
									<input type="checkbox" name="roomSize" value="6" <%= checkedRoomSize[0] %>><span style="margin-left: 10px;">6평</span>
								</div>
								<div class="col-2">
									<input type="checkbox" name="roomSize" value="8" <%= checkedRoomSize[1] %>><span style="margin-left: 10px;">8평</span>
								</div>
								<div class="col-2">
									<input type="checkbox" name="roomSize" value="10" <%= checkedRoomSize[2] %>><span style="margin-left: 10px;">10평</span>
								</div>
								<div class="col-2">
									<input type="checkbox" name="roomSize" value="12" <%= checkedRoomSize[3] %>><span style="margin-left: 10px;">12평</span>
								</div>
								<div class="col-2">
									<input type="checkbox" name="roomSize" value="14" <%= checkedRoomSize[4] %>><span style="margin-left: 10px;">14평</span>
								</div>
								<div class="col-2">
									<input type="checkbox" name="roomSize" value="16" <%= checkedRoomSize[5] %>><span style="margin-left: 10px;">16평</span>
								</div>
							</div>
							<input type="hidden" name="checkedRoomSize" id="checkedRoomSize">
						</div>
						<div class="col-4"></div>
					</div>
					<!--카테고리-->
					<div class="row"
						style="font-size: 17px; color: #11BBFF; font-weight: bold; margin-bottom: 20px;">카테고리</div>
					<!--카테고리체크박스-->
					<div class="row" style="margin-bottom: 30px;">
						<div class="col-8">
							<div class="row"
								style="font-size: 15px; color: gray; font-weight: bold;">
								<div class="col-2">
									<input type="checkbox" name="item" value="1" <%= checkedCategory[0] %>><span style="margin-left: 10px;">침대</span>
								</div>
								<div class="col-2">
									<input type="checkbox" name="item" value="2" <%= checkedCategory[1] %>><span style="margin-left: 10px;">매트리스</span>
								</div>
								<div class="col-2">
									<input type="checkbox" name="item" value="3" <%= checkedCategory[2] %>><span style="margin-left: 10px;">서랍장</span>
								</div>
								<div class="col-2">
									<input type="checkbox" name="item" value="4" <%= checkedCategory[3] %>><span style="margin-left: 10px;">커튼</span>
								</div>
								<div class="col-2">
									<input type="checkbox" name="item" value="5" <%= checkedCategory[4] %>><span style="margin-left: 10px;">조명</span>
								</div>
								<div class="col-2">
									<input type="checkbox" name="item" value="6" <%= checkedCategory[5] %>><span style="margin-left: 10px;">행거</span>
								</div>
							</div>
							<input type="hidden" name="checkedItemCategory" id="checkedItemCategory" >
						</div>
						<div class="col-4"></div>
					</div>
					<!--가격-->
					<div class="row"
						style="font-size: 17px; color: #11BBFF; font-weight: bold; margin-bottom: 20px;">가격</div>
					<!--가격 및 검색-->
					<div class="row">
						<div class="col">
							<div class="range-slider"
								style="font-size: 17px; color: #11BBFF; font-weight: bold;">
								<input class="range-slider__range" type="range" value="<%= maxPrice %>" name="maxPrice" id="maxPrice"
									style="width: 300px;" min="0" max="1000000" step="30000">
								~ <span class="range-slider__value">0</span>원
							</div>
						</div>
						<div class="col" style="margin-left: 460px; margin-top: 30px;">
							<button class="button1" type="submit">검색</button>
						</div>
					</div>
				</div>
			</div>

			<!-- 할인율,신상,낮은가격, 높은가격 순 -->
			<div class="row"
				style="font-size: 15px; font-weight: bold; color: #11bbff; cursor: pointer; margin-left: 10px; margin-top: 30px; text-align:center;">
						<!-- <input type="hidden" name="index" value="0"> -->
						<div class="col-2 sort" onclick=""<%-- "location.href='<%= request.getContextPath()%>/boardStore.bo?index=1'" --%>>할인율순</div>
						<!-- <input type="hidden" name="discountRate" value="">할인율순</div> -->
						<div class="col-2 sort" onclick="<%-- location.href='<%= request.getContextPath()%>/boardStore.bo?index=2' --%>">신상품순</div>
						<!-- <input type="hidden" name="new" value="">신상품순</div> -->
						<div class="col-2 sort" onclick="<%-- location.href='<%= request.getContextPath()%>/boardStore.bo?index=3' --%>">낮은 가격순</div>
						<!-- <input type="hidden" name="low" value="">낮은 가격순</div> -->
						<div class="col-2 sort" onclick="<%-- location.href='<%= request.getContextPath()%>/boardStore.bo?index=4' --%>">높은 가격순</div>
						<!-- <input type="hidden" name="high" value="">높은 가격순</div> -->
						<div class="col-4"></div>
					</div>
				<input type="hidden" name="index" id="index">
					<hr>
			
		
		<!-- </div> -->
		<!-- 침대 -->
		<div class="container">
		<div class="row">
		</form>
			
			<% if(pList.isEmpty() || fList.isEmpty()) { %>
			<div class="row">
			<div class="col-2"><img src="images\nosearch.png"></div>
			<div class="col-8 text-center" style="height:300px; top:300px; font-size:30px; font-weight: bold;">해당되는 상품이 없습니다.<br>
			</div>
			<div class="col-2"></div>
		</div>
			<div class="row" style="margin-top: 50px; margin-bottom:100px;"></div>
			<% } else { %>
				<% for(int i = 0; i < pList.size(); i++) { %>
					<% Product p = pList.get(i); %>
					<input type="hidden" name="cId" value="<%= p.getProductCategoryId() %>">
					<div class="col-3 thumb-list" style="display:inline-block; margin-top: 30px; margin-left:30px; margin-right:30px; margin-bottom:50px; vertical-align:middle;">
						<div style="cursor:pointer;">
							<% for(int j = 0; j < fList.size(); j++) { %>
								<% ProductAttachment pa = fList.get(j); %>
								<% if(p.getProductId() == pa.getProductId() && pa.getProductFileLevel() == 0) { %>
									<span><img src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= pa.getProductChangeName() %>" width="300px" height="300px"></span><br><br>
								<% } %>
							<% } %>
						</div>
						<% int rate =  (int)(Math.ceil(p.getProductDiscountRate()*100)); %>
						<span style="font-size:20px; font-weight:bold; color:#11bbff; margin-left:20px;  margin-right: 80px;"><%= rate %>%</span>
						<span style="font-size:20px; font-weight:bold;"><%= p.getProductPrice() %>원</span><br><br>
						<span style="font-size:17px; font-weight:bold; margin-top:10px;"><%= p.getProductName() %></span><br>
						<span style="font-size:15px;"><%= p.getProductBrand() %></span>
						<input type="hidden" name="pId" value="<%= p.getProductId() %>">
					</div>
				<% } %>
			<% } %>
		</div>
		
		</div>

	<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 40px;">
		<div class="col">
		<!-- 페이징 -->
		<!-- 페이징 버튼 클릭시 검색 조건 값을 넘겨줌 -->
		<nav aria-label="Page navigation example" class="pagination justify-content-center page-item" style="display:flex;">
		<!-- 맨 처음으로 -->
			<button class="page-link paging" onclick="location.href='<%=request.getContextPath() %>/boardStore.bo?currentPage=1&checkedRoomSize=<%= sendRoom %>&checkedItemCategory=<%= sendCategory %>&maxPrice=<%= maxPrice %>&index=<%= index %>'" id="bebeforeBtn"> &lt;&lt; </button>
			<!-- 이전 페이지로 -->
			<button class="page-link paging" onclick="location.href='<%=request.getContextPath() %>/boardStore.bo?currentPage=<%= currentPage -1 %>&checkedRoomSize=<%= sendRoom %>&checkedItemCategory=<%= sendCategory %>&maxPrice=<%= maxPrice %>&index=<%= index %>'" id="beforeBtn"> &lt; </button>
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
						<button class="page-link" id="numBtn" onclick="location.href='<%= request.getContextPath()%>/boardStore.bo?currentPage=<%= p %>&checkedRoomSize=<%= sendRoom %>&checkedItemCategory=<%= sendCategory %>&maxPrice=<%= maxPrice %>&index=<%= index %>'"><%= p %></button>
			<% 				} %>	
			<% }%>		
			<!-- 다음 페이지로 -->
			<button class="page-link" onclick="location.href='<%=request.getContextPath() %>/boardStore.bo?currentPage=<%= currentPage + 1%>&checkedRoomSize=<%= sendRoom %>&checkedItemCategory=<%= sendCategory %>&maxPrice=<%= maxPrice %>&index=<%= index %>'" id="afterBtn"> &gt; </button>
			<!-- 맨 끝으로 -->
			<button class="page-link" onclick="location.href='<%=request.getContextPath() %>/boardStore.bo?currentPage=<%= maxPage %>&checkedRoomSize=<%= sendRoom %>&checkedItemCategory=<%= sendCategory %>&maxPrice=<%= maxPrice %>&index=<%= index %>'" id="afafterBtn"> &gt;&gt;</button>
			<script>
				if(<%= currentPage %> >= <%=maxPage %>){
					$('#afterBtn').prop('disabled', true);
					$('#afafterBtn').prop('disabled', true);
				}
			</script>
		</nav>
		</div>
		</div>
	 	<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 120px;"></div>

	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		<%@ include file="../common/bottom.jsp" %>
	</div>
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단 끝 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->											
		<%@ include file="../common/navbar.jsp"%>
							

	<!-- 가격 표시 -->
	<script type="text/javascript">
		var rangeSlider = function() {
			var slider = $('.range-slider'),
			
			range = $('.range-slider__range'),
			value = $('.range-slider__value');
			slider.each(function() {
				value.each(function() {
					var value = $(this).prev().attr('value');
					$(this).html(value);
				});
				range.on('input', function() {
					
					$(this).next(value).html(this.value.replace(/\B(?=(\d{3})+(?!\d))/g, ","));
				});
			});
		};

		rangeSlider();
	</script>
	
	<script>
	/* 정렬 조건을 클릭 했을 때 정렬 조건에 맞는 index값 넘기기 */
	$(function() {
		$('.sort').click(function() {
			switch($(this).text()) {
			case "할인율순": $('#index').val(1); break;
			case "신상품순": $('#index').val(2); break;
			case "낮은 가격순": $('#index').val(3); break;
			case "높은 가격순": $('#index').val(4); break;
			}

			$('#storeForm').submit();
		});
	});

	/* 선택된 검색 항목들 데이터 넘겨주기 위한 준비 */
		function checkList() {
			var size = document.getElementsByName('roomSize');
			
			for(var i = 0 ; i < size.length ; i++) {
				if(size[i].checked) {
					document.getElementById("checkedRoomSize").value += size[i].value + ",";
				}
			}
			
			var itemCategory = document.getElementsByName("item");
			var checkedItemCategory = "";
			
			for(var j = 0 ; j < itemCategory.length ; j++) {
				if(itemCategory[j].checked) {
					checkedItemCategory += itemCategory[j].value + ",";
				}
			}
			
			if(checkedItemCategory.length != 0) {
				document.getElementById("checkedItemCategory").value = checkedItemCategory;				
			} 
		};
	
	</script>
	
	<script>
		$(function(){
			$('.thumb-list').click(function(){
				var pId = $(this).find("input").val();
				location.href="<%=request.getContextPath()%>/boardStoreDetail.bo?pId=" + pId;
			});
		});
	</script>	
</body>
</html>

	