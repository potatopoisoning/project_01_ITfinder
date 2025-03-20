<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/include/common.jsp" %>
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
if(login == null || bno == null || bno.equals(""))
{
	response.sendRedirect("list.jsp");
	return;	
}

//본인 게시글이 맞는지 확인한다.
BoardDTO bdto = new BoardDTO();
BoardVO  vo   = bdto.Read(bno, false);
if(!login.getUno().equals(vo.getUno()))
{
	response.sendRedirect("list.jsp");
	return;	
}

//게시글을 삭제한다.
bdto.Delete(bno);

if(login != null && login.getUkind().equals("A")&vo.getBkind().equals("R"))
{
	response.sendRedirect("/TPJ6/community/news/list.jsp?type=" + type + "&keyword=" + keyword + "&bkind=" + bkind);
}else
{
	response.sendRedirect("list.jsp?type=" + type + "&keyword=" + keyword + "&bkind=" + bkind);
}


//response.sendRedirect("list.jsp?type=" + type + "&keyword=" + keyword + "&bkind=" + bkind);


%>
