<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>

<% Member member = (Member)request.getAttribute("member");
   String userName = member.getName();
   String userId = member.getId();
   String userPwd = member.getPwd();
   String email = member.getEmail();
   String adminCode = member.getAdminCode();
   String phone = member.getPhone().equals("null") ? "" : member.getPhone();
   String address = member.getAddress().equals("null") ? "" : member.getAddress();
   
   String[] splitStr = address.split("/");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 설정</title>
<script src="js/popper.min.js"></script>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap-4.3.1.js"></script>
<link href="css/bootstrap-4.3.1.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">	
<style>



.table th[scope="col"] {
	background: rgb(17, 187, 255);
	color: white;
	width: 60px;
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
		
		<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!상단 끝!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->

		<%@ include file="../common/adminMiddleCategory.jsp" %>
		<!-- ----------------------------------------------------------------------------- -->
			<!-- 행 사이 빈공간-->
			<div class="row" style="margin-top: 40px;"></div>

			<!-- 관리자 정보 수정 제목-->
			<div class="row">
				<!-- 여백 -->
				<div class="col"></div>
				<!-- 관리자정보수정 -->
				<div class="col"
					style="text-align: center; font-size: 25px; font-weight: bold; color: rgb(17, 187, 255);">관리자정보수정</div>
				<!-- 여백 -->
				<div class="col"></div>
			</div>
			<!-- 행 사이 빈공간-->
			<div class="row" style="margin-top: 10px;"></div>

			 <!-- 정보기입 -->
         <div class="row">
            <!-- 여백 -->
            <div class="col-4"></div>
            <!-- 기입칸-->
         <div class="col-5" style="font-size: 18px; font-weight: bold;">
            <form action="<%= request.getContextPath() %>/update.me" method="post" id="adminForm">
            	<button type="button" id="delete" style="text-decoration: underline; font-weight: normal; border-style: none; background-color: #fff; color: rgb(127, 127, 127); cursor: pointer; font-size: 12px; margin-left: 350px;">탈퇴하기</button>
				<label class="form-label">이름</label><br>
					<input class="form-control" type="text" id="name" name="name" value="<%=userName%>"
						style="color: rgb(94, 94, 94); font-size: 14px; line-height: 200%; width: 60%;"><br>			 	
			 	<label class="form-label">아이디</label><br>
			 		<input class="form-control" type="text" id="id" name="id" value="<%=userId%>" readonly
			 		style="color: rgb(94, 94, 94); font-size: 14px; line-height: 200%; width: 60%;"><br>
   				<label class="form-label">이메일</label><br>
				 <input class="form-control" type="email" id="email" name="email" value="<%=email%>"
                  style="color: rgb(94, 94, 94); font-size: 14px; line-height: 200%; width: 80%;"><br>
              <label class="form-label">연락처</label><br>
                <input class="form-control" type="text" id="phone" name="phone" value="<%=phone%>"
                  style="color: rgb(94, 94, 94); font-size: 14px; line-height: 200%; width: 70%;"><br>
                <label class="form-label">주소</label><br>
                <input class="form-control" type="text" id="post" name="post" placeholder="우편번호" value="<%=splitStr[0]%>"
                  style="color: rgb(94, 94, 94); font-size: 14px; line-height: 200%; width: 40%;"><br>
                <input class="form-control" type="text" id="add1" name="add1" placeholder="주소" value="<%=splitStr[1]%>"
                  style="color: rgb(94, 94, 94); font-size: 14px; line-height: 200%; width: 80%; margin-top: -13px;"><br>                  
                <input class="form-control" type="text" id="add2" name="add2" placeholder="상세주소" value="<%=splitStr[2]%>" \
                  style="color: rgb(94, 94, 94); font-size: 14px; line-height: 200%; width: 80%; margin-top: -13px;"><br>			  
				 <input type="hidden" name="isAdmin" value="<%= member.getIsAdmin() %>">
				<button type="submit" id="update" class="button1" onclick="return enroll();" style="width: 150px; margin-left:80px;">관리자정보수정</button>
			</form>
				</div>
				<!-- 여백 -->
				<div class="col-3"></div>
			</div>
			
			
			<!-- 행 사이 빈공간-->
			<div class="row" style="margin-top: 100px;"></div>
				
			
			
			<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
			<%@ include file="../common/bottom.jsp" %>
		</div>
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단 끝 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	<%@ include file="../common/navbar.jsp"%>


	<!-- 상단 스크립트 -->
	<script>
	 /* 회원가입시 빠진 항목 확인 메소드 */
    function enroll() {
        var userName = document.getElementById('name').value;
        var email = document.getElementById('email').value;
        var post = document.getElementById('post').value;
        var add1 = document.getElementById('add1').value;
        var add2 = document.getElementById('add2').value;
       var regExpEmail = /^[0-9a-zA-Z_\-]+@[.0-9a-zA-Z_\-]+$/;
       var regExpPost = /^\d{5}$/;
       var regExpPass = /^[A-Za-z0-9]{8,15}$/;

        if (userName == '' || userName.length == 0) {
          alert('이름을 입력해주세요.');
           document.getElementById('name').focus();
           return false;
        } else if (email == '' || email.length == 0) {
           alert('이메일을 입력해주세요.');
           document.getElementById('email').focus();
           return false;
        } else if (!regExpEmail.test(email)){
      	alert('이메일이 조건에 맞지않습니다.\n(영문,숫자@영문,숫자)');
      	document.getElementById('email').value = '';
      	document.getElementById('email').focus();
          return false; 
        }   else if (post == '' || post.length == 0) {
           alert('우편번호를 입력해주세요.');
           document.getElementById('post').focus();
           return false;
        } else if (!regExpPost.test(post)){
       		alert('우편번호가 조건에 맞지 않습니다.\n(00000)');
       		document.getElementById('post').value = '';
 				document.getElementById('post').focus();
 				return false;
		 } else if (add1 == '' || add1.length == 0) {
           alert('주소를 입력해주세요.');
           document.getElementById('add1').focus();
           return false;
        } else if (add2 == '' || add2.length == 0) {
            alert('상세주소를 입력해주세요.');
            document.getElementById('add2').focus();
            return false;
         } else {
            var bool = confirm('정말 수정하시겠습니까?');
           if(bool){
              alert(userName + "님, 정보 수정이 성공적으로 완료되었습니다.");
               return true;
           } else {
            	return false;
           }   
         } 
     }
    
    $(function() {
		$('#delete').click(function() {
			var bool = prompt('정말 탈퇴하시겠습니까? 탈퇴하시려면 관리자 코드를 입력하십시오');
			var userName = $('#name').val();
			if (bool == "realadmin") {
				alert(userName +"님은 자유로운 도비입니다!");
				$('#adminForm').attr('action', 'delete.me');
				$('#adminForm').submit();
			}	else {
				if(bool == null) {
					
				} else {
					alert("값을 제대로 입력해주세요.");	
				}
			}
		});
	});
</script>	
</body>
</html>