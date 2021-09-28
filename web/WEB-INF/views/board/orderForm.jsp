<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*"%>
<%
ArrayList<CartWhole> cwList = (ArrayList) request.getAttribute("cwList");	
ArrayList<ProductAttachment> fList = (ArrayList) request.getAttribute("fList");
String boards = (String) request.getAttribute("boards");

int fee = 0;
int price = 0;
for(int i = 0; i<cwList.size(); i++) {
	fee += cwList.get(i).getProductDeliveryFee();
	price += (cwList.get(i).getProductPrice() * cwList.get(i).getCartProductAmount());
}
int sum = fee+price;
//주문번호 주문상품 주문금액 주문일자 상세보기
//상세=>주문번호 주문상품이미지 주문상품 주문금액 주문일자 주문자 연락처 이메일 배송지 요청사항
//주문번호, 주문자, 연락처, 이메일, 배송지, 요청사항, 주문상품명, 주문상품이미지(PRODUCT_ID), 주문금액, 주문일자
//SEQ, buyer_name, buyer_tel, buyer_email, buyer_postcode/buyer_add1/buyer_add2, message, name, amount, productId, SYSDATE
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
	border: 0px solid blue;
}

h4 {
	color: #11BBFF;
	font-weight: bold;
	text-align: center;
}

h5 {font-size: 15px; 
	text-decoration: none; 
	 
	font-weight: bold;"
	}



.water {
	background: #11BBFF;
	border-color: #11BBFF;
	width: 150px;
	height: 40px;
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
		<div class="row-12" style="font-size: 25px; color: #11BBFF; font-weight: bold; text-align: center; margin-bottom:40px;">
		결제정보입력</div>
	<form action="" id="detailForm" method="post">	
		<div class="row-12" style="font-size: 20px; color: #11BBFF; font-weight: bold; margin-left:250px; margin-bottom:10px;">
		상품정보</div>
		<div class="row" style="margin-bottom:20px; margin-left: 210px; border:2px solid #11bbff; border-radius:10px; height: 250px; width:700px;">
			<div class="col-3">
				<% for(int j = 0; j < fList.size(); j++) { %>
								<% if(cwList.get(0).getProductId() == fList.get(j).getProductId() && fList.get(j).getProductFileLevel() == 0) { %>
									<span><img src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= fList.get(j).getProductChangeName() %>"
									style="width:200px; height:200px; margin-top:20px;"></span><br><br>
								<% } %>
							<% } %>				
				</div>
			<div class="col-1"></div>
			<div class="col-8" style="margin-top: 7px;"><br>
			<% if(cwList.size() == 1 ) { %>
			<span style="font-size: 18px; font-weight: bold;"><%=cwList.get(0).getProductName()%></span>
			<input type="hidden" name="name" value="<%=cwList.get(0).getProductName()%>">
			<% } else { %>
			<span style="font-size: 18px; font-weight: bold;"><%=cwList.get(0).getProductName()%>
			외 <%=cwList.size() -1%>개</span>
			<input type="hidden" name="name" value="<%=cwList.get(0).getProductName()%> 외  <%=cwList.size() -1%>개">
			<% } %>
				<hr>
				<div class="row" style="font-size:16px; margin-left:5px; font-weight:bold;">총 배송비 : <%= fee %></div><br>
				<div class="row" style="font-size:16px; margin-left:5px; font-weight:bold;">총 상품가격 : <%= price %></div><br>
				<div class="row" style="font-size:16px; margin-left:5px; font-weight:bold;">총 결제가격 : <%= sum %></div>
				<input type="hidden" name="amount" value="<%= sum %>">
				<input type="hidden" name="productId" value="<%=cwList.get(0).getProductId() %>">
				<input type="hidden" name="boards" value="<%= boards %>">
			</div>
		</div>
		
		
		<div class="row-12" style="font-size: 20px; color: #11BBFF; font-weight: bold; margin-left:240px; margin-top:40px; margin-bottom:10px;">
		주문자정보입력</div>	
			<div class="row" style="margin-bottom:20px; margin-left: 210px; border:2px solid #11bbff; border-radius:10px; height: 730px; width:700px;">
				<div class="col-2"></div>
				<div class="col-8" style="margin-top: 40px; margin-left:-30px;">
				<label class="form-label" style="font-weight:bold;">이름</label><br>
               <input class="form-control" type="text" id="buyer_name" name="buyer_name" value="<%=loginUser.getName()%>"
                  style="color: rgb(94, 94, 94); font-size: 14px; line-height: 200%; width: 60%;"><br>
			    <label class="form-label" style="font-weight:bold;">연락처</label><br>
               <% String phone = loginUser.getPhone() == null ? "" : loginUser.getPhone(); %>
               <input class="form-control" type="text" id="buyer_tel" name="buyer_tel"
                  value="<%= phone %>" style="color: rgb(94, 94, 94); font-size: 14px; line-height: 200%; width: 70%;"><br>
                <label class="form-label" style="font-weight:bold;">이메일</label><br>
               <% String email = loginUser.getEmail() == null ? "" : loginUser.getEmail(); %>
               <input class="form-control" type="text" id="buyer_email" name="buyer_email"
                  value="<%= email %>" style="color: rgb(94, 94, 94); font-size: 14px; line-height: 200%; width: 70%;"><br> 
               <% String address = loginUser.getAddress() == null ? "" : loginUser.getAddress(); %>
                <% String[] splitStr = address.split("/"); %>
               <label class="form-label" style="font-weight:bold;">주소</label><br>
				<input class="form-control" type="text" id="buyer_postcode" name="buyer_postcode"
                  value="<%=splitStr[0]%>"
                  style="color: rgb(94, 94, 94); font-size: 14px; line-height: 200%; width: 40%;"><br>
               <input class="form-control" type="text" id="buyer_add1" name="buyer_add1"
                  value="<%=splitStr[1]%>"
                  style="color: rgb(94, 94, 94); font-size: 14px; line-height: 200%; width: 80%; margin-top: -13px;"><br>
               <input class="form-control" type="text" id="buyer_add2" name="buyer_add2"
                  value="<%=splitStr[2]%>"
                  style="color: rgb(94, 94, 94); font-size: 14px; line-height: 200%; width: 80%; margin-top: -13px;"><br> 
               <label class="form-label" style="font-weight:bold;">배송메시지</label><br>
                <textarea class="form-control" id="message" name="message"
                  style="color: rgb(94, 94, 94); font-size: 14px; width: 500px; height: 150px; resize:none;"></textarea>
             </div>
         </div>
	</form>	
			<div class="row" style="margin-top: 40px;">
				<input type="button" id="goBack" class="water3" onclick="location.href='<%=request.getContextPath()%>/cart.bo'" value="돌아가기" style="margin-left:230px; cursor:pointer;">
				<input type="button" id="order" class="water3" onclick="order();" value="결제하기" style="margin-left:480px; cursor:pointer;">
			</div>
			
		<div class="row" style="margin-bottom: 120px;"></div>
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		<%@ include file="../common/bottom.jsp" %>
	</div>	
	<%@ include file="../common/navbar.jsp"%>

	<!-- 상단 스크립트 -->
	
		
	<script>
	 function order() {
         var userName = document.getElementById('buyer_name').value;
         var phone = document.getElementById('buyer_tel').value;
         var email = document.getElementById('buyer_email').value;
         var post = document.getElementById('buyer_postcode').value;
         var add1 = document.getElementById('buyer_add1').value;
         var add2 = document.getElementById('buyer_add2').value;
         var message = document.getElementById('message').value;
         var regExpPhone = /^\d{3}-\d{4}-\d{4}$/;
        var regExpPost = /^\d{5}$/;
        var regExpPass = /^[A-Za-z0-9]{8,15}$/;
        var regExpEmail = /^[0-9a-zA-Z_\-]+@[.0-9a-zA-Z_\-]+$/;
        
         
         if (userName == '' || userName.length == 0) {
           alert('이름을 입력해주세요.');
            document.getElementById('buyer_name').focus();
            return false;
         } else if (phone == '' || phone.length == 0) {
             alert('연락처를 입력해주세요.');
             document.getElementById('buyer_tel').focus();
             return false;
          } else if (!regExpPhone.test(phone)){
         		alert('연락처가 조건에 맞지 않습니다.\n(000-0000-0000)');
         		document.getElementById('buyer_tel').value = '';
   				document.getElementById('buyer_tel').focus();
   				return false;
 		 } else if (email == '' || email.length == 0) {
             alert('이메일을 입력해주세요.');
             document.getElementById('buyer_email').focus();
             return false;
          } else if (!regExpEmail.test(email)){
        	alert('이메일이 조건에 맞지않습니다.\n(영문,숫자@영문,숫자)');
        	document.getElementById('buyer_email').value = '';
        	document.getElementById('buyer_email').focus();
            return false; 
          } else if (post == '' || post.length == 0) {
            alert('우편번호를 입력해주세요.');
            document.getElementById('buyer_postcode').focus();
            return false;
         } else if (!regExpPost.test(post)){
        		alert('우편번호가 조건에 맞지 않습니다.\n(00000)');
        		document.getElementById('buyer_postcode').value = '';
  				document.getElementById('buyer_postcode').focus();
  				return false;
		 } else if (add1 == '' || add1.length == 0) {
            alert('주소를 입력해주세요.');
            document.getElementById('buyer_add1').focus();
            return false;
         } else if (add2 == '' || add2.length == 0) {
             alert('상세주소를 입력해주세요.');
             document.getElementById('buyer_add2').focus();
             return false;
          } else if ( message == '' || message.length == 0) {
              alert('배송메시지를 입력해주세요.');
              document.getElementById('message').focus();
              return false;
           }else {
           var bool = confirm("결제창으로 넘어가시겠습니까?");
           if (bool) {
        	   $('#detailForm').attr('action', '<%= request.getContextPath() %>/order.bo');
				$('#detailForm').submit();
           } else {
        	   return false;
           }
            return true;
         }
      }
  </script>
  </body>
</html> 