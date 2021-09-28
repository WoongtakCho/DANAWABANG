<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다나와방</title>
</head>
<body>
<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		<div class="row" style="margin-top: 40px;">
			<div class="col-1"></div>
			<div class="col-4" onclick="location.href='<%= request.getContextPath() %>/boardFaq.bo';"
				style="color: black; font-size: 22px; font-weight: bold; cursor: pointer; line-height:20px; margin-left: 20px; margin-bottom:-10px;">
				고객센터 : 1555-5551<br><span style="font-size: 13px; font-weight: normal; color:black;">평일 09:00 ~ 18:00 (주말 & 공휴일 제외)</span></div>
			<div class="col-6"></div>
		</div>
		<div class="row" style="margin-top: 20px; color: black; line-height: 20px; font-size: 13px; font-weight: bold; cursor: pointer;">
			<div class="col-1" style="margin-right:-20px;"></div>
			<div class="col-6">
			<div class="row" style="margin:auto; text-align: center;">
				<div class="col" onclick="location.href='<%= request.getContextPath() %>/introduction.me';">회사소개</div>
				<div class="col" onclick="location.href='<%= request.getContextPath() %>/accessTerms.me';">이용약관</div>
				<div class="col" onclick="location.href='<%= request.getContextPath() %>/privacyPolicy.me';">개인정보처리방침</div>
				<div class="col" onclick="location.href='<%= request.getContextPath() %>/boardNotice.bo';">공지사항</div>
			</div>
			</div>
			<div class="col-5"></div>
		</div>
		<div class="row" style="margin-top: 10px; margin-left: 10px; font-size: 12px;">
			<div class="col-1"></div>
			<div class="col-11">
				<p>
					상호명 : (주)다나와방 / 이메일 : danawabang@danawabang.com / 대표이사 : 박신우 /
					사업자등록번호 : 999-88-77777 / 통신판매업신고번호 : 제2021-서울역삼-0215호<br> 주소 :
					서울 역삼구 역삼대로56길 6 타워팰리스타워 31층 <br> Copyright 2021. danawabang,
					Co., Ltd. All rights reserved
				</p>
			</div>
		</div>
	<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!하단 끝 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
</body>
</html>