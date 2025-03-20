<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp" %>
<%
String pageno  = request.getParameter("page");
String type    = request.getParameter("type");
String keyword = request.getParameter("keyword");
String bkind   = request.getParameter("bkind");
if(pageno  == null) pageno  = "1";
if(type    == null) type    = "T";
if(keyword == null) keyword = "";
if(bkind   == null) bkind   = "F";

int curpage = 1;
try
{
	curpage = Integer.parseInt(pageno);
}catch(Exception e) {}


String title = "";
switch(bkind)
{
	case "N" : title = "공지사항"; break;
	case "R" : title = "취업뉴스"; break;	
	case "F" : title = "일반게시글"; break;			
}

BoardDTO bdto = new BoardDTO();

//전체 게시물의 갯수를 얻는다.
int total = bdto.GetTotal(bkind,type, keyword);

//최대 페이지 번호를 계산한다.
int maxpage = total / 10;
if( total % 10 != 0) maxpage++;

//게시물 목록을 조회한다. 
ArrayList<BoardVO> list = bdto.GetList(curpage, bkind, type, keyword);

%>
<!--------------------------------------------  컨텐츠 시작 영역 -->
<br>
<table class="tbl">
	<tr>
		<td style="height:40px">
			<span style="font-weight:bold;font-size: 30px;">자유게시판</span>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<form id="search" name="search" method="get" action="list.jsp">
			<select id="type" name="type">
				<option value="T">제목</option>
				<option value="N">내용</option>
				<option value="">제목+내용</option>
			</select>
			<input type="text" id="keyword" name="keyword" value="">
			<input type="submit" value="검색">
			</form>		
		</td>
	</tr>																		
	<tr>
		<td style="height:25px; text-align:right;">
		<%
		if(login != null )
		{
			%>
			<a href="/TPJ6/community/board/write.jsp">게시글 작성</a>
			<% 
		}else
		{
			%>
			<a href="javascript:alert('글쓰기 권한이 없습니다.');">게시글 작성</a>
			<%
		}				
		%>
		</td>
	</tr>
</table>						
<table border="1" class="tbl">
	<tr>
		<td style="text-align:center; background-color:lightgray; width: 60px;">번호</td>
		<td style="text-align:center; background-color:lightgray;">제목</td>
		<td style="text-align:center; background-color:lightgray;width: 150px;">작성일</td>
		<td style="text-align:center; background-color:lightgray;width: 100px;">작성자</td>
		<td style="text-align:center; background-color:lightgray;width: 70px;">조회수</td>						
	</tr>
	<% 
	int seqNo = total - ((curpage-1) * 10);
	for(BoardVO vo : list)
	{
		%>
	<tr>
		<td style="text-align:center;"><%= vo.getBkind().equals("N") ? "<b>공지</b>" : seqNo-- %></td>
		<td>&nbsp;<a href="view.jsp?type=<%= type %>&keyword=<%= keyword %>&bkind=<%= bkind %>&page=<%= curpage %>&no=<%= vo.getBno() %>"><%= vo.getBtitle() %></a><span style="color:#ff6600"></span>
		<% 
		if(!vo.getRno().equals("0"))
		{
			%>
		<span style="color:#ff6600">(<%= vo.getRno() %>)</span></td>
		<% 
		}
		%>
		<td style="text-align:center;"><%= vo.getBwdate() %></td>
		<td style="text-align:center;"><%= vo.getUname() %></td>
		<td style="text-align:center;"><%= vo.getBhit() %></td>
	</tr>
	<% 
	}						
	%>
</table>
<br>
<table class="tbl">	
	<tr>
		<td style="text-align: center;">
		<%
		int startBlock = ( (curpage - 1) / 10) * 10 + 1;
		int endBlock = startBlock + 10 - 1;
		
		if(endBlock > maxpage)
		{
			endBlock = maxpage;
		}
		
		if(startBlock != 1)
		{
			%><a href="list.jsp?type=<%=type %>&keyword=<%= keyword %>&kind=<%= bkind %>&page=<%= startBlock - 1 %>">◀</a>&nbsp;<%
		}
		
		for(int pno = startBlock; pno <= endBlock; pno++)
		{
			if( curpage == pno)
			{
				%><a href="list.jsp?type=<%=type %>&keyword=<%= keyword %>&kind=<%= bkind %>&page=<%= pno %>"><b style="color:red;"><%= pno %></b></a>&nbsp;<%
			}else
			{
				%><a href="list.jsp?type=<%=type %>&keyword=<%= keyword %>&kind=<%= bkind %>&page=<%= pno %>"><%= pno %></a>&nbsp;<%
			}			
		}
		if(endBlock < maxpage)
		{
			%><a href="list.jsp?type=<%=type %>&keyword=<%= keyword %>&kind=<%= bkind %>&page=<%= endBlock + 1 %>">▶</a>&nbsp;<%
		}		
		%>
		</td>
	</tr>												
</table>
<br>
<!--------------------------------------------  컨텐츠 종료 영역 -->
<%@ include file="/include/tail.jsp" %>