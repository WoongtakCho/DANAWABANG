<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
    
<% Member member = (Member)request.getAttribute("member");
   String userName = member.getName();
   String userId = member.getId();
   String userPwd = member.getPwd();
   String email = member.getEmail();
   String phone = member.getPhone() == null ? "" : member.getPhone();   
   String address = member.getAddress() == null ? "//" : member.getAddress();
   
   
   String[] splitStr = address.split("/");
   System.out.println(member);
%>   
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
   <link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>

</style>
</head>
<body style="font-family: 'Nanum Gothic', sans-serif;">
   <!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!상단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
   <div id="main-container" class="container">
      <%@ include file="../common/top.jsp" %>

      <!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!상단 끝!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->


      <!--!!!!!!!!!!!!!!!!!!!!!!!!! 마이 페이지 카테고리 !!!!!!!!!!!!!!!!!!!!!!!!!!-->
      <!-- 중단 카테고리 -->   
      <div class="row" id="middleCategories">
         <!-- 중단 카테고리 여백 -->
         <div class="col-3"></div>
         <!-- 나의쇼핑, 나의활동, 설정 중단카테고리 -->
         <div onclick="location.href='<%= request.getContextPath() %>/myOrder.bo'"
               class="col-2" style="text-align: center; cursor: pointer; font-size: 20px; font-weight: bold; padding-right:10px;">
               나의 쇼핑</div>
         <div onclick="location.href='<%= request.getContextPath() %>/myReply.bo'"
               class="col-2" style="text-align: center; cursor: pointer; font-size: 20px; font-weight: bold; padding-right:20px;">
               나의 활동</div>
         <div onclick="location.href='<%= request.getContextPath() %>/mySettingForm.me';"
               class="col-2" style="text-align: center; cursor: pointer; font-size: 20px; font-weight: bold;">
               설정</div>
         <!-- 상단 카테고리 여백 -->
         <div class="col-3"></div>
      </div>
      
      
      
      
      
      <!-- 행 사이 빈공간-->
      <div class="row" style="margin-top: 40px;"></div>

         <!-- 회원정보수정 제목 -->
         <div class="row">
            <!-- 여백 -->
            <div class="col"></div>
            <!-- 회원정보수정 제목-->
            <div class="col"
               style="text-align: center; font-size: 23px; font-weight: bold; color: #11BBFF;">회원정보수정</div>
            <!-- 여백 -->
            <div class="col"></div>
         </div>
         <!-- 행 사이 빈공간-->
         <div class="row" style="margin-top: 20px;"></div>

         <!-- 정보기입 -->
         <div class="row">
            <!-- 여백 -->
            <div class="col-4"></div>
            <!-- 기입칸-->
         <div class="col-5" style="font-size: 18px; font-weight: bold;">
            <form action="<%=request.getContextPath() %>/update.me" method="post" id="myForm">
            	<button type="button" onclick="withdraw();" style="text-decoration: underline; font-weight: normal; border-style: none; background-color: #fff; color: rgb(127, 127, 127); cursor: pointer; font-size: 12px; margin-left: 350px;">탈퇴하기</button>
               <label class="form-label">이름</label>
               <br><input class="form-control" type="text" id="name" name="name" value="<%=userName%>"
                  style="color: rgb(94, 94, 94); font-size: 14px; line-height: 200%; width: 60%;"><br>
               <label class="form-label">아이디</label><br>
			<input class="form-control" type="text" id="id" name="id" value="<%=userId%>"
			 style="color: rgb(94, 94, 94); font-size: 14px; line-height: 200%; width: 60%;" readonly><br>
             <label class="form-label">이메일</label><br>
             <input class="form-control" type="text" id="email" name="email" value="<%=email%>"
                 style="color: rgb(94, 94, 94); font-size: 14px; line-height: 200%; width: 80%;"><br>
               <label class="form-label">연락처</label>
				<input class="form-control" type="text" id="phone" name="phone" value="<%=phone%>"
                  style="color: rgb(94, 94, 94); font-size: 14px; line-height: 200%; width: 70%;"><br>
               <label class="form-label">주소</label><br>
               <input class="form-control" type="text" id="post" name="post" value="<%=splitStr[0]%>"
                  style="color: rgb(94, 94, 94); font-size: 14px; line-height: 200%; width: 40%;"><br>
               <input class="form-control" type="text" id="add1" name="add1"
                  value="<%=splitStr[1]%>"
                  style="color: rgb(94, 94, 94); font-size: 14px; line-height: 200%; width: 80%; margin-top: -13px;"><br>
               <input class="form-control" type="text" id="add2" name="add2" value="<%=splitStr[2]%>"
			     style="color: rgb(94, 94, 94); font-size: 14px; line-height: 200%; width: 80%; margin-top: -13px;"><br>
			     <input type="hidden" name="isAdmin" value="<%= member.getIsAdmin() %>">
               <button type="submit" id="update" onclick="return enroll();"
                  class="button1" style="width: 150px; margin-left: 80px;">회원정보수정</button>
            </form>
         </div>
            <!-- 여백 -->
            <div class="col-3"></div>
         </div>

      

         <!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
      <%@ include file="../common/bottom.jsp" %>
   </div>
   <!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단 끝 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	<%@ include file="../common/navbar.jsp"%>


   <!-- 상단 스크립트 -->
     <script>
  //중단 카테고리 색변환
         $('#middleCategories').children().hover(function() {
            $(this).css('color', '#11BBFF');
         }, function() {
            $(this).css('color', 'black');
         });
      
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
      
      function withdraw() {
    	  var bool = confirm('정말 탈퇴하시겠습니까?');
    	  var userName = document.getElementById('name').value;
    	  if(bool) {
    		alert(userName +"님, 탈퇴되셨습니다. 언젠가 다시 뵙길 바래요!")
     	 $('#myForm').attr('action', '<%=request.getContextPath()%>/delete.me');
     	 $('#myForm').submit();
     	 return true;
    	  } else {
    		  return false;
    	  }
        }
   </script>
</body>
</html>
