<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp" %>
<%
String reno = request.getParameter("reno");
String jno = request.getParameter("jno");

UserDTO udto = new UserDTO();
UserVO uvo = udto.Read(login.getUno());

ResumeDTO rdto = new ResumeDTO();
ResumeVO rvo = rdto.ReRead(reno);

if(!login.getUno().equals(rvo.getUno()))
{
	//게시물 작성자가 아님.
	response.sendRedirect("index.jsp");
	return;	
}
%>
<!---------------------------------------------  컨텐츠 시작 영역 -->
<br>
<table class="tbl">
	<form name="mypage_modify" method="post" action="/TPJ6/mypage/modifyok.jsp">
		<input type="hidden" name="uno" id="uno" value="<%= login.getUno() %>">
		<input type="hidden" id="reno" name="reno" value="<%= reno %>">
		<input type="hidden" id="jno" name="jno" value="<%= jno %>">
	<tr>
		<td style="height:40px">
			<span style="font-weight:bold;font-size: 30px;">이력서 수정</span>
		</td>
	</tr>
	<table class="tbl">
		<tr>
			<td>
				<h4>[<%= uvo.getUname() %>]님의 이력서입니다.</h4><br>
			</td>
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
			<td style="width:200px; background-color:lightgray;text-align:center;">이력서 제목</td>
			<td style="padding:0 0 0 10px;"><input type="text" name="retitle" id="retitle" style="width:98%;height:25px;" value="<%= rvo.getRetitle() %>"></td>
		</tr>
		<tr height="30px">
			<td style="width:200px; background-color:lightgray;text-align:center;">학력</td>
			<td style="padding:0 0 0 10px;"><input type="text" name="reeducation" id="reeducation" style="width:98%;height:25px;" value="<%= rvo.getReeducation() %>"></td>
		</tr>
		<tr height="30px">
			<td style="width:200px; background-color:lightgray;text-align:center;">학점</td>
			<td style="padding:0 0 0 10px;"><input type="text" name="rescore" id="rescore" style="width:98%;height:25px;" value="<%= rvo.getRescore() %>"></td>
		</tr>
		<tr height="30px">
			<td style="width:200px; background-color:lightgray;text-align:center;">학교명</td>
			<td style="padding:0 0 0 10px;"><input type="text" name="reschoolname" id="reschoolname" style="width:98%;height:25px;" value="<%= rvo.getReschoolname() %>"></td>
		</tr>
		<tr height="30px">
			<td style="width:200px; background-color:lightgray;text-align:center;">전공명</td>
			<td style="padding:0 0 0 10px;"><input type="text" name="remajor" id="remajor" style="width:98%;height:25px;" value="<%= rvo.getRemajor() %>"></td>
		</tr>
		<tr height="30px">
			<td style="width:200px; background-color:lightgray;text-align:center;">졸업일자</td>
			<td style="padding:0 0 0 10px;"><input type="text" name="regraduation" id="regraduation" style="width:98%;height:25px;" value="<%= rvo.getRegraduation() %>"></td>
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
			<td style="padding:0 0 0 10px;"><input type="text" name="recompanyname" id="recompanyname" style="width:98%;height:25px;" value="<%= rvo.getRecompanyname() %>"></td>
		</tr>
		<tr height="30px">
			<td style="width:200px; background-color:lightgray;text-align:center;">재직기간</td>
			<td style="padding:0 0 0 10px;"><input type="text" name="retenure" id="retenure" style="width:98%;height:25px;" value="<%= rvo.getRetenure() %>"></td>
		</tr>
		<tr height="30px">
			<td style="width:200px; background-color:lightgray;text-align:center;">직급/직책</td>
			<td style="padding:0 0 0 10px;"><input type="text" name="reposition" id="reposition" style="width:98%;height:25px;" value="<%= rvo.getReposition() %>"></td>
		</tr>
		<tr height="30px">
			<td style="width:200px; background-color:lightgray;text-align:center;">재직여부</td>
			<td style="padding:0 0 0 10px;"><input type="text" name="restatus" id="restatus" style="width:98%;height:25px;" value="<%= rvo.getRestatus() %>"></td>
		</tr>
		<tr height="30px">
			<td style="width:200px; background-color:lightgray;text-align:center;">주요성과</td>
			<td style="padding:0 0 0 10px;"><input type="text" name="reperformance" id="reperformance" style="width:98%;height:25px;" value="<%= rvo.getReperformance() %>"></td>
		</tr>
	</table>
	<table class="tbl">
	<tr>
		<td>
			<p><h4>자기소개서</h4></p>
		</td>
	</tr>
	</table>
	<table class="tbl">
		<tr>
			<td>
				<textarea style="width:100%; height:200px;" name="reself" id="reself" ><%= rvo.getReself() %></textarea>
			</td>
		</tr>
	</table>
	<table border="0" style="width:80%;height:100px;text-align:center;">
		<tr>
			<td align="center">
				<button type="button" style="width:100px;height:40px;" onclick="window.location.href='/TPJ6/mypage/view.jsp?reno=<%= reno %>&jno=<%= jno %>'">수정 취소</button>
				<input type="submit" value="글수정 완료" style="width:100px;height:40px;">
			</td>						
		</tr>
	</table>
	</form>
</table>
<br>
<!---------------------------------------------  컨텐츠 종료 영역 -->
<%@ include file="/include/tail.jsp" %>