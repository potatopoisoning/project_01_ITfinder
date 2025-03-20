<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="itfinder.vo.*" %>
<%@ page import="itfinder.dto.*" %>
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
int size = 10 * 1024 * 1024;
MultipartRequest multi;
try
{
	multi = 
			new MultipartRequest(request,uploadPath,size,
				"UTF-8",new DefaultFileRenamePolicy());
}catch(Exception e)
{
	response.sendRedirect("cjoin.jsp");
	return;
}

request.setCharacterEncoding("UTF-8");

String uid     = multi.getParameter("uid");
String upw     = multi.getParameter("upw");
String uname   = multi.getParameter("uname");
String ubirth = multi.getParameter("ubirth");
String uphone  = multi.getParameter("uphone");
String uemail  = multi.getParameter("uemail");
String ulicensenum = multi.getParameter("ulicensenum");
String uceo = multi.getParameter("uceo");
String usize = multi.getParameter("usize");
String uindustry = multi.getParameter("uindustry");
String agreeterm  = multi.getParameter("agreeterm");
String agreeinfo  = multi.getParameter("agreeinfo");
String agreemarket  = multi.getParameter("agreemarket");

//업로드된 파일명을 얻는다.
Enumeration files = multi.getFileNames();
String fileid = (String) files.nextElement();
String filename = (String) multi.getFilesystemName("pname");

if(filename !=  null)
{
	String srcName    = uploadPath + "/" + filename; //업로드된 원래 파일명
	File srcFile    = new File(srcName);
}

if( uid == null || upw == null)
{
	//회원가입 정보가 올바르게 전송되지 않음.
	response.sendRedirect("cjoin.jsp");
	return;
}

UserVO vo = new UserVO();

vo.setUid(uid);
vo.setUpw(upw);
vo.setUname(uname);
vo.setUbirth(ubirth);
vo.setUphone(uphone);
vo.setUemail(uemail);
vo.setUlicensenum(ulicensenum);
vo.setUceo(uceo);
vo.setUsize(usize);
vo.setUindustry(uindustry);
vo.setPname(filename);
vo.setAgreeterm(agreeterm);
vo.setAgreeinfo(agreeinfo);
vo.setAgreemarket(agreemarket);
vo.setUkind("C");

UserDTO dto = new UserDTO();
dto.Join(vo);

response.sendRedirect("/TPJ6/index/index.jsp");	
%>