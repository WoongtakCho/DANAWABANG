<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<% 
	Member loginUser = (Member) session.getAttribute("loginUser"); 
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>다나와방</title>
<!-- --------------------- -->
<style>
/*상단 관련 스타일*/
/*검색창*/
.btn-outline-secondary {
	color: #fff;
	border-color: #11BBFF;
	background-color: #11BBFF;
	font-weight: bold;
}

.btn-outline-secondary:hover {
	color: #fff;
	background-color: #FBA481;
	border-color: #FBA481;
}

.btn-outline-secondary:focus, .btn-outline-secondary.focus {
	box-shadow: 0 0 0 0 rgba(17, 187, 255, 0);
}

.btn-outline-secondary:not (:disabled ):not (.disabled ):active,
	.btn-outline-secondary:not (:disabled ):not (.disabled ).active, .show>.btn-outline-secondary.dropdown-toggle
	{
	color: #fff;
	background-color: #11BBFF;
	border-color: #11BBFF;
}

.btn-outline-secondary:not (:disabled ):not (.disabled ):active:focus,
	.btn-outline-secondary:not (:disabled ):not (.disabled ).active:focus,
	.show>.btn-outline-secondary.dropdown-toggle:focus {
	box-shadow: 0 0 0 0 rgba(17, 187, 255, 0);
}
/*아이콘 색변경*/
.i-plain {
	color: #11BBFF;
}

.i-plain:hover {
	color: #FBA481;
}
/*메뉴버튼*/
.dropdown-menu {
   position: absolute;
   top: 100%;
   left: 0;
   z-index: 1000;
   display: none;
   float: left;
   min-width: 250px;
   padding: 0;
   margin: 0;
   font-size: 18px;
   color: black;
   text-align: left;
   list-style: none;
   background-color: #fff;
   background-clip: padding-box;
   border: 2px solid rgba(17, 187, 255, 1);
   border-radius: 0.25rem;
}

.dropdown-item:hover {
   color: #11bbff;
}
.button1{
	border: 1px solid rgb(17, 187, 255);
	background-color: rgb(17, 187, 255);
	color: white;
	border-radius: 4px;
	width: 100px;
	height: 40px;
}


/* ----------------아이콘 호버시 색 바꾸기------------------- */
.i-side {
     color: #fff;
 }
.i-side:hover {
     color: #FBA481;
 }
 
.side-nav {
	color: #fff;
}
.side-nav:hover{
	color: #FBA481;
	text-decoration:none !important
}


</style>
</head>
<body style="font-family: 'Nanum Gothic', sans-serif;">
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!상단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	<form action="<%= request.getContextPath() %>/searchAll.bo" id="searchAll" method="post" onsubmit="return search();">
		<!-- 1행 -->
		<div class="row" id="top-bar">
			<!-- 상단 광고 -->
			<div class="col-12" onclick="location.href='<%= request.getContextPath()%>/boardPromotionDetail.bo?bId=271'"
				style="background: #11BBFF; text-align: center; cursor: pointer; line-height: 30px; font-size: 14px; font-weight: bold; color: white;">
				정리정돈의 달인이 될 수 있는 기회, 수납/정리 프로모션으로 함께 떠나요!</div>
		</div>

		<!-- 2행 -->
		<div class="row" id="secondRow">
			<!-- 로고  -->
			<div class="col-3">
				<div id="logo" onclick="location.href='<%= request.getContextPath() %>/mainPage.me';"
					style="color: #11BBFF; font-size: 32px; text-align: center; vertical-align: middle; margin-top: 16px; font-weight: bold; cursor: pointer; color: #11BBFF;">
					<i class="bi bi-house" style="font-size: 37px;"></i>다나와방
				</div>
			</div>

			<!-- 검색창  -->
			<div class="col-3">
				<!-- 검색 아이콘  -->
				<div style="margin-top: 30px;">
					<input type="text" class="form-control" placeholder="검색어를 입력해주세요" id="searchAllWord" name="searchAllWord"
						style="font-size: 14px; border:2px solid #11bbff; margin-left: 30px;">
				</div>
			</div>
			<div class="col-1">
				<button class="btn btn-outline-secondary" type="submit"
					id="main-search" style="font-size: 14px; margin-top: 30px;">검색</button>
					
			</div>
			<% if(loginUser == null) { %>
			<!-- 로그인/회원가입 아이콘 -->
			<div class="col-2">
				<div id="login" onclick="location.href='<%= request.getContextPath() %>/loginForm.me';"
					style="width: 140px; margin-left: 10px; font-size: 15px; margin-top: 37px; border-radius: 15px 15px 15px 15px; border-width: 2px 2px 2px 2px; border-style: solid; border-color: #11BBFF; background-color: #11BBFF; color: white; text-align: center; cursor: pointer; font-weight: bold;">로그인/회원가입</div>
			</div>
			
			<% } else { %>
			<!-- 로그아웃 아이콘 -->
			<div class="col-2">
				<div id="logout" onclick="location.href='<%= request.getContextPath() %>/logout.me';"
					style="width: 140px; margin-left: 10px; font-size: 15px; margin-top: 37px; border-radius: 15px 15px 15px 15px; border-width: 2px 2px 2px 2px; border-style: solid; border-color: #11BBFF; background-color: #11BBFF; color: white; text-align: center; cursor: pointer; font-weight: bold;">로그아웃</div>
			</div>	
			<% } %>
			<!-- 마이페이지 아이콘  -->
			<div class="col-1" style="margin-top: 18px; cursor: pointer; font-size: 42px;">
			<% if(loginUser == null) { %>
				<i class="bi bi-person i-plain" onclick="location.href='<%= request.getContextPath() %>/loginForm.me';"></i>
			<% } else if (loginUser != null && loginUser.getIsAdmin().equals("ADMIN")) { %>
				<i class="bi bi-person i-plain" onclick="location.href='<%= request.getContextPath() %>/adminMember.me';"></i>
			<% } else {%>
				<i class="bi bi-person i-plain" onclick="location.href='<%= request.getContextPath() %>/myOrder.bo';"></i>
			<% } %>	
			</div>
			<!-- 고객센터 아이콘  -->
			<div class="col-1" style="margin-top: 20px; cursor: pointer; font-size: 37px;">
				<i class="bi bi-headset i-plain" onclick="location.href='<%= request.getContextPath() %>/boardFaq.bo';"></i>
			</div>
			<!-- 장바구니 아이콘 -->
			<div class="col-1" style="margin-top: 18px; cursor: pointer; font-size: 38px;">
			<% if(loginUser == null) { %>
				<i class="bi bi-cart2 i-plain" onclick="location.href='<%= request.getContextPath() %>/loginForm.me';"></i>
			<% } else if (loginUser != null && loginUser.getIsAdmin().equals("USER")) { %>
            <i class="bi bi-cart2 i-plain" onclick="location.href='<%= request.getContextPath() %>/cart.bo';"></i>
         	<% } %>   	
			</div>
		</div>

	</form>

		<!-- 3행 -->
		<!-- 메뉴아이콘 -->
		<div class="row" id="thirdRow"
			style="text-align: center; margin-top: 15px;">
			<div class="col-1">
				<div class="dropdown" style="margin-top: -10px;">
					<a class="btn-group-vertical" href="#" role="button"
						id="dropdownMenuLink" data-bs-toggle="dropdown"
						aria-expanded="false"><i class="bi bi-list i-plain"
						style="font-size: 35px;"></i></a>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink"
						style="text-align: center; font-weight: bold;">
						<li class="dropdown-item" style="font-weight: bold;">6평<a
							class="dropdown-item" href="<%=request.getContextPath() %>/boardStore.bo?currentPage=1&checkedRoomSize=6"><img
								src="images/6평.png"></a></li>
						<li class="dropdown-item" style="font-weight: bold;">8평<a
							class="dropdown-item" href="<%=request.getContextPath() %>/boardStore.bo?currentPage=1&checkedRoomSize=8"><img
								src="images/8평.png"></a></li>
						<li class="dropdown-item" style="font-weight: bold;">10평<a
							class="dropdown-item" href="<%=request.getContextPath() %>/boardStore.bo?currentPage=1&checkedRoomSize=10"><img
								src="images/10평.png"></a></li>
						<li class="dropdown-item" style="font-weight: bold;">12평<a
							class="dropdown-item" href="<%=request.getContextPath() %>/boardStore.bo?currentPage=1&checkedRoomSize=12"><img
								src="images/12평.png"></a></li>
						<li class="dropdown-item" style="font-weight: bold;">14평<a
							class="dropdown-item" href="<%=request.getContextPath() %>/boardStore.bo?currentPage=1&checkedRoomSize=14"><img
								src="images/14평.png"></a></li>
					</ul>
				</div>
			</div>
			<!-- 스토어 카테고리 -->
			<div class="col-2" onclick="location.href='<%= request.getContextPath() %>/boardStore.bo';"
				style="font-size: 23px; color: #11BBFF; font-weight: bold; cursor: pointer">스토어</div>
			<!-- 셀프가이드 카테고리 -->
			<div class="col-2" onclick="location.href='<%= request.getContextPath() %>/boardSelfGuide.bo';"
				style="text-align: center; font-size: 23px; color: #11BBFF; font-weight: bold; cursor: pointer">셀프가이드</div>
			<!-- 프로모션 카테고리 -->
			<div class="col-2" onclick="location.href='<%= request.getContextPath() %>/boardPromotion.bo'"
				style="text-align: center; font-size: 23px; color: #11BBFF; font-weight: bold; cursor: pointer">프로모션</div>
			<div class="col-5"></div>
		</div>

		<!-- 구분선 -->
		<div
			style="margin-top: 20px; width: 100%; border-bottom: 2px solid #11BBFF; margin-bottom: 15px;"></div>

		<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 15px;"></div>

		<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!상단 끝!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		<!-- ------------------------스크립트 공간 ----------------------- -->
	
	<!-- 상단 스크립트 -->
	<script>
	$(function() {
		$('#top-bar').children().hover(function() {
			$(this).css({'background-color' : '#FBA481'});
		}, function() {
			$(this).css({'background-color' : '#11BBFF'});
		});
	});
	//2행 로고
	$(function() {
		$('#logo').hover(function() {
			$(this).css({'font-size' : '34px', 'color' : '#FBA481'});
		}, function() {
			$(this).css({'font-size' : '32px', 'color' : '#11bbff'});
		});
	});
	//2행 로그인
	$(function() {
		$('#login').hover(function() {
			$(this).css({
				'background-color' : '#FBA481',
				'border-color' : '#FBA481'
			});
		}, function() {
			$(this).css({
				'background-color' : '#11BBFF',
				'border-color' : '#11BBFF'
			});
		});
	});
	//2행 로그아웃
	$(function() {
		$('#logout').hover(function() {
			$(this).css({
				'background-color' : '#FBA481',
				'border-color' : '#FBA481'
			});
		}, function() {
			$(this).css({
				'background-color' : '#11BBFF',
				'border-color' : '#11BBFF'
			});
		});
	});
	//3행
	$(function() {
		$('#thirdRow').children().hover(function() {
			$(this).css('color', '#FBA481');
		}, function() {
			$(this).css('color', '#11BBFF');
		});
	});
	
	// 검색창 
	function search() {
		var keyword = document.getElementById('searchAllWord').value;
		
		console.log(keyword);
		if (keyword == '' || keyword.length == 0) {
			document.getElementById('searchAllWord').focus();
			return false;
		}
	}
	
	
	
	
	
	</script>
	
	

	<!-- 필요한 외부 script -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"
		integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT"
		crossorigin="anonymous"></script>

</body>
</html>		