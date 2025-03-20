<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp" %>
<script src="/TPJ6/js/jquery-3.7.1.js"></script>
<%
String pageno  = request.getParameter("page");
String reno = request.getParameter("reno");
String jno = request.getParameter("jno");
//로그인이 안되어있거나 기업회원이면 못들어옴
if(login == null || login.getUkind().equals("C"))
{
	out.println("<script>alert('권한이 없습니다.'); location.href='/TPJ6/index/index.jsp';</script>");
	return;
}
if(pageno  == null) pageno  = "1";
int curpage = 1;
try
{
	curpage = Integer.parseInt(pageno);
}catch(Exception e){}

UserDTO udto = new UserDTO();
UserVO uvo   = udto.Read(login.getUno());

ResumeDTO rdto = new ResumeDTO();

int total = rdto.GetTotal(login.getUno());
//최대 페이지 번호를 계산한다.
int maxpage = total / 10;
if( total % 10 != 0) maxpage++;

ArrayList<ResumeVO> list = rdto.GetList(curpage,login.getUno());

%>
<!---------------------------------------------  컨텐츠 시작 영역 -->
<br>
<table class="tbl">
	<tr>
		<td style="height:40px">
			<span style="font-weight:bold;font-size: 30px;">이력서 관리</span>
		</td>
	</tr>
	<%-- <p class="tbl"><%= total %>건</p> --%>
																			
	<%
	if(total == 0)
	{
		%>
		<table class="tbl">
   			<tr>
				<td style="text-align:center;">
					<h2>이력서 정보가 없습니다.</h2><br>
					<h4><a href="/TPJ6/mypage/write.jsp">&nbsp;<span style="text-decoration : underline;">이력서 등록하기</span></h4></a>
			</tr>
		</table>
		<%
	}
	else
	{ 
		 %>  
		<table border="1" class="tbl">
			<tr  style="height:30px; background-color:lightgray;text-align : center;">
				<td style="width:5%;">No.</td>
				<td style="width:400px;">이력서제목</td>
				<td style="width:200px;">관리</td>
				<td style="width:200px;">최종수정일</td>
			</tr>
		<%
		int seqNo = ((curpage-1) * 10) + 1;
		for(ResumeVO rvo : list)
		{
			%>
			<tr height="30px">
				<td style="text-align:center;"><%= seqNo++ %></td>
				<td style="text-align:center;"><%= rvo.getRetitle() %></td>
				<td style="text-align:center;">
					<button type="button" onclick="window.location.href='/TPJ6/mypage/view.jsp?reno=<%= rvo.getReno() %>&jno=<%= jno %>'">보기</button>
					<button type="button" onclick="window.location.href='/TPJ6/mypage/copy.jsp?reno=<%= rvo.getReno() %>&jno=<%= jno %>'">복사</button>
					<button type="button" onclick="window.location.href='/TPJ6/mypage/modify.jsp?reno=<%= rvo.getReno() %>&jno=<%= jno %>'">수정</button>
					<button type="button" onclick="window.location.href='/TPJ6/mypage/delete.jsp?reno=<%= rvo.getReno() %>&jno=<%= jno %>'">삭제</button>
				</td>
				<td style="text-align:center;"><%= rvo.getRewdate() %></td>
			</tr>
			<%
		}
		%>
	</table>
	<table class="tbl">
		<tr>
			<td style="text-align:center;">
			<%
			int startBlock = ( (curpage - 1)  / 10) * 10 + 1;
			int endBlock   = startBlock + 10 - 1; 
			
			if( endBlock > maxpage)
			{
				endBlock = maxpage;
			}	
			
			if(startBlock != 1)
			{
				%><a href="list.jsp?page=<%= startBlock - 1 %>">◀</a>&nbsp;<%
			}	
			
			for(int pno = startBlock ; pno <= endBlock; pno++)
			{
				if( curpage == pno)
				{
					%><a href="list.jsp?page=<%= pno %>"><b style="color:red;"><%= pno %></b></a>&nbsp;<%
				}else
				{
					%><a href="list.jsp?page=<%= pno %>"><%= pno %></a>&nbsp;<%
				}
			}
			
			if(endBlock < maxpage)
			{
				%><a href="list.jsp?tpage=<%= endBlock + 1 %>">▶</a>&nbsp;<%
			}		
			%>
			</td>
		</tr>
	</table>
 	<%
 }
%> 	 																																					
</table>
<br>
<!---------------------------------------------  컨텐츠 종료 영역 -->
<%@ include file="/include/tail.jsp" %>