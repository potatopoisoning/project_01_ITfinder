<%@page import="itfinder.vo.UserVO"%>
<%@page import="itfinder.vo.ResumeVO"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp" %>
<%

request.setCharacterEncoding("UTF-8");

String uno 			 = request.getParameter("uno");
String reeducation 	 = request.getParameter("reeducation");
String rescore 		 = request.getParameter("rescore");
String reschoolname  = request.getParameter("reschoolname");
String remajor 		 = request.getParameter("remajor");
String regraduation  = request.getParameter("regraduation");
String recompanyname = request.getParameter("recompanyname");
String retenure 	 = request.getParameter("retenure");
String reposition 	 = request.getParameter("reposition");
String restatus 	 = request.getParameter("restatus");
String reperformance = request.getParameter("reperformance");
String reself 		 = request.getParameter("reself");
String retitle 		 = request.getParameter("retitle");

ResumeVO rvo = new ResumeVO();
ResumeDTO rdto = new ResumeDTO();

rvo.setUno(login.getUno());
rvo.setReeducation(reeducation);
rvo.setRescore(rescore);
rvo.setReschoolname(reschoolname);
rvo.setRemajor(remajor);
rvo.setRegraduation(regraduation);
rvo.setRecompanyname(recompanyname != null ? recompanyname : "");
rvo.setRetenure(retenure != null ? retenure : "");
rvo.setReposition(reposition != null ? reposition : "");
rvo.setRestatus(restatus != null ? restatus : "");
rvo.setReperformance(reperformance != null ? reperformance : "");
rvo.setReself(reself);
rvo.setRetitle(retitle);

rdto.ReInsert(rvo);

response.sendRedirect("/TPJ6/mypage/list.jsp");
%>

<%@ include file="/include/tail.jsp" %>