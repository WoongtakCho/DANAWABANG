<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다나와방</title>
<style>
	/* ----------스크롤시 하단아이콘  보이기 --------------------------------------------------------------------- */
.bottomNav {
	position: fixed;
	font-size: 50px;
	color: #11BBFF;
}

.bottomNav {
	bottom: -90px;
	transition: bottom .2s;
}

.bottomNav.show {
	bottom: 0;
}

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
<body>
	
	<!-- 오른쪽 따라 다니는 네비게이션 바 -->
<div class="container">
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
		<div class="col-1" style="">
			<i class="bi bi-arrow-up-circle-fill bottomNav i-plain"
				style="cursor: pointer;" onclick="window.scrollTo(0,0);"></i>
		</div>
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
	
	
	<!-- --------------------따라오는 오른쪽 네비게이션 ------------------------------- !-->

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