<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp" %>
<%
String reno	   = request.getParameter("reno");
String pageno  = request.getParameter("page");
String type    = request.getParameter("type");
String region  = request.getParameter("region");
String keyword = request.getParameter("keyword");

if(pageno  == null) pageno  = "1";
if(type    == null) type    = "";
if(region  == null) region  = "";
if(keyword == null) keyword = "";
int curpage = 1;
try
{
	curpage = Integer.parseInt(pageno);
}catch(Exception e){}
//로그인이 안되어있거나 개인회원이면 못들어옴
if(login == null || login.getUkind().equals("P"))
{
	out.println("<script>alert('작성 권한이 없습니다.'); location.href='/TPJ6/index/index.jsp';</script>");
	return;
}
String title = "";

UserDTO udto = new UserDTO();
UserVO uvo = udto.Read(login.getUno());
ResumeDTO rdto = new ResumeDTO();
JobDTO jdto = new JobDTO();
ArrayList<ResumeVO> list = rdto.GetListWithJob(curpage, login.getUno());


int total = rdto.GetTotal(login.getUno());
int maxpage = total / 10;
if( total % 10 != 0) maxpage++;




%>
<!-- }} ----------------------------------------  컨텐츠 시작 영역 -->
<br>
<table class="tbl">
	<tr>
		<td style="height:40px">
			<span style="font-weight:bold;font-size: 30px;">지원자 관리</span>
		</td>
	</tr>
<%-- 	<p class="tbl"><%= total %>건</p> --%>
	 <%-- <% 
     if( total == 0)
     {
    	%>
    	<table class="tbl">
    		<tr>
	    		 <td style="text-align:center;">
	    		 	<h2>지원자가 없습니다.</h2><br>
	    		 </td>
    		</tr>
    	</table>
    	 <% 
     }else
     {
    	 %>	 --%>		
	<table border="1" class="tbl">
		<tr style="background-color : lightgray; text-align : center;" >
			<td>No.</td>
			<td>채용공고 제목</td>
			<td>이름</td>
			<td>경력</td>
			<td>최종학력</td>
			<td>전공명</td>
			<!-- 관리자 -->
			<td>열람</td>
		</tr>
		<%
		int seqNo = ((curpage-1) * 10) + 1;
		for(ResumeVO rvo : list)
		{
			 UserVO applicantInfo = udto.Read(rvo.getUno()); // 지원자 정보를 가져온다.
		        if(applicantInfo == null) 
		        {
		            continue; // applicantInfo가 null이면 루프의 다음 반복으로 넘어간다.
		        }
			%>
			<tr style="text-align : center;">
				<td><%= seqNo++ %></td>
				<td><%= rvo.getJtitle() %></td> 
   				<td><%= applicantInfo.getUname() %></td> 
				<td><%= rvo.getRetenure() %></td>
				<td><%= rvo.getReschoolname() %></td>
				<td><%= rvo.getRemajor() %></td>
				<!-- 관리자 -->
				<td>
					<button type="button" onclick="window.location.href='/TPJ6/company/alistok.jsp?reno=<%= rvo.getReno() %>'">이력서 보기</button>
				</td>
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
<%-- <%
 }
%> --%>
</table>
<br>
<!-- }} ----------------------------------------  컨텐츠 종료 영역 -->
<%@ include file="/include/tail.jsp" %>