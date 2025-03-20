<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="itfinder.vo.*" %>
<%@ page import="itfinder.dto.*" %> 
<%
String uid = request.getParameter("uid");
String upw = request.getParameter("upw");

if( uid == null || upw == null)
{
	//로그인 정보가 올바르게 전송되지 않음.
	out.println("ERROR");
	return;
}
UserDTO dto = new UserDTO();
UserVO vo = dto.Login(uid,upw);
if(vo == null)
{
	out.println("ERROR");
}else
{
	session.setAttribute("login", vo);
	out.println("OK");  //로그인 됨
}
%>
