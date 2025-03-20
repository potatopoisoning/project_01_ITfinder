<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/common.jsp" %>
<%

String rno = request.getParameter("rno");
if(rno == null)
{
	out.println("잘못된 댓글 번호입니다.");
	return;
}

ReplyDTO rdto = new ReplyDTO();
rdto.Delete(rno);
out.println("댓글이 삭제되었습니다.");

%>