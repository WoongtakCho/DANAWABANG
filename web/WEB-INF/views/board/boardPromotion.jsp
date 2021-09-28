<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*"%>
<% 
	ArrayList<Board> bList = (ArrayList<Board>)request.getAttribute("bList");
	ArrayList<BoardAttachment> fList = (ArrayList<BoardAttachment>)request.getAttribute("fList");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
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
<title>다나와방</title>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap-4.3.1.js"></script>
<script src="js/bootstrap.min.js"></script>

<link rel="stylesheet" href="css/bootstrap-4.3.1.css" >
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

    
    
<style type="text/css">
		div {
			border: 0px solid green;
		}
      

/*페이지번호매기는거*/
.page-link {
  color: #11BBFF;
}

     
.pro_ml { text-decoration:none !important } 
.pro_ml:hover { text-decoration:none !important }     
.img-thumbnail {margin-top:50px;}
.pro_mt {margin-top:-90px; margin-left:10px; color:#fff; text-shadow: 2px 2px 6px gray;}



/* ----------스크롤시 하단아이콘  보이기 --------------------------------------------------------------------- */

.bottomNav {position: fixed; font-size:50px; color: #11BBFF;}
.bottomNav {bottom: -90px;  transition:bottom .2s;}
.bottomNav.show {bottom: 0; }



/* ------------따라다니는 오른쪽 네비게이션---------------------------------------------------------- */
#followquick { position:absolute; top:200px; right:50%; margin-right:-850px; }
</style>

</head>
<body style="font-family: 'Nanum Gothic', sans-serif;">
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!상단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	<div id="main-container" class="container">
		<%@ include file="../common/top.jsp" %>

		<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!상단 끝!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	
		
		<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 40px;"></div>
		
		
		<!-- 셀프가이드 전용 -->
		<div class="container" style="margin-bottom: 50px;">
			<div class="row" >
				<div class="col-4"></div>
				<div class="col-4" style=" text-align:center; font-size: 25px; text-decoration: none; color: #11BBFF; font-weight: bold;">프로모션</div>
				<div class="col-4"></div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-2"></div>
				<div class="col-8">
			<% if(bList.isEmpty() || fList.isEmpty()) { %>
			등록된 사진이 없습니다.
			<% } else { %>
				<% for(int i = 0; i < bList.size(); i++) { %>
					<% Board b = bList.get(i); %>
					<div class="thumb-list" align="center">
						<div style="cursor:pointer;">
							<% for(int j = 0; j < fList.size(); j++) { %>
								<% BoardAttachment a = fList.get(j); %>
								<% if(b.getBoardId() == a.getBoardId()) { %>
									<img src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= a.getChangeName() %>" width="600px" height="600px">
								<% } %>
							<% } %>
						</div>
						<div style="margin-bottom:70px; font-size: 25px; font-weight: bold; cursor:pointer;"><span>
						<%= b.getBoardTitle() %></span><input type="hidden" class="bId" value="<%= b.getBoardId() %>"></div>
					</div>
				<% } %>
			<% } %>
		</div>
		<div class="col-2"></div>
			</div>
		</div>

		<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 40px;"></div>

		<!-- 페이징 -->
		<nav aria-label="Page navigation example" class="pagination justify-content-center page-item">
		<!-- 맨 처음으로 -->
			<button class="page-link" onclick="location.href='<%=request.getContextPath() %>/boardPromotion.bo?currentPage=1'" id="bebeforeBtn"> &lt;&lt; </button>
			<!-- 이전 페이지로 -->
			<button class="page-link" onclick="location.href='<%=request.getContextPath() %>/boardPromotion.bo?currentPage=<%= currentPage -1 %>'" id="beforeBtn"> &lt; </button>
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
						<button class="page-link" id="numBtn" onclick="location.href='<%= request.getContextPath()%>/boardPromotion.bo?currentPage=<%= p %>'"><%= p %></button>
			<% 				} %>	
			<% }%>		
			<!-- 다음 페이지로 -->
			<button class="page-link" onclick="location.href='<%=request.getContextPath() %>/boardPromotion.bo?currentPage=<%= currentPage + 1%>'" id="afterBtn"> &gt; </button>
			<!-- 맨 끝으로 -->
			<button class="page-link" onclick="location.href='<%=request.getContextPath() %>/boardPromotion.bo?currentPage=<%= maxPage %>'" id="afafterBtn"> &gt;&gt;</button>
			<script>
				if(<%= currentPage %> >= <%=maxPage %>){
					$('#afterBtn').prop('disabled', true);
					$('#afafterBtn').prop('disabled', true);
				}
			</script>
		</nav>
		
		<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 120px;"></div>
		
		<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		<%@ include file="../common/bottom.jsp" %>
	</div>
	
	<!-- 오른쪽 따라 다니는 네비게이션 바 -->

	<div id="followquick" style="width: 7%;">
		<div class="row"
			style="height: 280px; background: #11BBFF; border-radius: 3px;">
			<div class="col" style="margin-top: -10px;">
				<br> <i class="bi bi-house"
					style="font-size: 50px; margin-left: 5px; color: #fff"></i> <span
					style="font-size: 18px; font-weight: bold; color: #fff">다나와방</span>
				<div class="row" style="margin-top: 110px;"></div>

				<div>
					<a href="" class="side-nav"
						style="font-size: 20px; font-weight: bold; text-decoration: none">
						<i class="bi bi-whatsapp i-side"
						style="font-size: 23px; text-align: center;"></i>&nbsp;&nbsp;고객센터
					</a>
				</div>

				<span style="font-size: 15px; font-weight: bold; color: #fff">1555-5551</span>

				<div
					style="margin-top: 10px; width: 100%; border-bottom: 2px solid #fff"></div>
			</div>
		</div>
	</div>
	<!-- 탭 하면 맨위로 올라가는 버튼 -->				 
	<div class="row">
		<div class="col-10"></div>
		<div class="col-1" style="float-right">
			<i class="bi bi-arrow-up-circle-fill bottomNav i-plain" 
			style="cursor:pointer;" onclick="window.scrollTo(0,0);" ></i>
		</div>
		<div class="col-1">
			<i class="bi bi-whatsapp bottomNav i-plain" style="cursor:pointer;" ></i>
		
		</div>
	</div>	
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단 끝 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	

		<!-- ---------------------------------------스크립트 영역 --------------------------------------->
		
		
	


	<!-- 스크롤 시 하단 아이콘 보이기-------------------------------------------- -->
	<script>
	//Javascript
	var lastScrollTop = 0;
	var delta = 10;
	var fixBox = document.querySelector('.bottomNav');
	var fixBoxHeight = fixBox.offsetHeight;
	var didScroll;
	//스크롤 이벤트 
	window.onscroll = function(e) {
	    didScroll = true;
	};

	//0.25초마다 스크롤 여부 체크하여 스크롤 중이면 hasScrolled() 호출
	setInterval(function(){
	    if(didScroll){
	        hasScrolled();
	        didScroll = false;
	    }
	}, 250);

	function hasScrolled(){
	    var nowScrollTop = window.scrollY;
	    if(Math.abs(lastScrollTop - nowScrollTop) <= delta){
	        return;
	    }
	    if(nowScrollTop > lastScrollTop && nowScrollTop > fixBoxHeight){
	        //Scroll down
	        fixBox.classList.add('show');
	    }else{
	        if(nowScrollTop + window.innerHeight < document.body.offsetHeight){
	            //Scroll up
	            fixBox.classList.remove('show');
	        }
	    }
	    lastScrollTop = nowScrollTop;
	};
	
	</script>
	<!-- --------------------따라오는 오른쪽 네비게이션 ------------------------------- -->
	
	<script>
	//follow quick menu
	$(window).scroll(function(){
	var scrollTop = $(document).scrollTop();
	if (scrollTop < 180) {
	 scrollTop = 180;
	}
	$("#followquick").stop();
	$("#followquick").animate( { "top" : scrollTop });
	});
	</script>	
	<script>
		$(function(){
			$('.thumb-list').click(function(){
				var bId = $(this).find("input").val();
				console.log(bId);
				location.href="<%=request.getContextPath()%>/boardPromotionDetail.bo?bId=" + bId;
			});
		});
		
		$(function(){
			$('.thumb-list').children().hover(function(){
				$(this).css('color', '#11BBFF');
			}, function() {
				$(this).css('color', 'black');
			});
		});
	</script>	
			
</body>
</html>