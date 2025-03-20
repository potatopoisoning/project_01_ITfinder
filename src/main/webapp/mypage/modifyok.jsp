<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp" %>
<%
request.setCharacterEncoding("UTF-8");

String jno			 = request.getParameter("jno");
String reno			 = request.getParameter("reno");
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

rvo.setReno(reno);
rvo.setReeducation(reeducation);
rvo.setRescore(rescore);
rvo.setReschoolname(reschoolname);
rvo.setRemajor(remajor);
rvo.setRegraduation(regraduation);
rvo.setRecompanyname(recompanyname);
rvo.setRetenure(retenure);
rvo.setReposition(reposition);
rvo.setRestatus(restatus);
rvo.setReperformance(reperformance);
rvo.setReself(reself);
rvo.setRetitle(retitle);

ResumeDTO rdto = new ResumeDTO();
rdto.ReUpdate(rvo);

response.sendRedirect("/TPJ6/mypage/view.jsp?reno=" + reno + "&jno=" + jno);
%>
<%@ include file="/include/tail.jsp" %>