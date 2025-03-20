<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp" %>
<%

String jno = request.getParameter("jno");
String reno = request.getParameter("reno");

JobDTO jdto = new JobDTO();
boolean apply = jdto.InsertApplicant(reno, jno);

if(apply) 
{
    // 성공 시 이동할 페이지나 로직
    out.println("<script>alert('입사지원에 성공하였습니다.'); location.href='/TPJ6/index/index.jsp';</script>");
} else 
{
    // 실패 시 이동할 페이지나 로직
    out.println("<script>alert('이력서를 제출할 채용공고를 선택해주세요.'); location.href='/TPJ6/post/list.jsp';</script>");
}


%>
