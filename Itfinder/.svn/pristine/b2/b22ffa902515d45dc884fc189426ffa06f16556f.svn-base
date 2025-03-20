<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp" %>
<%
String pageno  = request.getParameter("page");
String type    = request.getParameter("type");
String keyword = request.getParameter("keyword");
String bkind   = request.getParameter("bkind");
if(pageno  == null) pageno  = "1";
if(type    == null) type    = "";
if(keyword == null) keyword = "";
if(bkind   == null) bkind   = "R";

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
int total = bdto.NewsGetTotal(bkind,type, keyword);

//최대 페이지 번호를 계산한다.
int maxpage = total / 4;
if( total % 4 != 0) maxpage++;

//게시물 목록을 조회한다. 
ArrayList<BoardVO> list = bdto.NewsGetList(curpage, bkind, type, keyword);

%>
<!--------------------------------------------  컨텐츠 시작 영역 -->
		<br>
		<table class="tbl">
			<tr>
				<td style="height:40px">
					<span style="font-weight:bold;font-size: 30px;">취업뉴스</span>
				</td>
			</tr>																		
			<%
            int seqNo = total - ((curpage-1) * 10);
            for(int i = 0; i < list.size(); i+=2)
            {
                BoardVO vo1 = list.get(i);
                BoardVO vo2 = (i + 1 < list.size()) ? list.get(i + 1) : null;
             %>
	   			<tr>
	               <td style="width: 50%; padding: 10px;">
	                   <a href="view.jsp?type=<%= type %>&keyword=<%= keyword %>&bkind=<%= bkind %>&page=<%= curpage %>&no=<%= vo1.getBno() %>" style="color:black;">
	                       <h2>"<%= vo1.getBtitle() %>"</h2>
	                       <p><%= vo1.getBnote().length() > 100 ? vo1.getBnote().substring(0, 100) + "..." : vo1.getBnote() %></p>
	                       <p><%= vo1.getBwdate() %>&nbsp;&nbsp;&nbsp;조회수 : <%= vo1.getBhit() %></p>
	                   </a>
	               </td>
	               <% if(vo2 != null)
	               { 
	               	%>
	               	<td style="width: 50%; padding: 10px;">
	                    <a href="view.jsp?type=<%= type %>&keyword=<%= keyword %>&bkind=<%= bkind %>&page=<%= curpage %>&no=<%= vo2.getBno() %>" style="color:black;">
	                        <h2>"<%= vo2.getBtitle() %>"</h2>
	                        <p><%= vo2.getBnote().length() > 100 ? vo2.getBnote().substring(0, 100) + "..." : vo2.getBnote() %></p>
	                        <p><%= vo2.getBwdate() %>&nbsp;&nbsp;&nbsp;조회수 : <%= vo2.getBhit() %></p>
	                    </a>
	               	</td>
	              		<% 
	              	} 
	                 	%>
			                </tr>
			                <% 
			                } 
			                %>
				</td>
			</tr>
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
					%><a href="list.jsp?type=<%=type %>&keyword=<%= keyword %>&kind=<%= bkind %>&page=<%= startBlock - 1 %>">◀</a>&nbsp;<%
				}
				
				//화면에 블럭 페이징을 표시한다.		
				for(int pno = startBlock; pno <= endBlock; pno++)
				{
					if( curpage == pno)
					{
						//현재 페이지 이면....
						%><a href="list.jsp?type=<%=type %>&keyword=<%= keyword %>&kind=<%= bkind %>&page=<%= pno %>"><b style="color:red;"><%= pno %></b></a>&nbsp;<%
					}else
					{
						%><a href="list.jsp?type=<%=type %>&keyword=<%= keyword %>&kind=<%= bkind %>&page=<%= pno %>"><%= pno %></a>&nbsp;<%
					}			
				}
				//다음 페이지 블럭을 표시한다.
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