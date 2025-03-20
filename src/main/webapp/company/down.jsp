<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/common.jsp" %>

<%
//게시물 번호
String uno = request.getParameter("no");

//게시물 정보를 조회한다.
UserDTO udto = new UserDTO();
UserVO  uvo   = udto.Read(uno);

//첨부파일을 브라우저로 전송한다.
response.setContentType("application/octet-stream");   
response.setHeader("Content-Disposition","attachment; filename=" + uvo.getPname() + "");   
String fullname = uploadPath + "\\" + uvo.getPname();
File file = new File(fullname);
FileInputStream fileIn = new FileInputStream(file);
ServletOutputStream ostream = response.getOutputStream();

byte[] outputByte = new byte[4096];
//copy binary contect to output stream
while(fileIn.read(outputByte, 0, 4096) != -1)
{
	ostream.write(outputByte, 0, 4096);
}
fileIn.close();
ostream.flush();
ostream.close();
%>
