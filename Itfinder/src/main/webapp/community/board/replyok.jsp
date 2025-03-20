<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/common.jsp" %>
<%
String bno = request.getParameter("no");
String rnote = request.getParameter("rnote");
if(bno == null)
{
	out.println("게시물 번호 오류입니다.");
	return;
}
ReplyVO rvo = new ReplyVO();
rvo.setBno(bno);
rvo.setUno(login.getUno());
rvo.setRnote(rnote);

ReplyDTO rdto = new ReplyDTO();
rdto.Insert(rvo);

out.println("댓글 등록이 완료되었습니다.");

%>
