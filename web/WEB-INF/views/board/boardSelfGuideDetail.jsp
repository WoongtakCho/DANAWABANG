<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*, java.util.*"%>
<%
	Board b = (Board) request.getAttribute("board");
	ArrayList<BoardAttachment> fileList = (ArrayList) request.getAttribute("fileList");
	BoardAttachment titleImg = fileList.get(0); 
	BoardAttachment contentImg1 = fileList.get(1); 
	BoardAttachment contentImg2 = fileList.get(2); 
	BoardAttachment contentImg3 = fileList.get(3); 
	BoardAttachment contentImg4 = fileList.get(4); 
	BoardAttachment contentImg5 = fileList.get(5); 
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다나와방</title>
<script src="js/popper.min.js"></script>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap-4.3.1.js"></script>
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
<link href="css/bootstrap-4.3.1.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

<style>
div {
	border: 0px solid green;
	}

/* ----------스크롤시 하단아이콘  보이기 --------------------------------------------------------------------- */

.bottomNav {position: fixed; font-size:50px; color: #11BBFF;}
.bottomNav {bottom: -90px;  transition:bottom .2s;}
.bottomNav.show {bottom: 0; }



/* ------------따라다니는 오른쪽 네비게이션---------------------------------------------------------- */
#followquick {
	position: absolute;
	top: 200px;
	right: 50%;
	margin-top: 270px;
	margin-right: -800px;
}
</style>
</head>
<body style="font-family: 'Nanum Gothic', sans-serif;">
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!상단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	<div id="main-container" class="container">
		<%@ include file="../common/top.jsp" %>
		<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!상단 끝!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->

		<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 20px;"></div>
		
		<!-- ------------------------------------------가이드 내용------------------------- -->	
		<div class="row" style="text-align: center; font-size: 25px; text-decoration: none; color: #11BBFF; font-weight: bold;">
			<div class="col-4"></div>
			<div class="col-4">셀프 인테리어 가이드</div>
			<div class="col-4"></div>
		</div>
	
		<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 30px;"></div>
		<!-- 가이드 작성 내용-->
		<div class="row">
			<div class="col-1"></div>
			<div class="col-8" style=" font-size: 30px; text-decoration: none; font-weight: bold;"><%= b.getBoardTitle() %></div>
			<div class="col-3"></div>
		</div>
		<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 40px;"></div>
		<div class="row">
			<div class="col-1"></div>
			<div class="col-3" style=" font-size: 17px; text-decoration: none; font-weight: bold;">조회수 : <%= b.getBoardCount() %></div>
			<div class="col-4"></div>
			<div class="col-3" style=" font-size: 17px; text-decoration: none; font-weight: bold;">작성일자 : <%= b.getEnrollDate() %></div>
		</div>
		<div class="row">
			<div class="col-12" style="text-align:center;">
				<div style="margin-top: 10px; ">
					<img id="contentImg1" width="800"  src="<%=request.getContextPath()%>/selfGuide_uploadFiles/<%=contentImg1.getChangeName()%>">
				</div>
				<div style="margin-top: 10px; ">
					<img id="contentImg2" width="800"  src="<%=request.getContextPath()%>/selfGuide_uploadFiles/<%=contentImg2.getChangeName()%>">
				</div>
				<div style="margin-top: 10px; ">
					<img id="contentImg3" width="800"  src="<%=request.getContextPath()%>/selfGuide_uploadFiles/<%=contentImg3.getChangeName()%>">
				</div>
				<div style="margin-top: 10px; ">
					<img id="contentImg4" width="800"  src="<%=request.getContextPath()%>/selfGuide_uploadFiles/<%=contentImg4.getChangeName()%>">
				</div>
				<div style="margin-top: 10px; ">
					<img id="contentImg5" width="800"  src="<%=request.getContextPath()%>/selfGuide_uploadFiles/<%=contentImg5.getChangeName()%>">
				</div>
			</div>
		</div>
		
		<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 40px;"></div>
		
		<!-- 버튼 -->
		<div class="row">
			<div class="col" style="left: 10%; width: 70%;">
					<button type="button" class="button1" onclick="location.href='<%= request.getContextPath() %>/boardSelfGuide.bo'">돌아가기</button>
			</div>
		</div>
	
		<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 100px;"></div>
		
		<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		<%@ include file="../common/bottom.jsp" %>
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단 끝 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	</div>
		<%@ include file="../common/navbar.jsp"%>
	
	
	<!-- 오른쪽 따라 다니는 네비게이션 바 -->

	<div id="followquick" style="width: 7%;">
		<div class="row"
			style="height: 200px; background: #11BBFF; color: #fff; border-radius: 10px;">
			<div class="col"
				style="margin-top: -10px; text-align: center; cursor: pointer;"
				onclick="location.href='<%= request.getContextPath() %>/boardFaq.bo';">
				<div>
					<div class="side-nav"
						style="font-size: 19px; font-weight: bold; margin-top: 15px;">
						<i class="bi bi-house" style="font-size: 45px; color: #fff"></i><br>
						<div style="color: #fff;">
							다나와방<br>고객센터
						</div>
						<br>
						<div
							style="font-size: 23px; font-weight: bold; color: #fff; margin-top: -10px;">1555-5551</div>
					</div>
				</div>
				<div
					style="margin-top: 5px; width: 100%; border-bottom: 2px solid #fff"></div>
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

	$(function(){
		$('#followquick').children().hover(function(){
			$(this).css({'background-color':'#FBA481', 'color' : '#fff'});
	}, function(){
		$(this).css({'background-color':'#11BBFF', 'color' : '#fff'});
	});
	});
   </script>
	
</body>
</html>