<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp" %>
<%
//로그인이 안되어있거나 개인회원이면 못들어옴
if(login == null || login.getUkind().equals("P"))
{
	out.println("<script>alert('작성 권한이 없습니다.'); location.href='/TPJ6/index/index.jsp';</script>");
	return;
}

String pageno  = request.getParameter("page");
String type    = request.getParameter("type");
String region    = request.getParameter("region");
String keyword = request.getParameter("keyword");
if(pageno  == null) pageno  = "1";
if(type    == null) type    = "t0";
if(region    == null) region    = "R0";
if(keyword == null) keyword = "";
int curpage = 1;
try
{
	curpage = Integer.parseInt(pageno);
}catch(Exception e){}

String title = "";

JobDTO jdto = new JobDTO();

//전체 게시물 갯수를 조회한다.
int total = jdto.GetTotal2(login.getUno());

//최대 페이지 번호를 계산한다.
int maxpage = total / 10;
if( total % 10 != 0) maxpage++;

//게시물 목록을 조회한다.
ArrayList<JobVO> list2 = jdto.GetList2(curpage, login.getUno());
%>
<!--------------------------------------------  컨텐츠 시작 영역 -->
<br>
<table class="tbl">
					<tr>
						<td style="height:40px">
							<span style="font-weight:bold;font-size: 30px;">채용공고 관리</span>
						</td>
					</tr>
	     <% 
     if( total == 0)
     {
    	%>
    	<table class="tbl">
    		<tr>
	    		 <td style="text-align:center;">
	    		 	<h2>등록된 채용정보가 없습니다.</h2><br>
	    		 	<h4><a href="/TPJ6/company/write.jsp">&nbsp;<span style="text-decoration : underline;">채용공고 등록하기</span></h4></a>
	    		 </td>
    		</tr>
    	</table>
    	 <% 
     }else
     {
    	 %>																						
	<table border="1" class="tbl">
		<tr style="background-color : lightgray; text-align : center;" >
			<td style="width:5%;">No.</td>
			<td>공고 제목</td>
			<td style="width : 150px">관리</td>
			<td style="width : 150px">등록일</td>
		</tr>
		<%
		int seqNo = ((curpage-1) * 10) + 1;
		for(JobVO vo : list2)
		{
			%>
			<tr>
				<td style="text-align:center;"><%= seqNo++ %></td>
				<td style="text-align:center;"><%= vo.getJtitle() %></td>
				<td style="text-align:center;">
					<button type="button" onclick="window.location.href='/TPJ6/company/view.jsp?no=<%= vo.getJno() %>'">보기</button>
				</td>
				<td style="text-align:center;"><%= vo.getJwdate() %></td>
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
				%><a href="list.jsp?type=<%= type %>&keyword=<%= keyword %>&page=<%= startBlock - 1 %>">◀</a>&nbsp;<%
			}	
			
			for(int pno = startBlock ; pno <= endBlock; pno++)
			{
				if( curpage == pno)
				{
					%><a href="list.jsp?type=<%= type %>&keyword=<%= keyword %>&page=<%= pno %>"><b style="color:red;"><%= pno %></b></a>&nbsp;<%
				}else
				{
					%><a href="list.jsp?type=<%= type %>&keyword=<%= keyword %>&page=<%= pno %>"><%= pno %></a>&nbsp;<%
				}
			}
			
			if(endBlock < maxpage)
			{
				%><a href="list.jsp?type=<%= type %>&keyword=<%= keyword %>&page=<%= endBlock + 1 %>">▶</a>&nbsp;<%
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
<!--------------------------------------------  컨텐츠 종료 영역 -->
<%@ include file="/include/tail.jsp" %>