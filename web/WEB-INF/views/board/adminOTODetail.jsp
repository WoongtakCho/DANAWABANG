<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.Board, board.model.vo.Reply, java.util.ArrayList"%>
<% 
	Board board = (Board)request.getAttribute("board"); 
	ArrayList<Reply> replyList = (ArrayList)request.getAttribute("replyList");
    
    
   /*  System.out.println(replyList); */
%>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다나와방</title>
<script src="js/popper.min.js"></script>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap-4.3.1.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="css/bootstrap-4.3.1.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>


#middleCategories {
	text-align: center;
	cursor: pointer;
	font-size: 20px;
	font-weight: bold;
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
/* ====================== */
button {
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
}
button.firstBtn:focus{ 	
    border: none;
    outline:none;
    }
</style>
</head>
<body style="font-family: 'Nanum Gothic', sans-serif;">
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!상단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	<div id="main-container" class="container">
		<%@ include file="../common/top.jsp" %>

		<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!상단 끝!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->

		<%@ include file="../common/adminMiddleCategory.jsp" %>
		<!-- --------------------------------------------------------------------------------- -->

			<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 40px;"></div>
		
		<div class="row">
			<div class="col">
				<div style="font-weight: bold; font-size: 25px; text-align: center; color: rgb(17, 187, 255);"
					class="">1:1 문의 관리자 게시판 </div>
			</div>
		</div>

		<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 20px;"></div>
	
		<!-- 가이드 작성 내용-->
	<form action="<%= request.getContextPath() %>/boardOTOUpdateForm.bo" id="detailForm" method="post" >
		<div class="row">
			<input type="hidden" id="bId" name="bId" value="<%= board.getBoardId()%>">
			<div class="col-1"></div>
			<div class="col-8" style=" font-size: 30px; font-weight: bold;"><%= board.getBoardTitle() %>	</div>
			<input type="hidden" name="title" value="<%= board.getBoardTitle()%>">
			<div class="col-3"></div>
		</div>
		<div class="row">
			<div class="col-1"></div>
			<div class="col-3" style=" font-size: 17px; font-weight: bold;">작성자 : <%= board.getWriter() %></div>
			<input type="hidden" name="writer" value="<%= board.getWriter()%>">
			<div class="col-8"></div>
		</div>
		<div class="row">
			<div class="col-1"></div>
			<div class="col-3" style=" font-size: 17px; font-weight: bold;">작성일자 : <%= board.getEnrollDate() %></div>
			<input type="hidden" name="enrollDate" value="<%= board.getEnrollDate()%>">
			<div class="col-8"></div>
		</div>
		
		<div class="row">
			<div class="col-1"></div>
			<div class="col-9">
				<div style="margin-top: 10px;">
					<br>
					<span > 
						<%= board.getBoardContent() %>
					</span>
					<input type="hidden" name="content" value="<%= board.getBoardContent() %>">
					<br>
				</div>
			</div>
			<div class="col-2"></div>
		</div>
	
		<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 60px;"></div>

		<!-- 댓글 -->
		<div class="row">
			<div class="col"></div>
			<div class="col-10">
				<span style="font-weight: bold; font-size: 18px;">댓글</span>
				<div style="border-top: 1px solid lightgray; border-bottom: 1px solid lightgray;">
					<div class="row" style="margin: 5px;">
						<div class="col" id="replySelectArea">
							<div id="replySelectTable">
								<% if(replyList.isEmpty()){ %>
									<div>
										<span >댓글이 없습니다.</span>
									</div>
								<% } else {%>
									<% for(int i = 0; i < replyList.size(); i++){ %>
										<div id="rep<%= i%>">
											<input type="hidden" class="replyId" id="replyId<%= i%>"value="<%= replyList.get(i).getReplyId() %>">
											<span style="font-size: 18px; font-weight: bold;"><%= replyList.get(i).getMemberId() %></span>
											<span style="margin-left: 10px"><%= replyList.get(i).getEnrollDate() %></span>
												<% Reply r = replyList.get(i); %>
												<% if(loginUser != null && loginUser.getId().equals(r.getMemberId()))  { %>					
													<span class="repBtnF repUpdate" id="repUpdate">수정</span>
													<span class="repBtnB repDelete" id="repDelete">삭제</span>
												<% } else {%>
													<span class="repBtnB repDelete" id="repDelete">삭제</span>
												<% } %>

											<br>
											<pre><%= replyList.get(i).getReplyContent() %></pre>
										</div>
										<div style="display: none; width: 760px; height: 120px" id="repUpdateForm<%= i%>">
											<span style="font-weight: bold; font-size: 18px;"><%= loginUser.getId() %></span><span class="repBtnF update" id="update<%= i%>">등록</span><span class="repBtnB cancle" id="cancle<%= i%>">취소</span>
											<textarea rows="3" cols="107" class="form-control" id="updateContent<%= i%>" style="resize: none; border-color: lightgray;"></textarea>
										</div>
										
									<% } %>
								<% } %>
								
							</div>
						</div> 
					</div>
				</div>
			</div>
			<div class="col"></div>
		</div>
		
		<br>

		<div class="row">
			<div class="col"></div>
			<div class="col-10">
				<div class="row">
				<% if(loginUser != null && loginUser.getAdminCode() != null) { %>
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
		
		<!-- 행 사이 빈공간-->
		<div class="row" style="margin-top: 40px;"></div>

		<!-- 버튼 -->
			<div class='row'>
				<div class="col"></div>
				<div class='col'>
					<button type="button" class="button1" onclick="location.href='<%= request.getContextPath() %>/adminOTO.bo';">돌아가기</button>
				</div>
				<div class='col-5'></div>
				<div class='col'>
			<% if(loginUser != null && loginUser.getId().equals(board.getWriter())) { %>
					<input type="submit" class="button1" value="수정">					
			<% } %>
				</div>
				<div class='col'>
			<% if(loginUser != null && loginUser.getId().equals(board.getWriter()) || loginUser.getAdminCode() != null) { %>
					<button type="button" style="margin-left: 50px;"class="button1" id="delete">삭제</button>
			<% } %>
				</div>
				<div class='col'></div>
			</div>
	</form>

		<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		<%@ include file="../common/bottom.jsp" %>
	</div>
		<%@ include file="../common/navbar.jsp"%>
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단 끝 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->

	<!-- 상단 스크립트 -->
	<script>
		
		
		//중단 카테고리 색변환
		$(function() {
			$('#middleCategories').children().hover(function() {
				$(this).css('color', '#11BBFF');
			}, function() {
				$(this).css('color', 'black');
			});
		});
		
		
		
		/* -----댓글등록------------------------------------------------------------------- */
		
		 $('#addReply').on('click', function(){
			
			var writer = '<%= loginUser.getId() %>';
			var bId = '<%= board.getBoardId() %>';
			var content = $('#replyContent').val();
			
			$.ajax({
				url: 'insertReply.bo',
				data: {memberId:writer, content:content, bId:bId},
				success: function(data){
					
					$replyTable = $('#replySelectTable');
					$replyTableCT = $('#replySelectTable');
					$replyTable.html('');
					$replyTableCT.html('');
					console.log(data);
					
					for(var i in data){
						
						var $div = $('<div id="rep' + i +'">');
						var $writerTd = $('<span>').text(data[i].memberId).css({"font-size":"18px","font-weight":"bold"});
						var $dateTd = $('<span> ').text(data[i].enrollDate).css({"margin-left":"12px"});
						var $updateTd = $('<span class="repBtnF repUpdate">').text('수정').css({"margin-left":"24px"});
						var $deleteCT = $('<span class="repBtnB repDelete">').text('삭제').css({"margin-left":"14px"});
						var $br = $('<br>');
						var $contentTd = $('<pre>').text(data[i].replyContent);
						var $input = $('<input type="hidden" id="replyId'+ i +'" value="'+ data[i].replyId +'">');
						var $div2 = $('<div id="repUpdateForm' + i + '">').css({"display":"none", "width":"760px", "height":"120px"});
						var $writer = $('<span>').text(data[i].memberId).css({"font-size":"18px","font-weight":"bold"});
						var $update = $('<span class="repBtnF update" id="update'+i+'">').text("등록");
						var $cancle = $('<span class="repBtnB cancle" id="delete'+i+'">').text("취소");
						var $content = $('<textarea rows="3" cols="107" class="form-control" id="updateContent'+i+'">').css({"resize":"none", "border-color":"lightgray"});
						var $userId = '<%= loginUser != null ?  loginUser.getId() : null %>';
						
						$div.append($input);
						$div.append($writerTd);
						$div.append($dateTd);
						
						if($userId == data[i].memberId){
							$div.append($updateTd);
							$div.append($deleteCT);
						}
						$div.append($deleteCT);
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
		
		
		//댓글 삭제-------------------------------------------------
		
		/* $('.refDelete').parent().on('click',function(){ */
	
		$(document).on('click', ".repDelete", function(){
			if (!confirm("삭제하시겠습니까?")) {
				return;
			}
			console.log(this);
			
			var divId = $(this).parent().attr('id');
			/* console.log("div 아이디 : " + divId); */
			
			var replyId = $(this).parent().children().attr('value');
			/* console.log("replyId 아이디 : " + replyId); */

			$.ajax({
				url : "deleteReply.bo",
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
			console.log(divId);
			var repUpdateForm = $(this).parent().next();
			console.log(repUpdateForm);
			
			$('#'+divId).hide();
			$(repUpdateForm).show();
					
		});
			// 댓글 수정 버튼 누른후 등록버튼 누를 때
			$(document).on('click', ".update", function() {
				
		 		var replyId = $(this).parent().prev().children().first().val();
		 		console.log(replyId);
				var content = $(this).next().next().val();
				console.log(content);
				var bId = $('#bId').val();
				console.log(bId);
				
				console.log($(this).next().next());
				
				if(content == '') {
					$(this).next().next().attr("placeholder", "댓글을 입력해주세요");
					return 0;
				}
				
				// 멤버 아이디와 등록일에 접근하기
				/* var memberId = $(this).parent().prev().children().eq(1).text();
				console.log(memberId);
				var enrollDate = $(this).parent().prev().children().eq(2).text();
				console.log(enrollDate);
				var divId = $(this).parent().prev().attr('id');
				console.log(divId);
				var replyId = $(this).parent().prev().children().first().val();
				console.log(replyId); */
					
			$.ajax({
				url : "updateReply.bo",
				data : {
					replyId : replyId,
					content : content,
					bId : bId
				},
				 success : function(data) {
					 
					 $replyTable = $('#replySelectTable');
						$replyTableCT = $('#replySelectTable');
						$replyTable.html('');
						$replyTableCT.html('');
						console.log(data);
						
						for(var i in data){
							
							var $div = $('<div id="rep' + i +'">');
							var $writerTd = $('<span>').text(data[i].memberId).css({"font-size":"18px","font-weight":"bold"});
							var $dateTd = $('<span> ').text(data[i].enrollDate).css({"margin-left":"15px"});
							var $updateTd = $('<span class="repBtnF repUpdate">').text('수정').css({"margin-left":"24px"});
							var $deleteCT = $('<span class="repBtnB repDelete">').text('삭제').css({"margin-left":"14px"});
							var $br = $('<br>');
							var $contentTd = $('<pre>').text(data[i].replyContent);
							var $input = $('<input type="hidden" id="replyId'+ i +'" value="'+ data[i].replyId +'">');
							var $div2 = $('<div id="repUpdateForm' + i + '">').css({"display":"none", "width":"760px", "height":"120px"});
							var $writer = $('<span>').text(data[i].memberId).css({"font-size":"18px","font-weight":"bold"});
							var $update = $('<span class="repBtnF update" id="update'+i+'">').text("등록");
							var $cancle = $('<span class="repBtnB cancle" id="delete'+i+'">').text("취소");
							var $content = $('<textarea rows="3" cols="107" class="form-control" id="updateContent'+i+'">').css({"resize":"none", "border-color":"lightgray"});
							
							var $userId = '<%= loginUser != null ?  loginUser.getId() : null %>';
							
							$div.append($input);
							$div.append($writerTd);
							$div.append($dateTd);
							
							if($userId == data[i].memberId){
								$div.append($updateTd);
								$div.append($deleteCT);
							}
							$div.append($deleteCT);
							
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
			
			
		//게시글삭제 버튼
		
		$(function() {
			$('#delete').click(function() {
				var bool = prompt('정말 삭제하시겠습니까? 삭제하시려면 관리자 코드를 입력하십시오')
				
				console.log(bool);
				if (bool == "realadmin") {
					$('#detailForm').attr('action', 'adminOTODelete.bo');
					$('#detailForm').submit();
				} else {
					alert("관리자 코드를 잘못입력하셨습니다.");
				}
			});
		});	
	</script>
		
	
</body>
</html>

