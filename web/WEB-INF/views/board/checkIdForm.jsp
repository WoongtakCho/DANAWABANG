<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
</head>
<style>
.button1 {
	border: 1px solid rgb(17, 187, 255);
	background-color: rgb(17, 187, 255);
	color: white;
	border-radius: 4px;
	width: 100px;
	height: 40px;
}
</style>
<body onload="inputValue();" style="font-family: 'Nanum Gothic', sans-serif; text-align: center;">
	
	<!-- 행 사이 빈공간-->
	<div class="row" style="margin-top: 20px;"></div>
					
	<b style="text-align: center;">아이디 중복 검사</b><br>
	<br>
	<form action="<%= request.getContextPath() %>/checkId.me" id="idCheckForm">
		<input type="text" class="form-control" id="inputId" name="inputId" pattern=".{5,15}" required title="아이디는 5~15글자입니다." style="font-size: 15px; width: 200px; display: inline;">
		<input type="submit" class="button1" value="중복확인" style="margin-left: 10px;">
	</form>
	
	<br>
	<%
		Integer result = (Integer)request.getAttribute("result");
		if(result != null) {
			if(result > 0) {
	%>
			이미 사용 중인 아이디 입니다.
	<%
			} else if(((String)request.getAttribute("checkedId")).length() == 0 ) {
	%>
			아이디를 입력해주세요.
	<%
			} else {
	%>
			사용 가능한 아이디입니다.
	<%		
			}
		}
	%>
	
	<br>
	<br>
	
	<input type="button" class="button1" id="usedId" value="확인">
	<input type="button" class="button1" id="cancel" style="margin-left: 10px;" value="취소" onclick="window.close();">
	
	<script>
		function inputValue() {
			if('<%= request.getAttribute("checkedId") %>' == 'null') {  
				document.getElementById("inputId").value = opener.document.signUpForm.id.value;
			} else {
				document.getElementById("inputId").value = '<%= (String)request.getAttribute("checkedId") %>';
			}
		}
	
		document.getElementById('usedId').onclick=function() { 
			<%
				if(result != null) {
					if(result > 0) {
			%>
				opener.document.signUpForm.id.value = '';
				self.close();
			<% 
				} else if(((String)request.getAttribute("checkedId")).length() == 0 ) {
			%>
				opener.document.signUpForm.id.value = '';
				self.close();
			<%
					} else {
			%>
				opener.document.signUpForm.id.value = '<%= (String)request.getAttribute("checkedId") %>';
				self.close();
			<%		
					}
				}
			%>
		}
	</script>
</body>
</html>