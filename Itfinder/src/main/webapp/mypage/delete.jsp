<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp" %>
<%
String reno = request.getParameter("reno");
String jno = request.getParameter("jno");
ResumeDTO rdto = new ResumeDTO();
rdto.ReDelete(reno);

response.sendRedirect("/TPJ6/mypage/list.jsp?jno=" + jno);
%>