<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp" %>
<%
String pageno  = request.getParameter("page");
String rvcompanyname = request.getParameter("rvcompanyname");

if(pageno  == null)     pageno  = "1";
if(rvcompanyname == null) rvcompanyname = "";

int curpage = 1;
try
{
	curpage = Integer.parseInt(pageno);
}catch(Exception e) {}


ReviewDTO rvdto = new ReviewDTO();

//전체 게시물의 갯수를 얻는다.
int total = rvdto.GetTotal(rvcompanyname);

//최대 페이지 번호를 계산한다.
int maxpage = total / 5;
if( total % 5 != 0) maxpage++;

//기업리뷰 목록을 조회한다. 
ArrayList<ReviewVO> list = rvdto.GetList(curpage, rvcompanyname);


%>
<!--------------------------------------------  컨텐츠 시작 영역 -->
	   <br>
		<table class="tbl">
			<tr>
				<td>
					<span style="font-weight:bold;font-size: 30px;">기업리뷰</span>
				</td>
			</tr>				
			<tr>
				<td colspan="2">
				<form id="search" name="search" method="get" action="list.jsp">
					회사명 <input type="text" id="rvcompanyname" name="rvcompanyname" align="left" value="<%= rvcompanyname %>">
					<input type="submit" value="검색">
				</form>		
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: right;padding-right:200px">
				<button type="button" style="width:100px;height:40px;" onclick="window.location.href='write.jsp';">리뷰 등록</button></td>
			</tr>
			<tr>
				<td colspan="2">총[<%= total %>]개의 기업 리뷰</td>
			</tr>
			<%
			for(ReviewVO vo : list)
			{	
				%>
				<tr>
				<td align="left" width="300px">
				<div style="width:200px; height:210px; border:1px solid;text-align:center;">
					<br>
					<img src="/TPJ6/community/review/down.jsp?uno=<%= vo.getRvuno() %>" style="height:50px; width:150px;"><br><br>
					<!-- <img src="/TPJ6/upload/toss5.jpg"style="height:50px; width:150px;"><br> -->
					총점 [<%= vo.getRvtotal() %>점]<br>
					업무와 삶의 균형 [<%= vo.getRvbalance() %>점]<br>
					급여 및 복지 [<%= vo.getRvpay() %>점]<br>
					사내문화 [<%= vo.getRvculture() %>점]												
				</div>	
				
				</td>
				<td>
					<div style="width:80%; height:35px;font-size:20px;font-weight:bold;">"[<%=vo.getRvcompanyname()%>]<%= vo.getRvcomment() %>"</div>
					기업의 장점
					<div style="width:80%; height:50px; border:1px solid;padding:5px;"><%= vo.getRvgood() %></div><br>
					기업의 단점
					<div style="width:80%; height:50px; border:1px solid;padding:5px;"><%= vo.getRvbad() %></div>
				</td>
			</tr>
			
			<% 
			}
			%>
			</table>
	     <br>
	     <table class="tbl">
			<tr>
				<td style="text-align:center;">
				<%
				//페이징 시작블럭번호와 끝블럭 번호를 계산한다
				int startBlock = ( (curpage - 1) / 10) * 10 + 1;
				int endBlock = startBlock + 10 - 1;
				
				//endBlock이 최대 페이지 번호보다 크면 안됨
				if(endBlock > maxpage)
				{
					//예: maxpage가 22인데, endBlock이 30이면 endBlock을 22로 변경
					endBlock = maxpage;
				}
				
				//이전 페이지의 블럭을 표시한다.
				if(startBlock != 1)
				{
					%><a href="list.jsp?rvcompanyname=<%= rvcompanyname %>&page=<%= startBlock - 1 %>">◀</a>&nbsp;<%
				}
				
				//화면에 블럭 페이징을 표시한다.		
				for(int pno = startBlock; pno <= endBlock; pno++)
				{
					if( curpage == pno)
					{
						//현재 페이지 이면....
						%><a href="list.jsp?rvcompanyname=<%= rvcompanyname %>&page=<%= pno %>"><b style="color:red;"><%= pno %></b></a>&nbsp;<%
					}else
					{
						%><a href="list.jsp?rvcompanyname=<%= rvcompanyname %>&page=<%= pno %>"><%= pno %></a>&nbsp;<%
					}			
				}
				//다음 페이지 블럭을 표시한다.
				if(endBlock < maxpage)
				{
					%><a href="list.jsp?rvcompanyname=<%= rvcompanyname %>&page=<%= endBlock + 1 %>">▶</a>&nbsp;<%
				}		
				%>
				</td>
			</tr>						
		</table>
		<br>
<!--------------------------------------------  컨텐츠 종료 영역 -->
<%@ include file="/include/tail.jsp" %>