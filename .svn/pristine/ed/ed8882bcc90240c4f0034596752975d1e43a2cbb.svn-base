<%@page import="itfinder.dto.ResumeDTO"%>
<%@page import="itfinder.vo.ResumeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String reno = request.getParameter("reno");
String jno = request.getParameter("jno");
/* ResumeVO rvo = new ResumeVO(); */
ResumeDTO rdto = new ResumeDTO();
rdto.Copy(reno);

/* response.sendRedirect("/TPJ6/mypage/list.jsp"); */
response.sendRedirect("/TPJ6/mypage/list.jsp?jno=" + jno);
%>