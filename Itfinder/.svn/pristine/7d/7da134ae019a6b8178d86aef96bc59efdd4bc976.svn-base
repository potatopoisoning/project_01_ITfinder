<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String pageno  = request.getParameter("page");
String type    = request.getParameter("type");
String keyword = request.getParameter("keyword");
String bkind   = request.getParameter("bkind");
if(pageno  == null) pageno  = "1";
if(type    == null) type    = "T";
if(keyword == null) keyword = "";
if(bkind   == null) bkind   = "";

int curpage = 1;
try
{
	curpage = Integer.parseInt(pageno);
}catch(Exception e){}

String title = "";
switch(bkind)
{
	case "N" : title = "공지사항"; break;
	case "R" : title = "취업뉴스"; break;	
	case "F" : title = "일반게시글"; break;			
}
BoardDTO bdto = new BoardDTO();
int total1 = bdto.GetTotal(bkind,type, keyword);
ArrayList<BoardVO> list1 = bdto.NewsGetList1(curpage, bkind);
ArrayList<BoardVO> list3 = bdto.GetList1(curpage, bkind);


JobDTO jdto = new JobDTO();
int total2 = jdto.GetTotal(bkind, type, keyword);
ArrayList<JobVO> list2 = jdto.GetList3(curpage);
%>
<%@ include file="/include/common.jsp" %>   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="/TPJ6/css/style.css"/>
		<link rel="stylesheet" href="/TPJ6/css/index.css"/>
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
	   <!-- }} ----------------------------------------  컨텐츠 시작 영역 -->
		<div id="idx_board_wrap">
			<div>
				<div class="idx_board">
					<div class="title">
						<a href="/TPJ6/community/news/list.jsp" class="name">
							취업뉴스 <i class="fa-solid fa-house"></i>
						</a>
					</div>
					<div class="list">
						<ul>
						<%
							for(BoardVO vo : list1)
							{
							%>
								<li>
									<a href="/TPJ6/community/news/view.jsp?bkind=<%= bkind %>&page=<%= curpage %>&no=<%= vo.getBno() %>"><%= vo.getBtitle() %></a>
									<span class="spn"><%= vo.getBhit() %>회</span>
									<span class="spn"><%= vo.getBwdate() %></span>
								</li>
							<%
							}
						%>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		<div class="list_wrap">
				<div class="idx_board">
					<div class="title" >
						<a href="/TPJ6/post/list.jsp" class="name">
							채용공고 <i class="fa-solid fa-house"></i>
						</a>
					</div>
				</div>
				<ul>
				<%
				for(JobVO vo : list2)
				{
					%>
						<li class="item" onclick="location.href=('/TPJ6/post/view.jsp?no=<%= vo.getJno() %>')">
							<div class="rn">
								<div class="image" >
									<img src="/TPJ6/index/down.jsp?uno=<%= vo.getUno() %>"width="90%" height="60px" >
								</div><br>
								<div class="cont">
									<strong><%= vo.getUname() %></strong>
									<p><%= vo.getJtitle() %></p>
								</div>	
							</div>
						</li>
					<%
				}
				%>
				</ul>
			</div>
		
		<div id="idx_board_wrap">
			<div>
				<div class="idx_board">
					<div class="title">
						<a href="/TPJ6/community/board/list.jsp" class="name">
							자유게시판 <i class="fa-solid fa-house"></i>
						</a>
					</div>
					<div class="list">
						<ul>
						<%
							for(BoardVO vo : list3)
							{
							%>
								<li>
									<a href="/TPJ6/community/board/view.jsp?bkind=<%= bkind %>&page=<%= curpage %>&no=<%= vo.getBno() %>"><%= vo.getBtitle() %>
									<% 
									if(!vo.getRno().equals("0"))
									{
										%>
										<span style="color:#ff6600">(<%= vo.getRno() %>)</span></td>
										<% 
									}
									%></a>
									<span class="spn1"><%= vo.getUname() %></span>
									<span class="spn"><%= vo.getBwdate() %></span>
								</li>
							<%
							}
						%>
						</ul>
					</div>
				</div>
			</div>
		</div>
<!-- }} ----------------------------------------  컨텐츠 종료 영역 -->
<%@ include file="/include/tail.jsp" %>