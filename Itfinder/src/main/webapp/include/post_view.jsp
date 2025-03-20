<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/TPJ6/css/style.css"/>
	<link rel="stylesheet" href="/TPJ6/css/post_view.css"/>
	<title>ITfinder</title>
	<script src="https://kit.fontawesome.com/4788385f0b.js" crossorigin="anonymous"></script>
	<script src="TPJ6/js/jquery-3.7.1.js"></script>
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
								<li class="li1"><a href="/TPJ6/post/list.jsp">채용정보</a></li>
								<li class="li1">
									<a href="/TPJ6/community/review/list.jsp"> 커뮤니티 </a>
									<ul class="sub_menu">
										<li class="li1"><a href="/TPJ6/community/review/list.jsp">기업리뷰</li>
										<li class="li1"><a href="/TPJ6/community/news/list.jsp">취업뉴스</li>
										<li class="li1"><a href="/TPJ6/community/board/list.jsp">자유게시판</li>
									</ul>
								</li>
								<li class="li1">
									<a href="/TPJ6/mypage/list.jsp">마이페이지</a>
									<ul class="sub_menu">
										<li class="li1"><a href="/TPJ6/mypage/write.jsp">이력서 등록</li>
										<li class="li1"><a href="/TPJ6/mypage/list.jsp">이력서 관리</li>
									</ul>
								</li>
								<li class="li1">
									<a href="/TPJ6/company/list.jsp">기업서비스</a>
									<ul class="sub_menu">
										<li class="li1"><a href="/TPJ6/company/write.jsp">채용공고 등록</li>
										<li class="li1"><a href="/TPJ6/company/list.jsp"">채용공고 관리</li>
										<li class="li1"><a href="/TPJ6/company/alist.jsp">지원자 관리</li>
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
									<li class="li1"><a href="/TPJ6/join/join.jsp">회원가입</a></li>
									<li>|</li>
									<li class="li1"><a href="/TPJ6/login/login.jsp">로그인</a></li>
									<% 
								}else
								{
									%>
									<li>[ <%= login.getUid() %> ] 님</li>
									<li class="li1"><a href="/TPJ6/login/logout.jsp">로그아웃</a></li>
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
				<td class="menu_a on"><h3><a href="/TPJ6/post/list.jsp">채용정보</a></h3></td>
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