<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="itfinder.dto.*" %>
<%
String uname = request.getParameter("uname");
if(uname == null || uname.equals(""))
{
	out.println("00");
	return;	
}
UserDTO dto = new UserDTO();
if( dto.ComCheckID(uname) == true)
{
	//중복된 ID
	out.println("01");
}else
{
	//등록 가능한 ID
	out.println("02");
}

%>    