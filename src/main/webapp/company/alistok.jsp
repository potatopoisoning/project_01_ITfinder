<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp" %>
<%
String reno = request.getParameter("reno");

UserDTO udto = new UserDTO();
UserVO uvo = udto.Read(login.getUno());

ResumeDTO rdto = new ResumeDTO();
ResumeVO rvo = rdto.ReRead(reno);

%>
<!-- }} ----------------------------------------  컨텐츠 시작 영역 -->
<br>
<table class="tbl">
<form name="mypage" method="post" action="list.jsp" onsubmit="window.location.href='/TPJ6/company/alist.jsp?reno=<%= reno %>'">
	<tr>
		<td style="height:40px">
			<span style="font-weight:bold;font-size: 30px;">이력서</span>
		</td>
	</tr>																		
<table class="tbl">
	<tr>
		<td>
			<p><h4>인적사항</h4></p>
		</td>
	</tr>
</table>
<table border="1" class="tbl">
	<tr height="30px">
		<td style="width:200px; background-color:lightgray;text-align:center;">성명</td>
		<td>&nbsp;<%= rvo.getUname() %></td>
	</tr>
	<tr height="30px">
		<td style="width:200px; background-color:lightgray;text-align:center;">연락처</td>
		<td>&nbsp;<%= rvo.getUphone() %></td>
	</tr>
	<tr height="30px">
		<td style="width:200px; background-color:lightgray;text-align:center;">이메일</td>
		<td>&nbsp;<%= rvo.getUemail() %></td>
	</tr>
</table>
<table class="tbl">
	<tr>
		<td>
			<p><h4>학력사항</h4></p>
		</td>
	</tr>
</table>
<table border="1" class="tbl">
	<tr height="30px">
		<td style="width:200px; background-color:lightgray;text-align:center;">학력</td>
		<td>&nbsp;<%= rvo.getReeducation() %></td>
	</tr>
	<tr height="30px">
		<td style="width:200px; background-color:lightgray;text-align:center;">학점</td>
		<td>&nbsp;<%= rvo.getRescore() %></td>
	</tr>
	<tr height="30px">
		<td style="width:200px; background-color:lightgray;text-align:center;">학교명</td>
		<td>&nbsp;<%= rvo.getReschoolname() %></td>
	</tr>
	<tr height="30px">
		<td style="width:200px; background-color:lightgray;text-align:center;">전공명</td>
		<td>&nbsp;<%= rvo.getRemajor() %></td>
	</tr>
	<tr height="30px">
		<td style="width:200px; background-color:lightgray;text-align:center;">졸업일자</td>
		<td>&nbsp;<%= rvo.getRegraduation() %></td>
	</tr>
</table>
<table class="tbl">
	<tr>
		<td>
			<p><h4>경력사항</h4></p>
		</td>
	</tr>
</table>
<table border="1" class="tbl">
	<tr height="30px">
		<td style="width:200px; background-color:lightgray;text-align:center;">회사명</td>
		<td>&nbsp;<%= rvo.getRecompanyname() %></td>
	</tr>
	<tr height="30px">
		<td style="width:200px; background-color:lightgray;text-align:center;">재직기간</td>
		<td>&nbsp;<%= rvo.getRetenure() %></td>
	</tr>
	<tr height="30px">
		<td style="width:200px; background-color:lightgray;text-align:center;">직급/직책</td>
		<td>&nbsp;<%= rvo.getReposition() %></td>
	</tr>
	<tr height="30px">
		<td style="width:200px; background-color:lightgray;text-align:center;">재직여부</td>
		<td>&nbsp;<%= rvo.getRestatus() %></td>
	</tr>
	<tr height="30px">
		<td style="width:200px; background-color:lightgray;text-align:center;">주요성과</td>
		<td>&nbsp;<%= rvo.getReperformance() %></td>
	</tr>
</table>
<table class="tbl">
	<tr>
		<td>
			<p><h4>자기소개서</h4></p>
		</td>
	</tr>
</table>
<table border="1" class="tbl" style="height:200px;" >
	<tr>
		<td>&nbsp;<%= rvo.getReself() %></td>					
	</tr>
</table>																																								
</form>
</table>
<table class="tbl">
	<tr>
		<td align="center">
		<a href="/TPJ6/company/alist.jsp">지원자 관리</a>
		</td>						
	</tr>	
</table>
<br>
<!-- }} ----------------------------------------  컨텐츠 종료 영역 -->
<%@ include file="/include/tail.jsp" %>