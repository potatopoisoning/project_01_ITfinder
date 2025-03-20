<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/post_list.jsp" %>
<%
String pageno  = request.getParameter("page");
String region    = request.getParameter("region");
String type    = request.getParameter("type");
String keyword = request.getParameter("keyword");
if(pageno  == null) pageno  = "1";
if(region    == null) region    = "R0";
if(type    == null) type    = "t0";
if(keyword == null) keyword = "";
int curpage = 1;
try
{
	curpage = Integer.parseInt(pageno);
}catch(Exception e){}


JobDTO jdto = new JobDTO();

//전체 게시물 갯수를 조회한다.
int total = jdto.GetTotal(type, region, keyword);

//최대 페이지 번호를 계산한다.
int maxpage = total / 10;
if( total % 10 != 0) maxpage++;

//게시물 목록을 조회한다.
ArrayList<JobVO> list1 = jdto.GetList1(curpage, type, region, keyword);
%>
<!--------------------------------------------  컨텐츠 시작 영역 -->
    <br>
    <table border="0" style="width:80%;" class="htbl">
	<tr>
		<td style="height:40px">
			<span style="font-weight:bold;font-size: 30px;">채용정보</span>
		</td>
	</tr>																		
</table >
     <nav class="do">
      	<form id="search" name="search" method="get" action="list.jsp">
       	<select id="region" name="region">
       		<option value="R0" <%= region.equals("R0") ? "selected" : "" %>>지역별</option>
       		<option value="R1" <%= region.equals("R1") ? "selected" : "" %>>서울</option>
       		<option value="R2" <%= region.equals("R2") ? "selected" : "" %>>경기도</option>
       		<option value="R3" <%= region.equals("R3") ? "selected" : "" %>>강원도</option>
       		<option value="R4" <%= region.equals("R4") ? "selected" : "" %>>충청남도</option>
       		<option value="R5" <%= region.equals("R5") ? "selected" : "" %>>충청북도</option>
       		<option value="R6" <%= region.equals("R6") ? "selected" : "" %>>전라남도</option>
       		<option value="R7" <%= region.equals("R7") ? "selected" : "" %>>전라북도</option>
       		<option value="R8" <%= region.equals("R8") ? "selected" : "" %>>경상남도</option>
       		<option value="R9" <%= region.equals("R9") ? "selected" : "" %>>경상북도</option>
       		<option value="R10" <%= region.equals("R10") ? "selected" : "" %>>제주도</option>
       	</select>
       	<select id="type" name="type">
       		<option value="t0" <%= type.equals("t0") ? "selected" : "" %>>직업별</option>
       		<option value="t1" <%= type.equals("t1") ? "selected" : "" %>>소프트웨어 엔지니어</option>
       		<option value="t2" <%= type.equals("t2") ? "selected" : "" %>>프론트엔드 개발자</option>
       		<option value="t3" <%= type.equals("t3") ? "selected" : "" %>>파이썬 개발자</option>
       		<option value="t4" <%= type.equals("t4") ? "selected" : "" %>>머신러닝 엔지니어</option>
       		<option value="t5" <%= type.equals("t5") ? "selected" : "" %>>웹개발자</option>
       		<option value="t6" <%= type.equals("t6") ? "selected" : "" %>>자바 개발자</option>
       		<option value="t7" <%= type.equals("t7") ? "selected" : "" %>>서버 개발자</option>
       		<option value="t8" <%= type.equals("t8") ? "selected" : "" %>>c,c++ 개발자</option>
       		<option value="t9" <%= type.equals("t9") ? "selected" : "" %>>앱 개발자</option>
       	</select>
	       	<input type="text" id="keyword" name="keyword" value="<%= keyword %>">
			<input type="submit" value="검색">
      	</form>
      </nav>
     <br>
     <p>검색건수 <%= total %>건</p>
     <br>
     <% 
     if( total == 0)
     {
    	%>
    	<table class="stbl">
    		<tr>
	    		 <td>
	    		 	<h2>선택한 조건의 채용정보가 없습니다.</h2><br>
					<h4>선택하신 조건을 다시 확인해주세요.</h4>
	    		 </td>
    		</tr>
    	</table>
    	 <% 
     }else
     {
    	 %>
      <table class="tbl">
   	 	<tr>
   	 		<th>회사명</th>
   	 		<th>채용공고명/지원자격/근무지역</th>
   	 		<th>급여</th>
   	 		<th>모집기간</th>
   	 	</tr>
   	 	<%
				int seqNo = total - ((curpage-1) * 10);
				for(JobVO vo : list1)
				{
					%>
					<tr>
			   	 		<td><%= vo.getUname() %></td>
			   	 		<td>
			   	 			<a href="/TPJ6/post/view.jsp?no=<%= vo.getJno() %>">
			   	 			<%= vo.getJtitle() %><br>
			   	 			<%= vo.getJcareerName() %> | <%= vo.getJeducationName() %> | <%= vo.getJregionName() %>
			   	 			</a>
			   	 		</td>
			   	 		<td><%= vo.getJpay() %></td>
			   	 		<td>
			   	 			<%= vo.getJperiod1() %><br>
			   	 			~<%= vo.getJperiod2() %>
			   	 		</td>
					</tr>
					<%
				}
		%>
   	 	<tr>
   	 	</tr>
     </table>
     <br>
     <table class="stbl">
   		<tr>
		<td>
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
		for(int pno = startBlock; pno <= endBlock; pno++)
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
<br>
<!--------------------------------------------  컨텐츠 종료 영역 -->
<%@ include file="/include/tail.jsp" %>