<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp" %>
<%
if(login == null)
{
	response.sendRedirect("/TPJ6/index/index.jsp");
	return;
}

request.setCharacterEncoding("UTF-8");

String rvuno = request.getParameter("rvuno");
String rvcompanyname = request.getParameter("rvcompanyname");
String rvtotal = request.getParameter("rvtotal");
String rvbalance = request.getParameter("rvbalance");
String rvpay = request.getParameter("rvpay");
String rvculture = request.getParameter("rvculture");
String rvcomment = request.getParameter("rvcomment");
String rvgood = request.getParameter("rvgood");
String rvbad = request.getParameter("rvbad");

//기업리뷰를 저장한다
String[]ary = rvcompanyname.split(":");
rvuno = ary[0];
rvcompanyname = ary[1];

ReviewVO rvvo = new ReviewVO();
rvvo.setUno(login.getUno());
rvvo.setRvuno(rvuno);
rvvo.setRvcompanyname(rvcompanyname);
rvvo.setRvtotal(rvtotal);
rvvo.setRvbalance(rvbalance);
rvvo.setRvpay(rvpay);
rvvo.setRvculture(rvculture);
rvvo.setRvcomment(rvcomment);
rvvo.setRvgood(rvgood);
rvvo.setRvbad(rvbad);

ReviewDTO rvdto = new ReviewDTO();
rvdto.Insert(rvvo);


response.sendRedirect("list.jsp");
%>

<%@ include file="/include/tail.jsp" %>