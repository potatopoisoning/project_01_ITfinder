<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/common.jsp" %>

<%
//회원번호
String uno = request.getParameter("uno");

//회원정보를 조회한다.
UserDTO udto = new UserDTO();
UserVO vo = udto.Read(uno);

//회원정보(기업회원)의 첨부파일을 브라우저로 전송한다.
response.setContentType("application/octet-stream");   

response.setHeader("Content-Disposition","attachment; filename=" + vo.getPname() + "");   
String fullname = uploadPath + "\\" + vo.getPname();
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
