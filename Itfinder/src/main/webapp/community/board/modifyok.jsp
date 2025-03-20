<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ include file="/include/head.jsp" %>
<%
//업로드가 가능한 최대 파일 크기를 지정한다.
//uploadPath: 업로드된 파일 저장폴더 경로(properties로 확인 가능)
//DefaultFileRenamePolicy():동일한 파일명을 업로드한 경우 자동으로 파일명 변환되어 저장됨(image, image1...)
if(login == null)
{
	response.sendRedirect("/TPJ6/index/index.jsp");
	return;
}
int size = 10 * 1024 * 1024;
MultipartRequest multi;
try
{
	multi = 
			new MultipartRequest(request,uploadPath,size,
				"UTF-8",new DefaultFileRenamePolicy());
}catch(Exception e)
{
	response.sendRedirect("index.jsp");
	return;
}

String bno     = multi.getParameter("no");
String pageno  = multi.getParameter("page");
String type    = multi.getParameter("type"); 
String keyword = multi.getParameter("keyword");
String kind    = multi.getParameter("kind"); //URL주소에서 넘어오는 것임
if(pageno  == null) pageno  = "1";
if(type    == null) type    = "T";
if(keyword == null) keyword = "";
if(kind    == null) kind   = "F";

//입력요소로 넘어오는 것임
String btitle = multi.getParameter("btitle");
String bkind  = multi.getParameter("bkind"); 
String bnote  = multi.getParameter("bnote");
String bsource = multi.getParameter("bsource");

//업로드된 파일명을 얻는다.
Enumeration files = multi.getFileNames();
String fileid = (String) files.nextElement();
String filename = (String) multi.getFilesystemName("fname");

String phyname = null;
if(filename !=  null)
{
	phyname = UUID.randomUUID().toString();
	String srcName    = uploadPath + "/" + filename; //업로드된 원래 파일명
	String targetName = uploadPath + "/" + phyname;  //저장 후 암호화된 파일명(물리적이름)
	File srcFile    = new File(srcName);
	File targetFile = new File(targetName);
	srcFile.renameTo(targetFile);
}
//게시물을 저장한다
BoardVO bvo = new BoardVO();
bvo.setBno(bno);
bvo.setBtitle(btitle);
bvo.setBkind(bkind);
bvo.setBnote(bnote);
bvo.setBsource(bsource);
bvo.setFname(filename);
bvo.setPname(phyname);

BoardDTO bdto = new BoardDTO();
bdto.Update(bvo);

if(login != null && bvo.getBkind().equals("R"))
{
	response.sendRedirect("/TPJ6/community/news/view.jsp?no=" + bno + "&type=" + type + "&keyword=" + keyword + "&kind=" + kind + "&page=" + page + "");
}else
{
	response.sendRedirect("view.jsp?no=" + bno + "&type=" + type + "&keyword=" + keyword + "&kind=" + kind + "&page=" + page + "");
}



%>
<%@ include file="/include/tail.jsp" %>