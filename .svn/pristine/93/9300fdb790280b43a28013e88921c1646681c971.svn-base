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
if(bkind   == null) bkind   = "F";
if(bno == null || bno.equals(""))
{
	response.sendRedirect("list.jsp");
	return;	
}

//게시물 정보를 조회한다.
BoardDTO bdto = new BoardDTO();
BoardVO  vo   = bdto.Read(bno, true);

%>
<script>

window.onload = function()
{
	$("#rnote").keyup(function(event){
		if(event.keyCode == 13)
		{
			AddReply();
		}		 
	 });
}	

function DoDelete()
{
	if(confirm("게시물을 삭제하시겠습니까?") == 0)
	{
		return;	
	}
	document.location = "delete.jsp?type=<%= type %>&keyword=<%= keyword %>&bkind=<%= bkind %>&page=<%= pageno %>&no=<%= bno %>";
}

function AddReply()
{
	if($("#rnote").val() == "")
	{
		alert("댓글 내용을 입력하세요.");
		$("#rnote").focus();
		return;
	}	
	if(confirm("댓글을 등록하시겠습니까?") == 0)
	{
		return;	
	}
	$.ajax({
 		type : "post",
 		url : "replyok.jsp",
 		data :
 		{
 			no : "<%= bno %>",
 			rnote : $("#rnote").val()
 		},
 		dataType : "html",
 		success : function(result)
 		{
 			result = result.trim();
 			alert(result);
 			window.location.reload();
 		}
	});		 	
}

function DeleteReply(rno)
{
	if(confirm("댓글을 삭제하시겠습니까?") == 0)
	{
		return;	
	}
	$.ajax({
 		type : "post",
 		url : "replydelete.jsp",
 		data :
 		{
 			rno : rno
 		},
 		dataType : "html",
 		success : function(result)
 		{
 			result = result.trim();
 			alert(result);
 			window.location.reload();
 		}
	});		 	
}
</script>
<!--------------------------------------------  컨텐츠 시작 영역 -->
<style>
.rad  
{
/* 	  border-radius: 10px;
	  border-style: hidden;
 */	  box-shadow: 0 0 0 1px 	#A9A9A9;
} 

.brd
{
	 border-top: 1px solid 	#A9A9A9;
	 border-bottom: 1px solid 	#A9A9A9;
}

</style>
<br>
<table class="tbl" >
	<tr>
		<td style="height:40px">
			<span style="font-weight:bold;font-size: 30px;">자유게시판</span>
		</td>
	</tr>										
</table>
<table class="tbl rad">
	<tr>
		<td  colspan="3" style="width:85%; height:7px;text-align:left; padding:10px;">
			<h3><%= vo.getBtitle() %></h3>
		</td>							
		<td style="text-align:right; color:#ff6600">
			<%
			if(login != null && login.getUno().equals(vo.getUno()))
			{
				%>
				&nbsp;&nbsp;
				<a href="modify.jsp?type=<%= type %>&keyword=<%= keyword %>&bkind=<%= bkind %>&page=<%= pageno %>&no=<%= bno %>">글수정</a>
				&nbsp;&nbsp;
				<a href="javascript:DoDelete()">글삭제</a>
				<%
			}
			%>
		&nbsp;</td>							
	</tr>	
	<tr>
		<td  colspan="4" style="text-align:left; color:#777">&nbsp;&nbsp;<%= vo.getUname() %> | <%= vo.getBwdate() %> | 조회수: <%= vo.getBhit() %></td>
	</tr>	
	<tr>
		<td colspan="4" style="padding:10px;">
			<%		
			String bnote = vo.getBnote();
			bnote = bnote.replace("<","&lt;");
			bnote = bnote.replace(">","&gt;");
			bnote = bnote.replace("\n","\n<br>");
			%>
			<%= bnote %>
		</td>													
	</tr>
	<tr>
		<%
		if(vo.getFname() != null && !vo.getFname().equals(""))
		{
			%>
			<td style="width:8%;">&nbsp;&nbsp;첨부파일</td>
			<td colspan="3">&nbsp;&nbsp;
				<a style="text-decoration : underline;" href="down.jsp?no=<%= bno %>"><%= vo.getFname() %></a>
			<%
		}else
		{
			%>
			
			<%
		}
		%>		
	</tr>		
</table>
<table class="tbl">
	<tr>
		<td style="text-align:center;">
			<a href="list.jsp?type=<%= type %>&keyword=<%= keyword %>&bkind=<%= bkind %>&page=<%= pageno %>">글목록</a>
		</td>
	</tr>
</table>
	<form name="view" method="post" action="replyok.jsp" >
		<%
		if(login != null)
		{
			%>
		<table class="tbl rad">
			<tr>
				<%-- <td width="110px"><%= login.getUname() %></td> --%>
				<td align="center">&nbsp;<textarea id="rnote" name="rnote" style="width:95%; height:75px;"></textarea></td>
				<td style="width:50px; align:center; vertical-align: top;">
				<input type="button" onclick="AddReply()" value="등록"></td>
			</tr>
		</table>
			<%
		}
		%>
		<br>
		<%
		ReplyDTO rdto = new ReplyDTO();
		ArrayList<ReplyVO> rlist = rdto.GetList(bno);
		for(ReplyVO rvo : rlist)
		{
			%>			
			<table class="tbl brd">
				<tr>
					<td align="left" style="padding:10px;"><%= rvo.getRnote() %></td>
					<%
					if(login != null && login.getUno().equals(rvo.getUno()))
					{
						//로그인 회원의 번호와 댓글 작성자가 일치하면..
						%><td align="right"><a href="javascript:DeleteReply('<%= rvo.getRno() %>');" style="color:red;">삭제</a></td><%
					}else
					{
						%><td width="150px"></td><% 
					}
					%>			
				</tr>
				<tr>
					<td colspan="2" align="right">&nbsp;<%= rvo.getUname() %>&nbsp;<%= rvo.getRwdate() %>&nbsp;</td>
				</tr>
			</table>
			<%
		}
		%>
	</form>	
<br>
<!--------------------------------------------  컨텐츠 종료 영역 -->
<%@ include file="/include/tail.jsp" %>