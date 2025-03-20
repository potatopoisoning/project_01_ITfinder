<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="itfinder.vo.*" %>
<%@ page import="itfinder.dto.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%
//첨부파일 저장 경로
String uploadPath = "D:\\ydh\\project\\TPJ6\\src\\main\\webapp\\upload";
// String uploadPath = "C:\\Javastudy\\workspace\\TPJ6\\src\\main\\webapp\\upload";

//로그인 여부를 세션을 통해 검사한다.
UserVO login = (UserVO)session.getAttribute("login");
%>