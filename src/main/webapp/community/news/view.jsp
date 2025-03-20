<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp" %>
<%
String pageno  = request.getParameter("page");
String type    = request.getParameter("type");
String keyword = request.getParameter("keyword");
String bkind   = request.getParameter("bkind");
String bno     = request.getParameter("no");
if(pageno  == null) pageno  = "1";
if(type    == null) type    = "T";
if(keyword == null) keyword = "";
if(bkind   == null) bkind   = "R";
if(bno == null || bno.equals(""))
{
	response.sendRedirect("list.jsp");
	return;	
}

//게시물 정보를 조회한다.
BoardDTO bdto = new BoardDTO();
BoardVO  vo   = bdto.Read(bno, true);

BoardVO prevNews = bdto.GetPreviousNews(bno, bkind);
BoardVO nextNews = bdto.GetNextNews(bno, bkind);

%>
<script>

function DoDelete()
{
	if(confirm("게시물을 삭제하시겠습니까?") == 0)
	{
		return;	
	}
	document.location = "/TPJ6/community/board/delete.jsp?type=<%= type %>&keyword=<%= keyword %>&bkind=<%= bkind %>&page=<%= pageno %>&no=<%= bno %>";
}

</script>
<!--------------------------------------------  컨텐츠 시작 영역 -->
<br>
<table class="tbl">
	<tr>
		<td style="height:40px">
			<span style="font-weight:bold;font-size: 30px;">취업뉴스</span>
		</td>
	</tr>																		
</table >
<table border="1" class="tbl">
	<tr>
		<td style="padding: 20px;">
			<h2>"<%= vo.getBtitle() %>"</h2><br>
			<div style="text-align:center;">								
				<%
				if(vo.getFname() != null && !vo.getFname().equals(""))
				{
					%><img src="/TPJ6/community/board/down.jsp?no=<%= bno %>" style="width:300px;height:300px;"><%
				}else
				{
					%>이미지 없음<%
				}
				%>									
			</div>
			<pre style="font-family:Malgun Gothic;">
			<%		
			String bnote = vo.getBnote();
			bnote = bnote.replace("<","&lt;");
			bnote = bnote.replace(">","&gt;");
			bnote = bnote.replace("\n","\n<br>");
			%>
			<br><%= bnote %>
			</pre><br>
			<a href="<%= vo.getBsource() %>" style="text-decoration:underline;">뉴스원문</a>							
		</td>
	</tr>
	<tr>
		<td>
		 <%
		 if(prevNews != null) 
		 { 
		 	%>
	        &nbsp;&nbsp;&nbsp;<a href='view.jsp?type=<%= type %>&keyword=<%= keyword %>&bkind=<%= bkind %>&page=<%= pageno %>&no=<%= prevNews.getBno() %>'>이전글</a>
	     	<% 
	     } else 
	     { 
	     	%>
	        &nbsp;&nbsp;&nbsp;이전글 없음
	   		 <% 
	     } 
	     %>
		</td>
	</tr>
	<tr>
		<td>
	 <% 
	 if(nextNews != null) 
	 { 
	 	%>
 							&nbsp;&nbsp;&nbsp;<a href='view.jsp?type=<%= type %>&keyword=<%= keyword %>&bkind=<%= bkind %>&page=<%= pageno %>&no=<%= nextNews.getBno() %>'>다음글</a>
					 <% 
				 } else 
				 { 
					%>
							&nbsp;&nbsp;&nbsp;다음글 없음
						<% 
					 } 
					%>
		</td>
	</tr>		
</table>
<table class="tbl">
	<tr>
		 <td style="text-align:center;">
            <button type="button" style="width:80px;height:30px;" onclick="window.location.href='/TPJ6/community/news/list.jsp';">목록</button>
       <%
			if(login != null && login.getUkind().equals("A"))
			{
				%>
			      		<a href="/TPJ6/community/board/modify.jsp?type=<%= type %>&keyword=<%= keyword %>&bkind=<%= bkind %>&page=<%= pageno %>&no=<%= bno %>"><button type="button" style="width:80px;height:30px;">글수정</button></a>
			           <button type="button" onclick="DoDelete()" style="width:80px;height:30px;">글삭제</button>
		     	<%
			}
		%>
        </td>					        					
	</tr>								
</table>						
<br>
<!--------------------------------------------  컨텐츠 종료 영역 -->
<%@ include file="/include/tail.jsp" %>