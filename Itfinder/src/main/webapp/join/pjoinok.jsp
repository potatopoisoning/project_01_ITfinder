<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="itfinder.vo.*" %>
<%@ page import="itfinder.dto.*" %>  
<%@ include file="/include/head.jsp" %>
<%
request.setCharacterEncoding("UTF-8");

String uid     = request.getParameter("uid");
String upw     = request.getParameter("upw");
String uname   = request.getParameter("uname");
String ubirth = request.getParameter("ubirth");
String uphone  = request.getParameter("uphone");
String uemail  = request.getParameter("uemail");
String agreeterm  = request.getParameter("agreeterm");
String agreeinfo  = request.getParameter("agreeinfo");
String agreemarket  = request.getParameter("agreemarket");

if( uid == null || upw == null)
{
	//회원가입 정보가 올바르게 전송되지 않음.
	response.sendRedirect("pjoin.jsp");
	return;
}

UserVO vo = new UserVO();

vo.setUid(uid);
vo.setUpw(upw);
vo.setUname(uname);
vo.setUbirth(ubirth);
vo.setUphone(uphone);
vo.setUemail(uemail);
vo.setAgreeterm(agreeterm);
vo.setAgreeinfo(agreeinfo);
vo.setAgreemarket(agreemarket);
vo.setUkind("P");

UserDTO dto = new UserDTO();
dto.Join(vo);

response.sendRedirect("/TPJ6/index/index.jsp");	
%>
