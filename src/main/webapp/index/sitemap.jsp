<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/common.jsp" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="/TPJ6/css/style.css"/>
		<link rel="stylesheet" href="/TPJ6/css/table.css"/>
		<title>ITfinder</title>
		<script src="https://kit.fontawesome.com/4788385f0b.js" crossorigin="anonymous"></script>
	</head>
	<body>
		<div style="width:1900px; align:center;">
		<header>
			<div>
				<nar class="navbar">
					<div class="navbar_logo">
						<a href="/TPJ6/index/index.jsp">
							<img src="/TPJ6/image/logo.jpg" style="width:200px; height:50px;">
						</a>
					</div>
					<div class="con">
					  	<nav class="top-bar__menu-box-1">
							<ul class="navbar_menu">
								<li><a href="/TPJ6/post/list.jsp">채용정보</a></li>
								<li>
									<a href="/TPJ6/community/review/list.jsp"> 커뮤니티 </a>
									<ul>
										<li><a href="/TPJ6/community/review/list.jsp">기업리뷰</li>
										<li><a href="/TPJ6/community/news/list.jsp">취업뉴스</li>
										<li><a href="/TPJ6/community/board/list.jsp">자유게시판</li>
									</ul>
								</li>
								<li>
									<a href="/TPJ6/mypage/list.jsp">마이페이지</a>
									<ul>
										<li><a href="/TPJ6/mypage/write.jsp">이력서 등록</li>
										<li><a href="/TPJ6/mypage/list.jsp">이력서 관리</li>
									</ul>
								</li>
								<li>
									<a href="/TPJ6/company/list.jsp">기업서비스</a>
									<ul>
										<li><a href="/TPJ6/company/write.jsp">채용공고 등록</li>
										<li><a href="/TPJ6/company/list.jsp"">채용공고 관리</li>
										<li><a href="/TPJ6/company/alist.jsp">지원자 관리</li>
									</ul>
								</li>
								<li>
									<a href="/TPJ6/index/sitemap.jsp"><i class="fa-solid fa-bars"></i></a>
								</li>
							</ul>
						</nav>
					</div>	
					<ul class="navbar_menu">
					<% 
						if(login == null)
						{
							%>
							<li><a href="/TPJ6/join/join.jsp">회원가입</a></li>
							<li>|</li>
							<li><a href="/TPJ6/login/login.jsp">로그인</a></li>
							<% 
						}else
						{
							%>
							<li>[ <%= login.getUid() %> ] 님</li>
							<li><a href="/TPJ6/login/logout.jsp">로그아웃</a></li>
							&nbsp;
							<%
						}
					%>
					</ul>
				</nar>
			</div>
		</header>
		
		<!-- 왼쪽 -->
			<style>
	table
	{
		margin-left:60px;
	}
	 .menu_a
	 {
	 	height: 40px;
	 	background-color: #f4f4f4;
	 	font-size : 16pt;
		text-align : center; 
	 }
	 .menu_a.on
	 {
	 	background-color: #cccccc;
	 }		 
	 .menu_a:hover
	 {
	 	background-color: #cccccc;
	 }
	 .menu_b
	 {
	 	padding-left: 40px;
	 	height: 30px;
	 	background-color: #f4f4f4;
	 	font-size : 14pt;
	 	text-align : left; 
	 }
	 .menu_b.on
	 {
	 	background-color: #cccccc;
	 }		 		
	 .menu_b:hover
	 {
	 	background-color: #fffff0;
	 }		  
	</style>
       <div style="float: left; width: 10%; margin-left:10px;">
		<table border="0" style="width:100%">
			<br>
			<tr>
				<td class="menu_a"><h3><a href="/TPJ6/post/list.jsp">채용정보</a></h3></td>
			</tr>
			<tr>
				<td class="menu_a"><h3><a href="/TPJ6/community/review/list.jsp">커뮤니티</a></h3></td>
			</tr>
			<tr>
				<td class="menu_b"><h5><a href="/TPJ6/community/review/list.jsp">-기업리뷰</a></h6></td>
			</tr>
			<tr>
				<td class="menu_b"><h5><a href="/TPJ6/community/news/list.jsp">-취업뉴스</a></h6></td>
			</tr>
			<tr>
				<td class="menu_b"><h5><a href="/TPJ6/community/board/list.jsp">-자유게시판</a></h6></td>
			</tr>
			<tr>
				<td class="menu_a"><h3><a href="/TPJ6/mypage/list.jsp">마이페이지</a></h3></td>
			</tr>
			<tr>
				<td class="menu_b"><h5><a href="/TPJ6/mypage/write.jsp">-이력서 등록</a></h6></td>
			</tr>
			<tr>
				<td class="menu_b"><h5><a href="/TPJ6/mypage/list.jsp">-이력서 관리</a></h6></td>
			</tr>
			<tr>
				<td class="menu_a"><h3><a href="/TPJ6/company/list.jsp">기업서비스</a></h3></td>
			</tr>
			<tr>
				<td class="menu_b"><h5><a href="/TPJ6/company/write.jsp">-채용공고 등록</a></h6></td>
			</tr>
			<tr>
				<td class="menu_b"><h5><a href="/TPJ6/company/list.jsp">-채용공고 관리</a></h6></td>
			</tr>
			<tr>
				<td class="menu_b"><h5><a href="/TPJ6/company/alist.jsp">-지원자 관리</a></h6></td>
			</tr>
		</table>
       </div>

		<!-- 오른쪽 -->
        <div style="float: right; width: 80%"></div>
	    <div style="padding-left: 220px;">
	   <!-- }} ----------------------------------------  컨텐츠 시작 영역 -->
	   <br>
		<table class="tbl">
		<tr>
			<td><h2><a href="/TPJ6/post/list.jsp">채용정보</a></h2></td>
			<td><h2><a href="/TPJ6/community/review/list.jsp">커뮤니티</a></h2></td>
			<td><h2><a href="/TPJ6/mypage/list.jsp">마이페이지</a></h2></td>
			<td><h2><a href="/TPJ6/company/write.jsp">기업서비스</a></h2></td>
		</tr>
		<tr>
			<td><h3> </h3></td>
			<td><h3><a href="/TPJ6/community/review/list.jsp">-기업리뷰</a></h3></td>
			<td><h3><a href="/TPJ6/mypage/write.jsp">-이력서 등록</a></h3></td>
			<td><h3><a href="/TPJ6/company/write.jsp">-채용공고 등록</a></h3></td>
		</tr>
		<tr>
			<td><h3> </h4></td>
			<td><h3><a href="/TPJ6/community/news/list.jsp">-취업뉴스</a></h3></td>
			<td><h3><a href="/TPJ6/mypage/list.jsp">-이력서 관리</a></h3></td>
			<td><h3><a href="/TPJ6/company/list.jsp">-채용공고 관리</a></h3></td>
		</tr>
		<tr>
			<td><h3> </h3></td>
			<td><h3><a href="/TPJ6/community/board/list.jsp">-자유게시판</a></h3></td>
			<td><h3></h3></td>
			<td><h3><a href="/TPJ6/company/alist.jsp">-지원자 관리</a></h3></td>
		</tr>
	</table>
	<br>
<!-- }} ----------------------------------------  컨텐츠 종료 영역 -->
<%@ include file="/include/tail.jsp" %>